;;;;;;;;;; init-markdown-mode模块 ;;;;;;;;;;
;;;; Desc:

;;;; init-markdown-mode start here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:
;; config pandoc path
(setq markdown-command "pandoc -f markdown -t html")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-markdown-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-markdown-mode end here
