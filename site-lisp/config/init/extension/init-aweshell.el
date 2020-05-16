;;;;;;;;;; init-aweshell module ;;;;;;;;;;
;;;; Desc:

;;;; init-aweshell starts here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:
(require 'aweshell)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:
(add-hook 'eshell-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-l") 'aweshell-clear-buffer)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-aweshell)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-aweshell ends here
