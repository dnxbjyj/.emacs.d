;;;;;;;;;; init-python-mode module ;;;;;;;;;;
;;;; Desc:

;;;; init-python-mode starts here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:
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
