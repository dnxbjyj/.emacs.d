;;;;;;;;;; init-local-path module ;;;;;;;;;;
;;;; Desc:

;;;; init-local-path starts here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:
(defun init-local-path (module-name path-var-name path)
  "Init local path."
  (when module-name
    (require module-name))
  (set path-var-name path))

(init-local-path nil find-function-C-source-directory "")
(init-local-path 'pasteex-mode 'pasteex-executable-path "D:/program/PasteEx.v1.1.8.0.beta/PasteEx/pasteex.exe")
(init-local-path 'grep-dired 'find-program "D:/program/Git/usr/bin/find.exe")
(init-local-path 'sift 'sift-executable "d:/program/Git/usr/bin/sift.exe")
(init-local-path 'virtualenvwrapper 'venv-location "e:/code/env/.py2env/")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-local-path)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-local-path ends here
