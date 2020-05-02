;;;;;;;;;; init-insert-translated-name模块 ;;;;;;;;;;
;;;; Desc: 写代码时的中文-英文翻译辅助插件

;;;; init-insert-translated-name start here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:
(require 'insert-translated-name)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code
;; 翻译输入的中文为当前语言风格的英文标识符
(global-set-key (kbd "C-c C-s") 'insert-translated-name-insert)

;; 翻译输入的中文为注释
(global-set-key (kbd "C-c C-c") 'insert-translated-name-insert-comment)

;; 替换选中的中文为当前语言风格的英文标识符
;; (global-set-key (kbd "C-c t r") 'insert-translated-name-replace)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-insert-translated-name)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-insert-translated-name end here

