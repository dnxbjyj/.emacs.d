;;;;;;;;;; init-awesome-tab模块 ;;;;;;;;;;
;;;; Desc:

;;;; init-awesome-tab start here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:
(require 'awesome-tab)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:
(awesome-tab-mode t)

;; 切换到右边的标签页
(global-set-key (kbd "C-)") 'awesome-tab-forward-tab)
;; 切换到左边的标签页
(global-set-key (kbd "C-(") 'awesome-tab-backward-tab)
;; 把当前标签页往右移
(global-set-key (kbd "C-M-)") 'awesome-tab-move-current-tab-to-right)
;; 把当前标签页往左移
(global-set-key (kbd "C-M-(") 'awesome-tab-move-current-tab-to-left)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-awesome-tab)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-awesome-tab end here
