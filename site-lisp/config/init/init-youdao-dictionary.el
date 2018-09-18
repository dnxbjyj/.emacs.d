;;;;;;;;;; init-youdao-dictionary模块 ;;;;;;;;;;
;;;; Desc: 有道词典配置

;;;; init-youdao-dictionary start here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:
;; 开启缓存
(setq url-automatic-caching t)

;; 查词: C-q
(global-set-key (kbd "C-q") 'youdao-dictionary-search-at-point+)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-youdao-dictionary)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-youdao-dictionary end here
