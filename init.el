;;***************************系统类配置***************************
;; 设置光标的形状为长条形（而非默认的矩形块）
(setq-default cursor-type 'bar)

;; 关闭备份文件（即以"~"结尾的文件）
(setq make-backup-files nil)

;; 关闭自动保存文件
(setq auto-save-default nil)

;; 默认使用utf-8编码新建文件
(setq default-buffer-file-coding-system 'utf-8-unix) 

;; 绑定切换到另一个窗口的快捷键为更好用的C-;
(global-set-key (kbd "C-;") 'other-window)

;; 使用bs-cycle-next和bs-cycle-previous在当前窗口中切换buffer
(global-set-key (kbd "C-<tab>") 'bs-cycle-next)
(global-set-key (kbd "S-<tab>") 'bs-cycle-previous)

;; 使用ido-mode让切换buffer时体验更好
(ido-mode 1)
(setq ido-seperator "\n")

;; 关闭菜单栏
(menu-bar-mode 0)
;; 关闭工具栏
(tool-bar-mode 0)
;; 关闭右边滚动条
(scroll-bar-mode 0)
;; 关闭启动欢迎画面
(setq inhibit-startup-message t)
;; 关闭哔哔告警音
(setq ring-bell-function 'ignore)

;; 启动时最大化窗口
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; 全屏展示
(toggle-frame-fullscreen)

;; 高亮当前行
(global-hl-line-mode 1)

;; 运行当前buffer中的所有代码，并绑定快捷键C-<f9>
(global-set-key (kbd "C-<f9>") '(lambda() (interactive) (eval-buffer nil)))

;; 自定义环境变量（自动添加的）
(custom-set-variables
 '(markdown-command "pandoc -f markdown -t html")
 '(package-selected-packages
   (quote
    (magit org-pomodoro w3m pydoc markdown-mode jdee company youdao-dictionary))))

;;***************************快速打开配置***************************
;; 快速打开配置文件init.el，并绑定到快捷键<F2>键上
(global-set-key (kbd "<f2>") '(lambda() (interactive) (find-file "~/.emacs.d/init.el")))
;; 快速加载init.el
(global-set-key (kbd "C-<f2>") '(lambda() (interactive) (load-file "~/.emacs.d/init.el")))

;; 在文件夹中打开当前文件所在目录C-c o
(global-set-key (kbd "C-c o") '(lambda() (interactive) (shell-command "start .\\")))

;; 快速在dired模式打开e:/code目录，绑定快捷键C-<f6>
(global-set-key (kbd "C-<f6>") (lambda() (interactive) (dired "e:/code")))
;; 快速在文件夹中打开e:/code目录，绑定快捷键C-S-<f6>
(global-set-key (kbd "C-S-<f6>") (lambda() (interactive) (shell-command "start e:/code")))

;; 在文件夹中打开.emacs.d目录，并绑定快捷键为：C-S-<f5>
(global-set-key (kbd "C-S-<f5>") '(lambda() (interactive) (shell-command "start C:/Users/Administrator.PC-20170728DWIF/AppData/Roaming/.emacs.d")))
;; 在dired模式中打开.emacs.d目录，并绑定快捷键C-<f5>
(global-set-key (kbd "C-<f5>") '(lambda() (interactive) (dired "~/.emacs.d/")))

;;***************************外观、主题配置***************************
;; 将主题文件目录：~/.emacs.d/themes添加到加载路径里
(add-to-list 'load-path "~/.emacs.d/themes")

;; 引入color-theme模块（需要提前将主题文件夹themes和color-theme.el文件放入~/.emacs.d/themes目录下）
(require 'color-theme)
;; 初始化模块
(color-theme-initialize)  

;; 设置calm-forest主题
(color-theme-calm-forest)

;; 自定义字体设置
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "微软雅黑" :foundry "outline" :slant normal :weight normal :height 120 :width normal)))))

;;***************************编程开发类配置***************************
;; 自动提交当前文件所在git仓库的所有修改代码到远程master分支，绑定快捷键：C-c C-p
(global-set-key
 (kbd "C-c C-p")
 '(lambda()
    (interactive)
    (shell-command "git add -A && git commit -m \"modify something in emacs\" && git push origin master")))

;;***************************文档编辑操作类配置***************************
;; 格式化JSON字符串
(global-set-key (kbd "C-c C-j") '(lambda () (interactive) (json-pretty-print-buffer)))

;; 字体缩放
(global-set-key (kbd "C-+") '(lambda () (interactive) (text-scale-increase)))
(global-set-key (kbd "C--") '(lambda () (interactive) (text-scale-decrease)))

;; 显示行号
(global-linum-mode 1)

;; 快速跳到某一行
(global-set-key (kbd "C-c j") 'goto-line)

;; 开启括号配对
(electric-pair-mode t)

;;***************************插件配置***************************
;;##### melpha #####
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

;;##### 有道词典，开启缓存和设置快捷键#####
(setq url-automatic-caching t)
(global-set-key (kbd "C-q") 'youdao-dictionary-search-at-point+)

;;##### org-pomodoro #####
;; org-pomodoro插件快捷键：在org-mode打开/关闭番茄钟
(global-set-key (kbd "C-c p")
		'(lambda () (interactive)
		   (org-pomodoro)))

;;***************************特定模式配置***************************
;;#####company-mode模式#####
;; 延迟时间 
(setq company-idle-delay 0.2)           
;; 触发补全的字符数量 
(setq company-minimum-prefix-length 2) 

;; 为所有的缓冲区开启company-mode模式
(add-hook 'after-init-hook 'global-company-mode)

;;#####dired模式#####

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

;;#####org-mode#####
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
	    (global-set-key (kbd "M-n") '(lambda () (interactive) (org-metadown)))))
(add-hook 'org-mode-hook
	  (lambda()
	    (global-set-key (kbd "M-p") '(lambda () (interactive) (org-metaup)))))

;; org-mode自动换行
(add-hook 'org-mode-hook
	  (lambda()
	    (setq truncate-lines nil)))

