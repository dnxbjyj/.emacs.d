;;;;;;;;;; init-eshell-mode模块 ;;;;;;;;;;
;;;; Desc:

;;;; init-eshell-mode start here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:
(defun clear-screen ()
  "Clear current screen."
  (interactive)
  (let ((eshell-buffer-maximum-lines 0))
	(eshell-truncate-buffer)))
(add-hook 'eshell-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-l") 'clear-screen)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-eshell-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-eshell-mode end here
