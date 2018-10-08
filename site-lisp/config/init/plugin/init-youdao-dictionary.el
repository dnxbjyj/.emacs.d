;;;;;;;;;; init-youdao-dictionary模块 ;;;;;;;;;;
;;;; Desc: 有道词典配置

;;;; init-youdao-dictionary start here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:
(require 'youdao-dictionary)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:
;; 开启缓存
(setq url-automatic-caching t)

;; 划词查词: C-q
(global-set-key (kbd "C-q") 'youdao-dictionary-search-at-point+)

;; 输入词查词: C-x C-y
(global-set-key (kbd "C-x C-y") 'youdao-dictionary-search-from-input)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-youdao-dictionary)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-youdao-dictionary end here
