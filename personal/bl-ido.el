;;; bl-ido.el --- IDO settings

;;; Commentary:

;;; Code:

(require 'ido)

(setq
 ido-save-directory-list-file "~/.emacs.d/cache/ido.last"
 ido-ignore-buffers ;; ignore these guys
 '("\\` " "^\*Mess" "^\*Back" ".*Completion" "^\*Ido" "^\*trace"
   "^\*compilation" "^\*GTAGS" "^session\.*" "^\*")
 ido-case-fold  t                 ; be case-insensitive
 ido-enable-last-directory-history t ; remember last used dirs
 ido-max-work-directory-list 30   ; should be enough
 ido-max-work-file-list      50   ; remember many
 ido-use-filename-at-point 1    ; don't use filename at point (annoying)
 ido-use-url-at-point nil         ; don't use url at point (annoying)
 ido-enable-flex-matching 1
 ido-max-prospects 8              ; don't spam my minibuffer
 ido-confirm-unique-completion t  ; wait for RET, even with unique completion
 ido-ignore-extensions t
 completion-ignored-extensions
 '("elc")) 

(ido-mode 1)

(provide 'bl-ido)
;;; bl-ido.el ends here
