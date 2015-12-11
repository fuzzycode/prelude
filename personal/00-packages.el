;;; 00-packages.el --- packages

;;; Commentary:
;;; List all packages that prelude should try to install when starting up

;;; Code:

(add-to-list 'load-path (file-name-directory buffer-file-name))

(prelude-require-packages '( solarized-theme
                            use-package))

(provide '00-packages)
;;; 00-packages.el ends here
