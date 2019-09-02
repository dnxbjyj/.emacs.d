;;;;;;;;;; init-pasteex-mode module ;;;;;;;;;;
;;;; Desc:

;;;; init-pasteex-mode starts here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:
(require 'pasteex-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:
(setq pasteex-executable-path "D:/program/PasteEx.v1.1.8.0.beta/PasteEx/pasteex.exe")
(define-key pasteex-mode-map (kbd "C-c i") 'pasteex-image)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-pasteex-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-pasteex-mode ends here
