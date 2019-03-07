;;;;;;;;;; init-org-mode模块 ;;;;;;;;;;
;;;; Desc: org-mode配置

;;;; init-org-mode start here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:
;; set org-table font to mono font
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
                            (local-set-key (kbd "C-c s e")
                                           'org-edit-src-code)
                            ;; keybinding for inserting code blocks
                            (local-set-key (kbd "C-c s i")
                                           'org-insert-src-block)
                            ))

;; 代码块语法高亮
(setq org-src-fontify-natively t)

;; 缩进
(add-hook 'org-mode-hook
	  (lambda()
	    (global-set-key (kbd "C-c i") '(lambda () (interactive) (org-indent-mode 1)))))
(add-hook 'org-mode-hook
	  (lambda()
	    (global-set-key (kbd "C-c l") '(lambda () (interactive) (org-indent-mode 0)))))


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
