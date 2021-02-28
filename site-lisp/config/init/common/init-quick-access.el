;;;;;;;;;; init-quick-access模块 ;;;;;;;;;;
;;;; Desc: 通用的快速访问按键配置

;;;; init-quick-access start here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:
(require 'init-local-path)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:
(defun open-current-file-in-chrome ()
  "Open current file in chrome. 
PS: should add path of chrome.exe to environment path."
  (interactive)
  ;; should add chrome executable path to env PATH at first
  (setq chrome-executable-path "chrome")
  (let ((open-file-in-chrome-command) (file-path-to-open))
    ;; dired-mode
    (if (string-equal major-mode "dired-mode")
        (if-let ((file (dired-get-filename)))
            (setq file-path-to-open file))
      ;; other mode
      (setq file-path-to-open buffer-file-name))
    (message "file path to open in chrome: %s" file-path-to-open)
    (if file-path-to-open
        (setq open-file-in-chrome-command (format "\"%s\" \"%s\"" chrome-executable-path file-path-to-open)))
    (if open-file-in-chrome-command
        (progn
          (async-shell-command open-file-in-chrome-command)
          (delete-window (get-buffer-window "*Async Shell Command*")))
      (message "NOT on a file!"))))

(defun search-symbol ()
  "Search any symbol by use function `apropos'."
  (interactive)
  (call-interactively 'apropos))

;; 在当前路径快速打开cmd命令行窗口
(defun open-cmd ()
  (interactive)
  (async-shell-command "start cmd"))

;; 快速打开elisp手册
(defun open-elisp-manual ()
  (interactive)
  (progn
    (info)
    (Info-menu "Elisp")))

(defun open-emacs-manual ()
  "Quickly open emacs manual."
  (interactive)
  (progn
    (info)
    (Info-menu "Emacs")))

;; 在文件夹中打开当前文件所在目录: C-c o
(defun open-explorer ()
  (interactive)
  (shell-command "start .\\"))

(defun run-git-bash ()
  "Run git bash."
  (interactive)
  (setq cur-dir default-directory)
  (setq executable-file "git-bash.exe")
  (unless (executable-find executable-file)
    (user-error (format "CANNOT find executable file `%s', add it to your environment PATH." executable-file)))
  (vbs-shell-execute executable-file cur-dir nil cur-dir))

(defun run-auto-commit ()
  "Run auto-commit.bat to do git commit and push."
  (interactive)
  (setq cur-dir default-directory)
  (setq auto-commit-file "auto-commit.bat")
  (setq commands (format "cd /d %s && %s" cur-dir auto-commit-file))
  (unless (file-exists-p auto-commit-file)
    (user-error (format "CANNOT find file `%s'" auto-commit-file)))
  (run-commands-in-cmd cur-dir commands))

(defun run-ipython ()
  "Run iPython."
  (interactive)
  (setq cur-dir default-directory)
  (setq commands "ipython")
  (unless (executable-find commands)
    (user-error (format "CANNOT find commands `%s', add it to your environment PATH." commands)))
  (run-commands-in-cmd cur-dir commands))

(defun run-win-cmd-with-admin ()
  "Run Windows CMD with admin privilege."
  (interactive)
  (setq cur-dir default-directory)
  (setq commands (format "cd /d %s" cur-dir))
  (run-commands-in-cmd cur-dir commands))

(defun run-commands-in-cmd (cur-dir commands)
  "Run commands in Windows CMD with admin privilege."
  (interactive)
  (setq executable-file "cmd.exe")
  (unless (executable-find executable-file)
    (user-error (format "CANNOT find executable file `%s', add it to your environment PATH." executable-file)))
  (setq args (format "/k %s" commands))
  (vbs-shell-execute executable-file cur-dir args nil "runas" 1))

(defun vbs-shell-execute (executable-file work-dir &optional args directory operation show)
  "Run executable file using VBS ShellExecute.
For detail usage of VBS ShellExecute, see URL `https://docs.microsoft.com/en-us/windows/win32/shell/shell-shellexecute'"
  (interactive)
  ;; VBS commands that will be executed
  (setq vbs-commands (concat "Set objShell = CreateObject(\"Shell.Application\")\n"
			     (format "objShell.ShellExecute \"%s\", \"%s\", \"%s\", \"%s\", \"%s\"" executable-file (or args "") (or directory "") (or operation "") (or show 1))))
  ;; run commands
  (run-vbs-commands work-dir vbs-commands))

(defun run-vbs-commands (work-dir vbs-commands)
  "Run VBS commands based on `work-dir'."
  (interactive)
  ;; make a temp VBS script file
  (setq vbs-file-name (concat (file-name-as-directory work-dir) "TMP_FILE_run-vbs-commands.vbs"))
  ;; save VBC commands to .vbs file
  (with-temp-buffer
    (insert vbs-commands)
    (write-file vbs-file-name))
  ;; execute VBS script file
  (call-process-shell-command (format "wscript %s" vbs-file-name))
  ;; delete temp VBS script file
  (delete-file vbs-file-name))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-quick-access)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-quick-access end here
