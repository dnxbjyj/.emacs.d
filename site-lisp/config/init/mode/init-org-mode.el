;;;;;;;;;; init-org-mode模块 ;;;;;;;;;;
;;;; Desc: org-mode配置

;;;; init-org-mode start here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:
(require 'org-indent)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:
(defun org-todo-and-move-top ()
  "Execute `org-todo' at point, and move item to top of current subtree."
  (interactive)
  (widen)
  ;; add timestamp
  (goto-char (line-end-position))
  (insert " @")
  (now)
  ;; execute org-todo
  (org-todo)
  ;; record raw line number
  (setq raw-line-number (line-number-at-pos))
  ;; raw next line number
  (setq raw-next-line-number (1+ raw-line-number))
  (save-excursion
    (next-line)
    (setq raw-next-line-number (line-number-at-pos)))
  ;; go to up level top
  (outline-up-heading 1)
  ;; go to next line
  (next-line)
  ;; get current line number
  (setq top-line-number (line-number-at-pos))
  ;; go to raw line
  (goto-line raw-line-number)
  ;; line diff
  (setq line-diff (- raw-line-number top-line-number))
  (ignore-errors
    ;; move current item
    (while (> line-diff 0)
      (org-metaup)
      (setq line-diff (1- line-diff))))
  (goto-line raw-next-line-number))

(defun org-delete-item (&optional line-number)
  "Delete item on current line (means add '+' to head and tail of item title) if optional arguement `line-number' is not indicated, otherwise delete the item on indicated line."
  (interactive "sInput line number (default current line): ")
  (unless (string-empty-p line-number)
    (goto-line (string-to-number line-number)))
  (setq cur-line (buffer-substring-no-properties (line-beginning-position) (line-end-position)))
  (setq replaced-line (replace-regexp-in-string "^\\(**[[:blank:]]*\\(TODO|DONE\\)*[[:blank:]]*\\)\\(.+?\\)[[:blank:]]*$" "\\1 +\\3+" cur-line))
  (goto-char (line-beginning-position))
  (org-show-subtree)
  (kill-line)
  (insert replaced-line)
  (org-cycle))

;; select org-table field
(defun my-org-table-select-field ()
  "Select current org-table field."
  (interactive)
  (when (not (looking-back "|[[:blank:]]?"))
    (org-table-beginning-of-field 1))
  (set-mark-command nil)
  (org-table-end-of-field 1))

;; org delete line
(defun my-org-delete-line (&optional line-number)
  "Delete current line (means add `+' to head and tail of line) if optional param `line-number' is not indicated, otherwise delete the indicated line."
  (interactive "sInput line number (default current line): ")
  (save-excursion
    (ignore-errors
      (unless (string-empty-p line-number)
	(goto-line (string-to-int line-number)))
      (beginning-of-line)
      (insert "+")
      (end-of-line)
      (insert "+"))))

;; close org mode indent
(org-indent-mode -1)

(defun make-line-to-title ()
  "Make a line to a title."
  (interactive)
  (goto-char (line-beginning-position))
  (insert "- ")
  (goto-char (line-end-position))
  (insert " :: "))

(defun insert-s-or-f-note (command)
  "Insert snote or fnote mark, or delete an existing mark in org-mode."
  (interactive "sInput `s' for inputing snote mark, `f' for inputing fnote mark, `d' for deleting an existing mark: ")
  (cond
   ((string-equal command "s") (insert "[s&f:s]"))
   ((string-equal command "f") (insert "[s&f:f]"))
   ((string-equal command "d")
    (skip-chars-backward "^[:space:]")
    (insert "+")
    (skip-chars-forward "^[:space:]")
    (insert "+"))
   (t (message "NOT support the command: %s" command))))

(defun my-org-table-insert-row-below ()
  "Insert a new row at current row below quickly in org-table."
  (interactive)
  (let ((current-prefix-arg 5))
    (call-interactively 'org-table-insert-row)))

(defun my-org-table-insert-column-below ()
  "Insert a new column at current column below quickly in org-table."
  (interactive)
  (let ((current-prefix-arg 5))
    (call-interactively 'org-table-insert-column)))

(defun my-org-insert-str-to-head-tail (flag)
  "Operate a region, or word at point, insert a character both at the position of head and tail.
If flag is `d', insert `+' character, for the sake of deleting text in org-mode.
If flag is `q', insert `~' character, for the sake of quoting text in org-mode."
  (interactive "sPlease input operate flag(`d' for deleting text, `q' for quoting text): ")
  (let (from to input-str output-str)
    ;; if select a region, then operate the region
    (if (use-region-p)
	(progn
	  (setq from (region-beginning))
	  (setq to (region-end)))
      ;; if not select a region, then operate word at point
      (progn
	(setq bounds (bounds-of-thing-at-point 'word))
	(setq from (car bounds))
	(setq to (cdr bounds))))
    (setq input-str (buffer-substring-no-properties from to))
    ;; set the value of output-str
    (cond
     ((string-equal flag "d") (setq output-str (concat " +" input-str "+ ")))
     ((string-equal flag "q") (setq output-str (concat " ~" input-str "~ ")))
     (t (message "NOT support the operate: %s" flag)))
    ;; operate the regin between "from" to "to"
    (progn
      (delete-region from to)
      (goto-char from)
      (insert output-str)
      (goto-char (+ to 4)))))

;; eval code block
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))

;; config virtualenv root path
(setq python-shell-virtualenv-root "e:/code/env/.py2env")

(defun shrink-parent-level-headline ()
  "Shrink parent leve headline."
  (interactive)
  (outline-up-heading 1)
  (org-cycle))

(defun shrink-current-level-headline ()
  "Shrink current leve headline."
  (interactive)
  (outline-previous-visible-heading 1)
  (org-cycle))

;; 插入代码块
(defun org-insert-src-block (src-code-type)
  "Insert a `SRC-CODE-TYPE' type source code block in org-mode."
  (interactive
   (let ((src-code-types
          '("emacs-lisp" "python" "C" "sh" "java" "js" "clojure" "C++" "css"
            "calc" "asymptote" "dot" "gnuplot" "ledger" "lilypond" "mscgen"
            "octave" "oz" "plantuml" "R" "sass" "screen" "sql" "awk" "ditaa"
            "haskell" "latex" "lisp" "matlab" "ocaml" "org" "perl" "ruby"
            "scheme" "sqlite")))
     (list (ido-completing-read "Source code type: " src-code-types))))
  (progn
    (newline-and-indent)
    (insert (format "#+BEGIN_SRC %s\n" src-code-type))
    (newline-and-indent)
    (insert "#+END_SRC\n")
    (previous-line 2)
    (org-edit-src-code)))

;; 代码块语法高亮
(setq org-src-fontify-natively t)

;; 缩进
(defun indent-mode-on ()
  "Open org-indent-mode."
  (interactive)
  (org-indent-mode 1))

(defun indent-mode-off ()
  "Close org-indent-mode."
  (interactive)
  (org-indent-mode 0))

;; add hooks
;; to go line
(add-hook 'org-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-j") 'goto-line)))
;; org-mode自动换行
(add-hook 'org-mode-hook
	  (lambda()
	    (setq truncate-lines nil)))
;; set org-table font to mono font, should install ttf in advance
(add-hook 'org-mode-hook
	  (lambda ()
	    (set-face-attribute 'org-table nil :family "Noto Sans Mono")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-org-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-org-mode end here
