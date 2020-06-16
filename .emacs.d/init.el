(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	      '("melpa" . "https://melpa.org/packages/"))

(package-initialize)  


(add-hook 'focus-out-hook #'garbage-collect)


(setq-default    
	confirm-kill-emacs 'yes-or-no-p)
(fset 'yes-or-no-p 'y-or-n-p)                     ; Replace yes/no prompts nwith y/n 



;;Disabling tool bar
(tool-bar-mode -1)

;;Disabling menu bar
(menu-bar-mode -1)

;;Disabling the scroll bar
(scroll-bar-mode -1)

;;Lines and columns
(line-number-mode 1)
(column-number-mode 1) 

;;Allowing Subwords
(global-subword-mode 1)   

;; ;; ;;Starting Emacs server 
;; (server-start) 

;;adding org appointment from the agenda
(org-agenda-to-appt)
;;adding org appointments  

;; Moving Focus Windows
(global-set-key (kbd "M-h") 'windmove-left)
(global-set-key (kbd "M-l") 'windmove-right)
(global-unset-key (kbd "M-j"))
(global-set-key (kbd "M-j") 'windmove-down)
(global-set-key (kbd "M-k") 'windmove-up) 
;; Moving Focus Windows



;;;---Rebinding Undo Key---;;;
(global-unset-key "\C-z")
(global-set-key "\C-z" 'undo)
;;;---Rebinding Undo Key---;;;

;;;---binding dabbrev---;;; 
(global-unset-key "\M-\\")
(global-unset-key "\M-p")
(global-set-key "\M-\\" 'dabbrev-expand)
;;;---binding dabbrev---;;;

; ;;;---Config for common lisp---;;;
; (load (expand-file-name "~/quicklisp/slime-helper.el"))
; ;; Replace "sbcl" with the path to your implementation
; (setq inferior-lisp-program "sbcl")
; ;;;---Config for common lisp---;;;


;;---Modifying the title bar---;;;
   (setq frame-title-format "%b")
;;---Modifying the title bar---;;;


;;;---Enabling Winner Mode---;;;
(winner-mode 1)
;;;---Enabling Winner Mode---;;; 

;;;---Refiling active region---;;;
(setq org-refile-active-region-within-subtree t)
;;;---Refiling active region---;;;

;;;---Electric Pairs Brackets---;;;
	(setq electric-pair-pairs '(
				    (?\( . ?\))
				    (?\{ . ?\})
				    (?\[ . ?\])
				    (?\" . ?\"))) 
	(electric-pair-mode 1)   
;;;---Electric Pairs Brackets---;;;

;;;---Rainbow Delimiters---;;;
(use-package rainbow-delimiters
	:ensure t
	:init
	(rainbow-delimiters-mode))
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
;;;---Rainbow Delimiters---;;;

;;;---Hide Show Mode---;;;

;;--Hide Show Org--;;
(use-package hideshow-org
  :ensure t
  :config
(add-to-list 'load-path "~/hideshow-org/")

(global-set-key "\C-ch" 'hs-org/minor-mode)
  )
(require 'hideshow-org) 
;;--Hide Show Org--;;

;;--Hide Show Actual--;;
		
;;--Hide Show Actual--;;


;;;---Hide Show Mode---;;;

;;;---Web Mode---;;;
(use-package web-mode
  :ensure t
  :config
 (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
 (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
 (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
 (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
 (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
 (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
 (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
 (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  )
;;;---Web Mode---;;;

;;;---Emmet Mode---;;; 
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
;;;---Emmet Mode---;;;

;;;---Highlighting Parentheses---;;;
(show-paren-mode 1)
;;;---Highlighting Parentheses---;;;

;;;---Toggle Show Dot Files---;;; 
  (defun dired-dotfiles-toggle ()
    "Show/hide dot-files"
    (interactive)
    (when (equal major-mode 'dired-mode)
      (if (or (not (boundp 'dired-dotfiles-show-p)) dired-dotfiles-show-p) ; if currently showing
	  (progn 
	    (set (make-local-variable 'dired-dotfiles-show-p) nil)
	    (message "h")
	    (dired-mark-files-regexp "^\\\.")
	    (dired-do-kill-lines))
	(progn (revert-buffer) ; otherwise just revert to re-show
	       (set (make-local-variable 'dired-dotfiles-show-p) t)))))
;;;---Toggle Show Dot Files---;;;

;;;---Speedbar Config---;;;
(global-set-key (kbd "<f8>") 'speedbar)
;;;---Speedbar Config---;;;

;;;---Dumb Jump---;;;
(use-package dumb-jump
  :ensure t)
(dumb-jump-mode)
;;;---Dumb Jump---;;;


;;;---Move line up or Down---;;;
 (defun move-line-down ()
   (interactive)
   (let ((col (current-column)))
     (save-excursion
       (forward-line)
       (transpose-lines 1))
     (forward-line)
     (move-to-column col)))

 (defun move-line-up ()
   (interactive)
   (let ((col (current-column)))
     (save-excursion
       (forward-line)
       (transpose-lines -1))
     (forward-line -1)
     (move-to-column col)))

 (global-set-key (kbd "C-S-j") 'move-line-down)
 (global-set-key (kbd "C-S-k") 'move-line-up)
;;;---Move line up or Down---;;;


;;;---Company---;;;

(require 'cl)

(use-package company 
	:ensure t   
	:init 
	(add-hook 'after-init-hook 'global-company-mode)
	:config 
	(setq company-idle-delay 0.15)   
	(setq company-minimum-prefix-length 2)
	(setq company-selection-wrap-around t) 
	(setq company-require-match 'never)  
	(setq company-dabbrev-downcase nil)
	(define-key company-active-map (kbd "C-n") nil) 
	(define-key company-active-map (kbd "C-p") nil) 
	(define-key company-active-map (kbd "M-n") #'company-select-next) 
	(define-key company-active-map (kbd "M-p") #'company-select-previous) 
	(add-to-list 'company-backends '(company-capf company-dabbrev))
	;; (add-to-list 'company-backends '(company-lsp company-dabbrev))
	(add-to-list 'company-backends '(company-css company-dabbrev))
	(add-to-list 'company-backends '(company-elisp company-dabbrev))
	(add-to-list 'company-backends '(company-nxml company-dabbrev))
	(add-to-list 'company-backends '(company-files company-dabbrev)))                               




;;--Company Irony--;;
(use-package company-irony
	:ensure t 
	:config  
	(add-to-list 'company-backends 'company-irony))
;;--Company Irony--;;

;;--Irony--;;
(use-package irony 
	:ensure t 
	:config  
	(add-hook 'c++-mode-hook 'irony-mode)
	(add-hook 'c-mode-hook 'irony-mode)
	(add-hook 'objc-mode-hook 'irony-mode)
	(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))
;;--Irony--;;

;;--Company Irony C Headers--;;
(use-package company-irony-c-headers
  :config
 	(eval-after-load 'company
 	  '(add-to-list
 	    'company-backends '(company-irony-c-headers company-irony)))
  :ensure t
  )
(require 'company-irony-c-headers)
;; Load with `irony-mode` as a grouped backend
;;--Company Irony C Headers--;;

;;;---Company---;;;

;;;---Generating Etags---;;;
  (defun create-tags (dir-name)
     "Create tags file."
     (interactive "DDirectory: ")
     (eshell-command 
      (format "find %s -type f -name \"*.[ch]\" | etags -" dir-name)))
;;;---Generating Etags---;;;



;;;---js2-mode---;;;

(use-package js2-mode
  :ensure t
  :config
 	(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
 	;; Better imenu
 	(add-hook 'js2-mode-hook #'js2-imenu-extras-mode)
	
  )

(use-package ac-js2
	:ensure t 
	:config
	(add-to-list 'company-backends 'ac-js2-company) 
	(setq ac-js2-evaluate-calls t)
)
;;;---js2-mode---;;;



;;;---Yasnippet---;;;
(use-package yasnippet
  :ensure t
  )
(yas-global-mode 1) 
;;;---Yasnippet---;;;

;;;---Flycheck Mode---;;;
(use-package flycheck 
	:ensure t 
	:init (global-flycheck-mode t))
;;;---Flycheck Mode---;;;

;;;---Popup---;;; 
(use-package popup 
	:ensure t 
	:config 
	(require 'popup)   
	(require 'pos-tip) 
	(eval-when-compile
	(require 'cl-lib))
	(define-key popup-menu-keymap (kbd "C-n") nil)
	(define-key popup-menu-keymap (kbd "C-p") nil)
	(define-key popup-menu-keymap (kbd "M-n") #'popup-next)
	(define-key popup-menu-keymap (kbd "M-p") #'popup-previous))

;;--Kill ring--;;
(use-package popup-kill-ring 
	:ensure t 
	:config 
	(define-key popup-kill-ring-keymap (kbd "M-n")     'popup-kill-ring-next)
	(define-key popup-kill-ring-keymap (kbd "M-p")     'popup-kill-ring-previous))
;;--Kill ring--;;
;;;---Popup---;;; 



;;;---Dired Settings---;;; 
(setq dired-dwim-target t)              ;will allow copy to another split dired
(defun xah-dired-mode-setup ()
  "to be run as hook for `dired-mode'."
  (dired-hide-details-mode 1))
(add-hook 'dired-mode-hook 'xah-dired-mode-setup)
;;;---Dired Settings---;;; 



;;;---Dired Switches---;;; 
;; (setq dired-listing-switches "-alt")
;;;---Dired Switches---;;;


;;;---Setting up expand region---;;;
(use-package expand-region
	:ensure t 
	:config 
	(global-set-key (kbd "C-;") 'er/expand-region))
;;;---Setting up expand region---;;;



;;;---Ido-Mode---;;;  
(use-package ido  
	:ensure t
	:config 
	(ido-mode 1)  
	(setq ido-enable-flex-matching t)
	(setq ido-everywhere t)  
	(setq ido-create-new-buffer nil) 
	(setq ido-default-buffer-method 'selected-window) 
	(setq ido-default-file-method 'selected-window)	 
	)


;;;---Smex Mode---;;; 
(use-package smex 
	:ensure t
	:init (smex-initialize) 
	:bind ("M-x" . smex))
;;;---Smex Mode---;;; 


;;;---Ido Vertical---;;;
(use-package ido-vertical-mode 
	:ensure t 
	:config 
	(ido-vertical-mode 1)
	(setq ido-vertical-define-keys 'C-n-and-C-p-only))
;;;---Ido Vertical---;;;

;;;---Ido-Mode---;;;


;;;---Elscreen---;;;
(use-package elscreen-tab 
	:ensure t 
	:config  
	(global-set-key (kbd "M-p") 'elscreen-next)
	(global-set-key (kbd "M-P") 'elscreen-previous)
	(global-set-key (kbd "C-c n") 'elscreen-create) 
	(global-set-key (kbd "C-c d") 'elscreen-kill)
     (elscreen-start))

;;;---Elscreen---;;; 

;;;---Projectile---;;;
(setq projectile-enable-caching t)
(use-package projectile 
	:ensure t 
	:config 
	(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)  
	(setq projectile-enable-caching t)
	(projectile-mode +1 ))
;;;---Projectile---;;;


;;;---Dired Subtree---;;; 
(use-package dired-subtree  
	:ensure t
  	:after dired
  	:config
  	(bind-key "<tab>" #'dired-subtree-toggle dired-mode-map)
  	(bind-key "<backtab>" #'dired-subtree-cycle dired-mode-map))
;;;---Dired Subtree---;;;


;; Disabling ring/bell setting
(setq ring-bell-function 'ignore)

;;Disable the startup tutorial screen 
(setq inhibit-startup-message t)

;;;---Multiple Cursors---;;;
(use-package multiple-cursors
	:ensure t 
	:config 
	(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines) 
	(global-set-key (kbd "C->") 'mc/mark-next-like-this)
	(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
	(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
	) 
;;;---Multiple Cursors---;;; 

;;;---Dired Async Shell---;;; 
(global-set-key (kbd "C-c b") 'bookmark-jump)  
(global-set-key (kbd "C-c x") 'xah-open-in-external-app)
;;;---Dired Async Shell---;;;

;;;---bgpape---;;;
(defun bgpape ()
  "Starts the command to change desktop background"
  (interactive)
  (shell-command (concat (concat "bgpape  " (dired-file-name-at-point)) " > /dev/null 2>&1 &")))
(add-hook 'dired-mode-hook '(lambda () 
                              (local-set-key (kbd "b") 'bgpape)))

;;;---bgpape---;;;




;;visual-regexp 
(use-package visual-regexp 
	:ensure t 
	:config
	(define-key global-map (kbd "C-c r") 'vr/replace)
	(define-key global-map (kbd "C-c q") 'vr/query-replace)
	;; if you use multiple-cursors, this is for you:
	(define-key global-map (kbd "C-c m") 'vr/mc-mark))

;;Setting the side lines as relative like in vim
(setq-default display-line-numbers 'relative)

;;Enabling tab indents I think
;;(setq-default tab-always-indent 'nil)
(setq-default indent-tabs-mode nil)

;;Pop-up menu for kill ring 
(use-package popup 
	:ensure t 
	:config 
	(require 'popup)   
	(require 'pos-tip) 
	(eval-when-compile
	  (require 'cl-lib))
	(define-key popup-menu-keymap (kbd "C-n") nil)
	(define-key popup-menu-keymap (kbd "C-p") nil) 
	(define-key popup-menu-keymap (kbd "M-n") #'popup-next)
	(define-key popup-menu-keymap (kbd "M-p") #'popup-previous))


(global-set-key (kbd "C-x p") 'popup-kill-ring) 


;; iBuffer for C-x C-b 
(use-package ibuffer 
	     	:ensure t 
		:config 
		(global-set-key (kbd "C-x C-b") 'ibuffer))


;;beacon, cursor signal when switching windows
(use-package beacon :ensure t :init (beacon-mode 1))




;; if use-package package not present, then download
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package)) 


;;Setting up Avy
(use-package avy
  :ensure t
  :bind
  ("M-z" . avy-goto-char))

;; Hungry Delete
(use-package hungry-delete
  :ensure t
  )




;; enabling which-key
(use-package which-key
 :ensure t
 :init
 (which-key-mode))




;; Sizing Windows
(global-set-key (kbd "M-H") 'shrink-window-horizontally)
(global-set-key (kbd "M-L") 'enlarge-window-horizontally)
(global-set-key (kbd "M-J") 'shrink-window)
(global-set-key (kbd "M-K") 'enlarge-window) 
;; Sizing Windows


;; Disabling all themes 
(defun disable-all-themes ()
  "disable all active themes."
  (dolist (i custom-enabled-themes)
    (disable-theme i)))

;; Using disable all themes in order to load another theme without conflict
(defadvice load-theme (before disable-themes-first activate)
  (disable-all-themes))

;; rgrep 
(global-set-key (kbd "M-/") 'rgrep) 
;; rgrep

;;Org Capture 
(global-set-key (kbd "C-c c") 'org-capture)

;;org capture 
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "/home/al/Dropbox/Sync/sched_org.org" "Inbox Tasks")
         "* TODO %?\n  %i\n  %a")
        )  
      ) 


;; begin emacs tags 
(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (eshell-command 
   (format "find %s -type f -name \"*.[ch]\" | etags -" dir-name)))
;; end emacs tags   


;; c indent style 
(setq c-default-style "linux"
      c-basic-offset 4)



;;org formatting 
(add-hook 'org-mode-hook 'auto-fill-mode) 
;;org formatting 

;;org agenda default 
(setq org-agenda-default-appointment-duration 60)
;;org agenda default 

;;setting default face font
(set-face-attribute 'default nil :height 120) 
;;setting default face font

(global-set-key (kbd "M-@") 'split-window-below)  
(global-set-key (kbd "M-#") 'split-window-right)  
(global-set-key (kbd "M-$") 'delete-window)  

(use-package fill-column-indicator
  :ensure t
  )

;; moving files to trash
(setq delete-by-moving-to-trash t) 

;; Visual Line mode, line wrapper
(global-visual-line-mode t )

;;deletion selection mode -> allows deletion of selected text 
(delete-selection-mode t)

;; setting kill whole line to true
 (setq kill-whole-line t)
;; setting kill whole line to true


;; Indenting Tabs 
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4) ; or any other preferred value 
;; make tab key do indent first then completion.
(setq-default tab-always-indent 'complete) 
(defun my-insert-tab-char ()
  "Insert a tab char. (ASCII 9, \t)"
  (interactive)
  (insert "\t"))(global-set-key (kbd "TAB") 'my-insert-tab-char) ; same as Ctrl+i

(defun compile-key() 
	(local-set-key [(f5)] 'recompile)
) 
(add-hook 'prog-mode-hook 'compile-key)

;; Org Mode tasks 
(setq org-todo-keywords
      '((sequence "TODO" "NEXT" "INPROG" "CANCELLED" "DONE" ))) 





;;Enabling line show mode
(global-hl-line-mode t)


;;Begin Scroll Settings
;;(setq scroll-conservatively 1)
;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time 
(setq scroll-conservatively 101) ;; move minimum when cursor exits view, instead of recentering....
;;Disabling the scroll bar
(toggle-scroll-bar 1)  
;; End Scroll Settings 






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
\\usepackage{amsfonts} 
\\usepackage{capt-of} 
\\usepackage{titlesec} 
\\usepackage{float} 
\\usepackage[font=small]{subcaption} 
\\usepackage{multicol} 
\\usepackage{mwe} 
\\usepackage{lipsum} 
\\usepackage{titling} 
\\usepackage{enumitem}  
\\usepackage{listings} 
\\usepackage{listings} 
\\usepackage{gensymb}
\\usepackage{xcolor}
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


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (fill-column-indicator hungry-delete avy beacon visual-regexp multiple-cursors dired-subtree projectile elscreen-tab ido-vertical-mode smex expand-region popup-kill-ring flycheck yasnippet ac-js2 js2 company-irony-c-headers company-irony company dumb-jump web-mode hideshow-org rainbow-delimiters use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
