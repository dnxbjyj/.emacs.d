;;;; 自定义函数

;; 在当前位置插入当前日期，格式举例：2018-09-14 周五
(defun today ()
  "insert today date string at current position."
  (interactive)
  (insert (format-time-string "%Y-%m-%d %a")))

;; 提供该模块
(provide 'init-myfunction)
