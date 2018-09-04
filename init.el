;;***************************系统类配置
;; 在dired模式中打开.emacs.d目录
(defun open-emacs-d()
  (interactive)
  (dired "~/.emacs.d/"))
(global-set-key (kbd "C-<f5>") 'open-emacs-d)

;; 在文件夹中打开.emacs.d目录
(defun open-emacs-d-dir()
  (interactive)
  (shell-command "start C:/Users/Administrator.PC-20170728DWIF/AppData/Roaming/.emacs.d"))
(global-set-key (kbd "C-S-<f5>") 'open-emacs-d-dir)

;; 定义一个函数：快速打开配置文件
(defun open-init-file()
    (interactive)
    (find-file "~/.emacs.d/init.el"))
;; 把函数open-init-file绑定到快捷键<F2>键上
(global-set-key (kbd "<f2>") 'open-init-file)
;; 快速加载init.el
(global-set-key (kbd "C-<f2>") 'load-file)

;; 运行当前buffer中的所有代码
(defun eval-this-buffer()
	(interactive)
	(eval-buffer nil (get-buffer-create "output"))
	(switch-to-buffer-other-window "output"))
;; 绑定快捷键C-<f9>
(global-set-key (kbd "C-<f9>") 'eval-this-buffer)

;; 自定义环境变量
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(markdown-command "pandoc -f markdown -t html")
 '(package-selected-packages
   (quote
    (org-pomodoro w3m pydoc markdown-mode jdee company youdao-dictionary))))

;; 关闭哔哔告警音
(setq ring-bell-function 'ignore)

;; 自定义字体设置
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "微软雅黑" :foundry "outline" :slant normal :weight normal :height 120 :width normal)))))

;;***************************文档编辑操作类配置

;; 显示行号
(global-linum-mode 1)

;; 快速跳到某一行
(global-set-key (kbd "C-c j") 'goto-line)
;; 开启括号配对
(electric-pair-mode t)

;;***************************插件配置
;;##### melpha
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; melpa插件库配置
(package-initialize)
(require 'package)
;;(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages") t)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))

;;##### 有道词典，开启缓存和设置快捷键
(setq url-automatic-caching t)
(global-set-key (kbd "C-q") 'youdao-dictionary-search-at-point+)

;;***************************特定模式配置
;;#####dired模式
;; dired模式默认递归删除目录
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)

;; 主动加载 Dired Mode
;; (require 'dired)
;; (defined-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)

;; 延迟加载dired mode
(with-eval-after-load 'dired
    (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;; 启用 dired-x 可以让每一次进入 Dired 模式时，使用新的快捷键 C-x C-j 就可以进 入当前文件夹的所在的路径
(require 'dired-x)

;; 让dired模式多个目录同时打开时共用一个缓冲区
(put 'dired-find-alternate-file 'disabled nil)

;;#####org-mode
;; org-mode自动换行
(add-hook 'org-mode-hook
	  (lambda()
	    (setq truncate-lines nil)))

