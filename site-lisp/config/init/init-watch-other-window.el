;;;;;;;;;; init-watch-other-window模块 ;;;;;;;;;;
;;;; Desc: 滚动另一个窗口插件

;;;; init-watch-other-window start here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:

(require 'watch-other-window)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:

(global-set-key (kbd "C->") 'watch-other-window-up-line)
(global-set-key (kbd "C-<") 'watch-other-window-down-line)
(global-set-key (kbd "C-M->") 'watch-other-window-up)
(global-set-key (kbd "C-M-<") 'watch-other-window-down)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-watch-other-window)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-watch-other-window end here
