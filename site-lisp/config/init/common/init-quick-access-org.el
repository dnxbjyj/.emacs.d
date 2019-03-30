;;;;;;;;;; init-quick-access-org module ;;;;;;;;;;
;;;; Desc:

;;;; init-quick-access-org starts here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:
(defun bind-key-for-open (path key-str in-where)
  "Quickly make a key bind for the operation of opening a directory or file in emacs dired-mode, or in system explorer."
  (interactive)
  (cond
   ((string-equal in-where "file") (global-set-key (kbd key-str) `(lambda() (interactive) (message "open %s in %s..." ',path ',in-where)(find-file ',path))))
   ((string-equal in-where "dired") (global-set-key (kbd key-str) `(lambda() (interactive) (message "open %s in %s..." ',path ',in-where)(dired ',path))))
   ((string-equal in-where "explorer") (global-set-key (kbd key-str) `(lambda() (interactive) (message "open %s in %s..." ',path ',in-where)(async-shell-command (format "start \"\" \"%s\"" ',path)))))
   (t (message "NOT support the operation: %s!" in-where))))

;; quickly open quick-access.org
(bind-key-for-open "~/.emacs.d/site-lisp/org/quick-access.org" "<f12>" "file")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-quick-access-org)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-quick-access-org ends here
