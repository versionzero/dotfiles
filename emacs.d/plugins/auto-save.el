;; auto-save.el
;;

;; Changes in file saving policy:
;;   * Put autosaves where I want them.
;;   * No backup files, but still use autosave.
;;   * Try hard to break hard links.
(setq make-backup-files             nil
      auto-save-list-file-prefix    (expand-file-name 
				     '"auto-save-list/.saves-" emacs-dir)
      file-precious-flag            t
      find-file-existing-other-name nil)

(provide 'auto-save)