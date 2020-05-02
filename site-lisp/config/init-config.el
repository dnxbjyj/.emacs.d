;;;;;;;;;; 包加载入口 ;;;;;;;;;;
;;;; basic config starts
;; pretty-hydra one key
(require 'init-pretty-hydra-one-key)
;; 主题设置
(require 'init-theme)
;; 界面外观设置
(require 'init-ui)
;;;; basic config ends

;;;; common start：通用设置
;; some local path config
(require 'init-local-path)
;; 更好的默认设置
(require 'init-better-default)
;; 自定义的好用函数
(require 'init-my-awesome-function)
;; 加载包
(require 'init-package)
;; 快速访问按键配置
(require 'init-quick-access)
;;;; common end 

;;;; init mode start
;; c-mode
(require 'init-c-mode)
;; init yaml-mode
(require 'init-yaml-mode)
;; init scheme-mode
(require 'init-cmuscheme)
;; init parenface
(require 'init-parenface)
;; init paredit
(require 'init-paredit)
;; elisp-mode
(require 'init-elisp-mode)
;; gud-mode
(require 'init-gud-mode)
;; pasteex-mode
(if (equal system-type 'windows-nt)
    ;; pasteex-mode, only on Windows
    (require 'init-pasteex-mode))
;; config java-mode
(require 'init-java-mode)
;; config dired-mode
(require 'init-dired-mode)
;; config python-mode
(require 'init-python-mode)
;; config markdown-mode
(require 'init-markdown-mode)
;; config eshell-mode
(require 'init-eshell-mode)
;; config org-mode
(require 'init-org-mode)
;; config company-mode
(require 'init-company-mode)
;;;; init mode end

;;;; init extension start
;; pretty-hydra
(require 'init-pretty-hydra)
;; anzu
(require 'init-anzu)
;; pyim
(require 'init-pyim)
;; sift: full text search
(require 'init-sift)
;; leetcode
(require 'init-leetcode)
;; smex
(require 'init-smex)
;; grep dired
(require 'init-grep-dired)
;; edit server
(require 'init-edit-server)
;; edit text area by emacs in chrome
(require 'init-atomic-chrome)
;; lazy search config
(require 'init-lazy-search)
;; auto pair
(require 'init-awesome-pair)
;; company-english-helper
(require 'init-company-english-helper)
;; projectile config
(require 'init-projectile)
;; awesome-tab config
(require 'init-awesome-tab)
;; 自动保存插件
(require 'init-auto-save)
;; helm插件配置
(require 'init-helm)
;; 写代码中-英文翻译辅助插件
(require 'init-insert-translated-name)
;; org-pomodoro插件配置
(require 'init-org-pomodoro)
;; virtualenvwrapper虚拟化环境配置
(require 'init-virtualenvwrapper)
;; 滚动另一个窗口插件配置
(require 'init-watch-other-window)
;; Youdao dictionary config
(require 'init-youdao-dictionary)
;;;; init extension end

;; provide init-config module
(provide 'init-config)
