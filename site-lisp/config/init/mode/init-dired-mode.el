;;;;;;;;;; init-dired模块 ;;;;;;;;;;
;;;; Desc: dired模式的自定义配置

;;;; init-dired start here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:
;; 启用dired-x模式
(require 'dired-x)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:
;; dired模式默认递归删除目录
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)

;; 延迟加载dired mode
(with-eval-after-load 'dired
    (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;; 让dired模式多个目录同时打开时共用一个缓冲区
(put 'dired-find-alternate-file 'disabled nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-dired-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-dired end here
