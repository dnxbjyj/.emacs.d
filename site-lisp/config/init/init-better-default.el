;;;;;;;;;; init-better-default模块 ;;;;;;;;;;
;;;; Desc: 更好的默认设置

;;;; init-better-default start here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:

;; 在状态条显示当前buffer大小
(size-indication-mode 1)

;; 在状态栏显示当前光标位于哪个函数内部
(which-function-mode t)

;; 设置文本编码全部为utf-8-unix
(setq default-buffer-file-coding-system 'utf-8-unix)  ;; 缓存文件
(setq default-file-name-coding-system 'utf-8-unix)  ;; 文件名
(setq default-keyboard-coding-system 'utf-8-unix)  ;; 键盘输入
(setq default-process-coding-system 'utf-8-unix)  ;; 进程输入输出
(setq default-sendmail-coding-system 'utf-8-unix)  ;; 发送邮件
(setq default-terminal-coding-system 'utf-8-unix)  ;; 终端

;; 设置光标的形状为长条形（而非默认的矩形块）
(setq-default cursor-type 'bar)

;; 关闭备份文件（即以"~"结尾的文件）
(setq make-backup-files nil)

;; 关闭自动保存文件
(setq auto-save-default nil)

;; 使用ido-mode让切换buffer时体验更好
(ido-mode 1)
(setq ido-seperator "\n")

;; 关闭哔哔告警音
(setq ring-bell-function 'ignore)

;; 开启括号配对
(electric-pair-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-better-default)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-better-default end here
