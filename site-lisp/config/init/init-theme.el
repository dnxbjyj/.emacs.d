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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-theme)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-theme end here
