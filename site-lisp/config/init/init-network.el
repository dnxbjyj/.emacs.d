;;;;;;;;;; init-network模块 ;;;;;;;;;;
;;;; Desc: 网络配置模块

;;;; init-network start here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:

;; 代理设置
; (setq url-using-proxy t)
; (setq url-proxy-services
;      '(("no_proxy" . "^\\(localhost\\|10.*\\)")
;        ("http" . "username:password@proxy.example.com:8080")
;        ("https" . "username:password@proxy.example.com:8080")))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-network)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-network end here
