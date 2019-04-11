(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "http://www.melpa.org/packages/"))

(package-initialize)

;;Allowing Subwords
(global-subword-mode 1)

;;Autocompleting brackets via electric pairs
(setq electric-pair-pairs '(
			    (?\( . ?\))
			    (?\{ . ?\})
			    (?\[ . ?\])
			    (?\" . ?\")
			    (?\' . ?\')
			    (?\< . ?\>)
			    (?\\ . ?\\)
			    ))
(electric-pair-mode 1)


;;Disabling the scroll bar
(toggle-scroll-bar -1)

;;Dash board
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-banner-logo-title "OI MATE HOW YA DOING!!!!!!!!!!!!!!!!"))

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

;;Setting up Ido mode
(setq ido-enable-flex-matching t)
(setq do-create-new-buffer 'always)
(setq ido-everywhere t)
(ido-mode 1)

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
;;(setq-default tab-always-indent 'complete)

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

;;Beacon, cursor signal when switching windows
(use-package beacon :ensure t :init (beacon-mode 1))

;; Fixing the scroll
(setq scroll-conservatively 100)

;; Setting ctrl-u for scroll, needs to be before require evil
(setq evil-want-C-u-scroll t)
(setq evil-want-C-d-scroll t)
;; making evil mode default
(require 'evil)
(evil-mode 1)

;;setting default auto complete mode
(ac-config-default)

;;yassnippet
(require 'yasnippet)
(yas-global-mode 1)

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
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(custom-enabled-themes (quote (spacemacs-dark)))
 '(custom-safe-themes
   (quote
    ("274fa62b00d732d093fc3f120aca1b31a6bb484492f31081c1814a858e25c72e" "cd736a63aa586be066d5a1f0e51179239fe70e16a9f18991f6f5d99732cabb32" "f0dc4ddca147f3c7b1c7397141b888562a48d9888f1595d69572db73be99a024" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(fci-rule-color "#9e9e9e")
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
    (popup-kill-ring evil-goggles nyan-mode w3m dashboard rainbow-delimiters hungry-delete openwith rainbow-mode smex treemacs treemacs-evil treemacs-icons-dired treemacs-projectile beacon dired-ranger yasnippet-snippets yasnippet-classic-snippets which-key w3 use-package spacemacs-theme ranger projectile-codesearch pdf-tools org-evil org-edna neotree multiple-cursors latex-preview-pane irony-eldoc evil-tutor evil-org evil-fringe-mark evil-commentary evil-collection dracula-theme doom-themes company-jedi company-irony-c-headers company-irony company-dict company-c-headers company-bibtex company-auctex color-theme-solarized color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized better-defaults base16-theme avk-emacs-themes auto-yasnippet auto-org-md auto-minor-mode auto-indent-mode auto-highlight-symbol auto-dim-other-buffers auto-dictionary auto-correct auto-complete-sage auto-complete-rst auto-complete-pcmp auto-complete-nxml auto-complete-exuberant-ctags auto-complete-distel auto-complete-clang-async auto-complete-clang auto-complete-chunk auto-complete-c-headers auto-complete-auctex alect-themes ac-math ac-c-headers)))
 '(pdf-view-midnight-colors (quote ("#655370" . "#fbf8ef")))
 '(server-mode t)
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
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 110 :width normal :foundry "PfEd" :family "DejaVu Sans Mono")))))
