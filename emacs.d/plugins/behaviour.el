;; appearance.el
;;
;; Set some sane behaviour.  Or rather, return emacs to the way I've
;; come to expect it to work.
;;

; no one-buffer-per-frame
;(one-buffer-one-frame-mode 0)

; do not open certain buffers in special windows/frames
(setq special-display-regexps nil) 

; do not place frames behind the Dock or outside of screen boundaries
;(smart-frame-positioning-mode nil)

;; Don't %#@%! BEEP!!
(setq-default visible-bell t)

;; Always end a file with a newline
(setq-default require-final-newline t)

;; Stop at the end of the file, not just add lines
(setq-default next-line-add-newlines nil)

;; From:
;; http://emacs.wordpress.com/2007/01/28/simple-window-configuration-management/
;;
;; Sometimes, i want to recover a certain window configuration in a
;; quick way.  Use Emacs normally, and whenever one cherished window
;; layout gets destroyed, press C-c <left> (where <left> refers to the
;; left cursor key) to recover it–actually, this calls winner-undo,
;; and you can invoke it as many times as you want to visit previous
;; window configurations. As one would expect, C-c <right> (the
;; default binding for winner-redo) navigates configurations in the
;; opposite direction. Simple and very useful, as it should be.
(winner-mode 1)

(provide 'behaviour)
