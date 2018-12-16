;;;;;;;;;; init-my-function模块 ;;;;;;;;;;
;;;; Desc: 自定义函数配置

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

;; 在当前位置插入当前日期，格式举例：2018-09-14 Fri
(defun today ()
  "insert today date string at current position."
  (interactive)
  (setq date-str (format-time-string "%Y-%m-%d %a"))
  (setq date-str (gnus-replace-in-string date-str "周一" "Mon"))
  (setq date-str (gnus-replace-in-string date-str "周二" "Tues"))
  (setq date-str (gnus-replace-in-string date-str "周三" "Wed"))
  (setq date-str (gnus-replace-in-string date-str "周四" "Thurs"))
  (setq date-str (gnus-replace-in-string date-str "周五" "Fri"))
  (setq date-str (gnus-replace-in-string date-str "周六" "Sat"))
  (setq date-str (gnus-replace-in-string date-str "周日" "Sun"))
  (insert date-str))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-my-function)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-my-function end here
