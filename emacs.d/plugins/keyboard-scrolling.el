;; scrolling.el
;;

;; Scroller (http://geosoft.no/development/emacs.html)
;;
;; Scrolling without moving the cursor can be achieved by the functions:

(defun scroll-down-keep-cursor () 
   ;; Scroll the text one line down while keeping the cursor 
   (interactive) 
   (scroll-down 1))

(defun scroll-up-keep-cursor () 
   ;; Scroll the text one line up while keeping the cursor 
   (interactive) 
   (scroll-up 1))

;(define-key global-map [C-up]   'scroll-down-keep-cursor) 
;(define-key global-map [C-down] 'scroll-up-keep-cursor) 

(provide 'keyboard-scrolling)
