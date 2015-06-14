;; adjust-path.el
;;
;; Add Homebrew to to PATH.
;;

(setenv "PATH" 
	(concat "/usr/local/bin:/usr/local/sbin:/usr/bin:"
		"/Developer/Tools:/Developer/usr/bin:/Developer/usr/sbin:"
		(getenv "PATH")))

(provide 'adjust-path)
