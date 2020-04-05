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

(cond
 ;; Windows系统
 ((equal system-type 'windows-nt) (progn
				    (init-local-path nil 'find-function-C-source-directory "d:/")
				    (init-local-path 'pasteex-mode 'pasteex-executable-path "D:/program/PasteEx.v1.1.8.0.beta/PasteEx/pasteex.exe")
				    (init-local-path 'grep-dired 'find-program "D:/program/Git/usr/bin/find.exe")
				    (init-local-path 'sift 'sift-executable "d:/program/Git/usr/bin/sift.exe")
				    (init-local-path 'virtualenvwrapper 'venv-location "e:/code/env/.py2env/")
				    (init-local-path nil 'dirs-to-be-read-only '("d:/program/emacs-25.3.1-with-modules/emacs/share/emacs/25.3/lisp"
										 "c:/Users/76512/AppData/Roaming/.emacs.d/site-lisp/extension"))
				    ;; (init-local-path nil 'chrome-executable-path "C:/Program Files (x86)/Google/Chrome/Application/chrome.exe")
                                    ))
 ((equal system-type 'darwin) (progn
				(init-local-path nil 'junit-jar-path "/Users/m2fox/software/dev/junit-4.10.jar")))
 (t nil))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-local-path)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-local-path ends here

