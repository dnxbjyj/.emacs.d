;;;;;;;;;; init-org-mode模块 ;;;;;;;;;;
;;;; Desc: org-mode配置

;;;; init-org-mode start here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:
(require 'org-indent)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:
(defun insert-s-or-f-note (command)
  "Insert snote or fnote mark, or delete an existing mark in org-mode."
  (interactive "sInput `s' for inputing snote mark, `f' for inputing fnote mark, `d' for deleting an existing mark: ")
  (cond
   ((string-equal command "s") (insert "[s&f:s]"))
   ((string-equal command "f") (insert "[s&f:f]"))
   ((string-equal command "d")
    (skip-chars-backward "^[:space:]")
    (insert "+")
    (skip-chars-forward "^[:space:]")
    (insert "+"))
   (t (message "NOT support the command: %s" command))))
(add-hook 'org-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-c s n") 'insert-s-or-f-note)))

;; toggle link display
(add-hook 'org-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-c t p") 'org-toggle-link-display)))

(defun my-org-table-insert-row-below ()
  "Insert a new row at current row below quickly in org-table."
  (interactive)
  (let ((current-prefix-arg 5))
    (call-interactively 'org-table-insert-row)))
(add-hook 'org-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-c M-RET") 'my-org-table-insert-row-below)))

(defun my-org-table-insert-column-below ()
  "Insert a new column at current column below quickly in org-table."
  (interactive)
  (let ((current-prefix-arg 5))
    (call-interactively 'org-table-insert-column)))
(add-hook 'org-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-c <S-return>") 'my-org-table-insert-column-below)))

;; close org mode indent
(org-indent-mode -1)

(defun my-org-insert-str-to-head-tail (flag)
  "Operate a region, or word at point, insert a character both at the position of head and tail.
If flag is `d', insert `+' character, for the sake of deleting text in org-mode.
