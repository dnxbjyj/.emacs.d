;;;;;;;;;; init-quick-access模块 ;;;;;;;;;;
;;;; Desc: 通用的快速访问按键配置

;;;; init-quick-access start here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:
(defun search-symbol ()
  "Search any symbol by use function `apropos'."
  (interactive)
  (call-interactively 'apropos))

;; 在当前路径快速打开cmd命令行窗口
(defun open-cmd ()
  (interactive)
  (async-shell-command "start cmd"))

;; 快速打开elisp手册
(defun open-elisp-manual ()
  (interactive)
  (progn
    (info)
    (Info-menu "Elisp")))

;; 在文件夹中打开当前文件所在目录: C-c o
(defun open-explorer ()
  (interactive)
  (shell-command "start .\\"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-quick-access)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-quick-access end here
