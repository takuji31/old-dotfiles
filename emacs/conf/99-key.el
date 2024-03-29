(cua-mode t)
(setq cua-enable-cua-keys nil)
(ffap-bindings)
;; sequential-command
(sequential-command-setup-keys)
(global-set-key (kbd "C-m") 'newline-and-indent)
(global-set-key (kbd "C-c l") 'toggle-truncate-lines)
(global-set-key (kbd "C-c C-c") 'other-window)
(global-set-key (kbd "<f6>") 'linum-mode)
(global-set-key (kbd "C-x C-r") 'helm-recentf)
(global-set-key (kbd "C-c h") 'helm-mini)
(global-set-key (kbd "C-c C-f") 'helm-ls-git-ls)
(global-set-key (kbd "C-c C-f") 'helm-git-project)
(global-set-key (kbd "<f7>") 'point-undo)
(global-set-key (kbd "<f8>") 'point-redo)
(global-set-key (kbd "C-.") 'undo-tree-redo)
(global-set-key (kbd "C-c e") 'helm-flymake)
(global-set-key (kbd "C-x b") 'my-helm)
(global-set-key (kbd "C-x C-b") 'my-helm)
(global-set-key (kbd "C-x C-r") 'helm-recentf)
;;行儀のよくないマイナーモードのために2つ設定しておく
(global-set-key (kbd "C-c C-g") 'magit-status)
(global-set-key (kbd "C-c g") 'magit-status)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
;; Chrome ライクなタブ切り替えのキーバインド
(global-set-key (kbd "<M-s-right>") 'tabbar-forward-tab)
(global-set-key (kbd "<M-s-left>") 'tabbar-backward-tab)
(global-set-key (kbd "<C-tab>") 'tabbar-forward-tab)

(global-set-key (kbd "C-t") 'other-window)

;; DDSKK
(global-set-key (kbd "C-x C-j") 'skk-mode)

(global-set-key (kbd "C-c C-j") 'direx-project:jump-to-project-root-other-window)
(global-set-key (kbd "C-c j") 'dired-jump)

;; Dash at point
(global-set-key (kbd "C-c d") 'dash-at-point)
