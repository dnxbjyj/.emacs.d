;;;;;;;;;; init-better-default模块 ;;;;;;;;;;
;;;; Desc: 更好的默认设置


;;;; init-better-default start here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:
(require 'recentf)
(require 'saveplace)
(require 'init-local-path)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:
;; set some important source code dirs to READ ONLY
(defun set-dirs-read-only ()
  "Set some dirs to be read only."
  (if (and (boundp 'dirs-to-be-read-only) dirs-to-be-read-only)
      (progn
	(setq case-fold-search t)
	(mapcar (lambda (dir-prefix)
		  (if (string-match (concat dir-prefix ".+?$") (buffer-file-name))
		      (progn
			(setq buffer-read-only t)
			(message "current buffer is setted to READ ONLY!"))))
		dirs-to-be-read-only))))
(add-hook 'find-file-hooks 'set-dirs-read-only)

;; set case insensitive when search
(setq case-fold-search t)

;; switch on debug on error
(setq debug-on-error t)

;; display lambda and other smbols more pretty
(global-prettify-symbols-mode 1)

;; set vertical split when open a new buffer
(setq split-width-threshold nil)

;; 在elisp-mode高亮括号配对
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; 在状态栏显示当前时间、日期
(display-time-mode 1)
(setq display-time-day-and-date t)

;; 显示内存负载
(setq display-time-default-load-average t)

;; 防止页面滚动时跳动
(setq scroll-margin 3 scroll-conservatively 10000)

;; 保存上次光标所在位置
(setq-default save-place t)

;; 可以对选中的文本进行替换、删除
(delete-selection-mode 1)

;; 替换"yes/no"为"y/n"
(fset 'yes-or-no-p 'y-or-n-p)

;; 历史文件记录模式
(recentf-mode 1)
(setq recentf-max-menu-item 10)

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
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))  ;; process处理程序字符编码
(prefer-coding-system 'utf-8)

;; 设置Windows系统的字符
(when (eq system-type 'windows-nt)
  (set-next-selection-coding-system 'utf-16-le)
  (set-selection-coding-system 'utf-16-le)
  (set-clipboard-coding-system 'utf-16-le))

;; 设置光标的形状为长条形（而非默认的矩形块）
(setq-default cursor-type 'bar)

;; 关闭备份文件（即以"~"结尾的文件）
(setq make-backup-files nil)

;; 关闭自动保存文件
(setq auto-save-default nil)

;; 使用ido-mode让切换buffer时可以自动联想、自动补全
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
