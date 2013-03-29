;;; helm-themes.el --- Color theme helm interface

;; Copyright (C) 2012 by Syohei YOSHIDA

;; Author: Syohei YOSHIDA <syohex@gmail.com>
;; URL:

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;; Code:

(require 'helm-config)

(defun helm-c-themes-delete-theme ()
  (mapc (lambda (th)
          (disable-theme th)) custom-enabled-themes))

(defun helm-c-themes-load-theme (theme-str)
  (helm-c-themes-delete-theme)
  (load-theme (intern theme-str) t))

(defvar helm-themes-source
  '((name . "helm theme")
    (candidates . (lambda ()
                    (custom-available-themes)))
    (action . helm-c-themes-load-theme)
    (persistent-action . helm-c-themes-load-theme)))

(defun helm-themes ()
  (interactive)
  (let ((changed nil)
        (orig-theme (if custom-enabled-themes
                        (car custom-enabled-themes))))
    (unwind-protect
        (progn
          (helm :sources helm-themes-source :buffer "*helm-themes*")
          (setq changed t))
      (when changed
        (helm-c-themes-delete-theme)
        (if orig-theme
            (load-theme orig-theme t))))))

(provide 'helm-themes)

;;; helm-themes.el ends here
