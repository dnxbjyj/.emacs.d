;;;;;;;;;; init-org-mode模块 ;;;;;;;;;;
;;;; Desc: org-mode配置

;;;; init-org-mode start here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:
;; 缩进
(add-hook 'org-mode-hook
	  (lambda()
	    (global-set-key (kbd "C-c i") '(lambda () (interactive) (org-indent-mode 1)))))
(add-hook 'org-mode-hook
	  (lambda()
	    (global-set-key (kbd "C-c l") '(lambda () (interactive) (org-indent-mode 0)))))


;; 上下移动同一级主题的整行的内容
(add-hook 'org-mode-hook
	  (lambda()
	    (global-set-key (kbd "M-n") 'org-metadown)))
(add-hook 'org-mode-hook
	  (lambda()
	    (global-set-key (kbd "M-p") 'org-metaup)))

;; org-mode自动换行
(add-hook 'org-mode-hook
	  (lambda()
	    (setq truncate-lines nil)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-org-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-org-mode end here
