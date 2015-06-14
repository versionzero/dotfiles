;; yaml-mode-stuff.el
;;

;; Additional Modes
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

(provide 'setup-yaml-mode)
