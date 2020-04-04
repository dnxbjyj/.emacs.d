;;;;;;;;;; init-anzu module ;;;;;;;;;;
;;;; Desc:

;;;; init-anzu starts here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:
(require 'anzu)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:
(global-anzu-mode +1)

(defun awesome-anzu-query-replace-regexp (arg)
  "Awesome anzu quey replace regexp."
  (interactive "p")
  (goto-char (point-min))
  (anzu-query-replace-regexp arg))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-anzu)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-anzu ends here
