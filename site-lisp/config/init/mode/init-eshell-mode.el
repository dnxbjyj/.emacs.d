;;;;;;;;;; init-eshell-mode模块 ;;;;;;;;;;
;;;; Desc:

;;;; init-eshell-mode start here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:
(require 'init-local-path)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:
;; set every eshell buffer name
(defvar eshell-related-buffer-file-name nil "Eshell related buffer file name.")
(defadvice eshell (before remember-buffer-file-name nil compile)
  "Remember buffer file name before open eshell."
  (if (not (eq last-command 'eshell))
      (let ((eshell-extra-name))
	(if (buffer-file-name)
	    (setq eshell-extra-name (file-name-nondirectory (buffer-file-name)))
	  (setq eshell-extra-name (int-to-string (random 10000))))
	(setq eshell-related-buffer-file-name (format "*(eshell) %s*" eshell-extra-name)))))
(defun rename-eshell-buffer-to-pre-buf-file-name ()
  "Rename eshell buffer to pre buffer file name."
  (interactive)
  (if eshell-related-buffer-file-name
      (rename-buffer eshell-related-buffer-file-name)))

(defun clear-screen ()
  "Clear current screen."
  (interactive)
  (let ((eshell-buffer-maximum-lines 0))
	(eshell-truncate-buffer)))

;;;;; config for Java ;;;;;
(defun set-java-tool-options ()
  "Set Java tool options."
  (interactive)
  (let ((encoding "utf-8"))
    (setq export-command (format "export JAVA_TOOL_OPTIONS=\"-Dfile.encoding=%s -Duser.language=en\"" encoding))
    (insert export-command)
    (eshell-send-input)))

(defun javac-with-junit4 ()
  "Insert javac command with junit4 jar."
  (interactive)
  (unless junit-jar-path
    (user-error "JUnit4 jar path NOT setted!"))
  (setq javac-command (format "javac -cp .:%s " junit-jar-path))
  (insert javac-command))

(defun run-java-as-junit4-test ()
  "Run java as JUnit4 test."
  (interactive)
  (unless junit-jar-path
    (user-error "JUnit4 jar path NOT setted!"))
  (setq run-command (format "java -cp .:%s org.junit.runner.JUnitCore " junit-jar-path))
  (insert run-command))

;; add hooks
(add-hook 'eshell-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-l") 'clear-screen)
	    (local-set-key (kbd "C-x j") 'javac-with-junit4)
	    (local-set-key (kbd "C-x t") 'run-java-as-junit4-test)))
(add-hook 'eshell-mode-hook 'set-java-tool-options)
(add-hook 'eshell-mode-hook 'rename-eshell-buffer-to-pre-buf-file-name)

;; solve the problem that Chinese character messy code in eshell-mode
;; (add-hook 'eshell-mode-hook
;; 	  (lambda ()
;; 	    (when (eq system-type 'windows-nt)
;; 	      (prefer-coding-system 'gbk))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-eshell-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-eshell-mode end here
