;;; smart-jump-typescript-mode.el --- Register `smart-jump' for `typescript-mode'. -*- lexical-binding: t -*-

;; Copyright (C) 2017 James Nguyen

;; Author: James Nguyen <james@jojojames.com>
;; Maintainer: James Nguyen <james@jojojames.com>
;; URL: https://github.com/jojojames/smart-jump
;; Version: 0.0.1
;; Package-Requires: ((emacs "25.1"))
;; Keywords: emacs, tools

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
;;; Register `smart-jump' for `typescript-mode'.

;;; Code:
(require 'smart-jump)
(require 'tide nil t)

(defun smart-jump-typescript-tide-available-p ()
  "Return whether or not `tide' is available."
  (bound-and-true-p tide-mode))

(defun smart-jump-typescript-mode-register ()
  "Register `smart-jump' for `typescript-mode'."
  (smart-jump-register :modes 'tide-mode
                       :jump-fn 'tide-jump-to-definition
                       :pop-fn 'tide-jump-back
                       :refs-fn 'tide-references
                       :should-jump #'smart-jump-typescript-tide-available-p
                       :heuristic 'point
                       :async t))

(provide 'smart-jump-typescript-mode)
;;; smart-jump-typescript-mode.el ends here