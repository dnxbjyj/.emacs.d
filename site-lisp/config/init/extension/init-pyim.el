;;;;;;;;;; init-pyim module ;;;;;;;;;;
;;;; Desc:

;;;; init-pyim starts here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:
(require 'pyim)
(require 'pyim-basedict) ; 拼音词库设置，五笔用户 *不需要* 此行设置

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:
(pyim-basedict-enable)   ; 拼音词库，五笔用户 *不需要* 此行设置
(setq default-input-method "pyim")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-pyim)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-pyim ends here
