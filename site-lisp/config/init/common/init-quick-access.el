;;;;;;;;;; init-quick-access模块 ;;;;;;;;;;
;;;; Desc: 通用的快速访问按键配置

;;;; init-quick-access start here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:
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
