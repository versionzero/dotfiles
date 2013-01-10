;; security.el
;;
;; Some basic save my silly self from bad people
;;

;; Prompt before evaluating local bits of lisp.  This stops people
;; putting things at the end of files which delete all your files!
(setq-default enable-local-variables t 
	      enable-local-eval 1)

(provide 'security)