;;CPerl
(defalias 'perl-mode 'cperl-mode)
(require 'plenv)

(setq cperl-indent-level 4
      cperl-continued-statement-offset 4
      cperl-close-paren-offset -4
      cperl-label-offset -4
      cperl-comment-column 40
      cperl-highlight-variables-indiscriminately t
      cperl-indent-parens-as-block t
      cperl-tab-always-indent nil
      cperl-font-lock t)
; perl tidy
; sudo aptitude install perltidy
(defun perltidy-region ()
  "Run perltidy on the current region."
  (interactive)
  (save-excursion
    (shell-command-on-region (point) (mark) "perltidy -q" nil t)))
(defun perltidy-defun ()
  "Run perltidy on the current defun."
  (interactive)
  (save-excursion (mark-defun)
                  (perltidy-region))) 
(require 'set-perl5lib)
;;perl-completion
(defun perl-completion-hook ()
  (require 'perl-completion)
  (perl-completion-mode t)
  (setq indent-tabs-mode nil)
  (setq tab-width nil)
  (local-set-key (kbd "C-c t") 'perltidy-region)
  (local-set-key (kbd "C-c i") 'perltidy-defun)
  (local-set-key (kbd "C-c C-f") 'helm-git-project)
  (require 'auto-complete nil t)
  (auto-complete-mode t)
  (make-variable-buffer-local 'ac-sources)
  (setq ac-sources '(ac-source-perl-completion)))
(add-hook 'cperl-mode-hook 'perl-completion-hook)

(setq auto-mode-alist (cons '("\\.t$" . cperl-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.psgi$" . cperl-mode) auto-mode-alist))

;; Perl用設定
;; http://unknownplace.org/memo/2007/12/21#e001
(defvar flymake-perl-err-line-patterns
  '(("\\(.*\\) at \\([^ \n]+\\) line \\([0-9]+\\)[,.\n]" 2 3 nil 1)))

(defconst flymake-allowed-perl-file-name-masks
  '(("\\.pl$" flymake-perl-init)
    ("\\.pm$" flymake-perl-init)
    ("\\.t$" flymake-perl-init)))

(defun flymake-perl-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list (guess-plenv-perl-path) (list "-wc" local-file))))

(defun flymake-perl-load ()
  (interactive)
  (defadvice flymake-post-syntax-check (before flymake-force-check-was-interrupted)
    (setq flymake-check-was-interrupted t))
  (ad-activate 'flymake-post-syntax-check)
  (setq flymake-allowed-file-name-masks (append flymake-allowed-file-name-masks flymake-allowed-perl-file-name-masks))
  (setq flymake-err-line-patterns flymake-perl-err-line-patterns)
  (set-perl5lib)
  (flymake-mode t))

(add-hook 'cperl-mode-hook 'flymake-perl-load)

;;Carton向け設定
(defun my:find-climb-up (filename &optional current-dir)
  (setq current-dir (or current-dir (file-name-directory(buffer-file-name))))
  (if (string= current-dir (directory-file-name current-dir))
      nil
    (let ((filepath (concat current-dir filename)))
      (if (file-exists-p filepath)
          filepath
        (my:find-climb-up filename
                          (file-name-directory (directory-file-name current-dir))))
      )))

;; よくある感じのflymake-perlの設定にlocal/lib/perl5/を追加
(defadvice flymake-perl-init (after add-carton-inc-flymake-advice activate)
  (let ((lib-dir (my:find-climb-up "local/lib/perl5/")))
    (if (stringp lib-dir)
        (setf (nth 1 ad-return-value)
              (pushnew (format "%s%s" "-I" lib-dir) (nth 1 ad-return-value))))
    ))
