;;;;;;;;;; .emacs.d全局配置文件入口 ;;;;;;;;;;
(package-initialize)

;; 递归遍历加载路径，将这些路径加入到加载列表中
(defun add-subdirs-to-load-path(dir)
  "Recursive add directories to `load-path`"
  (let ((default-directory (file-name-as-directory dir)))
    (add-to-list 'load-path dir)
    (normal-top-level-add-subdirs-to-load-path)))

(let (
  ;; 加载的时候临时增大`gc-cons-threshold'以加速启动速度。
  (gc-cons-threshold most-positive-fixnum)
  ;; 清空避免加载远程文件的时候分析文件。
  (file-name-handler-alist nil))

  ;; Emacs配置文件内容
  ;; 递归加载~/.emacs.d/site-lisp目录
  (add-subdirs-to-load-path "~/.emacs.d/site-lisp/")
  ;; 递归加载~/.emacs.d/local-lisp目录
  (add-subdirs-to-load-path "~/.emacs.d/local-lisp/")
)

;; 加载init-config模块
(require 'init-config)

;; 本地化配置
(require 'init-local-config)
(put 'narrow-to-region 'disabled nil)
