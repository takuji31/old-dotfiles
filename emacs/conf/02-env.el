;;文字コードの設定
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)
(when (eq system-type 'darwin)
  (require 'ucs-normalize)
  (set-file-name-coding-system 'utf-8-hfs)
  (setq locale-coding-system 'utf-8-hfs))

;;バックアップファイル、オートセーブファイルを作らない
(setq make-backup-files nil)
(setq auto-save-default nil)

;;yes/noをy/nに
(fset 'yes-or-no-p 'y-or-n-p)

;;GUIで起動した時にシェルのPATHを読むようにする
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(global-undo-tree-mode t)

;;ハードタブ使わない
(setq-default indent-tabs-mode nil)

;;バッファーの名前をuniqueに
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-ignore-buffers-re "*[^*]+*")

;; ミニバッファの履歴を保存する
(savehist-mode 1)

;; ミニバッファの履歴の保存数を増やす
(setq history-length 3000)

;;正規表現をPerlのものに
(custom-set-variables
 ;; 正規表現、perlかrubyを選択
 '(foreign-regexp/regexp-type 'perl) ;; Choose by your preference.
 '(reb-re-syntax 'foreign-regexp)) ;; Tell re-builder to use foreign regexp.

