;;;;;;;;;; init-key-binding模块 ;;;;;;;;;;
;;;; Desc: 按键绑定设置（系统功能按键，不包含三方插件的按键配置）

;;;; init-key-binding start here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:
;; 快速打开elisp手册
(defun open-elisp-manual ()
  (interactive)
  (progn
    (info)
    (Info-menu "Elisp")))
(global-set-key (kbd "C-h C-x e") 'open-elisp-manual)


;; 执行当前行的S式
(global-set-key (kbd "<f9>") (lambda () (interactive)
			       (goto-char (line-end-position))
			       (eval-last-sexp nil)))

;; 跳转到某行
(global-set-key (kbd "C-=") 'goto-line)

;; 加载当前文件
(global-set-key (kbd "C-<f3>") 'load-file)

;; 窗口缩放，用于多窗口场景
(global-set-key (kbd "C-S-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "C-S-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "C-S-<down>") 'shrink-window)
(global-set-key (kbd "C-S-<up>") 'enlarge-window)


;; 切换到另一个窗口: C-;
(global-set-key (kbd "C-;") 'other-window)

;; 在当前窗口中切换buffer
(global-set-key (kbd "C-<tab>") 'bs-cycle-next)
(global-set-key (kbd "S-<tab>") 'bs-cycle-previous)

;; 运行当前buffer中的所有代码: C-<f9>
(global-set-key (kbd "C-<f9>") '(lambda()
				  (interactive)
				  (setq cur-buf (current-buffer))
				  (get-buffer-create "output")
				  (switch-to-buffer-other-window "output")
				  (erase-buffer)
				  (eval-buffer cur-buf  (get-buffer-create "output"))
			           	  (other-window -1)))

;; 格式化JSON字符串: C-c C-j
(global-set-key (kbd "C-c C-j") 'json-pretty-print-buffer)

;; 字体缩放
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; 快速跳到某一行
(global-set-key (kbd "C-c j") 'goto-line)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-key-binding)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-key-binding end here
