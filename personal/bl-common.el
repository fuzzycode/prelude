;;; Package --- Common settings

;;; Commentary:
;; Common Settings affectin all of emacs

;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Make <CR> yes
(define-key query-replace-map [return] 'act)
(define-key query-replace-map [?\C-m] 'act)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Global key bindings
(define-key global-map (kbd "RET") 'newline-and-indent)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Copy and kill a line without having to mark it first
;;http://emacs-fu.blogspot.com/search/label/new?updated-max=2009-11-29T14%3A52%3A00%2B02%3A00&max-results=20
(defadvice kill-ring-save (before slick-copy activate compile)
  "When called interactively with no active region, copy a single line instead."
  (interactive (if mark-active (list (region-beginning) (region-end)) (message
                                                                       "Copied line") (list (line-beginning-position) (line-beginning-position
                                                                                                                       2)))))

(defadvice kill-region (before slick-cut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Whitespace mode
(setq whitespace-line-column 120)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ACE Jump mode

(autoload 'ace-jump-mode  "ace-jump-mode"  "Emacs quick move minor mode"  t)

(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; enable a more powerful jump back function from ace jump mode
;;
(autoload  'ace-jump-mode-pop-mark  "ace-jump-mode"  "Ace jump back:-)"  t)
(eval-after-load "ace-jump-mode"  '(ace-jump-mode-enable-mark-sync))
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Delight mode
;; Used to shorten mode names in the mode line.

(require 'delight)

(delight '((guru-mode nil nil)
           (company-mode " C " company)
           (whitespace-mode nil whitespace)))

(provide 'bl-common)
;;; bl-common ends here
