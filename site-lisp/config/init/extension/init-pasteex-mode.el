;;;;;;;;;; init-pasteex-mode module ;;;;;;;;;;
;;;; Desc:

;;;; init-pasteex-mode starts here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:
(require 'pasteex-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:
(setq pasteex-executable-path "D:/program/PasteEx/pasteex.exe")
(global-set-key (kbd "C-c i") 'pasteex-image)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-pasteex-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-pasteex-mode ends here
