;;; elscreen-mew.el --- ElScreen Add-On for Mew

;;; Commentary:

;; This package is ElScreen Add-On for Mew.

;;; Installation:

;; Put `elscreen-mew.el' in the `load-path' and add
;;
;;   (require 'elscreen-mew)
;;
;; to your Mew init file.

;; Author: Takashi Masuda <masutaka.net@gmail.com>
;; Maintainer: Takashi Masuda <masutaka.net@gmail.com>

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, 675 Mass Ave, Cambridge, MA 02139, USA.

(require 'elscreen)

;;; Code:

(defcustom elscreen-mew-mode-to-nickname-alist
  '(("^mew-draft-mode$" .
     (lambda ()
       (format "Mew(%s)" (buffer-name (current-buffer)))))
    ("^mew-" . "Mew"))
  "*Alist composed of the pair of mode-name and corresponding screen-name."
  :type '(alist :key-type string :value-type (choice string function))
  :tag "Mew major-mode to screen nickname alist"
  :set (lambda (symbol value)
         (custom-set-default symbol value)
         (elscreen-rebuild-mode-to-nickname-alist))
  :group 'mew)
(elscreen-set-mode-to-nickname-alist 'elscreen-mew-mode-to-nickname-alist)


(defadvice mew-buffer-message (after
			       mew-buffer-message-after-advice
			       activate)
  (setq ad-return-value
	(format "%s[%d]" ad-return-value (elscreen-get-current-screen))))

(provide 'elscreen-mew)
;;; elscreen-mew.el ends here
