;;;;;;;;;; init-edit-server module ;;;;;;;;;;
;;;; Desc:

;;;; init-edit-server starts here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:
(require 'edit-server)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:
(edit-server-start)
(setq edit-server-new-frame nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-edit-server)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-edit-server ends here
