;;;;;;;;;; init-java-mode module ;;;;;;;;;;
;;;; Desc:

;;;; init-java-mode starts here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:
(defun insert-junit-imports ()
  "Insert JUnit4 common import statements."
  (interactive)
  (insert "import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;\n\n"))

;; add hooks
(add-hook 'java-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-x u") 'insert-junit-imports)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-java-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-java-mode ends here
