;;; 02-keys.el --- Keyboard mappings

;;; Commentary:
;;: Provides key binding related to standard Emacs functionality and custom functions


;;; Code:

;; Make <CR> yes
(define-key query-replace-map [return] 'act)
(define-key query-replace-map [?\C-m] 'act)

(provide '02-keys)
;;; 02-keys.el ends here
