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

;; 快速在dired模式打开d:/github目录: C-<f1>
(global-set-key (kbd "C-<f1>") (lambda() (interactive) (dired "d:/github")))
;; 快速在文件夹中打开e:/code目录: C-S-<f6>
(global-set-key (kbd "C-S-<f1>") (lambda() (interactive) (shell-command "start d:/github")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-quick-access-local)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-quick-access-local end here
