;;;;;;;;;; init-theme模块 ;;;;;;;;;;
;;;; Desc: 主题设置

;;;; init-theme start here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:

;; 引入color-theme模块
(require 'color-theme)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:

;; 初始化主题模块
(color-theme-initialize)

;; 设置calm-forest主题
(color-theme-calm-forest)

;; 设置英文字体为等宽字体
(set-face-attribute
 'default nil :font "Monaco 14")
;; 设置中文字体为等宽楷体kaiti
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
                    charset
                    (font-spec :family "Kaiti SC" :size 16)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-theme)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-theme end here
