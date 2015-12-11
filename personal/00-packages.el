;;; 00-packages.el --- packages

;;; Commentary:
;;; List all packages that prelude should try to install when starting up

;;; Code:

(prelude-require-packages '(yasnippet
                            ; ace-jump-mode
                            ; delight
                            solarized-theme
                            ; cmake-ide
                            ; heroku-theme
                            ; ace-window
                            ; google-this
                            ; jekyll-modes
                            multiple-cursors
(add-to-list 'load-path (file-name-directory buffer-file-name))
                            use-package))

(provide '00-packages)
;;; 00-packages.el ends here
