;; initialize.el
;;

;; Set the vendor-dir variable to the ventor plugin directory under
;; the current one
(setq vendor-dir 
      (concat plugin-dir "/vendor"))

;; Add our extensions to the load path
(add-to-list 'load-path vendor-dir)

;; Load up ELPA, the package manager
(unless (file-directory-p "~/.emacs.d/elpa")
  (make-directory "~/.emacs.d/elpa" t))

;; Load some of the 3rd party extensions
(require 'package)
(package-initialize)
(require 'starter-kit-elpa)
(require 'yasnippet-bundle)

;; Personal specific customizations - see individual files for details
(require 'adjust-path)
(require 'appearance)
(require 'auto-save)
(require 'behaviour)
(require 'bubble-buffer)
(require 'clipboard)
(require 'desktop-save)
;(require 'file-finder)
(require 'full-screen)
(require 'keyboard-bindings)
(require 'keyboard-scrolling)
(require 'navigation)
(require 'setup-abbrev-mode)
(require 'setup-hs-blocks)
(require 'setup-iswitch-mode)
(require 'setup-ido)
(require 'setup-js2-mode)
(require 'setup-org-mode)
(require 'setup-yaml-mode)
(require 'security)
(require 'personal)
(require 'prefer-utf)
(require 'useful-functions)
(require 'markdown)

;; Initialize!
(provide 'initialize)
