;;; elscreen-tab-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "elscreen-tab" "elscreen-tab.el" (0 0 0 0))
;;; Generated autoloads from elscreen-tab.el

(defvar elscreen-tab-mode nil "\
Non-nil if Elscreen-Tab mode is enabled.
See the `elscreen-tab-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `elscreen-tab-mode'.")

(custom-autoload 'elscreen-tab-mode "elscreen-tab" nil)

(autoload 'elscreen-tab-mode "elscreen-tab" "\
Show tab window of elscreen at `elscreen-tab-position' instead of 'header-line.
Because header line is precious and tab is only displayed in
`frame-first-window' in elscreen-mode.

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "elscreen-tab" '("elscreen-tab-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; elscreen-tab-autoloads.el ends here
