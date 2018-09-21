;;;;;;;;;; .emacs.d全局配置文件入口 ;;;;;;;;;;
(package-initialize)

;; 递归遍历加载路径，将这些路径加入到加载列表中
(defun add-subdirs-to-load-path(dir)
  "Recursive add directories to `load-path`"
  (let ((default-directory (file-name-as-directory dir)))
    (add-to-list 'load-path dir)
    (normal-top-level-add-subdirs-to-load-path)))

;; 递归加载~/.emacs.d/site-lisp目录
(add-subdirs-to-load-path "~/.emacs.d/site-lisp/")
;; 递归加载~/.emacs.d/local-lisp目录
(add-subdirs-to-load-path "~/.emacs.d/local-lisp/")

;; 本地化快速访问配置
(require 'init-quick-access-local)
;; 加载init-config模块
(require 'init-config)

