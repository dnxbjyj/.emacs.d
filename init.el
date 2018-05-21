(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
 
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "微软雅黑" :foundry "outline" :slant normal :weight normal :height 120 :width normal)))))

;;;; 【markdown-mode】
;; 官方的markdown-mode设置：https://github.com/jrblevin/markdown-mode
(add-to-list 'load-path "C:/Users/Administrator.PC-20170728DWIF/AppData/Roaming/.emacs.d/markdown")

(custom-set-variables
 '(markdown-command "pandoc"))

(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(autoload 'gfm-mode "markdown-mode"
   "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

;; errors: 
;; 1. 问题：markdown-mode下使用"C-c C-c p"预览md文档时，报错：user-error: markdown failed with exit code 1
;;    状态：已解决
;;    原因：两个：(1)没有为markdown-command指定可执行文件；(2)md文件中有中文，markdown-mode不支持中文
      措施：(1)安装pandoc，并在init.el中添加如下配置：(custom-set-variables '(markdown-command "D:/Programs/pandoc/pandoc"))
;;          (2)

