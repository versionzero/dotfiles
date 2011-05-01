;;; .emacs

;; This is the Aquamacs Preferences file.  Add Emacs-Lisp code here
;; that should be executed whenever you start Aquamacs Emacs. If
;; errors occur, Aquamacs will stop evaluating this file and print
;; errors in the *Messags* buffer.  Use this file in place of ~/.emacs
;; (which is loaded as well.)

;; Set the emacs-dir variable to this directory
(setq emacs-dir "~/.emacs.d")

;; Set the plugin-dir variable to the plugin directory under the
;; current one
(setq plugin-dir (concat emacs-dir "/plugins"))

;; Set up our various directories to load
(add-to-list 'load-path plugin-dir)

(require 'initialize)

;; Local Variables:
;; mode: Emacs-Lisp
;; End:

