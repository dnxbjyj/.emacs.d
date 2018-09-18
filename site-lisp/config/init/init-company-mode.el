;;;;;;;;;; init-company-mode模块 ;;;;;;;;;;
;;;; Desc: company-mode自定义配置

;;;; init-company-mode start here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:

;; 加载company
(require 'company)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:

;; 为所有的缓冲区开启company-mode模式
(add-hook 'after-init-hook 'global-company-mode)

;; 延迟时间 
(setq company-idle-delay 0.2)           

;; 触发补全的字符数量 
(setq company-minimum-prefix-length 2) 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-company-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-company-mode end here
