;;;;;;;;;; init-my-function模块 ;;;;;;;;;;
;;;; Desc: 自定义函数

;;;; init-my-function start here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:
;; 正则替换: C-c f
(global-set-key (kbd "C-c f")
		(lambda (from to)
		  (interactive "squery, then replace, from:\nsto:")
		  (goto-char (point-min))
		  (query-replace-regexp from to)))

;; 在当前位置插入当前日期，格式举例：2018-09-14 周五
(defun today ()
  "insert today date string at current position."
  (interactive)
  (insert (format-time-string "%Y-%m-%d %a")))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-my-function)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-my-function end here
