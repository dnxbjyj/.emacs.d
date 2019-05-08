;;;;;;;;;; init-org-mode模块 ;;;;;;;;;;
;;;; Desc: org-mode配置

;;;; init-org-mode start here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:
(require 'org-indent)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:
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
(add-hook 'org-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-x s") 'insert-s-or-f-note)))

;; toggle link display
(add-hook 'org-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-x t l") 'org-toggle-link-display)))

(defun my-org-table-insert-row-below ()
  "Insert a new row at current row below quickly in org-table."
  (interactive)
  (let ((current-prefix-arg 5))
    (call-interactively 'org-table-insert-row)))
(add-hook 'org-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-c M-RET") 'my-org-table-insert-row-below)))

(defun my-org-table-insert-column-below ()
  "Insert a new column at current column below quickly in org-table."
  (interactive)
  (let ((current-prefix-arg 5))
    (call-interactively 'org-table-insert-column)))
(add-hook 'org-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-c <S-return>") 'my-org-table-insert-column-below)))

;; close org mode indent
(org-indent-mode -1)

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
(add-hook 'org-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-x a") 'my-org-insert-str-to-head-tail)))

;; eval code block
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))

;; config virtualenv root path
(setq python-shell-virtualenv-root "e:/code/env/.py2env")

;; set org-table font to mono font, should install ttf in advance
(add-hook 'org-mode-hook
	  (lambda ()
	    (set-face-attribute 'org-table nil :family "Noto Sans Mono")))

;; shrink parent leve headline
(add-hook 'org-mode-hook
	  '(lambda ()
	     (local-set-key (kbd "C-M-{") '(lambda () (interactive)
						     (outline-up-heading 1) (org-cycle)))))

;; shrink current leve headline
(add-hook 'org-mode-hook
	  '(lambda ()
	     (local-set-key (kbd "C-{") '(lambda () (interactive)
						     (outline-previous-visible-heading 1) (org-cycle)))))

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
;; 绑定快捷键：C-c s i
(add-hook 'org-mode-hook '(lambda ()
                            ;; turn on flyspell-mode by default
                            (flyspell-mode 1)
                            ;; C-TAB for expanding
                            (local-set-key (kbd "C-<tab>")
                                           'yas/expand-from-trigger-key)
                            ;; keybinding for editing source code blocks
                            (local-set-key (kbd "C-x s e")
                                           'org-edit-src-code)
                            ;; keybinding for inserting code blocks
                            (local-set-key (kbd "C-x s i")
                                           'org-insert-src-block)
                            ))

;; 代码块语法高亮
(setq org-src-fontify-natively t)

;; 缩进
(add-hook 'org-mode-hook
	  (lambda()
	    (global-set-key (kbd "C-x i") '(lambda () (interactive) (org-indent-mode 1)))))
(add-hook 'org-mode-hook
	  (lambda()
	    (global-set-key (kbd "C-x l") '(lambda () (interactive) (org-indent-mode 0)))))


;; 上下移动同一级主题的整行的内容
(add-hook 'org-mode-hook
	  (lambda()
	    (global-set-key (kbd "M-n") 'org-metadown)))
(add-hook 'org-mode-hook
	  (lambda()
	    (global-set-key (kbd "M-p") 'org-metaup)))

;; org-mode自动换行
(add-hook 'org-mode-hook
	  (lambda()
	    (setq truncate-lines nil)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-org-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-org-mode end here
