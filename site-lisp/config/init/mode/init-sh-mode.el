;;;;;;;;;; init-sh-mode module ;;;;;;;;;;
;;;; Desc:

;;;; init-sh-mode starts here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:
(require 's)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:
(defun insert-shell-func-template (func-name desc args-desc return-desc)
  "Insert shell function template."
  (interactive "sInput function name: \nsInput function description: \nsInput function args description: \nsInput function return value description: ")
  (when (string-blank-p args-desc)
    (setq args-desc "无"))
  (when (string-blank-p return-desc)
    (setq return-desc "无"))  
  (setq tpl-str
        (let ((func-name func-name) (desc desc) (args-desc args-desc) (return-desc return-desc))
          (s-lex-format "##################################################
# 函数名：${func-name}
# 功 能：${desc}
# 参 数：${args-desc}
# 返回值：${return-desc}
# 已测试：否
##################################################
function ${func-name}()
{
    echo '########## start ${func-name} ##########'

    echo '########## end ${func-name} ##########'
}")))
  (insert tpl-str)
  ;; 把光标上移2行
  (let ((current-prefix-arg '(2)))
    (call-interactively 'previous-line)
    (insert "    ")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-sh-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-sh-mode ends here
