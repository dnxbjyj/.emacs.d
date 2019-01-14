;;;;;;;;;; init-my-function模块 ;;;;;;;;;;
;;;; Desc: 自定义函数配置

;;;; init-my-function start here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:
(defun select-current-word-core (word-char-regex)
  "Select current word with indicated word char regex."
  (skip-chars-backward word-char-regex)
  (setq start (point))
  (skip-chars-forward word-char-regex)
  (set-mark start))

(defun select-current-word ()
  "Select current word using default word char regex."
  (interactive)
  (let ((default-word-char-regex "[\\-_a-zA-Z0-9]"))
  (select-current-word-core default-word-char-regex)))
(global-set-key (kbd "C-?") 'select-current-word)


;; select current line
(defun select-current-line ()
  "Select current line."
  (interactive)
  (end-of-line)
  (set-mark (line-beginning-position)))
(global-set-key (kbd "C-_") 'select-current-line)

;; copy current line to clipboard
(defun copy-current-line ()
  "Copy current line to clipboard."
  (interactive)
  (select-current-line)
  (kill-ring-save (line-beginning-position) (line-end-position))
  (message "current line has been copied to clipboard!"))
(global-set-key (kbd "C-c C-l") 'copy-current-line)

;; run current buffer elisp code, output to another buffer named "output"
(defun eval-current-buf-elisp ()
  "Run current buffer elisp code, output to another buffer named 'output'."
  (interactive)
  (setq cur-buf (current-buffer))
  (get-buffer-create "output")
  (switch-to-buffer-other-window "output")
  (erase-buffer)
  (eval-buffer cur-buf (get-buffer-create "output"))
  (other-buffer -1))
(global-set-key (kbd "C-<f9>") 'eval-current-buf-elisp)

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
