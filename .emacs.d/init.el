(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	      '("melpa" . "https://melpa.org/packages/"))

(package-initialize)  


(org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (doom-acario-light)))
 '(custom-safe-themes
   (quote
    ("9b01a258b57067426cc3c8155330b0381ae0d8dd41d5345b5eddac69f40d409b" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
