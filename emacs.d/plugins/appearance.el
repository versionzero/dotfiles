;; appearance.el
;;
;; Choose some visual elements, themes, etc.
;;

;; Get rid of the unnecessary menu bar keyboard
(tool-bar-mode 0)

;; Don't want any startup message
(setq inhibit-startup-message t)

;; Highlight search object
(setq search-highlight t)

;; Highlight query object 
(setq query-replace-highlight t) 

;; Set column/line number display
(setq-default column-number-mode t
	      line-number-mode t)

;; Visual feedback on selections; keep marked regions highlighted
(setq-default transient-mark-mode t)

;; Enable syntax-highlighting
(global-font-lock-mode t)

;; Highlight misspelt words in text mode and tex mode
;(setq flyspell-mode 1)
(add-hook 'text-mode-hook (lambda()(flyspell-mode 1)))
(add-hook 'tex-mode-hook  (lambda()(flyspell-mode 1)))

;; Set the cursor to be something more visible.  Can be any of "box"
;; "hollow" "bar" "hbar".
(set-default 'cursor-type 'bar)

;; general coding/editing niceties
;(require 'line-num)
(require 'whitespace)

(setq default-frame-alist 
      (append (list 
	       '(width . 81) ; Width set to 81 characters
	       '(height . 40)) ; Height set to 60 lines
	      default-frame-alist))


;; Set default colors to green on black
;; will override this with theme below, if you want
;(setq default-frame-alist
;      '((background-color . "black")
;        (foreground-color . "green")))

;; set up color theme of choice by uncommenting the one you want here
;; or simply using one of Aquamacs included themes by only specifying
;; it with line (color-theme-your-chosen-theme's-name) if you choose
;; twilight or blackboard here, uncomment require and initialize lines
;; + the relevant load and setting lines for the theme
; (require 'color-theme)
; (color-theme-initialize)
;(load-file (concat plugin-dir "/vendor" "/twilight.el"))
;(color-theme-twilight)
;(load-file (concat plugin-dir "/themes" "/blackboard.el"))
;(color-theme-blackboard)

(provide 'appearance)
