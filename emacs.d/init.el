
;; Set the emacs-dir variable to this directory
(setq emacs-dir "~/.emacs.d")

;; Make sure the starter-kit is present
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

;; It's recommended to create a list of packages in init.el which will
;; be installed if they are found to not be present
(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(starter-kit starter-kit-lisp starter-kit-bindings)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aquamacs-additional-fontsets nil t)
 '(aquamacs-customization-version-id 211 t)
 '(aquamacs-tool-bar-user-customization (quote ((16777249 new-file open-file recent-files save-buffer aquamacs-print nil undo redo cut copy paste isearch-forward nil customize help))) t)
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(default-frame-alist (quote ((width . 85) (height . 66) (width . 81) (height . 40) (right-fringe . 0) (left-fringe . 4) (fringe) (internal-border-width . 0) (vertical-scroll-bars . right) (cursor-type . box) (menu-bar-lines . 1) (height . 40) (width . 81) (tool-bar-mode . -1))))
 '(display-time-mode t)
 '(global-show-newlines-mode t)
 '(menu-bar-mode nil)
 '(ns-tool-bar-display-mode (quote icons) t)
 '(ns-tool-bar-size-mode (quote regular) t)
 '(save-place t nil (saveplace))
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(text-mode-hook (quote (smart-spacing-mode (lambda nil (flyspell-mode 1)) auto-detect-wrap)))
 '(tool-bar-mode nil)
 '(visual-line-mode t t)
 '(x-select-enable-clipboard 1))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ubuntu Mono" :foundry "unknown" :slant normal :weight normal :height 151 :width normal)))))
;; Local Variables:
;; mode: Emacs-Lisp
;; End:
