;;; 01-settings.el --- Personal settings

;; Keywords: lisp

;;; Commentary:

;;; Code:

;; -------------------------------------------------------- [Requires]
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

(use-package ace-jump-helm-line
  :ensure t
  :defer 3
  :config (define-key helm-map (kbd "C-'") 'ace-jump-helm-line
  ))

;; ------------------------------------------------------ [Key Chords]
(use-package key-chord
  :ensure t
  :defer 2
  :init (key-chord-mode 1)
  :config (setq key-chord-two-keys-delay 0.075))

;; -------------------------------------------- [Multiple Cursor mode]
(use-package multiple-cursors
  :ensure t
  :defer t
  :bind
  (("C-c m t" . mc/mark-all-like-this)
   ("C-c m m" . mc/mark-all-like-this-dwim)
   ("C-c m l" . mc/edit-lines)
   ("C-c m e" . mc/edit-ends-of-lines)
   ("C-c m a" . mc/edit-beginnings-of-lines)
   ("C-c m n" . mc/mark-next-like-this)
   ("C-c m p" . mc/mark-previous-like-this)
   ("C-c m s" . mc/mark-sgml-tag-pair)
   ("C-c m d" . mc/mark-all-like-this-in-defun)))


(provide '01-settings)
;;; 01-settings.el ends here
