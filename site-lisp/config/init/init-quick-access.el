;;;;;;;;;; init-quick-access模块 ;;;;;;;;;;
;;;; Desc: 快速访问按键配置

;;;; init-quick-access start here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:

;; 在文件夹中打开.emacs.d目录: C-S-<f1>
(global-set-key (kbd "C-S-<f1>") '(lambda() (interactive) (shell-command "start C:/Users/Administrator.PC-20170728DWIF/AppData/Roaming/.emacs.d")))
;; 在dired模式中打开.emacs.d目录: C-<f1>
(global-set-key (kbd "C-<f1>") '(lambda() (interactive) (dired "~/.emacs.d/")))

;; 快速打开配置文件init-config.el: <f2>
(global-set-key (kbd "<f2>") '(lambda() (interactive) (find-file "~/.emacs.d/site-lisp/config/init-config.el")))
;; 快速加载init-config.el: C-<f2>
(global-set-key (kbd "C-<f2>") '(lambda() (interactive) (load-file "~/.emacs.d/site-lisp/config/init-config.el")))

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

;; 快速提交git代码: <f12>
(global-set-key (kbd "<f12>") (lambda() (interactive) (shell-command "start auto-commit.bat")))


;; 在文件夹中打开当前文件所在目录: C-c o
(global-set-key (kbd "C-c o") '(lambda() (interactive) (shell-command "start .\\")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-quick-access)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-quick-access end here
