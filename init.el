;; TODO 设置文本文件的默认编码
 
;; 开启自动补全
; 开启全局 Company 补全
;;(global-company-mode 1)
;;(add-hook 'after-init-hook 'global-company-mode)

;; 关闭哔哔告警音
(setq ring-bell-function 'ignore)

;; 开启括号配对
(electric-pair-mode t)

;; 有道词典，Enable Cache
(setq url-automatic-caching t)
(global-set-key (kbd "C-q") 'youdao-dictionary-search-at-point+)

;;******************************************************************************

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; melpa插件库配置
(package-initialize)

(require 'package)
;;(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages") t)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
;;******************************************************************************


;; 启用 dired-x 可以让每一次进入 Dired 模式时，使用新的快捷键 C-x C-j 就可以进 入当前文件夹的所在的路径
(require 'dired-x)

;; 让dired模式多个目录同时打开时共用一个缓冲区
(put 'dired-find-alternate-file 'disabled nil)

;; 主动加载 Dired Mode
;; (require 'dired)
;; (defined-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)

;; 延迟加载
(with-eval-after-load 'dired
    (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (company youdao-dictionary))))
 
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "微软雅黑" :foundry "outline" :slant normal :weight normal :height 120 :width normal)))))

(global-linum-mode 1)

;; 定义一个函数：快速打开配置文件
(defun open-init-file()
    (interactive)
    (find-file "~/.emacs.d/init.el"))
    
;; 把函数open-init-file绑定到快捷键<F2>键上
(global-set-key (kbd "<f2>") 'open-init-file)
