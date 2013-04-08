(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/elisp")
;;(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elisp/auto-complete/ac-dict")
(ac-config-default)

(require 'recentf-ext)

(require 'auto-async-byte-compile)
(setq auto-async-byte-compile-exclude-files-regexp "/\\(conf\\|junk\\)/")
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)

(require 'point-undo)
(require 'quickrun)
(require 'undo-tree)
(require 'popwin)
(require 'direx)
(require 'direx-project)
(require 'yasnippet)
(require 'gist)

;;Markdown
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
