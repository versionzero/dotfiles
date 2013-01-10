;; setup-iswitch-mode.el
;;
;; IswitchBuffers: switching buffer names, with completion. 
;;

(iswitchb-mode 1)
(setq iswitchb-buffer-ignore '("^ " "*Buffer" "*Messages" "*scratch"))

(provide 'setup-iswitch-mode)
