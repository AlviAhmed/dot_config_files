(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "http://www.melpa.org/packages/"))

(package-initialize)

;;Ignore case when auto correcting
(setq ac-ignore-case nil)
;;Allowing Subwords
(global-subword-mode 1)

;;Autocompleting brackets via electric pairs
(setq electric-pair-pairs '(
			    (?\( . ?\))
			    (?\{ . ?\})
			    (?\[ . ?\])
			    (?\" . ?\")
			    (?\' . ?\')
			   ;; (?\< . ?\>)
			   ;; (?\\ . ?\\)
			    ))
(electric-pair-mode 1)

(evil-mode 1)
;;(setq evil-want-C-i-jump nil)
;; Setting ctrl-u for scroll, needs to be before require evil
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-normal-state-map (kbd "C-d") 'evil-scroll-down)
;; making evil mode default
(require 'evil)
;;Disabling the scroll bar
(toggle-scroll-bar -1)

;;fill column indicator
(require 'fill-column-indicator)

;; Visual Line mode, line wrapper
(global-visual-line-mode t )

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;;Enabling Write Room Mode
;;(global-writeroom-mode t )
;;Dired ranger config
(use-package dired-ranger
  :ensure t
  :bind (:map dired-mode-map
              ("Y" . dired-ranger-copy)
              ("X" . dired-ranger-move)
              ("P" . dired-ranger-paste)))



;;Dash board
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-banner-logo-title "OI MATE HOW YA DOING!!!!!!!!!!!!!!!!"))

;;Org-latex template
(with-eval-after-load 'ox-latex
(add-to-list 'org-latex-classes
             '("mycustom"
               "\\documentclass[11pt]{article}
\\usepackage[margin=1in]{geometry} 
\\usepackage[utf8]{inputenc} 
\\usepackage[T1]{fontenc} 
\\usepackage{grffile} 
\\usepackage{longtable} 
\\usepackage{graphicx} 
\\usepackage{wrapfig} 
\\usepackage{rotating} 
\\usepackage[normalem]{ulem} 
\\usepackage{nccmath} 
\\usepackage{amsmath} 
\\usepackage{textcomp} 
\\usepackage{amssymb} 
\\usepackage{capt-of} 
\\usepackage{titlesec} 
\\usepackage{float} 
\\usepackage[font=small]{subcaption} 
\\usepackage{multicol} 
\\usepackage{mwe} 
\\usepackage{lipsum} 
\\usepackage{titling} 
\\usepackage{enumitem} 
\\usepackage[font=normalsize, labelfont=bf, skip = 0pt, justification = centering]{caption} 
\\usepackage{pdfpages} 
\\usepackage{hyperref}
            [NO-DEFAULT-PACKAGES]
            [NO-PACKAGES]"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))


; Rainbow Delimiters
(use-package rainbow-delimiters
 :ensure t
 :init
 (rainbow-delimiters-mode))
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;;Disabling tool bar
(tool-bar-mode -1)

;;Disabling menu bar
(menu-bar-mode -1)

;;Lines and columns
(line-number-mode 1)
(column-number-mode 1)

;; Disabling ring/bell setting
(setq ring-bell-function 'ignore)

;;Disable the startup tutorial screen 
(setq inhibit-startup-message t)

;; Opening PDF files with zathura
(require 'openwith)
(openwith-mode t)
(setq openwith-associations '(("\\.pdf\\'" "zathura" (file))))
;; Enabling elpy
(elpy-enable)
;; changing the path to python shell interpreter /home/al/anaconda3/bin/python
(setq python-shell-interpreter "/home/al/anaconda3/bin/python")
;;Setting up Ido mode
(setq ido-enable-flex-matching t)
(setq do-create-new-buffer 'always)
(setq ido-everywhere t)
(ido-mode 1)

;;Ido Vertical Mode
(require 'ido-vertical-mode)
(ido-mode 1)
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)


;;Setting up Smex, auto completion for M-x
(use-package smex
  :ensure t
  :init (smex-initialize)
  :bind ("M-x" . smex))

;;Setting up Avy
(use-package avy
  :ensure t
  :bind
  ("M-s" . avy-goto-char))


;; Hungry Delete
(require 'hungry-delete)
(global-hungry-delete-mode)

;;rainbow mode
(use-package rainbow-mode
  :ensure t
  :init (rainbow-mode 1))


;;Setting the side lines as relative like in vim
(setq-default display-line-numbers 'relative)

;;Enabling tab indents I think
;(setq-default tab-always-indent 'complete)

;;Pop-up menu for kill ring
(require 'popup)
(require 'pos-tip)

(eval-when-compile
  (require 'cl-lib))

(global-set-key (kbd "C-x p") 'popup-kill-ring)

;; iBuffer for C-x C-b
(global-set-key (kbd "C-x C-b") 'ibuffer)

;;Enabling line show mode
(global-hl-line-mode t)

;;Switching Windows
(global-set-key (kbd "M-k") 'windmove-up)
(global-set-key (kbd "M-j") 'windmove-down)
(global-set-key (kbd "M-l") 'windmove-right)
(global-set-key (kbd "M-h") 'windmove-left)
(global-set-key (kbd "M-<up>") 'windmove-up)
(global-set-key (kbd "M-<down>") 'windmove-down)
(global-set-key (kbd "M-<right>") 'windmove-right)
(global-set-key (kbd "M-<left>") 'windmove-left)
;;Resizing windows
(global-set-key (kbd "M-H") 'shrink-window-horizontally)
(global-set-key (kbd "M-L") 'enlarge-window-horizontally)
(global-set-key (kbd "M-J") 'shrink-window)
(global-set-key (kbd "M-K") 'enlarge-window)

;;beacon, cursor signal when switching windows
(use-package beacon :ensure t :init (beacon-mode 1))

;; Fixing the scroll
(setq scroll-conservatively 100)

;;setting default auto complete mode
(require 'package)
(package-initialize)

;;yassnippet
(require 'yasnippet)
(yas-global-mode 1)

(require 'auto-complete)
(add-to-list 'ac-modes 'latex-mode)
(add-to-list 'ac-modes 'org-mode)
(add-to-list 'ac-modes 'matlab-mode)
()
;;do default config for auto-complete
(require 'auto-complete-config)

(ac-config-default)
(global-auto-complete-mode t)

;; Setting a default button for terminal in emacs
(global-set-key (kbd "<s-return>")'term) 

;; Setting so that can type y instead yes for quiting terminal
(defalias 'yes-or-no-p 'y-or-n-p)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;Setting software to download for portability, don't for things that use "use-package"
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; if use-package package not present, then download
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


;;if space macs theme is not present, then download
(unless (package-installed-p 'spacemacs-theme)
  (package-refresh-contents)
  (package-install 'spacemacs-theme))



;; if auto complete  not present, then download
(unless (package-installed-p 'auto-complete)
  (package-refresh-contents)
  (package-install 'auto-complete))



(use-package which-key
  :ensure t
  :init
  (which-key-mode))



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(ansi-term-color-vector
   [unspecified "#151515" "#ff0086" "#00c918" "#aba800" "#3777e6" "#ad00a1" "#3777e6" "#d0d0d0"] t)
 '(beacon-color "#cc6666")
 '(custom-enabled-themes (quote (wheatgrass)))
 '(custom-safe-themes
   (quote
    ("fede08d0f23fc0612a8354e0cf800c9ecae47ec8f32c5f29da841fe090dfc450" "0c3b1358ea01895e56d1c0193f72559449462e5952bded28c81a8e09b53f103f" "7153b82e50b6f7452b4519097f880d968a6eaf6f6ef38cc45a144958e553fbc6" "5e3fc08bcadce4c6785fc49be686a4a82a356db569f55d411258984e952f194a" "7e78a1030293619094ea6ae80a7579a562068087080e01c2b8b503b27900165c" "a3fa4abaf08cc169b61dea8f6df1bbe4123ec1d2afeb01c17e11fdc31fc66379" "cea3ec09c821b7eaf235882e6555c3ffa2fd23de92459751e18f26ad035d2142" "722e1cd0dad601ec6567c32520126e42a8031cd72e05d2221ff511b58545b108" "99c86852decaeb0c6f51ce8bd46e4906a4f28ab4c5b201bdc3fdf85b24f88518" "c9f102cf31165896631747fd20a0ca0b9c64ecae019ce5c2786713a5b7d6315e" "428bdd4b98d4d58cd094e7e074c4a82151ad4a77b9c9e30d75c56dc5a07f26c5" "69e7e7069edb56f9ed08c28ccf0db7af8f30134cab6415d5cf38ec5967348a3c" "45a8b89e995faa5c69aa79920acff5d7cb14978fbf140cdd53621b09d782edcf" "f5f3a6fb685fe5e1587bafd07db3bf25a0655f3ddc579ed9d331b6b19827ea46" "6271fc9740379f8e2722f1510d481c1df1fcc43e48fa6641a5c19e954c21cc8f" "f6f5d5adce1f9a764855c9730e4c3ef3f90357313c1cae29e7c191ba1026bc15" "f66abed5139c808607639e5a5a3b5b50b9db91febeae06f11484a15a92bde442" "840db7f67ce92c39deb38f38fbc5a990b8f89b0f47b77b96d98e4bf400ee590a" "4b2679eac1095b60c2065187d713c39fbba27039d75c9c928a1f3b5d824a3b18" "7559ac0083d1f08a46f65920303f970898a3d80f05905d01e81d49bb4c7f9e39" "44961a9303c92926740fc4121829c32abca38ba3a91897a4eab2aa3b7634bed4" "b3bcf1b12ef2a7606c7697d71b934ca0bdd495d52f901e73ce008c4c9825a3aa" "a5b1d671532f27c524264b433ad58df329297b7bb21966eddda1d385e7a9b055" "5d75f9080a171ccf5508ce033e31dbf5cc8aa19292a7e0ce8071f024c6bcad2a" "bd82c92996136fdacbb4ae672785506b8d1d1d511df90a502674a51808ecc89f" "ed36f8e30f02520ec09be9d74fe2a49f99ce85a3dfdb3a182ccd5f182909f3ab" "7356632cebc6a11a87bc5fcffaa49bae528026a78637acd03cae57c091afd9b9" "ab04c00a7e48ad784b52f34aa6bfa1e80d0c3fcacc50e1189af3651013eb0d58" "04dd0236a367865e591927a3810f178e8d33c372ad5bfef48b5ce90d4b476481" "ea71faa917045669be7b7450930b59460e61816a59c1d4026acba806951e194c" "2642a1b7f53b9bb34c7f1e032d2098c852811ec2881eec2dc8cc07be004e45a0" "a0feb1322de9e26a4d209d1cfa236deaf64662bb604fa513cca6a057ddf0ef64" "60e09d2e58343186a59d9ed52a9b13d822a174b33f20bdc1d4abb86e6b17f45b" "04790c9929eacf32d508b84d34e80ad2ee233f13f17767190531b8b350b9ef22" "aded4ec996e438a5e002439d58f09610b330bbc18f580c83ebaba026bbef6c82" "d2e9c7e31e574bf38f4b0fb927aaff20c1e5f92f72001102758005e53d77b8c9" "151bde695af0b0e69c3846500f58d9a0ca8cb2d447da68d7fbf4154dcf818ebc" "6b289bab28a7e511f9c54496be647dc60f5bd8f9917c9495978762b99d8c96a0" "8aca557e9a17174d8f847fb02870cb2bb67f3b6e808e46c0e54a44e3e18e1020" "1c082c9b84449e54af757bcae23617d11f563fc9f33a832a8a2813c4d7dfb652" "6b2636879127bf6124ce541b1b2824800afc49c6ccd65439d6eb987dbf200c36" "49ec957b508c7d64708b40b0273697a84d3fee4f15dd9fc4a9588016adee3dad" "6d589ac0e52375d311afaa745205abb6ccb3b21f6ba037104d71111e7e76a3fc" "100e7c5956d7bb3fd0eebff57fde6de8f3b9fafa056a2519f169f85199cc1c96" "fe666e5ac37c2dfcf80074e88b9252c71a22b6f5d2f566df9a7aa4f9bea55ef8" "274fa62b00d732d093fc3f120aca1b31a6bb484492f31081c1814a858e25c72e" "cd736a63aa586be066d5a1f0e51179239fe70e16a9f18991f6f5d99732cabb32" "f0dc4ddca147f3c7b1c7397141b888562a48d9888f1595d69572db73be99a024" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(diary-entry-marker (quote font-lock-variable-name-face))
 '(emms-mode-line-icon-image-cache
   (quote
    (image :type xpm :ascent center :data "/* XPM */
static char *note[] = {
/* width height num_colors chars_per_pixel */
\"    10   11        2            1\",
/* colors */
\". c #1fb3b3\",
\"# c None s None\",
/* pixels */
\"###...####\",
\"###.#...##\",
\"###.###...\",
\"###.#####.\",
\"###.#####.\",
\"#...#####.\",
\"....#####.\",
\"#..######.\",
\"#######...\",
\"######....\",
\"#######..#\" };")))
 '(fci-rule-color "#9e9e9e")
 '(flycheck-color-mode-line-face-to-color (quote mode-line-buffer-id))
 '(frame-background-mode (quote dark))
 '(gnus-logo-colors (quote ("#528d8d" "#c0c0c0")) t)
 '(gnus-mode-line-image-cache
   (quote
    (image :type xpm :ascent center :data "/* XPM */
static char *gnus-pointer[] = {
/* width height num_colors chars_per_pixel */
\"    18    13        2            1\",
/* colors */
\". c #1fb3b3\",
\"# c None s None\",
/* pixels */
\"##################\",
\"######..##..######\",
\"#####........#####\",
\"#.##.##..##...####\",
\"#...####.###...##.\",
\"#..###.######.....\",
\"#####.########...#\",
\"###########.######\",
\"####.###.#..######\",
\"######..###.######\",
\"###....####.######\",
\"###..######.######\",
\"###########.######\" };")) t)
 '(hl-todo-keyword-faces
   (quote
    (("TODO" . "#dc752f")
     ("NEXT" . "#dc752f")
     ("THEM" . "#2d9574")
     ("PROG" . "#3a81c3")
     ("OKAY" . "#3a81c3")
     ("DONT" . "#f2241f")
     ("FAIL" . "#f2241f")
     ("DONE" . "#42ae2c")
     ("NOTE" . "#b1951d")
     ("KLUDGE" . "#b1951d")
     ("HACK" . "#b1951d")
     ("TEMP" . "#b1951d")
     ("FIXME" . "#dc752f")
     ("XXX" . "#dc752f")
     ("XXXX" . "#dc752f")
     ("???" . "#dc752f"))))
 '(jdee-db-active-breakpoint-face-colors (cons "#fafafa" "#3b6ea8"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#fafafa" "#4f894c"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#fafafa" "#bdbdbd"))
 '(package-selected-packages
   (quote
    (org-bullets org-download latex-math-preview pyenv-mode anaconda-mode elpy live-py-mode matlab-mode atom-dark-theme atom-one-dark-theme org-ac php-auto-yasnippets fill-column-indicator darkroom buffer-move writeroom-mode dired-rainbow format-all nov popup-kill-ring evil-goggles nyan-mode w3m dashboard rainbow-delimiters hungry-delete openwith rainbow-mode smex treemacs treemacs-evil treemacs-icons-dired treemacs-projectile beacon dired-ranger yasnippet-snippets yasnippet-classic-snippets which-key w3 use-package spacemacs-theme ranger projectile-codesearch pdf-tools org-evil org-edna neotree multiple-cursors latex-preview-pane irony-eldoc evil-tutor evil-org evil-fringe-mark evil-commentary evil-collection dracula-theme doom-themes company-jedi company-irony-c-headers company-irony company-dict company-c-headers company-bibtex company-auctex color-theme-solarized color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized better-defaults base16-theme avk-emacs-themes auto-yasnippet auto-org-md auto-minor-mode auto-indent-mode auto-highlight-symbol auto-dim-other-buffers auto-dictionary auto-correct auto-complete-sage auto-complete-rst auto-complete-pcmp auto-complete-nxml auto-complete-exuberant-ctags auto-complete-distel auto-complete-clang-async auto-complete-clang auto-complete-chunk auto-complete-c-headers auto-complete-auctex alect-themes ac-math ac-c-headers)))
 '(pdf-view-midnight-colors (quote ("#655370" . "#fbf8ef")))
 '(send-mail-function (quote mailclient-send-it))
 '(server-mode t)
 '(tetris-x-colors
   [[229 192 123]
    [97 175 239]
    [209 154 102]
    [224 108 117]
    [152 195 121]
    [198 120 221]
    [86 182 194]])
 '(vc-annotate-background "#fafafa")
 '(vc-annotate-color-map
   (list
    (cons 20 "#4f894c")
    (cons 40 "#688232")
    (cons 60 "#817b19")
    (cons 80 "#9a7500")
    (cons 100 "#a0640c")
    (cons 120 "#a65419")
    (cons 140 "#ac4426")
    (cons 160 "#a53f37")
    (cons 180 "#9e3a49")
    (cons 200 "#97365b")
    (cons 220 "#973455")
    (cons 240 "#983350")
    (cons 260 "#99324b")
    (cons 280 "#a25467")
    (cons 300 "#ab7784")
    (cons 320 "#b49aa0")
    (cons 340 "#9e9e9e")
    (cons 360 "#9e9e9e")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
