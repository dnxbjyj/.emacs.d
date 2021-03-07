;;;;;;;;;; init-use-package module ;;;;;;;;;;
;;;; Desc:

;;;; init-use-package starts here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:
(require 'use-package)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:
;; 全局配置
(eval-and-compile
  ;; 默认都是确定已安装，不用每个包都手动添加: :ensure t
  ;; (setq use-package-always-ensure t)
  
  ;; 默认都是延迟加载，不用每个包都手动添加:defer t 
  (setq use-package-always-defer t) 
  (setq use-package-always-demand nil) 
  (setq use-package-expand-minimally t) 
  (setq use-package-verbose t))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-use-package)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-use-package ends here
