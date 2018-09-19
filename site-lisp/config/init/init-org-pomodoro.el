;;;;;;;;;; init-org-pomodoro模块 ;;;;;;;;;;
;;;; Desc: org-mode番茄时钟配置

;;;; init-org-pomodoro start here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:
(require 'org-pomodoro)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:

;; 在org-mode打开/关闭番茄钟: C-c p
(global-set-key (kbd "C-c p") 'org-pomodoro)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-org-pomodoro)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-org-pomodoro end here
