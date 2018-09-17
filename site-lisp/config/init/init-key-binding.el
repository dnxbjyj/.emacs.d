;;;;;;;;;; init-key-binding模块 ;;;;;;;;;;
;;;; Desc: 按键绑定设置（系统功能按键，不包含三方插件的按键配置）

;;;; init-key-binding start here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:

;; 窗口缩放，用于多窗口场景
(global-set-key (kbd "C-S-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "C-S-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "C-S-<down>") 'shrink-window)
(global-set-key (kbd "C-S-<up>") 'enlarge-window)

;; 快速提交git代码: <f12>
(global-set-key (kbd "<f12>") (lambda() (interactive) (shell-command "start auto-commit.bat")))

;; 切换到另一个窗口: C-;
(global-set-key (kbd "C-;") 'other-window)

;; 在当前窗口中切换buffer
(global-set-key (kbd "C-<tab>") 'bs-cycle-next)
(global-set-key (kbd "S-<tab>") 'bs-cycle-previous)

;; 运行当前buffer中的所有代码: C-<f9>
(global-set-key (kbd "C-<f9>") '(lambda() (interactive) (eval-buffer nil)))

;; 快速打开配置文件init.el: <f2>
(global-set-key (kbd "<f2>") '(lambda() (interactive) (find-file "~/.emacs.d/init.el")))
;; 快速加载init.el: C-<f2>
(global-set-key (kbd "C-<f2>") '(lambda() (interactive) (load-file "~/.emacs.d/init.el")))

;; 在文件夹中打开当前文件所在目录: C-c o
(global-set-key (kbd "C-c o") '(lambda() (interactive) (shell-command "start .\\")))

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

;; 在文件夹中打开.emacs.d目录: C-S-<f5>
(global-set-key (kbd "C-S-<f5>") '(lambda() (interactive) (shell-command "start C:/Users/Administrator.PC-20170728DWIF/AppData/Roaming/.emacs.d")))
;; 在dired模式中打开.emacs.d目录: C-<f5>
(global-set-key (kbd "C-<f5>") '(lambda() (interactive) (dired "~/.emacs.d/")))

;; 格式化JSON字符串: C-c C-j
(global-set-key (kbd "C-c C-j") 'json-pretty-print-buffer)

;; 字体缩放
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; 快速跳到某一行
(global-set-key (kbd "C-c j") 'goto-line)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-key-binding)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-key-binding end here
