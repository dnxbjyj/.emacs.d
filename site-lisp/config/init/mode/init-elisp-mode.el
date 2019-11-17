;;;;;;;;;; init-elisp-mode module ;;;;;;;;;;
;;;; Desc:

;;;; init-elisp-mode starts here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:
(require 'elisp-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:
;; 执行当前行的S式
(defun eval-current-line-sexp ()
  (interactive)
  (goto-char (line-end-position))
  (eval-last-sexp nil))

;; 执行当前所在的defun函数
(defun eval-current-defun ()
  "Eval current defun."
  (interactive)
  (call-interactively 'eval-defun))

;; add hooks
(add-hook 'emacs-lisp-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-<f11>") 'eval-current-line-sexp)
	    (local-set-key (kbd "C-M-<f11>") 'eval-current-defun)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-elisp-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-elisp-mode ends here
