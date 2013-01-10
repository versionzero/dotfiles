;; bubble-buffer.el
;;

;; Buffer Switcher (source: http://geosoft.no/development/emacs.html)
;;
;;  History:
;;  6-12-05: at the end of my-kill-buffer we make sure to change to most 
;;           recently visited buffer

;; After a file has been loaded once, it is available in an Emacs buffer. 
;; Emacs is installed with lots of clever functions for fast retrieval of 
;; buffers. The function below is different however. It makes it possible to 
;; browse through the buffer list by single key-strokes only. It is also 
;; clever in its handling of the buffer stack in the way that the most 
;; frequent visited buffers (i.e. files) always are at the top of the stack.

(defvar LIMIT  0.5) ;; delay before most recently visited buffer is push on top
(defvar time   0) 
(defvar mylist nil) 

(defun time-now () 
   (car (cdr (current-time)))) 

(defun bubble-buffer () 
   (interactive) 
   (if (or (> (- (time-now) time) LIMIT) (null mylist)) 
       (progn (setq mylist (copy-alist (buffer-list))) 
         	 (delq (get-buffer " *Minibuf-0*") mylist) 
         	 (delq (get-buffer " *Minibuf-1*") mylist))) 
   (bury-buffer (car mylist)) 
   (setq mylist (cdr mylist)) 
   (setq newtop (car mylist)) 
   (switch-to-buffer (car mylist))
   (setq rest (cdr (copy-alist mylist))) 
   (while rest 
     (bury-buffer (car rest)) 
     (setq rest (cdr rest))) 
   (setq time (time-now))) 

;; bind M-b to switch buffers
(global-set-key "\M-b" 'bubble-buffer)

(provide 'bubble-buffer)
