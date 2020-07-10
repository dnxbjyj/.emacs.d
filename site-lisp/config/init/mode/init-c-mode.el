;;;;;;;;;; init-c-mode module ;;;;;;;;;;
;;;; Desc:

;;;; init-c-mode starts here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:
;; 更智能地插入文档注释，适用于C风格注释
(defun my-prettify-c-block-comment (orig-fun &rest args)
  (let* ((first-comment-line (looking-back "/\\*\\s-*.*"))
         (start-col-num (when first-comment-line
                          (save-excursion
                            (re-search-backward "/\\*")
                            (1+ (current-column))))))
    (apply orig-fun args)
    (when first-comment-line
      (save-excursion
        (newline)
        (dotimes (cnt start-col-num)
          (insert " "))
        (move-to-column start-col-num)
        (insert "*/"))))
  ;; ensure one space between the asterisk and the comment
  (when (not (looking-back " "))
    (insert " ")))
;; shortcut for c-indent-new-comment-line is: M-j
(advice-add 'c-indent-new-comment-line :around #'my-prettify-c-block-comment)

(defun my-c-mode-hook ()
  (setq c-basic-offset 4
        c-indent-level 4
        c-default-style "bsd"))
(add-hook 'c-mode-common-hook 'my-c-mode-hook)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-c-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-c-mode ends here
