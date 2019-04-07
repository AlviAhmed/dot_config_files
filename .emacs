
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "http://www.melpa.org/packages/"))

(package-initialize)

;;Disabling the scroll bar
(toggle-scroll-bar -1)

;; Disabling ring/bell setting
(setq ring-bell-function 'ignore)

;;Disable the startup tutorial screen 
(setq inhibit-startup-message t)

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

;; Automatic Config Reload
;;(global-set-key (kbd "C-c r") 'config-reload)

;;rainbow mode
(use-package rainbow-mode
  :ensure t
  :init (rainbow-mode 1))


;;Setting the side lines as relative like in vim
(setq-default display-line-numbers 'relative)

;;Enabling tab indents I think
(setq-default tab-always-indent 'complete)

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

;; Setting default terminal and key binding
(defvar my-term "/bin/bash")
(defadvice term (before force-bash)
  (interactive (list my-term )))
(ad-activate 'term)

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



;;(use-package which-key
;;  :ensure t
;;  :init
;;  (which-key-mode))



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (spacemacs-dark)))
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(package-selected-packages
   (quote
    (rainbow-mode smex treemacs treemacs-evil treemacs-icons-dired treemacs-projectile beacon dired-ranger yasnippet-snippets yasnippet-classic-snippets which-key w3 use-package spacemacs-theme ranger projectile-codesearch pdf-tools org-evil org-edna neotree multiple-cursors latex-preview-pane irony-eldoc evil-tutor evil-org evil-fringe-mark evil-commentary evil-collection dracula-theme doom-themes company-jedi company-irony-c-headers company-irony company-dict company-c-headers company-bibtex company-auctex color-theme-solarized color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized better-defaults base16-theme avk-emacs-themes auto-yasnippet auto-org-md auto-minor-mode auto-indent-mode auto-highlight-symbol auto-dim-other-buffers auto-dictionary auto-correct auto-complete-sage auto-complete-rst auto-complete-pcmp auto-complete-nxml auto-complete-exuberant-ctags auto-complete-distel auto-complete-clang-async auto-complete-clang auto-complete-chunk auto-complete-c-headers auto-complete-auctex alect-themes ac-math ac-c-headers))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 110 :width normal :foundry "PfEd" :family "DejaVu Sans Mono")))))
