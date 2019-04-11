;;;;;;;;;; init-eshell-mode模块 ;;;;;;;;;;
;;;; Desc:

;;;; init-eshell-mode start here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:
;; solve the problem that Chinese character messy code in eshell-mode
(add-hook 'eshell-mode-hook
	  (lambda ()
	    (when (eq system-type 'windows-nt)
	      (prefer-coding-system 'gbk))))

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
