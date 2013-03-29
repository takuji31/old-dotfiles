;;カラム番号を表示
(column-number-mode t)

;;ファイルサイズを表示
(size-indication-mode t)

;;時計を表示
(setq display-time-24hr-format t)
(display-time-mode t)

;;リージョン内の行数と文字数をモードラインに表示する
(defun count-lines-and-chars ()
  (if mark-active
      (format "%d lines,%d chars "
	      (count-lines (region-beginning) (region-end))
	      (- (region-end) (region-beginning)))
    ""))
(add-to-list 'default-mode-line-format
	     '(:eval (count-lines-and-chars)))

;;タイトルにファイルのフルパスを表示
(setq frame-title-format "%f")

;;行番号を表示
(global-linum-mode t)
(setq linum-format "%4d ")

;;タブの文字数
(setq-default tab-width 4)

;;現在行のハイライト
(defface my-hl-line-face
  '((((class color) (background dark))
	 (:background "NavyBlue" t))
	(((class color) (background light))
	 (:background "LightGoldenrodYellow" t))
	(t (:bold t)))
  "hl-line's my face")
;(setq hl-line-face 'my-hl-line-face)
;(global-hl-line-mode 0)

;;対応する括弧の強調表示
(setq show-paren-delay 0)
(show-paren-mode t)
(setq show-paren-style 'expression)
(set-face-background 'show-paren-match-face nil)
(set-face-underline-p 'show-paren-match-face "yellow")

(load-theme 'wombat t)

;;popwin.el
(setq display-buffer-function 'popwin:display-buffer)
(push '("^\\*helm" :regexp t) popwin:special-display-config)
