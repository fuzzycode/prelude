;;; 02-keys.el --- Keyboard mappings

;;; Commentary:
;;: Provides key binding related to standard Emacs functionality and custom functions


;;; Code:

;; Make <CR> yes
(define-key query-replace-map [return] 'act)
(define-key query-replace-map [?\C-m] 'act)

(define-key global-map (kbd "RET") 'newline-and-indent)


;; --------------------------------------------------- [OSX Key setup]
;; http://stackoverflow.com/questions/6312379/setting-fn-key-as-ctrl-on-emacs
;;
;; Set up the mac specific controls as follows
;;
;; fn -> Control
;; ctrl -> Meta
;; alt(option) -> Super
;; cmd -> Hyper
;;
;; Right cmd and option are left untouched for the OS to use.
;; The only drawback with this setup is that the fn+F? keys can not be used to execute OS commands
;; like setting the screen brightness etc.. while in Emacs. I can live with that.

(when *is-a-mac*
  (setq mac-command-modifier 'hyper)
  (setq mac-option-modifier 'super)
  (setq ns-function-modifier 'control)
  (setq mac-right-option-modifier nil)
  (setq mac-right-command-modifier nil)
  (setq mac-control-modifier 'meta))

;;(provide '04-keys)
;;; 04-keys.el ends here
