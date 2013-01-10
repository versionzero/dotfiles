;;; cppcheck.el --- run cppcheck putting hits in a grep buffer

;; Copyright (C) 2011 Darius Powell

;; Author: Darius Powell <dariusp686@gmail.com>
;; Version: 1.0
;; URL: http://bitbucket.org/dariusp686/emacs-cppcheck
;; Keywords: cppcheck, check, lint

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Code:

(defvar cppcheck-hist nil)

(defgroup cppcheck nil
  "Run cppcheck putting hits in a grep buffer."
  :group 'tools
  :group 'processes)

(defcustom cppcheck-cmd "cppcheck --quiet --template gcc --enable=all"
  "The cppcheck command."
  :type 'string
  :group 'cppcheck)

;;;###autoload
(defun cppcheck ()
  (interactive)
  (let* ((cmd (read-shell-command "Command: " (concat cppcheck-cmd " " (file-name-nondirectory (or (buffer-file-name) ""))) 'cppcheck-hist))
         (null-device nil))
    (grep cmd)))

(provide 'cppcheck)

;;; cppcheck.el ends here
