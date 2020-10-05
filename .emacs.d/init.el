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
 '(ansi-color-names-vector
   ["#27212E" "#964C7B" "#74DFC4" "#FFE261" "#40B4C4" "#EB64B9" "#B4DCE7" "#FFFFFF"])
 '(beacon-color "#eab4484b8035")
 '(custom-enabled-themes (quote (doom-acario-light)))
 '(custom-safe-themes
   (quote
    ("730a87ed3dc2bf318f3ea3626ce21fb054cd3a1471dcd59c81a4071df02cb601" "6177ecbffb8f37756012c9ee9fd73fc043520836d254397566e37c6204118852" "3577ee091e1d318c49889574a31175970472f6f182a9789f1a3e9e4513641d86" "fe94e2e42ccaa9714dd0f83a5aa1efeef819e22c5774115a9984293af609fce7" "5a0eee1070a4fc64268f008a4c7abfda32d912118e080e18c3c865ef864d1bea" "9b01a258b57067426cc3c8155330b0381ae0d8dd41d5345b5eddac69f40d409b" default)))
 '(evil-emacs-state-cursor (quote ("#E57373" hbar)))
 '(evil-insert-state-cursor (quote ("#E57373" bar)))
 '(evil-normal-state-cursor (quote ("#FFEE58" box)))
 '(evil-visual-state-cursor (quote ("#C5E1A5" box)))
 '(fci-rule-color "#544863")
 '(highlight-indent-guides-auto-enabled nil)
 '(highlight-indent-guides-method (quote character))
 '(highlight-symbol-colors
   (quote
    ("#FFEE58" "#C5E1A5" "#80DEEA" "#64B5F6" "#E1BEE7" "#FFCC80")))
 '(highlight-symbol-foreground-color "#E0E0E0")
 '(highlight-tail-colors (quote (("#eab4484b8035" . 0) ("#424242" . 100))))
 '(jdee-db-active-breakpoint-face-colors (cons "#222228" "#40B4C4"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#222228" "#74DFC4"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#222228" "#4E415C"))
 '(objed-cursor-color "#964C7B")
 '(org-agenda-files
   (quote
    ("~/Dropbox/Sync/TODO.org" "~/Dropbox/Sync/inbox.org" "~/Dropbox/Sync/note_self.org" "~/Dropbox/Sync/backburner.org")))
 '(org-file-apps
   (quote
    ((auto-mode . emacs)
     ("\\.mm\\'" . default)
     ("\\.x?html?\\'" . "brave-browser %s")
     ("\\.pdf\\'" . "okular %s"))))
 '(package-selected-packages
   (quote
    (wgrep openwith htmlize auctex flyspell-correct-ivy vlf cdlatex company-math latex-math-preview lsp-latex gdscript-mode highlight-indent-guides zeno-theme yasnippet-snippets yasnippet-classic-snippets xresources-theme which-key web-mode visual-regexp vimish-fold use-package tramp-auto-auth tide smex react-snippets rainbow-mode rainbow-delimiters projectile popup-kill-ring peep-dired org-babel-eval-in-repl org-ac multiple-cursors moody modus-vivendi-theme modus-operandi-theme keycast js-react-redux-yasnippets java-snippets ivy-yasnippet ido-vertical-mode hungry-delete hideshow-org hide-mode-line gruvbox-theme fzf fill-column-indicator expand-region emmet-mode elscreen-tab dumb-jump doom-themes dmenu django-snippets dired-subtree competitive-programming-snippets company-jedi company-irony-c-headers company-irony company-c-headers company-bibtex company-auctex company-anaconda buster-snippets buffer-move beacon avy-menu apropospriate-theme angular-snippets ac-js2)))
 '(pdf-view-midnight-colors (cons "#FFFFFF" "#27212E"))
 '(pos-tip-background-color "#3a513a513a51")
 '(pos-tip-foreground-color "#9E9E9E")
 '(rustic-ansi-faces
   ["#27212E" "#964C7B" "#74DFC4" "#FFE261" "#40B4C4" "#EB64B9" "#B4DCE7" "#FFFFFF"])
 '(tabbar-background-color "#353335333533")
 '(vc-annotate-background "#27212E")
 '(vc-annotate-color-map
   (list
    (cons 20 "#74DFC4")
    (cons 40 "#a2e0a3")
    (cons 60 "#d0e182")
    (cons 80 "#FFE261")
    (cons 100 "#ffd35f")
    (cons 120 "#ffc55d")
    (cons 140 "#FFB85B")
    (cons 160 "#f89c7a")
    (cons 180 "#f18099")
    (cons 200 "#EB64B9")
    (cons 220 "#ce5ca4")
    (cons 240 "#b2548f")
    (cons 260 "#964C7B")
    (cons 280 "#834973")
    (cons 300 "#72466b")
    (cons 320 "#604363")
    (cons 340 "#544863")
    (cons 360 "#544863")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
