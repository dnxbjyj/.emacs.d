;;;;;;;;;; init-pasteex-mode module ;;;;;;;;;;
;;;; Desc:

;;;; init-pasteex-mode starts here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:
(require 'pasteex-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:
(setq pasteex-executable-path "D:/program/PasteEx.v1.1.8.0.beta/PasteEx/pasteex.exe")
(global-set-key (kbd "C-x p i") 'pasteex-image)
(global-set-key (kbd "C-x p d") 'pasteex-delete-img-link-and-file-at-line)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-pasteex-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-pasteex-mode ends here
