;;;;;;;;;; init-dired模块 ;;;;;;;;;;
;;;; Desc: dired模式的自定义配置

;;;; init-dired start here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:
;; 启用dired-x模式
(require 'dired-x)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:
(defun dired-mode-open-file-at-point ()
  "Open any file in dired-mode, using system default opening method."
  (interactive)
  ;; when in windows system, set encoding of `cmdproxy.exe` to GBK
  (when (eq system-type 'windows-nt)
    (set-default 'process-coding-system-alist
		 '(("[pP][lL][iI][nN][kK]" gbk-dos . gbk-dos)
		   ("[cC][mM][dD][pP][rR][oO][xX][yY]" gbk-dos . gbk-dos))))
  (if-let ((file (dired-get-filename)))
      (progn
	;; the usage of windows cmd command `start` has a pit when there is blank character in path string, pay attention.
	(async-shell-command (format "start \"\" \"%s\"" file))
	(message "Success to open file: %s" file))
    (message "NO file found at point!")))
(add-hook 'dired-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-c C-o") 'dired-mode-open-file-at-point)))

;; dired模式默认递归删除目录
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)

;; 延迟加载dired mode
(with-eval-after-load 'dired
    (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;; 让dired模式多个目录同时打开时共用一个缓冲区
(put 'dired-find-alternate-file 'disabled nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-dired-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-dired end here
