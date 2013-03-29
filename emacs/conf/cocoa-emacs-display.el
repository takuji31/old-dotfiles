;;powerline
(require 'powerline)
;; モードラインの色
(custom-set-faces
 ;; アクティブ時
 '(mode-line ((t (:foreground "white" :background "#0044cc" :box nil))))
 ;; 非アクティブ時
 '(mode-line-inactive ((t (:foreground "white" :background "#262626" :box nil)))))
;; モードライン2色目
(setq powerline-color1 "#0088cc")
;; モードライン3色目
(setq powerline-color2 "white")

;; バッファ情報の書式
(defpowerline buffer-id (propertize (car (propertized-buffer-identification "%b"))
                                    'face (powerline-make-face color1)))
(defpowerline row     "%l")    ; 行番号の書式
(defpowerline column  "%c")    ; 列番号の書式
(defpowerline percent "%p")    ; カーソル位置の割合
(defpowerline time    "%M")    ; 時計の書式
;; 右部分の位置合わせ(右端から何文字分を左に寄せるか、デフォルト+15文字)
(defun powerline-make-fill (color)
  (let ((plface (powerline-make-face color)))
    (if (eq 'right (get-scroll-bar-mode))
      (propertize " " 'display '((space :align-to (- right-fringe 36))) 'face plface)
      (propertize " " 'display '((space :align-to (- right-fringe 39))) 'face plface))))
;; Powerlineの書式
(setq-default mode-line-format (list
 '("-" mode-line-mule-info mode-line-modified)
 '(:eval (concat
           (powerline-buffer-id   'left   nil powerline-color1)
           (powerline-major-mode  'left       powerline-color1)
           (powerline-minor-modes 'left       powerline-color1)
           (powerline-narrow      'left       powerline-color1 powerline-color2)
           (powerline-vc          'center                      powerline-color2)
           (powerline-make-fill                                powerline-color2)
           (powerline-row         'right      powerline-color1 powerline-color2)
           (powerline-make-text   ": "        powerline-color1)
           (powerline-column      'right      powerline-color1)
           (powerline-percent     'right      powerline-color1)
           (powerline-time        'right  nil powerline-color1)
           (powerline-make-text   "  "    nil )))))
;; 時計のフォーマット
(setq display-time-string-forms '((format
  "%s/%s(%s) %s:%s" month day dayname 24-hours minutes)))
