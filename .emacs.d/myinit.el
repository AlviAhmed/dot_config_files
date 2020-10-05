(setq-default    
	confirm-kill-emacs 'yes-or-no-p)
(fset 'yes-or-no-p 'y-or-n-p)                     ; Replace yes/no prompts nwith y/n 
;;Disabling tool bar
(tool-bar-mode -1)
;;Disabling menu bar
(menu-bar-mode 1)
;;Disabling the scroll bar
(scroll-bar-mode -1)
;;Lines and columns
(line-number-mode 1)
(column-number-mode 1)

(require 'openwith)
(openwith-mode t)
(setq openwith-associations '(("\\.pdf\\'" "okular" (file))))

(add-hook 'focus-out-hook #'garbage-collect)

(global-set-key (kbd "<f5>") 'revert-buffer)

(setq org-html-html5-fancy t)

(show-paren-mode 1)

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

(global-subword-mode 1)

(setq frame-title-format "%b")

(setq dired-dwim-target t)              ;will allow copy to another split dired
(defun xah-dired-mode-setup ()
  "to be run as hook for `dired-mode'."
  (dired-hide-details-mode 1))
(add-hook 'dired-mode-hook 'xah-dired-mode-setup)

;; (setq dired-listing-switches "-alt")

(use-package expand-region
	:ensure t 
	:config 
	(global-set-key (kbd "C-;") 'er/expand-region))

(use-package dired-subtree  
	:ensure t
  	:after dired
  	:config
  	(bind-key "<tab>" #'dired-subtree-toggle dired-mode-map)
  	(bind-key "<backtab>" #'dired-subtree-cycle dired-mode-map))

(setq ring-bell-function 'ignore)

(setq inhibit-startup-message t)

(global-set-key (kbd "M-h") 'windmove-left)
(global-set-key (kbd "M-l") 'windmove-right)
(global-unset-key (kbd "M-j"))
(global-set-key (kbd "M-j") 'windmove-down)
(global-set-key (kbd "M-k") 'windmove-up)

(setq gdscript-godot-executable "/home/al/Desktop/Godot_v3.2.2-stable_x11.64")

(setq jit-lock-defer-time 0)
(setq fast-but-imprecise-scrolling t)

(setq save-abbrevs 'silently)
(setq-default abbrev-mode t)

(global-unset-key "\C-z")
(global-set-key "\C-z" 'undo)

(global-unset-key "\M-\\")
(global-unset-key "\M-p")
(global-set-key "\M-\\" 'dabbrev-expand)

(load (expand-file-name "~/quicklisp/slime-helper.el"))
;; Replace "sbcl" with the path to your implementation
(setq inferior-lisp-program "sbcl")

(use-package vimish-fold
            :ensure t
            :config
            (global-set-key (kbd "C-c v f") #'vimish-fold)
			(global-set-key (kbd "C-c v v") #'vimish-fold-delete))

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode) 


(use-package tide
  :ensure t
  :after (typescript-mode company flycheck)
  :hook ((typescript-mode . tide-setup)
         (typescript-mode . tide-hl-identifier-mode)
         (before-save . tide-format-before-save)))

(winner-mode 1)

(add-hook 'python-mode-hook
      (lambda ()
        (setq-default indent-tabs-mode nil)
        (setq-default tab-width 4)
        (setq-default python-indent 4)))

(setq org-refile-active-region-within-subtree t)
(setq org-refile-use-outline-path t)

(global-set-key (kbd "C-x C-z") 'nil)

(setq electric-pair-pairs '(
			    (?\( . ?\))
			    (?\{ . ?\})
			    (?\[ . ?\])
			    (?\" . ?\"))) 
(electric-pair-mode 1)

(use-package rainbow-delimiters
	:ensure t
	:init
	(rainbow-delimiters-mode))
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; (use-package hideshow-org
;;   :ensure t
;;   :config
;; (add-to-list 'load-path "~/hideshow-org/")

;; (global-set-key "\C-ch" 'hs-org/minor-mode)
;;   )

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

(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.

(global-set-key (kbd "<f8>") 'speedbar)

(dumb-jump-mode)

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

(use-package anaconda-mode 
	:config 
	(add-hook 'python-mode-hook 'anaconda-mode))

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
	(add-to-list 'company-backends 'company-capf)
	(add-to-list 'company-backends 'company-dabbrev)
	(add-to-list 'company-backends 'company-nxml)
	(add-to-list 'company-backends 'company-files) 
	(add-to-list 'company-backends 'company-anaconda))

(use-package company-irony
	:ensure t 
	:config  
	(add-to-list 'company-backends 'company-irony))

(use-package irony 
	:ensure t 
	:config  
	(add-hook 'c++-mode-hook 'irony-mode)
	(add-hook 'c-mode-hook 'irony-mode)
	(add-hook 'objc-mode-hook 'irony-mode)
	(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))

(use-package company-irony-c-headers
  :config
 	(eval-after-load 'company
 	  '(add-to-list
 	    'company-backends '(company-irony-c-headers company-irony)))
  :ensure t
  )

(defun create-tags (dir-name)
   "Create tags file."
   (interactive "DDirectory: ")
   (eshell-command))



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

(use-package yasnippet
  :ensure t
  )
(yas-global-mode 1)

(use-package flycheck 
	:ensure t 
	:init (global-flycheck-mode t))

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

(use-package popup-kill-ring 
	:ensure t 
	:config 
	(define-key popup-kill-ring-keymap (kbd "M-n")     'popup-kill-ring-next)
	(define-key popup-kill-ring-keymap (kbd "M-p")     'popup-kill-ring-previous))

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

(use-package ido-vertical-mode 
	:ensure t 
	:config 
	(ido-vertical-mode 1)
	(setq ido-vertical-define-keys 'C-n-and-C-p-only))

(use-package smex 
	:ensure t
	:init (smex-initialize) 
	:bind ("M-x" . smex))

(use-package elscreen-tab 
	:ensure t 
	:config  
	(global-set-key (kbd "M-p") 'elscreen-next)
	(global-set-key (kbd "M-P") 'elscreen-previous)
	(global-set-key (kbd "C-c n") 'elscreen-create) 
	(global-set-key (kbd "C-c d") 'elscreen-kill))

(setq projectile-enable-caching t)
(use-package projectile 
	:ensure t 
	:config 
	(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)  
	(setq projectile-enable-caching t)
	(projectile-mode +1 ))

(use-package multiple-cursors
	:ensure t 
	:config 
	(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines) 
	(global-set-key (kbd "C->") 'mc/mark-next-like-this)
	(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
	(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
	)

(global-set-key (kbd "C-c b") 'bookmark-jump)  
(global-set-key (kbd "C-c x") 'xah-open-in-external-app)

(setq python-shell-interpreter "/usr/bin/python3")

(add-hook 'c-mode-hook 'electric-indent-mode)
(add-hook 'c++-mode-hook 'electric-indent-mode)
(add-hook 'java-mode-hook 'electric-indent-mode)
(add-hook 'html-mode-hook 'electric-indent-mode)
(add-hook 'css-mode-hook 'electric-indent-mode)

(defun bgpape ()
  "Starts the command to change desktop background"
  (interactive)
  (shell-command (concat (concat "bgpape  " (dired-file-name-at-point)) " > /dev/null 2>&1 &")))
(add-hook 'dired-mode-hook '(lambda () 
                              (local-set-key (kbd "b") 'bgpape)))

(use-package visual-regexp 
	:ensure t 
	:config
	(define-key global-map (kbd "C-c r") 'vr/replace)
	(define-key global-map (kbd "C-c q") 'vr/query-replace)
	;; if you use multiple-cursors, this is for you:
	(define-key global-map (kbd "C-c m") 'vr/mc-mark))

(setq-default display-line-numbers 'relative)

(setq-default indent-tabs-mode nil)

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

(use-package ibuffer 
	     	:ensure t 
		:config 
		(global-set-key (kbd "C-x C-b") 'ibuffer))

(use-package beacon :ensure t :init (beacon-mode 1))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package avy
  :ensure t
  :bind
  ("M-z" . avy-goto-char))

(use-package hungry-delete
  :ensure t
)

(use-package which-key
 :ensure t
 :init
 (which-key-mode))

(global-set-key (kbd "M-H") 'shrink-window-horizontally)
(global-set-key (kbd "M-L") 'enlarge-window-horizontally)
(global-set-key (kbd "M-J") 'shrink-window)
(global-set-key (kbd "M-K") 'enlarge-window)

(defun disable-all-themes ()
  "disable all active themes."
  (dolist (i custom-enabled-themes)
    (disable-theme i)))

(defadvice load-theme (before disable-themes-first activate)
  (disable-all-themes))

(global-set-key (kbd "M-/") 'rgrep)



(setq org-refile-targets '((org-agenda-files :maxlevel . 10)))

(setq org-refile-allow-creating-parent-nodes 'confirm)

(setq org-agenda-exporter-settings
                   '((ps-number-of-columns 2)
                     (ps-landscape-mode t)
                     (org-agenda-add-entry-text-maxlines 7)
        ;; (setq org-agenda-prefix-format "[ ] %t ")
        ;; (setq ps-left-margin   	(/ (* 72  0.5) 2.54)) ;   the position of numbers next 72 is the cm
        ;; (setq ps-right-margin   	(/ (* 72  0.2) 2.54)) ;   
        ;; (setq ps-inter-column   	(/ (* 72  0.5) 2.54)) ;   
        ;; (setq ps-top-margin  	(/ (* 72  0.5) 2.54)) ;   
        ;; (setq ps-bottom-margin   (/ (* 72  1) 2.54)) ;   
        ;;  ;; (setq ps-font-size   '(10 . 11.5))
        ;;  ;; (setq ps-header-font-size '(12 . 13))
        ;; (setq org-agenda-use-time-grid nil)
        ;; (setq org-agenda-with-colors t)
        ;; (setq org-agenda-remove-tags nil)
        ;; (setq ps-print-header nil)
        ;; ;; (setq org-agenda-start-on-weekday nil)
        ;; ;; (setq org-agenda-span 1)

                     ))  
    (setq org-agenda-skip-additional-timestamps-same-entry nil)
     (setq org-agenda-entry-text-exclude-regexps 
       '("<[0-9]\\{4\\}-[0-9]\\{2\\}-[0-9]\\{2\\}[^>]*>"))
    (setq org-agenda-compact-blocks t)
    (setq org-agenda-block-seperator "-")
     (defun gg/entry-text-nix-empty-line ()
       "Delete empty entry text lines in agenda"
       (goto-char (point-min))
       (replace-regexp (concat "^ *" org-agenda-entry-text-leaders " *\n") ""))
     (add-hook 'org-agenda-finalize-hook 'gg/entry-text-nix-empty-line)
(setq org-use-fast-todo-selection t)

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "/home/al/Dropbox/Sync/inbox.org" "Unorganized")
         "* TODO %?\n  %i\n  %a")
        )  
	)

(global-set-key (kbd "C-c c") 'org-capture)

(setq org-agenda-files '(
"~/Dropbox/Sync/daily_todo.org" 
"~/Dropbox/Sync/exercise.org" 
"~/Dropbox/Sync/priorities.org"   
"~/Dropbox/Sync/islam_research.org"   
))

(setq c-default-style "linux"
      c-basic-offset 4)

(add-hook 'org-mode-hook 'auto-fill-mode)

(setq org-agenda-default-appointment-duration 60)

(set-face-attribute 'default nil :height 120)

(global-set-key (kbd "M-@") 'split-window-below)  
(global-set-key (kbd "M-#") 'split-window-right)  
(global-set-key (kbd "M-$") 'delete-window)

(use-package fill-column-indicator
  :ensure t
  )

(setq delete-by-moving-to-trash t)

(global-visual-line-mode t )

(delete-selection-mode t)

(setq kill-whole-line t)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(setq-default tab-always-indent 'complete) 
(defun my-insert-tab-char ()
  "Insert a tab char. (ASCII 9, \t)"
  (interactive)
  (insert "\t"))(global-set-key (kbd "TAB") 'my-insert-tab-char) ; same as Ctrl+i

(defun compile-key() 
	(local-set-key [(f5)] 'recompile)
) 
(add-hook 'prog-mode-hook 'compile-key)

(setq org-todo-keywords
      '((sequence "TODO(t)" "NEXT(n)" "INPROG(p)" "|" "CANCELLED(c!)" "DONE(d!)" )))

(global-hl-line-mode t)

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) 
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-follow-mouse 't)
(setq scroll-step 1)
(setq scroll-conservatively 101)

(toggle-scroll-bar 1)

(setq scroll-preserve-screen-position 1)

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

(defun xah-open-in-external-app (&optional @fname)
  "Open the current file or dired marked files in external app.
The app is chosen from your OS's preference.
When called in emacs lisp, if @fname is given, open that.
URL `http://ergoemacs.org/emacs/emacs_dired_open_file_in_ext_apps.html'
Version 2019-11-04"
  (interactive)
  (let* (

  ($file-list
          (if @fname
              (progn (list @fname))
            (if (string-equal major-mode "dired-mode")
                (dired-get-marked-files)
              (list (buffer-file-name)))))
         ($do-it-p (if (<= (length $file-list) 5)
                       t
                     (y-or-n-p "Open more than 5 files? "))))
    (when $do-it-p
      (cond
       ((string-equal system-type "windows-nt")
        (mapc
         (lambda ($fpath)
           (w32-shell-execute "open" $fpath)) $file-list))
       ((string-equal system-type "darwin")
        (mapc
         (lambda ($fpath)
           (shell-command
            (concat "open " (shell-quote-argument $fpath))))  $file-list))
       ((string-equal system-type "gnu/linux")
        (mapc
         (lambda ($fpath) (let ((process-connection-type nil))
                            (start-process "" nil "xdg-open" $fpath))) $file-list))))))

(add-hook 'c-mode-hook (lambda () (setq comment-start "//"
                                comment-end   "")))
