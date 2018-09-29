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

;; 在文件夹中打开.emacs.d目录: C-S-<f1>
(global-set-key (kbd "C-S-<f1>") '(lambda() (interactive) (shell-command "start C:/Users/Administrator.PC-20170728DWIF/AppData/Roaming/.emacs.d")))

;; 快速在dired模式打开e:/code目录: C-<f6>
(global-set-key (kbd "C-<f6>") (lambda() (interactive) (dired "e:/code")))
;; 快速在文件夹中打开e:/code目录: C-S-<f6>
(global-set-key (kbd "C-S-<f6>") (lambda() (interactive) (shell-command "start e:/code")))

;; 快速打开vector8日程文件: <f8>
(global-set-key (kbd "<f8>") (lambda() (interactive) (find-file "e:/gitee/vector8/vector8.org.txt")))
;; 快速在dired模式打开e:/gitee目录: C-<f8>
(global-set-key (kbd "C-<f8>") (lambda() (interactive) (dired "e:/gitee")))
;; 快速在文件夹中打开e:/gitee目录: C-S-<f8>
(global-set-key (kbd "C-S-<f8>") (lambda() (interactive) (shell-command "start e:/gitee")))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-quick-access-local)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-quick-access-local end here
