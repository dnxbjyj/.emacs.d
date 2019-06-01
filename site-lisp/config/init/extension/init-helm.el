;;;;;;;;;; init-helm模块 ;;;;;;;;;;
;;;; Desc: helm神器配置

;;;; init-helm start here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:
(require 'helm-config)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:
;; helm模式
(helm-mode 1)

;; 自动调整候选词窗口大小
(setq helm-autoresize-max-height 0)
(setq helm-autoresize-min-height 60)
(helm-autoresize-mode 1)

; rebind tab to do persistent action
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)

; make TAB works in terminal
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) 

; list actions using C-z
(define-key helm-map (kbd "C-z")  'helm-select-action)

;; 轻量的快速访问按键
(global-set-key (kbd "C-x b") 'helm-mini)

;; 模糊匹配
(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match    t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-helm)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-helm end here
