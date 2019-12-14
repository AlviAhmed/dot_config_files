;;; tramp-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "tramp" "tramp.el" (0 0 0 0))
;;; Generated autoloads from tramp.el

(defvar tramp-mode t "\
Whether Tramp is enabled.
If it is set to nil, all remote file names are used literally.")

(custom-autoload 'tramp-mode "tramp" t)

(defconst tramp-initial-file-name-regexp "\\`/.+:.*:" "\
Value for `tramp-file-name-regexp' for autoload.
It must match the initial `tramp-syntax' settings.")

(defvar tramp-file-name-regexp tramp-initial-file-name-regexp "\
Regular expression matching file names handled by Tramp.
This regexp should match Tramp file names but no other file
names.  When calling `tramp-register-file-name-handlers', the
initial value is overwritten by the car of `tramp-file-name-structure'.")

(defvar tramp-ignored-file-name-regexp nil "\
Regular expression matching file names that are not under Tramp’s control.")

(custom-autoload 'tramp-ignored-file-name-regexp "tramp" t)

(defconst tramp-autoload-file-name-regexp (concat "\\`/" (if (memq system-type '(cygwin windows-nt)) "\\(-\\|[^/|:]\\{2,\\}\\)" "[^/|:]+") ":") "\
Regular expression matching file names handled by Tramp autoload.
It must match the initial `tramp-syntax' settings.  It should not
match file names at root of the underlying local file system,
like \"/sys\" or \"/C:\".")

(defun tramp-autoload-file-name-handler (operation &rest args) "\
Load Tramp file name handler, and perform OPERATION." (tramp-unload-file-name-handlers) (if tramp-mode (let ((default-directory temporary-file-directory)) (load "tramp" (quote noerror) (quote nomessage)))) (apply operation args))

(defun tramp-register-autoload-file-name-handlers nil "\
Add Tramp file name handlers to `file-name-handler-alist' during autoload." (add-to-list (quote file-name-handler-alist) (cons tramp-autoload-file-name-regexp (quote tramp-autoload-file-name-handler))) (put (quote tramp-autoload-file-name-handler) (quote safe-magic) t))
 (tramp-register-autoload-file-name-handlers)

(defun tramp-unload-file-name-handlers nil "\
Unload Tramp file name handlers from `file-name-handler-alist'." (dolist (fnh file-name-handler-alist) (when (and (symbolp (cdr fnh)) (string-prefix-p "tramp-" (symbol-name (cdr fnh)))) (setq file-name-handler-alist (delq fnh file-name-handler-alist)))))

(defvar tramp-completion-mode nil "\
If non-nil, external packages signal that they are in file name completion.")

(autoload 'tramp-unload-tramp "tramp" "\
Discard Tramp from loading remote files.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "tramp" '(#("tramp-" 0 6 (fontified nil)) #("with-" 0 5 (fontified nil)))))

;;;***

;;;### (autoloads nil "tramp-adb" "tramp-adb.el" (0 0 0 0))
;;; Generated autoloads from tramp-adb.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "tramp-adb" '(#("tramp-" 0 6 (fontified nil)))))

;;;***

;;;### (autoloads nil "tramp-archive" "tramp-archive.el" (0 0 0 0))
;;; Generated autoloads from tramp-archive.el

(defvar tramp-archive-enabled (featurep 'dbusbind) "\
Non-nil when file archive support is available.")

(defconst tramp-archive-suffixes '("7z" "apk" "ar" "cab" "CAB" "cpio" "deb" "depot" "exe" "iso" "jar" "lzh" "LZH" "msu" "MSU" "mtree" "odb" "odf" "odg" "odp" "ods" "odt" "pax" "rar" "rpm" "shar" "tar" "tbz" "tgz" "tlz" "txz" "tzst" "warc" "xar" "xpi" "xps" "zip" "ZIP") "\
List of suffixes which indicate a file archive.
It must be supported by libarchive(3).")

(defconst tramp-archive-compression-suffixes '("bz2" "gz" "lrz" "lz" "lz4" "lzma" "lzo" "uu" "xz" "Z" "zst") "\
List of suffixes which indicate a compressed file.
It must be supported by libarchive(3).")

(defmacro tramp-archive-autoload-file-name-regexp nil "\
Regular expression matching archive file names." (quote (concat "\\`" "\\(" ".+" "\\." (regexp-opt tramp-archive-suffixes) "\\(?:" "\\." (regexp-opt tramp-archive-compression-suffixes) "\\)*" "\\)" "\\(" "/" ".*" "\\)" "\\'")))

(defalias 'tramp-archive-autoload-file-name-handler #'tramp-autoload-file-name-handler)

(defun tramp-register-archive-file-name-handler nil "\
Add archive file name handler to `file-name-handler-alist'." (when tramp-archive-enabled (add-to-list (quote file-name-handler-alist) (cons (tramp-archive-autoload-file-name-regexp) (function tramp-archive-autoload-file-name-handler))) (put (quote tramp-archive-autoload-file-name-handler) (quote safe-magic) t)))

(add-hook 'after-init-hook #'tramp-register-archive-file-name-handler)

(add-hook 'tramp-archive-unload-hook (lambda nil (remove-hook 'after-init-hook #'tramp-register-archive-file-name-handler)))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "tramp-archive" '(#("tramp-" 0 6 (fontified nil)) #("with-parsed-tramp-archive-file-name" 0 35 (fontified nil)))))

;;;***

;;;### (autoloads nil "tramp-cache" "tramp-cache.el" (0 0 0 0))
;;; Generated autoloads from tramp-cache.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "tramp-cache" '(#("tramp-" 0 6 (fontified nil)))))

;;;***

;;;### (autoloads nil "tramp-cmds" "tramp-cmds.el" (0 0 0 0))
;;; Generated autoloads from tramp-cmds.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "tramp-cmds" '(#("tramp-" 0 6 (fontified nil)))))

;;;***

;;;### (autoloads nil "tramp-compat" "tramp-compat.el" (0 0 0 0))
;;; Generated autoloads from tramp-compat.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "tramp-compat" '(#("tramp-" 0 6 (fontified nil)))))

;;;***

;;;### (autoloads nil "tramp-ftp" "tramp-ftp.el" (0 0 0 0))
;;; Generated autoloads from tramp-ftp.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "tramp-ftp" '(#("tramp-" 0 6 (fontified nil)))))

;;;***

;;;### (autoloads nil "tramp-gvfs" "tramp-gvfs.el" (0 0 0 0))
;;; Generated autoloads from tramp-gvfs.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "tramp-gvfs" '(#("tramp-" 0 6 (fontified nil)) #("with-tramp-dbus-" 0 16 (fontified nil)))))

;;;***

;;;### (autoloads nil "tramp-integration" "tramp-integration.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from tramp-integration.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "tramp-integration" '(#("tramp-" 0 6 (fontified nil)))))

;;;***

;;;### (autoloads nil "tramp-rclone" "tramp-rclone.el" (0 0 0 0))
;;; Generated autoloads from tramp-rclone.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "tramp-rclone" '(#("tramp-rclone-" 0 13 (fontified nil)))))

;;;***

;;;### (autoloads nil "tramp-sh" "tramp-sh.el" (0 0 0 0))
;;; Generated autoloads from tramp-sh.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "tramp-sh" '(#("tramp-" 0 6 (fontified nil)))))

;;;***

;;;### (autoloads nil "tramp-smb" "tramp-smb.el" (0 0 0 0))
;;; Generated autoloads from tramp-smb.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "tramp-smb" '(#("tramp-smb-" 0 10 (fontified nil)))))

;;;***

;;;### (autoloads nil "tramp-sudoedit" "tramp-sudoedit.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from tramp-sudoedit.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "tramp-sudoedit" '(#("tramp-sudoedit-" 0 15 (fontified nil)))))

;;;***

;;;### (autoloads nil "tramp-uu" "tramp-uu.el" (0 0 0 0))
;;; Generated autoloads from tramp-uu.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "tramp-uu" '(#("tramp-uu" 0 8 (fontified nil)))))

;;;***

;;;### (autoloads nil "trampver" "trampver.el" (0 0 0 0))
;;; Generated autoloads from trampver.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "trampver" '(#("tramp-" 0 6 (fontified nil)))))

;;;***

;;;### (autoloads nil nil ("tramp-loaddefs.el" "tramp-pkg.el") (0
;;;;;;  0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; tramp-autoloads.el ends here
