;;;;;;;;;; init-eshell-mode模块 ;;;;;;;;;;
;;;; Desc:

;;;; init-eshell-mode start here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:
(require 'init-local-path)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:
;; solve the problem that Chinese character messy code in eshell-mode
(add-hook 'eshell-mode-hook
	  (lambda ()
	    (when (eq system-type 'windows-nt)
	      (prefer-coding-system 'gbk))))

(defun clear-screen ()
  "Clear current screen."
  (interactive)
  (let ((eshell-buffer-maximum-lines 0))
	(eshell-truncate-buffer)))
(add-hook 'eshell-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-l") 'clear-screen)))

;;;;; config for Java ;;;;;
(defun set-java-tool-options ()
  "Set Java tool options."
  (interactive)
  (let ((encoding))
    (cond
      ;; set gbk when windows
     ((eq system-type 'windows-nt) (setq encoding "gbk"))
      ;; set utf-8 when other OS
     (t (setq encoding "utf-8")))
    (setq export-command (format "export JAVA_TOOL_OPTIONS=\"-Dfile.encoding=%s -Duser.language=en\"" encoding))
    (insert export-command)
    (eshell-send-input)))
(add-hook 'eshell-mode-hook 'set-java-tool-options)

(defun javac-with-junit4 ()
  "Insert javac command with junit4 jar."
  (interactive)
  (unless junit-jar-path
    (user-error "JUnit4 jar path NOT setted!"))
  (setq javac-command (format "javac -cp .:%s " junit-jar-path))
  (insert javac-command))
(add-hook 'eshell-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-x j") 'javac-with-junit4)))

(defun run-java-as-junit4-test ()
  "Run java as JUnit4 test."
  (interactive)
  (unless junit-jar-path
    (user-error "JUnit4 jar path NOT setted!"))
  (setq run-command (format "java -cp .:%s org.junit.runner.JUnitCore " junit-jar-path))
  (insert run-command))
(add-hook 'eshell-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-x t") 'run-java-as-junit4-test)))

;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-eshell-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-eshell-mode end here
