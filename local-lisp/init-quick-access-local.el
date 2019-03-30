;;;;;;;;;; init-quick-access-local模块 ;;;;;;;;;;
;;;; Desc: 本地化的快速访问

;;;; init-quick-access-local start here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:
;; 快速打开windows下的hosts文件
(defun my-local/hosts()
  "quickly open hosts config file."
  (interactive)
  (find-file "C:/Windows/System32/drivers/etc/hosts"))

;; quickly open quick-access.org
(global-set-key (kbd "C-<f12>") '(lambda() (interactive) (find-file "~/.emacs.d/local-lisp/quick-access-local.org")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-quick-access-local)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-quick-access-local end here
