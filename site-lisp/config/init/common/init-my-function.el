;;;;;;;;;; init-my-function模块 ;;;;;;;;;;
;;;; Desc: 自定义函数配置

;;;; init-my-function start here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:
(defun insert-4-space ()
  "Insert 4 space."
  (interactive)
  (insert "    "))
(global-set-key (kbd "C-M-SPC") 'insert-4-space)

(defun show-current-buffer-coding ()
  "Show current buffer coding."
  (interactive)
  (message "%s" buffer-file-coding-system))

(defun set-current-buffer-coding-system-utf-8-unix ()
  "Set current buffer coding system to utf-8-unix."
  (interactive)
  (set-buffer-file-coding-system 'utf-8-unix))

(defun set-current-buffer-coding-system ()
  "Set current buffer coding system."
  (interactive)
  (call-interactively 'set-buffer-file-coding-system))

(defun tomorrow ()
  "Insert tomorrow's date string at current point."
  (interactive)
  (setq date-str (format-time-string "%Y-%m-%d %a" (org-time-string-to-time (org-read-date nil nil "+1d"))))
  (insert date-str))

(defun my-list-hooks (search-keywords)
  "List all of current hooks that match the given search key words (separated by space character)."
  (interactive "sInput keywords of hook (separated by space character, or empty for searching all hooks): ")
  (if (string-empty-p search-keywords)
      (apropos-variable "-hook$")
    (progn
      (setq keywords (split-string search-keywords " +" t))
      (setq search-str (concat (string-join keywords ".*") ".*-hook$"))
      (apropos-variable search-str))))

(defun my-list-key-maps (search-keywords)
  "List all of current key maps that match the given search key words (separated by space character)."
  (interactive "sInput keywords of key map (separated by space character, or empty for searching all key maps): ")
  (if (string-empty-p search-keywords)
      (apropos-variable "-map$")
    (progn
      (setq keywords (split-string search-keywords " +" t))
      (setq search-str (concat (string-join keywords ".*") ".*-map$"))
      (apropos-variable search-str))))

(defun my-comment-or-uncomment-region (beg end &optional arg)
  "My custom comment or uncomment region function."
  (interactive
   (if (use-region-p)
       (list (region-beginning) (region-end))
     (list (line-beginning-position) (line-end-position))))
  (comment-or-uncomment-region beg end arg))

(defun bind-key-for-open (path key-str in-where)
  "Quickly make a key bind for the operation of opening a directory or file in emacs dired-mode, or in system explorer."
  (interactive)
  (cond
   ((string-equal in-where "file") (global-set-key (kbd key-str) `(lambda() (interactive) (message "open %s in %s..." ',path ',in-where)(find-file ',path))))
   ((string-equal in-where "dired") (global-set-key (kbd key-str) `(lambda() (interactive) (message "open %s in %s..." ',path ',in-where)(dired ',path))))
   ((string-equal in-where "explorer") (global-set-key (kbd key-str) `(lambda() (interactive) (message "open %s in %s..." ',path ',in-where)(async-shell-command (format "start \"\" \"%s\"" ',path)))))
   (t (message "NOT support the operation: %s!" in-where))))

(defun week-translate (zh-week)
  "Translate Chinese week string into English."
  (interactive)
  (setq week-table (make-hash-table :test 'equal))
  (puthash "周一" "Mon" week-table)
  (puthash "周二" "Tue" week-table)
  (puthash "周三" "Wed" week-table)
  (puthash "周四" "Thu" week-table)
  (puthash "周五" "Fri" week-table)
  (puthash "周六" "Sat" week-table)
  (puthash "周日" "Sun" week-table)
  (gethash zh-week week-table))

(defun yesterday ()
  "Insert date string of yesterday."
  (interactive)
  (setq date-str (format-time-string "%Y-%m-%d %a" (org-time-string-to-time (org-read-date nil nil "-1d"))))
  (insert date-str))

(defun today ()
  "Insert date string of today."
  (interactive)
  (setq datetime-str (format-time-string "%Y-%m-%d %a"))
  (insert datetime-str))

(defun now ()
  "Insert current datetime string."
  (interactive)
  (setq datetime-str (format-time-string "%Y-%m-%d %a %H:%M:%S"))
  (insert datetime-str))

(defun kill-all-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer
	(delq (current-buffer)
	      (remove-if-not 'buffer-file-name (buffer-list))))
  (message "all other buffers have been killed!"))

(defun switch-to-minibuffer-window ()
  "Switch to minibuffer window (if active)."
  (interactive)
  (when (active-minibuffer-window)
    (select-frame-set-input-focus (window-frame (active-minibuffer-window)))
    (select-window (active-minibuffer-window))))

;; scroll halfly
(defun get-half-window-height ()
  "Get half height of current window"
  (max 1 (/ (1- (window-height (selected-window))) 2)))

(defun scroll-up-half-window ()
  "Scroll up half window."
  (interactive)
  (setq half-window-height (get-half-window-height))
  (scroll-up half-window-height))

(defun scroll-down-half-window ()
  "Scroll down half window."
  (interactive)
  (setq half-window-height (get-half-window-height))
  (scroll-down half-window-height))

(defun next-5-lines ()
  "Move cursor to next five lines."
  (interactive)
  (let ((current-prefix-arg '(5)))
    (call-interactively 'next-line)))

(defun previous-5-lines()
  "Move cursor to previous five lines."
  (interactive)
  (let ((current-prefix-arg '(5)))
    (call-interactively 'previous-line)))

(defun check-inside-quotations (position)
  "Check whether the indicated position inside a pair of quotations."
  (nth 3 (syntax-ppss position)))

(defun select-text-between-quotations ()
  "Select text between two nearest quotation marks."
  (interactive)
    ;; here should not use square brackets in regexp
    (let ((start) (skip-char "^\"'`'"))
      (skip-chars-backward skip-char)
      (setq start (point))
      (skip-chars-forward skip-char)
      (push-mark start)
      (setq mark-active t)))

(defun select-current-word-core (word-char-regex)
  "Select current word with indicated word char regex."
  (skip-chars-backward word-char-regex)
  (setq start (point))
  (skip-chars-forward word-char-regex)
  (set-mark start))

(defun select-current-word ()
  "Select current word using default word char regex."
  (interactive)
  (let ((default-word-char-regex "[\\-_a-zA-Z0-9!@#$%]"))
  (select-current-word-core default-word-char-regex)))

;; select current line
(defun select-current-line ()
  "Select current line."
  (interactive)
  (end-of-line)
  (set-mark (line-beginning-position)))

;; copy current line to clipboard
(defun copy-current-line ()
  "Copy current line to clipboard."
  (interactive)
  (select-current-line)
  (kill-ring-save (line-beginning-position) (line-end-position))
  (message "current line has been copied to clipboard!"))

;; 正则替换: 
(defun search-and-replace  (from to)
  "Search, and then replace."
  (interactive "squery, then replace, from:\nsto:")
  (goto-char (point-min))
  (query-replace-regexp from to))

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
