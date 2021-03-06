;;; Package --- visual settings

;;; Commentary:
;; Visual settings loaded before prelude is loaded.

;;; Code:

;; ----------------------------------------------------------- [Theme]
(setq prelude-theme 'solarized-dark)


;; ----------------------------------------------------- [Window Size]
(setq initial-frame-alist
      '(
        (width . 150) ; character
        (height . 48) ; lines
        ))

;; --------------------------------------------------- [Font Settings]
(set-face-attribute 'default nil
                    :family "Inconsolata"
                    :height 140
                    :weight 'normal
                    :width 'normal)

(provide 'bl-visuals)
;;; bl-visuals ends here
