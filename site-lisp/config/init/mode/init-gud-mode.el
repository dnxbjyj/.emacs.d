;;;;;;;;;; init-gud-mode module ;;;;;;;;;;
;;;; Desc:

;;;; init-gud-mode starts here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:
(require 'gud)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:
(defun javac-compile-with-debug-info ()
  "Compile current Java source code file using javac command with debug info."
  (interactive)
  (setq extension (file-name-extension (buffer-file-name)))
  (if (string-equal (downcase extension) "java")
      (progn
	(setq error-buffer-name "*javac error*")
	(setq result (shell-command (format "javac -g -encoding utf-8 %s" (file-name-nondirectory (buffer-file-name))) nil error-buffer-name))
	(if (equal result 0)
	    (message "compile %s SUCCESS!" (buffer-file-name))
	  (progn
	    (message "compile %s FAILED!" (buffer-file-name))
	    (switch-to-buffer-other-window error-buffer-name))))
    (message "current file is NOT a Java source code file!")))

(defun jdb-debug-current-file ()
  "Debug current Java file using jdb."
  (interactive)
  (setq cur-buffer (buffer-name))
  (setq buffer-read-only t)
  (split-window-horizontally)
  (other-buffer)
  (jdb (gud-query-cmdline 'jdb))
  (message "start to debug %s using jdb" (buffer-file-name))
  (switch-to-buffer-other-window cur-buffer))

(defun execute-jdb-cmd-in-gud-buf (cur-buffer-name gud-buffer-name jdb-command)
  "Execute jdb command in gud buffer."
  (interactive)
  (save-excursion
    (ignore-errors
      (unless (get-buffer cur-buffer-name)
	(user-error "cur-buffer-name NOT exist!"))
      (unless (get-buffer gud-buffer-name)
	(user-error "gud-buffer-name NOT exist!"))
      (switch-to-buffer-other-window gud-buffer-name)
      (insert jdb-command)
      (comint-send-input)
      (switch-to-buffer-other-window cur-buffer-name))))

(defun execute-jdb-cmd-based-on-cur-buf (jdb-command)
  "Execute jdb command based on current buffer."
  (interactive)
  (execute-jdb-cmd-in-gud-buf (buffer-name) (format "*gud-%s*" (file-name-base)) jdb-command))

(defun jdb-show-breakpoints ()
  "Show all jdb breakpoints."
  (interactive)
  (execute-jdb-cmd-based-on-cur-buf "stop"))

(defun jdb-list-code ()
  "List current code.;"
  (interactive)
  (execute-jdb-cmd-based-on-cur-buf "list"))

(defun jdb-eval-expr ()
  "Eval expr."
  (interactive)
  (setq expr (read-string "Input expr: "))
  (execute-jdb-cmd-based-on-cur-buf (format "eval %s" expr)))

(defun jdb-dump-expr ()
  "Dump expr."
  (interactive)
  (setq expr (read-string "Input expr: "))
  (execute-jdb-cmd-based-on-cur-buf (format "dump %s" expr)))

(defun run-gud-cmd-at-a-line (gud-cmd cmd-action-desc)
  "Run gud command at a line."
  (setq cur-pos (point))
  (setq cur-line (line-number-at-pos))
  (setq cmd-execute-line (read-number (format "Input line number to %s: " cmd-action-desc) cur-line))
  (goto-line cmd-execute-line)
  (call-interactively gud-cmd)
  (goto-char cur-pos))

(defun jdb-gud-break ()
  "Set breakpoint at indicated line, or defalut at current line."
  (interactive)
  (run-gud-cmd-at-a-line 'gud-break "set breakpoint"))

(defun jdb-gud-remove-break ()
  "Remove breakpoint at indicated line, or defalut at current line."
  (interactive)
  (run-gud-cmd-at-a-line 'gud-remove "remove breakpoint"))

(defun gud-jdb-run ()
  "Run code, if has breakpoints, stop at first breakpoint."
  (interactive)
  (execute-jdb-cmd-based-on-cur-buf "run")
  (jdb-list-code))

(defun gud-jdb-next ()
  "Step one line (skip function)."
  (interactive)
  (execute-jdb-cmd-based-on-cur-buf "next")
  (jdb-list-code))

(defun gud-jdb-step ()
  "Step one line (not skip but enter into function)."
  (interactive)
  (execute-jdb-cmd-based-on-cur-buf "step")
  (jdb-list-code))

(defun gud-kill ()
  "Kill process."
  (interactive)
  (setq buffer-read-only nil)
  (with-current-buffer gud-comint-buffer (comint-skip-input))
  (kill-process (get-buffer-process gud-comint-buffer))
  (setq gud-buffer-name (format "*gud-%s*" (file-name-base)))
  (switch-to-buffer gud-buffer-name)
  (kill-buffer-and-window))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-gud-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-gud-mode ends here
