(defgroup pasteex nil
  "Save clipboard image to disk file, and insert file path to current buffer.")

(defcustom pasteex-executable-path "pasteex"
  "Pasteex executable file path."
  :type 'string
  :group 'pasteex)

(defun pasteex-image ()
  "Save clipboard image to disk file, and insert file path to current buffer."
  (interactive)
  ;; make img dir if not exists
  (setq img-dir (concatenate 'string (file-name-directory (buffer-file-name)) "/img/"))
  (unless (file-directory-p img-dir)
    (make-directory img-dir))
  ;; build image file name (use `pasteex_screenshot' as prefix, following buffer name, following datetime string)
  (setq img-file-name (format "pasteex_screenshot_%s_%s.png" (file-name-base (buffer-file-name)) (format-time-string "%Y%m%d%H%M%S")))
  ;; save image file to img-dir by invoking pasteex executable command
  (shell-command (format "%s /q %s %s" pasteex-executable-path img-dir img-file-name))
  ;; insert image file path (relative path)
  (setq relative-img-file-path (concatenate 'string "./img/" img-file-name))
  (insert (build-img-file-insert-path relative-img-file-path)))

(defun build-img-file-insert-path (file-path)
  "Build image file path that to insert to current buffer."
  (cond
   ((string-equal major-mode "markdown-mode") (format "![](%s)" file-path))
   ((string-equal major-mode "org-mode") (format "[[%s]]" file-path))
   (t file-path)))

;;;###autoload
(define-minor-mode pasteex-mode
  "Save clipboard image to disk file, and insert file path to current buffer."
  :lighter " pasteex")

;;;###autoload
(add-hook 'org-mode-hook 'pasteex-mode)
;;;###autoload
(add-hook 'markdown-mode-hook 'pasteex-mode)

(provide 'pasteex-mode)
