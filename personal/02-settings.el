;;; 01-settings.el --- Personal settings

;; Keywords: lisp

;;; Commentary:

;;; Code:

;; -------------------------------------------------------- [Requires]
(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

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
  :init (setq whitespace-line-column 120)
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
  :defer nil
  )

;; ------------------------------------------------------ [Key Chords]
(use-package key-chord
  :ensure t
  :defer 2
  :init (key-chord-mode 1)
  :config (progn
            (setq key-chord-two-keys-delay 0.075)
            (key-chord-define-global "xo" 'other-window)
            (key-chord-define-global "gg" 'magit-status)
            ))

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

;; ------------------------------------------------ [Git Time machine]
(use-package git-timemachine
  :ensure t
  :defer t
  :bind (("C-x t m" . git-timemachine)))

;; ------------------------------------------------ [Expand Selection]
(use-package expand-region
  :ensure t
  :defer t
  :bind ("C-M-," . er/expand-region))

;; ------------------------------------------------------- [Undo Tree]
(use-package undo-tree
  :ensure t
  :defer t
  :config (global-undo-tree-mode 1)
  :bind (("C-z" . undo)
         ("S-C-z" . undo-tree-redo)))

;; ------------------------------------------------------- [Guru mode]
(use-package guru-mode
  :diminish guru-mode)

;; --------------------------------------------------- [Helm Settings]
(use-package helm
  :diminish helm-mode)

(use-package helm-fuzzier
  :ensure t
  :config (helm-fuzzier-mode t))

(use-package helm-flx
  :ensure t
  :config (helm-flx-mode t))

(use-package helm-spotify
  :ensure t
  :defer t)

(use-package helm-flyspell
  :ensure t
  :defer t
  :config (bind-key "C-." #'helm-flyspell-correct flyspell-mode-map)
  )

(use-package helm-flycheck
  :ensure t
  :defer t)

;; -------------------------------------------------------- [Org Mode]
(use-package org
  :ensure t
  :defer t  )

;; -------------------------------------------------------- [Uniquify]
(use-package uniquify
  :defer t
  :config(setq uniquify-buffer-name-style 'forward
               uniquify-separator "/"
               uniquify-after-kill-buffer-p t
               uniquify-ignore-buffers-re "^\\*"))

;; ----------------------------------------------------------- [Tramp]
(use-package tramp
  :defer t
  :init (setq tramp-default-method "ssh"))

;; -------------------------------------------------------- [Flyspell]
(use-package flyspell
  :ensure t
  :defer t)

;; --------------------------------------------------- [Marcdown mode]
(use-package markdown-mode
  :ensure t
  :mode "\\.md\\'")

;; --------------------------------------------------------- [iBuffer]
(use-package ibuffer
  :config( progn
           (use-package ibuffer-projectile
             :ensure t)

           (add-hook 'ibuffer-hook
                     (lambda ()
                       (ibuffer-projectile-set-filter-groups)
                       (unless (eq ibuffer-sorting-mode 'alphabetic)
                         (ibuffer-do-sort-by-alphabetic))))
           ))


(provide '02-settings)
;;; 02-settings.el ends here
