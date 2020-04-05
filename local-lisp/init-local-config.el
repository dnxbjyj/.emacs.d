;;;;;;;;;; init-local-config模块 ;;;;;;;;;;
;;;; Desc: 本地化的快速访问

;;;; init-local-config start here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:
(add-hook 'eshell-mode-hook '(lambda ()
                               (enlarge-window-horizontally 25)))

(custom-set-faces
   '(default ((t (:family "Microsoft YaHei" :foundry "outline" :slant normal :weight normal :height 140 :width normal)))))

;; 快速打开windows下的hosts文件
(defun my-local/hosts()
  "quickly open hosts config file."
  (interactive)
  (find-file "C:/Windows/System32/drivers/etc/hosts"))

;; quickly open quick-access.org
(global-set-key (kbd "C-<f12>") '(lambda() (interactive) (find-file "~/.emacs.d/local-lisp/quick-access-local.org")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-local-config)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-local-config end here
