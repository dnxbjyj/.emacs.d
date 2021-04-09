;;;;;;;;;; init-python-mode module ;;;;;;;;;;
;;;; Desc:

;;;; init-python-mode starts here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:
(require 's)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:
(defun select-line-fit-indent ()
  "Select current line with fit indent."
  (interactive)
  (goto-char (line-beginning-position))
  (skip-chars-forward "[[:space:]]")
  (setq head-point (point))
  (end-of-line)
  (set-mark head-point))

(defun insert-doc-annotation-below-current-line ()
  "Insert doc annotations for python class or function below current line."
  (interactive)
  ;; first, get current line text
  (let ((cur-line-str (buffer-substring-no-properties (line-beginning-position) (line-end-position))))
    (cond
     ;; judge whether current line text match python function define pattern
     ((string-match "^[[:space:]]*def.+?(\\(.*\\))[[:space:]]*[-:]" cur-line-str)
      ;; first capture group of regex above is params list string
      (setq params-str (match-string 1 cur-line-str))      
      ;; check if type hint exist in params-str
      (setq type-hint-exist nil)
      (when (s-contains-p ":" params-str)
          (setq type-hint-exist t))
      ;; split params list string to list, and do some strip operation
      (setq params (split-string params-str ",[[:space:]]*" t "[[:space:]]*[=:].+?"))
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
	    ;; insert param type annotation line when type hint not exist
            (unless type-hint-exist
              (insert (format ":type %s: " param))
              (newline-and-indent))
	    (newline-and-indent)))
	(setq params (cdr params)))
      ;; insert return and return type annotation line
      (insert ":return: ")
      (newline-and-indent)
      ;; insert rtype when type hint not exist
      (unless type-hint-exist
        (insert ":rtype:")
        (newline-and-indent))
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

;; add-hooks
(add-hook 'python-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-_") 'select-line-fit-indent)
	    (local-set-key (kbd "C-c C-a") 'insert-doc-annotation-below-current-line)
	    (local-set-key (kbd "C-<return>") '(lambda () (interactive)    ;; 4 space
						 (insert "    ")))
	    (local-set-key (kbd "C-a") '(lambda () (interactive)    ;; change the behavior of "C-a"
					  (goto-char (line-beginning-position))
					  (skip-chars-forward "[[:space:]]")))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-python-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-python-mode ends here
