;;;;;;;;;; init-pretty-hydra-one-key module ;;;;;;;;;;
;;;; Desc:
;;;; init-pretty-hydra-one-key starts here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:
(require 'hydra)
(require 'init-my-awesome-function)
(require 'init-quick-access)
(require 'init-org-mode)

(require 'init-sift)
(require 'init-grep-dired)
(require 'init-gud-mode)
(require 'init-atomic-chrome)
(require 'init-anzu)
(require 'init-aweshell)

(require 'init-pretty-hydra)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:
;;-----------------common quick shortcut-----------------;;
;; Insert the `@timestamp'
(global-unset-key (kbd "M-A"))
(global-set-key (kbd "M-A") 'insert-at-timestamp)

;; kill buffer and delete window at the same time
(global-set-key (kbd "C-x K") 'kill-buffer-and-window)

;; in selected window switch to previous buffer
(global-set-key (kbd "C-{") 'previous-buffer)

;; in selected window switch to next buffer
(global-set-key (kbd "C-}") 'next-buffer)

;; 快速打开config目录
(global-set-key (kbd "<f9>") '(lambda() (interactive) (dired "~/.emacs.d/site-lisp/config/")))

;; 快速打开配置文件init-config.el
(global-set-key (kbd "<C-f9>") '(lambda() (interactive) (find-file "~/.emacs.d/site-lisp/config/init-config.el")))

;; 快速打开config目录
(global-set-key (kbd "<f9>") '(lambda() (interactive) (dired "~/.emacs.d/site-lisp/config/")))

;; 在dired模式中打开.emacs.d目录
(global-set-key (kbd "<f10>") '(lambda() (interactive) (dired "~/.emacs.d/")))

;; 快速打开init.el
(global-set-key (kbd "C-<f10>") '(lambda() (interactive) (find-file "~/.emacs.d/init.el")))

;; 加载当前文件
(global-set-key (kbd "<f11>") 'load-file)

;; quickly open quick-access.org
(bind-key-for-open "~/.emacs.d/site-lisp/org/quick-access.org" "<f12>" "file")

;; 快速提交git代码（need auto-commit.bat file in ~/.emacs.d/ directory）
(global-set-key (kbd "C-<f5>") (lambda() (interactive) (async-shell-command "start auto-commit.bat")))

;; 切换到下一个窗口: C-;
(global-set-key (kbd "C-;") 'other-window)

;; 切换到上一个窗口: C-:
(global-set-key (kbd "C-:") '(lambda () (interactive) (other-window -1)))

;; go to line
(global-set-key (kbd "C-j") 'goto-line)

;; select current line
(global-set-key (kbd "C-_") 'select-current-line)

;; copy current line
(global-set-key (kbd "C-M-_") 'copy-current-line)

;; select current word
(global-set-key (kbd "C-?") 'select-current-word)

;; select sequential non-empty text at point
(global-set-key (kbd "C-M-?") 'select-sequential-non-empty-text-at-point)

;; select text between current quotation marks
(global-set-key (kbd "C-\"") 'select-text-between-quotations)

;; Move cursor to next five lines
(global-set-key (kbd "C-S-M-n") 'next-5-lines)

;; Move cursor to previous five lines
(global-set-key (kbd "C-S-M-p") 'previous-5-lines)

;; Scroll up half window
(global-set-key (kbd "C-S-v") 'scroll-up-half-window)

;; Scroll down half window
(global-set-key (kbd "M-V") 'scroll-down-half-window)

;; change search default key binding
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;; insert 4 space
(global-set-key (kbd "C-M-SPC") 'insert-4-space)
;; backward 4 space
(global-set-key (kbd "M-S-SPC") 'backward-4-space)

;; change C-w default action
(global-set-key (kbd "C-w") 'kill-line-or-region)

;;-----------------hydra-----------------;;
(pretty-hydra-define pretty-hydra-one-key-access
  (:color pink :quit-key "q" :title "Access operations (access to position, file, directory, buffer, etc.).")
  ("Code"
   (("a" run-auto-commit "run auto-commit.bat")
    ("c" run-win-cmd-with-admin "run win cmd with admin")
    ("g" run-git-bash "run git bash")
    ("i" run-ipython "run ipython"))
   
   "File"
   (("C" open-current-file-in-chrome "open current file in chrome")
    ("o" open-explorer "open explorer")
    ("r" recentf-open-files "show recent opened files"))  

   "Emacs"
   (("h" my-list-hooks "search hooks")  
    ("m" my-list-key-maps "search key maps")  
    ("M" switch-to-minibuffer-window "switch to minibuffer window")
    ("S" search-symbol "search symbol")  
    ("C-<tab>" bs-cycle-next "cycle next buffer")  
    ("S-<tab>" bs-cycle-previous "cycle previous buffer"))  

   "Search"
   (("f" grep-dired-dwim "search file by grep-dired-dwim")  
    ("F" grep-dired "grep dired by custom")  
    ("s" sift-regexp "sift full-text search"))))  
(global-set-key (kbd "C-c a") 'pretty-hydra-one-key-access/body)

(pretty-hydra-define pretty-hydra-one-key-code-operation
  (:color pink :quit-key "q" :title "Code operations.")  
  (
   "CLI"
   (("s" aweshell-new "open aweshell"))
   
   "Code"
   (("j" json-pretty-print "format JSON at point or in region")  
    ("/" my-comment-or-uncomment-region "comment/uncomment region code")  
    ("m" toggle-message-buffer-window "toggle *Messages* buffer window"))))  
(global-set-key (kbd "C-c c") 'pretty-hydra-one-key-code-operation/body)

(pretty-hydra-define pretty-hydra-one-key-edit-operation
  (:color pink :quit-key "q" :title "Common edit operations.")
  ("Buffer"
   (("B" remove-blank-lines-in-buffer "remove blank lines in buffer")  
    ("c" show-current-buffer-coding "show current buffer coding")  
    ("C" set-current-buffer-coding-system "set current buffer coding system")  
    ("j" jump-to-next-blank-char "jump to next blank char")  
    ("k" kill-all-other-buffers "kill all other buffers")  
    ("l" select-current-line "select current line")  
    ("L" copy-current-line "copy current line")  
    ("n" now "insert current datetime string")  
    ("r" toggle-buffer-read-only "toggle current buffer read only")  
    ("s" select-text-between-quotations "select text between two nearest quotation marks")  
    ("t" today "insert today's date string")  ;; FAILED: Debugger entered--Lisp error: (void-function gnus-replace-in-string) @emacs-26.1
    ("T" tomorrow "insert tomorrow's date string")  
    ("u" set-current-buffer-coding-system-utf-8-unix "set current buffer coding system to utf-8-unix")  
    ("w" whitespace-mode "toggle show white space character")  
    ("W" widen "widen")  
    ("y" yesterday "insert yesterday's date string"))  

   "File"
   (("m" todo-list-md-to-org "convert markdown TODO list to org")  
    ("o" todo-list-org-to-md "convert org TODO list to markdown"))  
   
   "Remote"
   (("a" add-sync-atomic-chrome-hook-locally "add sync atomic chrome hook locally")
    ("A" remove-sync-atomic-chrome-hook-locally "remove sync atomic chrome hook locally"))

   "Search"
   (("f" awesome-anzu-query-replace-regexp "awesome anzu quey replace regexp")  
    ("F" anzu-query-replace-at-cursor "anzu query replace at cusor thing"))))  
(global-set-key (kbd "C-c e") 'pretty-hydra-one-key-edit-operation/body)

(pretty-hydra-define pretty-hydra-one-key-gud
  (:color pink :quit-key "q" :title "Gud shotcut.")
  ("Compile"
   (("c" javac-compile-with-debug-info "javac compile"))
   
   "Debug"
   (("j" jdb-debug-current-file "debug by jdb")
    ("r" gud-jdb-run "run debug")
    ("p" gud-print "print value of expression at point")
    ("e" jdb-eval-expr "eval expr")
    ("d" jdb-dump-expr "dump expr")
    ("b" jdb-gud-break "set breakpoint")
    ("B" jdb-gud-remove-break "remove breakpoint")
    ("l" jdb-list-code "list current code")
    ("L" jdb-show-breakpoints "show all jdb breakpoints")
    ("k" gud-kill "kill debug process")
    ("s" gud-jdb-step "step into")
    ("n" gud-jdb-next "step next line")
    ("u" gud-finish "continue until current method returns"))))
(global-set-key (kbd "C-c g") 'pretty-hydra-one-key-gud/body)

(pretty-hydra-define pretty-hydra-one-key-help
  (:color pink :quit-key "q" :title "Help operations.")
  ("Search"
   (("a" apropos "apropos search")
    ("A" info-apropos "info apropos"))
   
   "Manual"
   (("e" open-elisp-manual "elisp manual")
    ("E" open-emacs-manual "emacs manual")
    ("i" info "info")
    ("I" open-eintr "eintr"))

   "Pretty Hydra One Key"
   (("h" (lambda () (interactive) (find-file "~/.emacs.d/site-lisp/config/init/common/init-pretty-hydra-one-key.el")) "pretty hydra one key configuration file"))))
(global-set-key (kbd "C-c h") 'pretty-hydra-one-key-help/body)

;;;; org-mode ;;;;
(pretty-hydra-define pretty-hydra-one-key-org-mode
  (:color pink :quit-key "q" :title "Shortcut for org-mode.")
  ("Edit"
   (("d" org-delete-item "delete item on current line")  
    ("D" my-org-delete-line "add `+' to line head and tail")  
    ("e" org-export-dispatch "export dispatch")  
    ("i" my-org-insert-str-to-head-tail "insert str at head and tail")  
    ("n" insert-s-or-f-note "insert s&f note")  
    ("t" make-line-to-title "modify line to title"))  
   
   "Display"
   (("l" org-toggle-link-display "toggle link display")  
    ("N" org-narrow-to-subtree "narrow to subtree")  
    ("{" shrink-parent-level-headline "shrink parent leve headline")  
    ("[" shrink-current-level-headline "shrink current leve headline")  
    ("+" indent-mode-on "open org-indent-mode")  
    ("-" indent-mode-off "close org-indent-mode"))  

   "Move"
   (("M-n" org-metadown "move down")  
    ("M-p" org-metaup "move up"))  
   
   "Code"
   (("s" org-insert-src-block "insert code src block")  
    ("S" org-edit-src-code "edit code src block"))  
   
   "TODO"
   (("m" org-todo-and-move-top "done and move top"))  
   
   "Table"
   (("C" my-org-table-insert-column-below "insert column below")  
    ("R" my-org-table-insert-row-below "insert row below")  
    ("," my-org-table-select-field "select field"))))  
(add-hook 'org-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-c o") 'pretty-hydra-one-key-org-mode/body)))

(pretty-hydra-define pretty-hydra-one-key-toggles
  (:color pink :quit-key "q" :title "Toggle operations.")
  ("Debug"
   (("d" toggle-debug-on-error "toggle debug on error"))))  
(global-set-key (kbd "C-c t") 'pretty-hydra-one-key-toggles/body)

(pretty-hydra-define pretty-hydra-one-key-window-operation
  (:color pink :quit-key "q" :title "Common window operations.")
  ("Window"
   (("f" toggle-frame-fullscreen "toggle frame full screen")
    ("m" toggle-frame-maximized "toggle frame maximized")
    ("<left>" shrink-window-horizontally "shrink window horizontally")
    ("<right>" enlarge-window-horizontally "enlarge window horizontally")
    ("<down>" shrink-window "shrink window")
    ("<up>" enlarge-window "enlarge window"))
   
   "Text"
   (("+" text-scale-increase "increase text scale")
    ("-" text-scale-decrease "decrease text scale"))))
(global-set-key (kbd "C-c w") 'pretty-hydra-one-key-window-operation/body)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-pretty-hydra-one-key)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-pretty-hydra-one-key ends here
