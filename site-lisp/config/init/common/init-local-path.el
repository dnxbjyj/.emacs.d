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

;; proxy setting
(init-local-path nil 'http-proxy-url "proxy.example.com:8080")
(init-local-path nil 'https-proxy-url "proxy.example.com:8080")
(init-local-path nil 'no-proxy-urls "example.com")

(cond
 ;; Windows系统
 ((equal system-type 'windows-nt) (progn
				    (init-local-path nil 'find-function-C-source-directory "D:/program/emacs/emacs-27.2-x86_64/source/emacs-27.2/src/")
				    (init-local-path 'pasteex-mode 'pasteex-executable-path "D:/program/PasteEx.v1.1.8.0.beta/PasteEx/pasteex.exe")
				    (init-local-path 'grep-dired 'find-program "D:/program/Git/usr/bin/find.exe")
				    (init-local-path 'sift 'sift-executable "d:/program/Git/usr/bin/sift.exe")
				    (init-local-path 'virtualenvwrapper 'venv-location "e:/code/env/.py2env/")
				    (init-local-path nil 'dirs-to-be-read-only '("D:/program/emacs/emacs-27.2-x86_64/share/emacs/27.2/lisp"
										 "c:/Users/76512/AppData/Roaming/.emacs.d/"
                                         "D:/program/emacs/emacs-27.2-x86_64/source/"))
				    (init-local-path nil 'chrome-executable-path "C:/Program Files (x86)/Google/Chrome/Application/chrome.exe")
                    ))
 ;; Mac OS X系统
 ((equal system-type 'darwin) (progn
				(init-local-path nil 'junit-jar-path "/Users/m2fox/software/dev/junit-4.10.jar")
                                (init-local-path 'sift 'sift-executable "/usr/local/bin/sift")))
 (t nil))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-local-path)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-local-path ends here

