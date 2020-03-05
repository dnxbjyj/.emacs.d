;;;;;;;;;; init-atomic-chrome module ;;;;;;;;;;
;;;; Desc:

;;;; init-atomic-chrome starts here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:
(require 'atomic-chrome)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:
;; start the server
(atomic-chrome-start-server)

(defun cover-buffer-content (source-buffer-name target-buffer-name)
  "Cover target buffer content with source buffer content."
  (save-excursion
    (ignore-errors
      ;; check whether buffer exist
      (unless (and (get-buffer source-buffer-name) (get-buffer target-buffer-name))
	(error "source buffer or target buffer NOT exist!"))
      ;; store current buffer
      (setq cur-buffer (buffer-name))
      ;; switch to source buffer and get buffer content
      (switch-to-buffer source-buffer-name)
      (setq source-buffer-content (buffer-substring-no-properties (point-min) (point-max)))
      ;; switch to target buffer and cover its content with source buffer content
      (switch-to-buffer target-buffer-name)
      (delete-region (point-min) (point-max))
      (goto-char (point-min))
      (insert source-buffer-content)
      (goto-char (point-min))
      ;; switch back to current buffer
      (switch-to-buffer cur-buffer))))

(defun update-atomic-chrome-content (atomic-chrome-buffer-name)
  "Update atomic chrome buffer content with current buffer content, and sync text to chrome."
  (interactive)
  (setq cur-buffer (buffer-name))
  ;; cover atomic chrome buffer content with current buffer content
  (cover-buffer-content cur-buffer atomic-chrome-buffer-name)
  ;; sync text to chrome
  (switch-to-buffer atomic-chrome-buffer-name)
  (atomic-chrome-send-buffer-text)
  (switch-to-buffer cur-buffer))

(defun update-selected-atomic-chrome-buffer-content ()
  "Update a selected atomic chrome buffer with current buffer content, and sync text to chrome."
  (interactive)
  (setq atomic-chrome-buffer-name (read-buffer "Please select an atomic chrome buffer to update: " nil nil nil)) 
  (update-atomic-chrome-content atomic-chrome-buffer-name))

(defun add-sync-atomic-chrome-hook-locally ()
  "Add sync atomic chrome hook locally." 
  (interactive)
  (setq atomic-chrome-buffer-name (read-buffer "Please select an atomic chrome buffer to add sync hook: " nil nil))
  (add-hook 'after-save-hook (apply-partially #'update-atomic-chrome-content atomic-chrome-buffer-name) t t)
  (message "add sync atomic chrome hook locally to atomic chrome buffer: %s SUCCESS!" atomic-chrome-buffer-name))

(defun remove-sync-atomic-chrome-hook-locally ()
  "Remove sync atomic chrome hook locally." 
  (interactive)
  (setq atomic-chrome-buffer-name (read-buffer "Please select an atomic chrome buffer to remove sync hook: " nil nil))
  (remove-hook 'after-save-hook (apply-partially #'update-atomic-chrome-content atomic-chrome-buffer-name) t)
  (message "remove sync atomic chrome hook locally from atomic chrome buffer: %s SUCCESS!" atomic-chrome-buffer-name))

(defun show-sync-atomic-chrome-after-save-hook ()
  (interactive)
  (message "value of `after-save-hook' is: %s" (cdr after-save-hook)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-atomic-chrome)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-atomic-chrome ends here
