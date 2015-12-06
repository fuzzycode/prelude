;;; 01-settings.el --- Personal settings

;; Keywords: lisp

;;; Commentary:

;;; Code:

(eval-when-compile
  (require 'use-package))

;; --------------------------------------------------------- [Backups]
(setq backup-directory-alist `((".*" . "~/.emacs.d/backups")))

(setq make-backup-files t               ; backup of a file the first time it is saved.
      backup-by-copying t               ; don't clobber symlinks
      version-control t                 ; version numbers for backup files
      delete-old-versions t             ; delete excess backup files silently
      delete-by-moving-to-trash t
      kept-old-versions 6               ; oldest versions to keep when a new numbered backup is made (default: 2)
      kept-new-versions 9               ; newest versions to keep when a new numbered backup is made (default: 2)
      auto-save-default t               ; auto-save every buffer that visits a file
      auto-save-timeout 20              ; number of seconds idle time before auto-save (default: 30)
      auto-save-interval 200            ; number of keystrokes between auto-saves (default: 300)
      )


;; ------------------------------------------------- [Whitespace mode]
(use-package whitespace
             :config (setq whitespace-style
                           '(trailing))
             :diminish whitespace-mode)

;; ------------------------------------------------------- [Yasnippet]
(use-package yasnippet
  :ensure t
  :init (setq yas-snippet-dirs '("~/.emacs.d/snippets"))
  :config  (progn
             (yas-global-mode 1)
             (yas-reload-all))
  :diminish yas-minor-mode
  :defer 1)

;; ---------------------------------------------------- [Company Mode]
(use-package company
  :ensure t
  :defer 2
  :config (global-company-mode)
  :diminish company-mode)

;; ----------------------------------------------------- [Ace Jumping]
(use-package ace-jump-buffer
  :ensure t
  :defer 2)

;; ------------------------------------------------------ [Key Chords]
(use-package key-chord
  :ensure t
  :defer 2
  :init (key-chord-mode 1)
  :config (setq key-chord-two-keys-delay 0.075))


(provide '01-settings)
;;; 01-settings.el ends here
