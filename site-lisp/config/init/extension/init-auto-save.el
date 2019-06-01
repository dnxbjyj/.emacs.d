;;;;;;;;;; init-auto-save模块 ;;;;;;;;;;
;;;; Desc:

;;;; init-auto-save start here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:
(require 'auto-save)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:

;; 开启自动保存功能
(auto-save-enable)

;; 自动保存的时候静悄悄的， 不要打扰我
;; (setq auto-save-slient t)       

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-auto-save)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-auto-save end here
