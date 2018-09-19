;;;;;;;;;; init-quick-access模块 ;;;;;;;;;;
;;;; Desc: 通用的快速访问按键配置

;;;; init-quick-access start here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:

;; 在dired模式中打开.emacs.d目录: C-<f1>
(global-set-key (kbd "C-<f1>") '(lambda() (interactive) (dired "~/.emacs.d/")))

;; 快速打开配置文件init-config.el: <f2>
(global-set-key (kbd "<f2>") '(lambda() (interactive) (find-file "~/.emacs.d/site-lisp/config/init-config.el")))
;; 快速加载init-config.el: C-<f2>
(global-set-key (kbd "C-<f2>") '(lambda() (interactive) (load-file "~/.emacs.d/site-lisp/config/init-config.el")))

;; 快速打开emacs日常积累文件：emacs-daily.org
(global-set-key (kbd "<f7>") (lambda() (interactive) (find-file "~/.emacs.d/emacs-daily.org")))

;; 快速提交git代码: <f12>
(global-set-key (kbd "<f12>") (lambda() (interactive) (shell-command "start auto-commit.bat")))

;; 在文件夹中打开当前文件所在目录: C-c o
(global-set-key (kbd "C-c o") '(lambda() (interactive) (shell-command "start .\\")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-quick-access)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-quick-access end here
