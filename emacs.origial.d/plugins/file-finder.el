;; file-finder.el
;;

;; File Finder (http://geosoft.no/development/emacs.html)
;;
;; This extension to the powerful Emacs complete-word facility is the
;; major time saver for the frequent Emacs user. It is used within the
;; find-file function and makes it possible to enter a given directory
;; in the minibuffer by just entering a predefined two- to four letter
;; sequence followed by the space key. Three different paths are given
;; in the example below. The list can however be extended indefinetly.

(defun my-parse-minibuffer () 
  ;; Extension to the complete word facility of the minibuffer 
  (interactive) 
  (backward-char 4) 
  (setq found t) 
  (cond ; local directories 
     ((looking-at "..cd") (setq directory "c:/users/john/")) 
     ((looking-at ".doc") (setq directory "c:/users/john/documents/")) 
     ((looking-at "java") (setq directory "c:/users/john/src/java/")) 
     (t (setq found nil))) 
  (cond (found (beginning-of-line) 
	       (kill-line) 
	       (insert directory)) 
	(t     (forward-char 4) 
	       (minibuffer-complete)))) 

;; Use the function to extend the minibuffer complete-word function
(define-key minibuffer-local-completion-map " " 'my-parse-minibuffer) 

(provide 'file-finder)
