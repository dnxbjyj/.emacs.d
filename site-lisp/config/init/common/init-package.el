;;;;;;;;;; init-package模块 ;;;;;;;;;;
;;;; Desc: 加载插件包及配置

;;;; init-package start here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:
(require 'package)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:
(package-initialize)

;; 加载melpa扩展列表
;(add-to-list 'package-archives
;	     '("melpa" . "http://melpa.milkbox.net/packages/")
;	     'APPEND)
 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-package)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-package end here
