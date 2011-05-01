;; abbreviations.el
;;
;; Assist my lazy typing habits
;;

;;
;; Replace abbreviations with longer text
;;
;;  History: 
;; 21-12-05: inititally added
;;

;; set the abbreviations variable to this the following path
(setq abbrev-file-name
      (concat emacs-dir "/abbreviations.el"))

;; load the abbreviations to speed up our writting
(if (file-exists-p abbrev-file-name)
    (quietly-read-abbrev-file))

;; save abbrevs when files are saved
(set-default 'abbrev-mode t)

;; preserve case when expanding
(setq dabbrev-case-replace nil)

(provide 'setup-abbrev-mode)
