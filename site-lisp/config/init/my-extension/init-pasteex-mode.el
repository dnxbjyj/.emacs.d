;;;;;;;;;; init-pasteex-mode module ;;;;;;;;;;
;;;; Desc:

;;;; init-pasteex-mode starts here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:
(require 'pasteex-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:
(when (equal system-type 'windows-nt)
  (global-set-key (kbd "C-x p i") 'pasteex-image)
  (global-set-key (kbd "C-x p d") 'pasteex-delete-img-link-and-file-at-line))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-pasteex-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-pasteex-mode ends here
