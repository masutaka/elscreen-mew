;; -*- Mode: Emacs-Lisp -*-
;;
;; elscreen-mew.el
;;
(defconst elscreen-mew-version "0.1.0 (May 20, 2008)")
;;
;; Author:   Takashi Masuda <masutaka@nifty.com>
;; Created:  May 20, 2008
;; Revised:  May 20, 2008

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

(provide 'elscreen-mew)
(require 'elscreen)
(require 'mew)


;;; Code:

(if (fboundp 'defadvice)
    (defadvice mew-buffer-message
      (after mew-buffer-message-after-advice (&rest args) activate)
      (setq ad-return-value
	    (format "%s%d" ad-return-value (elscreen-get-current-screen)))))
