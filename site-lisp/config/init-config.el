;;;;;;;;;; 包加载入口 ;;;;;;;;;; 
;;;; common start：通用设置
;; 更好的默认设置
(require 'init-better-default)
;; 加载dired模式的自定义配置
(require 'init-dired)
;; 按键绑定
(require 'init-key-binding)
;; 自定义函数
(require 'init-my-function)
;; 网络配置
(require 'init-network)
;; 加载包
(require 'init-package)
;; 快速访问按键配置
(require 'init-quick-access)
;; 主题设置
(require 'init-theme)
;; 界面外观设置
(require 'init-ui)
;;;; common end 

;;;; init mode start
;; config markdown-mode
(require 'init-markdown-mode)
;; config eshell-mode
(require 'init-eshell-mode)
;; config org-mode
(require 'init-org-mode)
;; config company-mode
(require 'init-company-mode)
;;;; init mode end

;;;; plugin start：插件初始化设置
;; company-english-helper插件
(require 'init-company-english-helper)
;; projectile插件
(require 'init-projectile)
;; awesome-tab插件
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
;; 有道词典配置
(require 'init-youdao-dictionary)
;;;; plugin end

;; 提供init-config模块
(provide 'init-config)
