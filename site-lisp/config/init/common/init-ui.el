;;;;;;;;;; init-ui模块 ;;;;;;;;;;
;;;; Desc: 界面外观设置

;;;; init-ui start here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:
;; display line number and column number on mode line
(setq line-number-mode 1)
(setq column-number-mode 1)

;; set noto sans monospaced font, should install corresponding ttf in advance
; (set-default-font "Noto Sans Mono")

;; 设置行号格式为数字后面跟一个空格
(setq linum-format "%d ")

;; 关闭启动帮助画面
(setq inhibit-splash-screen 1)

;; 语法高亮
(global-font-lock-mode t)

;; 图形界面模式时关闭一些界面元素
(if (display-graphic-p)
    (progn
      ;; 关闭滚动条
      (scroll-bar-mode 0)
      ;; 关闭菜单栏
      (menu-bar-mode 0)
      ;; 关闭工具栏
      (tool-bar-mode 0)))
  

;; 关闭启动欢迎画面
(setq inhibit-startup-message t)

;; 启动时最大化窗口
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; 全屏展示
;; (toggle-frame-fullscreen)

;; 高亮当前行
(global-hl-line-mode 1)

;; 自定义字体设置
(custom-set-faces
 '(default ((t (:family "微软雅黑" :foundry "outline" :slant normal :weight normal :height 120 :width normal)))))

;; 显示行号
(global-linum-mode 1)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-ui)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-ui end here
