;;;;;;;;;; init-dired模块 ;;;;;;;;;;
;;;; Desc: dired模式的自定义配置

;;;; init-dired start here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:
;; 启用dired-x模式
(require 'dired-x)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:
(defun dired-mode-copy-current-file-name ()
  "Copy current file name to clipboard in dired-mode."
  (interactive)
  (if-let ((file (dired-get-filename)))
      (progn
	(setq dir-seq (split-string file "/" t))
	(setq file-name (seq-elt dir-seq (1- (length dir-seq))))
	(print file-name)
	(with-temp-buffer
	  (insert file-name)
	  (kill-ring-save (point-min) (point-max)))
	(message "file name (%s) has been copied to clipboard!" file-name))
    (message "NO file at current point!")))
(add-hook 'dired-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-c n") 'dired-mode-copy-current-file-name)))

(defun dired-mode-copy-current-directory-path ()
  "Copy current directory path to clipboard in dired-mode."
  (interactive)
  (if-let ((file (dired-get-filename)))
      (progn
	(setq dir-seq (split-string file "/" t))
	(setq dir-seq (subseq dir-seq 0 (- (seq-length dir-seq) 1)))
	(setq dir-path (string-join dir-seq "/"))
	(with-temp-buffer
	  (insert dir-path)
	  (kill-ring-save (point-min) (point-max)))
	(message "directory path (%s) has been copied to clipboard!" dir-path))
    (message "NO directory at current point!")))
(add-hook 'dired-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-c C-c") 'dired-mode-copy-current-directory-path)))

(defun dired-mode-copy-current-file-path ()
  "Copy current file path to clipboard in dired-mode."
  (interactive)
  (if-let ((file (dired-get-filename)))
      (progn
	(with-temp-buffer
	  (insert file)
	  (kill-ring-save (point-min) (point-max)))
	(message "file path (%s) has been copied to clipboard!" file))
    (message "NO file at current point!")))
(add-hook 'dired-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-c c") 'dired-mode-copy-current-file-path)))

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
