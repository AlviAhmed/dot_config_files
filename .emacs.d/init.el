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
			   ;;(?\' . ?\')
			   ;; (?\< . ?\>)
			   ;; (?\\ . ?\\)
			    ))
(electric-pair-mode 1)  
(evil-mode 1)  
(global-evil-tabs-mode t)  

;;(setq evil-want-C-i-jump nil)
;; Setting ctrl-u for scroll, needs to be before require evil 
;;(general-define-key
;;:states '(motion)
;;:keymaps 'dired-mode-map
;; "j" 'evil-next-line
;;)  
;;
;;(general-define-key
;;:states '(motion)
;;:keymaps 'dired-mode-map
;;"k" 'evil-previous-line
;;) 
;(setq inhibit-startup-screen t)
;; making evil mode default
(require 'evil)
;;Disabling the scroll bar
(toggle-scroll-bar -1) 

(use-package ranger :ensure t)


(dumb-jump-mode)

(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-normal-state-map (kbd "C-d") 'evil-scroll-down)  
(define-key evil-normal-state-map (kbd "f") 'ido-find-file) 
(define-key evil-normal-state-map (kbd "!") 'shell-command)  
(define-key dired-mode-map (kbd "j" )'dired-next-line)
(define-key dired-mode-map (kbd "k" )'dired-previous-line) 
(define-key dired-mode-map (kbd "f" )'ido-find-file)
(define-key dired-mode-map (kbd "r" )'revert-buffer) 
(define-key dired-mode-map (kbd "/" )'evil-search-forward) 
(define-key dired-mode-map (kbd "n" )'evil-search-next) 
(define-key dired-mode-map (kbd "N" )'evil-search-previous)  
(define-key dired-mode-map (kbd "C-p" )'nil)  
   
(global-set-key (kbd "M-!") 'delete-other-windows)  
(global-set-key (kbd "M-@") 'split-window-below)  
(global-set-key (kbd "M-#") 'split-window-right)  
(global-set-key (kbd "M-$") 'delete-window)  
;;binding hot key for bookmark
(global-set-key (kbd "M-1") 'ido-switch-buffer)
;;binding the bookmark to hotkey
(global-set-key (kbd "M-2") 'bookmark-jump)  
(global-set-key (kbd "<f2>") 'elscreen-next)
(global-set-key (kbd "<f1>") 'elscreen-previous)
(global-set-key (kbd "<f2>") 'evil-tabs-goto-tab) 
(global-set-key (kbd "<f3>") 'elscreen-create) 
(global-set-key (kbd "<f4>") 'elscreen-kill) 
;;binding the bookmark to hotkey
;;(global-set-key (kbd "M-3") 'ido-find-file) 

;;auto update directories
(global-auto-revert-mode t) 

(require 'fill-column-indicator)
;; moving files to trash
(setq delete-by-moving-to-trash t)
;; Visual Line mode, line wrapper
(global-visual-line-mode t )

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(setq tabbar-use-images  nil)


;;Enabling Write Room Mode
;;(global-writeroom-mode t )
;;Dired ranger config
(use-package dired-ranger
  :ensure t
  :bind (:map dired-mode-map
              ("W" . dired-ranger-copy)
              ("X" . dired-ranger-move)
              ("P" . dired-ranger-paste)))

;; Fixing bug in iedit mode
(define-key global-map (kbd "C-c ;") 'iedit-mode)

;;Dash board
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-banner-logo-title "OI MATE HOW YA DOING!!!!!!!!!!!!!!!!"))


;; Org Mode tasks 
(setq org-todo-keywords
      '((sequence "TODO" "INPROG." "DONE" )))

;;flycheck mode
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

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


; apparently tramp slows down due to projectile, this line of code disables something in projectile 
(setq projectile-mode-line "Projectile")

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; multiple cursors                                                       ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "C-c m c") 'evil-mc-mode) 



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
;;(setq-default tab-always-indent 'nil)
(setq-default indent-tabs-mode nil)

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
;()
;;do default config for auto-complete
(require 'auto-complete-config)

(ac-config-default)
(global-auto-complete-mode t)

;; Setting a default button for terminal in emacs
(global-set-key (kbd "<s-return>")'term) 

;; Setting so that can type y instead yes for quiting terminal
(defalias 'yes-or-no-p 'y-or-n-p)



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

;; Testing a file opening function
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

;;binding the program function to a hotkey
(global-set-key (kbd "M-3") 'xah-open-in-external-app)


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
 '(custom-enabled-themes (quote (moe-dark)))
 '(custom-safe-themes
   (quote
    ("a9c619535d63719a15f22e3c450a03062d3fed1e356ef96d33015849c4c43946" "4a9f595fbffd36fe51d5dd3475860ae8c17447272cf35eb31a00f9595c706050" "dd854be6626a4243375fd290fec71ed4befe90f1186eb5b485a9266011e15b29" "8c1dd3d6fdfb2bee6b8f05d13d167f200befe1712d0abfdc47bb6d3b706c3434" "6b423e7cd5d1e705b0c92356273899057d26e125f83d7f007615ae088195682f" "1f38fb71e55e5ec5f14a39d03ca7d7a416123d3f0847745c7bade053ca58f043" "df21cdadd3f0648e3106338649d9fea510121807c907e2fd15565dde6409d6e9" "50b64810ed1c36dfb72d74a61ae08e5869edc554102f20e078b21f84209c08d1" "41039913efab185af1ec1b13ff4df36d6941994d5e3dee39791f30fcd94b42be" "1897b97f63e91a792e8540c06402f29d5edcbfb0aafd64b1b14270663d6868ee" "fe76f3d5094967034192f6a505085db8db6deb0e135749d9a54dc488d6d3ee2f" "947190b4f17f78c39b0ab1ea95b1e6097cc9202d55c73a702395fc817f899393" "e61752b5a3af12be08e99d076aedadd76052137560b7e684a8be2f8d2958edc3" "13d20048c12826c7ea636fbe513d6f24c0d43709a761052adbca052708798ce3" "26d49386a2036df7ccbe802a06a759031e4455f07bda559dcf221f53e8850e69" "d1b4990bd599f5e2186c3f75769a2c5334063e9e541e37514942c27975700370" "4697a2d4afca3f5ed4fdf5f715e36a6cac5c6154e105f3596b44a4874ae52c45" "5a7830712d709a4fc128a7998b7fa963f37e960fd2e8aa75c76f692b36e6cf3c" "78c1c89192e172436dbf892bd90562bc89e2cc3811b5f9506226e735a953a9c6" "527df6ab42b54d2e5f4eec8b091bd79b2fa9a1da38f5addd297d1c91aa19b616" "c968804189e0fc963c641f5c9ad64bca431d41af2fb7e1d01a2a6666376f819c" "85e6bb2425cbfeed2f2b367246ad11a62fb0f6d525c157038a0d0eaaabc1bfee" "d9850d120be9d94dd7ae69053630e89af8767c36b131a3aa7b06f14007a24656" "ea9e9f350c019474a5265c08f7441027b23c1da3f23b9c30517d60133bab679f" "7a2ac0611ded83cdd60fc4de55ba57d36600eae261f55a551b380606345ee922" "446cc97923e30dec43f10573ac085e384975d8a0c55159464ea6ef001f4a16ba" "80930c775cef2a97f2305bae6737a1c736079fdcc62a6fdf7b55de669fbbcd13" "350dc341799fbbb81e59d1e6fff2b2c8772d7000e352a5c070aa4317127eee94" "196df8815910c1a3422b5f7c1f45a72edfa851f6a1d672b7b727d9551bb7c7ba" "d9dab332207600e49400d798ed05f38372ec32132b3f7d2ba697e59088021555" "250268d5c0b4877cc2b7c439687f8145a2c85a48981f7070a72c7f47a2d2dc13" "d96587ec2c7bf278269b8ec2b800c7d9af9e22d816827639b332b0e613314dfd" "5b8eccff13d79fc9b26c544ee20e1b0c499587d6c4bfc38cabe34beaf2c2fc77" "3f67aee8f8d8eedad7f547a346803be4cc47c420602e19d88bdcccc66dba033b" "9ce93c9eb0f26697eadc71afb99214fa2c85396f6148ddabf5a8319e667513ae" "ecfd522bd04e43c16e58bd8af7991bc9583b8e56286ea0959a428b3d7991bbd8" "8543b328ed10bc7c16a8a35c523699befac0de00753824d7e90148bca583f986" "bcfc77fcc3e012941eb47d5037f0fac767e23fd2dae039214e5fa856ac8bdfdd" "fec45178b55ad0258c5f68f61c9c8fd1a47d73b08fb7a51c15558d42c376083d" "ad16a1bf1fd86bfbedae4b32c269b19f8d20d416bd52a87cd50e355bf13c2f23" "d83e34e28680f2ed99fe50fea79f441ca3fddd90167a72b796455e791c90dc49" "100eeb65d336e3d8f419c0f09170f9fd30f688849c5e60a801a1e6addd8216cb" "fee4e306d9070a55dce4d8e9d92d28bd9efe92625d2ba9d4d654fc9cd8113b7f" "50d07ab55e2b5322b2a8b13bc15ddf76d7f5985268833762c500a90e2a09e7aa" "4feee83c4fbbe8b827650d0f9af4ba7da903a5d117d849a3ccee88262805f40d" "6daa09c8c2c68de3ff1b83694115231faa7e650fdbb668bc76275f0f2ce2a437" "4a91a64af7ff1182ed04f7453bb5a4b0c3d82148d27db699df89a5f1d449e2a4" "8cf1002c7f805360115700144c0031b9cfa4d03edc6a0f38718cef7b7cabe382" "12670281275ea7c1b42d0a548a584e23b9c4e1d2dabb747fd5e2d692bcd0d39b" "36746ad57649893434c443567cb3831828df33232a7790d232df6f5908263692" "aea30125ef2e48831f46695418677b9d676c3babf43959c8e978c0ad672a7329" "1263771faf6967879c3ab8b577c6c31020222ac6d3bac31f331a74275385a452" "bbb521edff9940ba05aeeb49f9b247e95e1cb03bd78de18122f13500bda6514f" "93268bf5365f22c685550a3cbb8c687a1211e827edc76ce7be3c4bd764054bad" "73ad471d5ae9355a7fa28675014ae45a0589c14492f52c32a4e9b393fcc333fd" "9be1d34d961a40d94ef94d0d08a364c3d27201f3c98c9d38e36f10588469ea57" "2a998a3b66a0a6068bcb8b53cd3b519d230dd1527b07232e54c8b9d84061d48d" "16dd114a84d0aeccc5ad6fd64752a11ea2e841e3853234f19dc02a7b91f5d661" "dd4628d6c2d1f84ad7908c859797b24cc6239dfe7d71b3363ccdd2b88963f336" "f984e2f9765a69f7394527b44eaa28052ff3664a505f9ec9c60c088ca4e9fc0b" "9c4acf7b5801f25501f0db26ac3eee3dc263ed51afd01f9dcfda706a15234733" "3be1f5387122b935a26e02795196bc90860c57a62940f768f138b02383d9a257" "146061a7ceea4ccc75d975a3bb41432382f656c50b9989c7dc1a7bb6952f6eb4" "36282815a2eaab9ba67d7653cf23b1a4e230e4907c7f110eebf3cdf1445d8370" "264b639ee1d01cd81f6ab49a63b6354d902c7f7ed17ecf6e8c2bd5eb6d8ca09c" "e1498b2416922aa561076edc5c9b0ad7b34d8ff849f335c13364c8f4276904f0" "808b47c5c5583b5e439d8532da736b5e6b0552f6e89f8dafaab5631aace601dd" "1025e775a6d93981454680ddef169b6c51cc14cea8cb02d1872f9d3ce7a1da66" "5a39d2a29906ab273f7900a2ae843e9aa29ed5d205873e1199af4c9ec921aaab" "65f35d1e0d0858947f854dc898bfd830e832189d5555e875705a939836b53054" "a62f0662e6aa7b05d0b4493a8e245ab31492765561b08192df61c9d1c7e1ddee" "819d24b9aba8fcb446aecfb59f87d1817a6d3eb07de7fdec67743ef32194438b" "b0c5c6cc59d530d3f6fbcfa67801993669ce062dda1435014f74cafac7d86246" "542e6fee85eea8e47243a5647358c344111aa9c04510394720a3108803c8ddd1" "304c39b190267e9b863c0cf9c989da76dcfbb0649cbcb89592e7c5c08348fce9" "ffac21ab88a0f4603969a24b96993bd73a13fe0989db7ed76d94c305891fad64" "ec3e6185729e1a22d4af9163a689643b168e1597f114e1cec31bdb1ab05aa539" "41eb3fe4c6b80c7ad156a8c52e9dd6093e8856c7bbf2b92cc3a4108ceb385087" "732ccca2e9170bcfd4ee5070159923f0c811e52b019106b1fc5eaa043dff4030" "fc7fd2530b82a722ceb5b211f9e732d15ad41d5306c011253a0ba43aaf93dccc" "0961d780bd14561c505986166d167606239af3e2c3117265c9377e9b8204bf96" "3e34e9bf818cf6301fcabae2005bba8e61b1caba97d95509c8da78cff5f2ec8e" "b67b2279fa90e4098aa126d8356931c7a76921001ddff0a8d4a0541080dee5f6" "cabc32838ccceea97404f6fcb7ce791c6e38491fd19baa0fcfb336dcc5f6e23c" "a61109d38200252de49997a49d84045c726fa8d0f4dd637fce0b8affaa5c8620" "c614d2423075491e6b7f38a4b7ea1c68f31764b9b815e35c9741e9490119efc0" "1d079355c721b517fdc9891f0fda927fe3f87288f2e6cc3b8566655a64ca5453" "760ce657e710a77bcf6df51d97e51aae2ee7db1fba21bbad07aab0fa0f42f834" "34ed3e2fa4a1cb2ce7400c7f1a6c8f12931d8021435bad841fdc1192bd1cc7da" "fede08d0f23fc0612a8354e0cf800c9ecae47ec8f32c5f29da841fe090dfc450" "0c3b1358ea01895e56d1c0193f72559449462e5952bded28c81a8e09b53f103f" "7153b82e50b6f7452b4519097f880d968a6eaf6f6ef38cc45a144958e553fbc6" "5e3fc08bcadce4c6785fc49be686a4a82a356db569f55d411258984e952f194a" "7e78a1030293619094ea6ae80a7579a562068087080e01c2b8b503b27900165c" "a3fa4abaf08cc169b61dea8f6df1bbe4123ec1d2afeb01c17e11fdc31fc66379" "cea3ec09c821b7eaf235882e6555c3ffa2fd23de92459751e18f26ad035d2142" "722e1cd0dad601ec6567c32520126e42a8031cd72e05d2221ff511b58545b108" "99c86852decaeb0c6f51ce8bd46e4906a4f28ab4c5b201bdc3fdf85b24f88518" "c9f102cf31165896631747fd20a0ca0b9c64ecae019ce5c2786713a5b7d6315e" "428bdd4b98d4d58cd094e7e074c4a82151ad4a77b9c9e30d75c56dc5a07f26c5" "69e7e7069edb56f9ed08c28ccf0db7af8f30134cab6415d5cf38ec5967348a3c" "45a8b89e995faa5c69aa79920acff5d7cb14978fbf140cdd53621b09d782edcf" "f5f3a6fb685fe5e1587bafd07db3bf25a0655f3ddc579ed9d331b6b19827ea46" "6271fc9740379f8e2722f1510d481c1df1fcc43e48fa6641a5c19e954c21cc8f" "f6f5d5adce1f9a764855c9730e4c3ef3f90357313c1cae29e7c191ba1026bc15" "f66abed5139c808607639e5a5a3b5b50b9db91febeae06f11484a15a92bde442" "840db7f67ce92c39deb38f38fbc5a990b8f89b0f47b77b96d98e4bf400ee590a" "4b2679eac1095b60c2065187d713c39fbba27039d75c9c928a1f3b5d824a3b18" "7559ac0083d1f08a46f65920303f970898a3d80f05905d01e81d49bb4c7f9e39" "44961a9303c92926740fc4121829c32abca38ba3a91897a4eab2aa3b7634bed4" "b3bcf1b12ef2a7606c7697d71b934ca0bdd495d52f901e73ce008c4c9825a3aa" "a5b1d671532f27c524264b433ad58df329297b7bb21966eddda1d385e7a9b055" "5d75f9080a171ccf5508ce033e31dbf5cc8aa19292a7e0ce8071f024c6bcad2a" "bd82c92996136fdacbb4ae672785506b8d1d1d511df90a502674a51808ecc89f" "ed36f8e30f02520ec09be9d74fe2a49f99ce85a3dfdb3a182ccd5f182909f3ab" "7356632cebc6a11a87bc5fcffaa49bae528026a78637acd03cae57c091afd9b9" "ab04c00a7e48ad784b52f34aa6bfa1e80d0c3fcacc50e1189af3651013eb0d58" "04dd0236a367865e591927a3810f178e8d33c372ad5bfef48b5ce90d4b476481" "ea71faa917045669be7b7450930b59460e61816a59c1d4026acba806951e194c" "2642a1b7f53b9bb34c7f1e032d2098c852811ec2881eec2dc8cc07be004e45a0" "a0feb1322de9e26a4d209d1cfa236deaf64662bb604fa513cca6a057ddf0ef64" "60e09d2e58343186a59d9ed52a9b13d822a174b33f20bdc1d4abb86e6b17f45b" "04790c9929eacf32d508b84d34e80ad2ee233f13f17767190531b8b350b9ef22" "aded4ec996e438a5e002439d58f09610b330bbc18f580c83ebaba026bbef6c82" "d2e9c7e31e574bf38f4b0fb927aaff20c1e5f92f72001102758005e53d77b8c9" "151bde695af0b0e69c3846500f58d9a0ca8cb2d447da68d7fbf4154dcf818ebc" "6b289bab28a7e511f9c54496be647dc60f5bd8f9917c9495978762b99d8c96a0" "8aca557e9a17174d8f847fb02870cb2bb67f3b6e808e46c0e54a44e3e18e1020" "1c082c9b84449e54af757bcae23617d11f563fc9f33a832a8a2813c4d7dfb652" "6b2636879127bf6124ce541b1b2824800afc49c6ccd65439d6eb987dbf200c36" "49ec957b508c7d64708b40b0273697a84d3fee4f15dd9fc4a9588016adee3dad" "6d589ac0e52375d311afaa745205abb6ccb3b21f6ba037104d71111e7e76a3fc" "100e7c5956d7bb3fd0eebff57fde6de8f3b9fafa056a2519f169f85199cc1c96" "fe666e5ac37c2dfcf80074e88b9252c71a22b6f5d2f566df9a7aa4f9bea55ef8" "274fa62b00d732d093fc3f120aca1b31a6bb484492f31081c1814a858e25c72e" "cd736a63aa586be066d5a1f0e51179239fe70e16a9f18991f6f5d99732cabb32" "f0dc4ddca147f3c7b1c7397141b888562a48d9888f1595d69572db73be99a024" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(diary-entry-marker (quote font-lock-variable-name-face))
 '(electric-indent-mode nil)
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
 '(jdee-server-dir "~/myJars")
 '(objed-cursor-color "#c82829")
 '(package-selected-packages
   (quote
    (evil-mc general evil-tabs tabbar dumb-jump ggtags flymake-cursor flymake-google-cpplint iedit avy-flycheck flycheck tramp-auto-auth tramp-hdfs tramp-term gnu-elpa-keyring-update tramp moe-theme org-bullets org-download latex-math-preview pyenv-mode anaconda-mode elpy live-py-mode matlab-mode atom-dark-theme atom-one-dark-theme org-ac php-auto-yasnippets fill-column-indicator darkroom buffer-move writeroom-mode dired-rainbow format-all nov popup-kill-ring evil-goggles nyan-mode w3m dashboard rainbow-delimiters hungry-delete openwith rainbow-mode smex treemacs treemacs-evil treemacs-icons-dired treemacs-projectile beacon dired-ranger yasnippet-snippets yasnippet-classic-snippets which-key w3 use-package spacemacs-theme projectile-codesearch pdf-tools org-evil org-edna neotree latex-preview-pane irony-eldoc evil-tutor evil-org evil-fringe-mark evil-commentary evil-collection dracula-theme doom-themes company-jedi company-irony-c-headers company-irony company-dict company-c-headers company-bibtex company-auctex color-theme-solarized color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized better-defaults base16-theme avk-emacs-themes auto-yasnippet auto-org-md auto-minor-mode auto-indent-mode auto-highlight-symbol auto-dim-other-buffers auto-dictionary auto-correct auto-complete-sage auto-complete-rst auto-complete-pcmp auto-complete-nxml auto-complete-exuberant-ctags auto-complete-distel auto-complete-clang-async auto-complete-clang auto-complete-chunk auto-complete-c-headers auto-complete-auctex alect-themes ac-math ac-c-headers)))
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