;; keyboard-bindings.el
;;

;;
;; Make Aquamacs less Mac'y
;;

;; No Mac-specific key bindings
(osx-key-mode -1) 

;;
;; Make Aquamacs less UNIX'y
;;

;; make C-z do the undo thing... %#@%! irritating that it suspends
;(define-key global-map "\C-z" 'undo)
(global-set-key (kbd "C-z") 'undo)

;;
;; Make Aquamacs *more* Mac'y
;;

;; C-x z to *hide* the application, not minimize it
(global-set-key (kbd "C-x C-z") 'ns-do-hide-emacs)
(global-set-key (kbd "M-h") 'ns-do-hide-emacs)

;; rectangle support, global mark mode, and other features, but prefer
;; the standard Emacs keys,
(cua-selection-mode t)

;; set the mac buttons to something more sane for my little head
; (setq mac-option-modifier 'meta) - Sets the option key as Meta (this is default)
; (setq mac-command-modifier 'meta) - Sets the command (Apple) key as Meta
; (setq mac-control-modifier 'meta) - Sets the control key as Meta
; (setq mac-function-modifier 'meta) - Sets the function key as Meta (limitations on non-English keyboards)
(setq mac-command-modifier 'meta)

;;
;; Key remapping
;;

;; fix the HOME and END keys so that they go to the beginning and end
;; of the current line, respectively.
(global-set-key [home] 'beginning-of-line)
(global-set-key [end]  'end-of-line)

;; since we removed the buffer navigation keys, lets make some new
;; ones.  They are fairly similar to the previous ones, with the small
;; exception of having to hold CTRL whilst depressing the original
;; keys.
(global-set-key [C-home] 'beginning-of-buffer)
(global-set-key [C-end]  'end-of-buffer)

;; Set up the keyboard so the delete key on both the regular keyboard
;; and the keypad delete the character under the cursor and to the
;; right under X, instead of the default, backspace behaviour.
(global-set-key [delete]    'delete-char)
(global-set-key [kp-delete] 'delete-char)

;; bind C-h to delete. This is useful when you are not on the console
;; so that the backspace does not give you the help command If you are
;; always at the console, you may comment it out
(global-set-key [C-h] 'backward-delete-char-untabify)

;; bind M-? to help. C-h usually does this but we changed it above
;; If you are always at the console, you may comment it out
(global-set-key [M-?] 'help-for-help)

;; bind C-x l to go to a line number
(global-set-key (kbd "C-x l") 'goto-line)

;; bind C-x v to go toggle between overwrite and insert mode
(global-set-key (kbd "C-x v") 'overwrite-mode)

;; bind C-x c to start the compiler
(global-set-key (kbd "C-x c") 'compile)

;; bind C-x ; to start ispell on the entire buffer
(global-set-key (kbd "C-x ;") 'ispell-buffer)

;; bind C-x : to start ispell on the current region
(global-set-key (kbd "C-x :") 'ispell-region)

;; bind C-x ' to start ispell on comments
(global-set-key (kbd "C-x '") 'ispell-comments-and-strings)

;; spell-check the last highlighted word)
(global-set-key (kbd "C-x j") 'flyspell-check-previous-highlighted-word)

;; What the silly sounding 'hippie-expand procedure does is provide a
;; variety of completion functions.  First, it does eaxactly what
;; 'dabbrev-expand does: it looks at the word you're currently typing
;; and tries to expand it to match one a word you've already typed. It
;; searches the text before the current point, then the text after the
;; current point. What differs from 'dabbrev-expand, is that
;; 'hippie-expand also searches through other buffers along with
;; things like expanding possible file names, and expanding from the
;; kill ring, etc.
(setq hippie-expand-try-functions-list 
      '(try-expand-dabbrev 
	try-expand-dabbrev-all-buffers 
	try-expand-dabbrev-from-kill
	try-complete-file-name-partially 
	try-complete-file-name
	try-expand-all-abbrevs 
	try-expand-list 
	try-expand-line
	try-complete-lisp-symbol-partially
	try-complete-lisp-symbol))
(global-set-key (kbd "M-/") 'hippie-expand)

(provide 'keyboard-bindings)
