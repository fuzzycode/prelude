;;; 03-common.el --- Common global Emacs settings

;;; Commentary:

;;; Code:


(defalias 'yes-or-no-p 'y-or-n-p) ;; Shorten the answers


(setq require-final-newline t)           ;; end files with a newline

;; Use utf-8
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(provide '03-common)
;;; 03-common ends here
