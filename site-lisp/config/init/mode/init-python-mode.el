;;;;;;;;;; init-python-mode module ;;;;;;;;;;
;;;; Desc:

;;;; init-python-mode starts here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:
(defun insert-doc-annotation-below-current-line ()
  "Insert doc annotations for python class or function below current line."
  (interactive)
  ;; first, get current line text
  (let ((cur-line-str (buffer-substring-no-properties (line-beginning-position) (line-end-position))))
    (cond
     ;; judge whether current line text match python function define pattern
     ((string-match "^[[:space:]]*def.+?(\\(.*\\))[[:space:]]*:" cur-line-str)
      ;; first capture group of regex above is params list string
      (setq params-str (match-string 1 cur-line-str))
      ;; split params list string to list, and do some strip operation
      (setq params (split-string params-str ",[[:space:]]*" t "[[:space:]]*=.+?"))
      ;; go to end of current line and go to new line and indent
      (goto-char (line-end-position))
      (newline-and-indent)
      ;; insert head of doc annotation `'''`
      (insert "'''")
      (goto-char (line-end-position))
      (newline-and-indent)
      ;; record current line number, jump back to here after inserting annotation
      (setq annotation-top-line (line-number-at-pos))
      (newline-and-indent)
      (newline-and-indent)
      ;; insert each params annotation
      (while params
	;; NOT insert param `self`
	(when (not (string-equal (car params) "self"))
	  (progn
	    (setq param (car params))
	    ;; insert param name annotation line
	    (insert (format ":param %s: " param))
	    (newline-and-indent)
	    ;; insert param type annotation line
	    (insert (format ":type %s: " param))
	    (newline-and-indent)
	    (newline-and-indent)))
	(setq params (cdr params)))
      ;; insert return and return type annotation line
      (insert ":return: ")
      (newline-and-indent)
      (insert ":rtype:")
      (newline-and-indent)
      ;; insert tail of doc annotation
      (insert "'''")
      ;; jump back to the position of annotation top
      (goto-line annotation-top-line)
      (indent-for-tab-command))
     ((string-match "^[[:space:]]*class.+?:" cur-line-str)
      (goto-char (line-end-position))
      (newline-and-indent)
      ;; insert head of doc annotation `'''`
      (insert "'''")
      (goto-char (line-end-position))
      (newline-and-indent)
      ;; record current line number, jump back to here after inserting annotation
      (setq annotation-top-line (line-number-at-pos))
      (newline-and-indent)
      ;; insert tail of doc annotation
      (insert "'''")
      ;; jump back to the position of annotation top
      (goto-line annotation-top-line)
      (indent-for-tab-command))
     (t (message "current line NOT match neither function nor class!")))))

(add-hook 'python-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-c C-a") 'insert-doc-annotation-below-current-line)))

;; 4 space
(add-hook 'python-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-<return>") '(lambda () (interactive)
						 (insert "    ")))))

;; change the behavior of "C-a"
(add-hook 'python-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-a") '(lambda () (interactive)
					  (goto-char (line-beginning-position))
					  (skip-chars-forward "[[:space:]]")))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-python-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-python-mode ends here
