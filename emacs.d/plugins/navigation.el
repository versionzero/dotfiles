;;;; navigation.el

;;; Navigation (source: http://geosoft.no/development/emacs.html)
;;;
;;; History:
;;; 6-12-05: added '-' as part of a word
;;; 26-4-11: improved reverse navigation
;;; 
;;; For fast navigation within an Emacs buffer it is necessary to be
;;; able to move swiftly between words. The functions below change the
;;; default Emacs behavour on this point slightly, to make them a lot
;;; more usable.
;;; 
;;; Note the way that the underscore character is treated. This is
;;; convinient behaviour in programming. Other domains may have
;;; different requirements, and these functions should be easy to
;;; modify in this respect.
;;; 
;;; Aditionally, when navigating forward, the cursor will be attracted
;;; to the start of words.  In reverse navigation, it will be
;;; attracted to the end of words, although a steping a further "word"
;;; backwards will place the cursor at the start of the current word.

;; for backward-to-word
(require 'misc)

(defun my-forward-word () 
  ;; Move one word forward. Leave the pointer at end of word 
  ;; Treat _ and - as part of word 
  (interactive) 
  (forward-char 1) 
  (backward-word 1) 
  (forward-word 2) 
  (backward-word 1) 
  (backward-char 1) 
  (cond ((looking-at "_") (forward-char 1) (my-forward-word))
	((looking-at "-") (forward-char 1) (my-forward-word)) 
	(t (forward-char 1))))

(defun my-backward-word () 
  ;; Move one word backward. Leave the pointer at end of word 
  ;; Treat _ and - as part of word 
  (interactive) 
  (backward-word 1)
  (backward-char 1)
  (cond ((looking-at "_") (my-backward-word)) 
	((looking-at "-") (my-backward-word))
	(t (forward-char 1))))

;; bind the functions to Ctrl-Left and Ctrl-Right with:
(global-set-key [C-right] 'my-forward-word) 
(global-set-key [C-left]  'my-backward-word) 

(provide 'navigation)

