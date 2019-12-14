;;; tramp-auto-auth-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "tramp-auto-auth" "tramp-auto-auth.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from tramp-auto-auth.el

(defvar tramp-auto-auth-mode nil "\
Non-nil if Tramp-Auto-Auth mode is enabled.
See the `tramp-auto-auth-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `tramp-auto-auth-mode'.")

(custom-autoload 'tramp-auto-auth-mode "tramp-auto-auth" nil)

(autoload 'tramp-auto-auth-mode "tramp-auto-auth" "\
Toggle Tramp-Auto-Auth global minor mode on or off.
With a prefix argument ARG, enable Tramp-Auto-Auth mode if ARG is
positive, and disable it otherwise.  If called from Lisp, enable
the mode if ARG is omitted or nil, and toggle it if ARG is ‘toggle’.

When enabled ‘tramp-auto-auth-alist’ is used to automatically
authenticate to remote servers.

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "tramp-auto-auth" '("tramp-auto-auth-alist")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; tramp-auto-auth-autoloads.el ends here
