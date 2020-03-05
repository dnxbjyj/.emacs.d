;;;;;;;;;; init-hydra-one-key module ;;;;;;;;;;
;;;; Desc:
;;;; init-hydra-one-key starts here
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:
;;-----------------common quick shortcut-----------------;;
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
(defhydra hydra-one-key-access (:color pink :hint nil)
  "
Access operations (access to position, file, directory, buffer, etc.).

_a_: run auto-commit.bat to do git commit and push
_c_: run Windows CMD with admin privilege
_C_: open current file in chrome
_f_: search file by grep-dired-dwim
_F_: grep dired by custom
_g_: run git bash
_h_: search and list hooks
_i_: run ipython
_m_: search and list key maps
_M_: switch to minibuffer window
_o_: open explorer
_r_: show recent opened files
_s_: sift full-text search
_S_: search symbol
_C-<tab>_: cycle next buffer
_S-<tab>_: cycle previous buffer
_q_: quit this hydra
"
  ("a" run-auto-commit)
  ("c" run-win-cmd-with-admin)
  ("C" open-current-file-in-chrome)
  ("f" grep-dired-dwim)
  ("F" grep-dired)
  ("g" run-git-bash)
  ("h" my-list-hooks)
  ("i" run-ipython)
  ("m" my-list-key-maps)
  ("M" switch-to-minibuffer-window)
  ("o" open-explorer)
  ("r" recentf-open-files)
  ("s" sift-regexp)
  ("S" search-symbol)
  ("C-<tab>" bs-cycle-next)
  ("S-<tab>" bs-cycle-previous)
  ("q" nil :color blue))
(global-set-key (kbd "C-c a") 'hydra-one-key-access/body)

(defhydra hydra-one-key-code-operation (:color pink :hint nil)
  "
Code operations.

_j_: format JSON at point or in region
_/_: comment/uncomment region code
_m_: toggle *Messages* buffer window
_q_: quit this hydra
"
  ("j" json-pretty-print)
  ("/" my-comment-or-uncomment-region)
  ("m" toggle-message-buffer-window)
  ("q" nil :color blue))
(global-set-key (kbd "C-c c") 'hydra-one-key-code-operation/body)

(defhydra hydra-one-key-better-default (:color pink :hint nil)
  "
Better default operations.

_d_: toggle debug on error
"
  ("d" toggle-debug-on-error)
  ("q" nil :color blue))
(global-set-key (kbd "C-c d") 'hydra-one-key-better-default/body)

(defhydra hydra-one-key-edit-operation (:color pink :hint nil)
  "
Common edit operations.

_a_: add sync atomic chrome hook locally
_A_: remove sync atomic chrome hook locally
_B_: remove blank lines in buffer
_c_: show current buffer coding
_C_: set current buffer coding system
_f_: find and replace
_k_: kill all other buffers
_l_: select current line
_L_: copy current line
_m_: convert markdown TODO list to org
_n_: insert current datetime string
_o_: convert org TODO list to markdown
_r_: toggle current buffer read only
_s_: select text between two nearest quotation marks
_t_: insert today's date string
_T_: insert tomorrow's date string
_u_: set current buffer coding system to utf-8-unix
_w_: show white space character
_y_: insert yesterday's date string
_q_: quit this hydra
"
  ("a" add-sync-atomic-chrome-hook-locally)
  ("A" remove-sync-atomic-chrome-hook-locally)
  ("B" remove-blank-lines-in-buffer)
  ("c" show-current-buffer-coding)
  ("C" set-current-buffer-coding-system)
  ("f" search-and-replace)
  ("k" kill-all-other-buffers)
  ("l" select-current-line)
  ("L" copy-current-line)
  ("m" todo-list-md-to-org)
  ("n" now)
  ("o" todo-list-org-to-md)
  ("r" toggle-buffer-read-only)
  ("s" select-text-between-quotations)
  ("t" today)
  ("T" tomorrow)
  ("u" set-current-buffer-coding-system-utf-8-unix)
  ("w" whitespace-mode)
  ("y" yesterday)
  ("q" nil :color blue))
(global-set-key (kbd "C-c e") 'hydra-one-key-edit-operation/body)

(defhydra hydra-one-key-gud (:color pink :hint nil)
  "
Gud shotcut.

_c_: compile current Java source code file using javac command with debug info
_j_: debug current Java file using jdb
_r_: run code, if has breakpoints, stop at first breakpoint
_p_: print value of expression at point
_e_: eval expr
_d_: dump expr
_b_: set breakpoint
_B_: remove breakpoint
_l_: list current code
_L_: show all jdb breakpoints
_k_: kill process
_s_: step one line (not skip but enter into function)
_n_: step one line (skip function)
_u_: continue until current method returns
_q_: quit this hydra
"
  ("c" javac-compile-with-debug-info)
  ("j" jdb-debug-current-file)
  ("r" gud-jdb-run)
  ("p" gud-print)
  ("e" jdb-eval-expr)
  ("d" jdb-dump-expr)
  ("b" jdb-gud-break)
  ("B" jdb-gud-remove-break)
  ("l" jdb-list-code)
  ("L" jdb-show-breakpoints)
  ("k" gud-kill)
  ("s" gud-jdb-step)
  ("n" gud-jdb-next)
  ("u" gud-finish)
  ("q" nil :color blue))
(add-hook 'java-mode-hook
	  (lambda () (local-set-key (kbd "C-c g") 'hydra-one-key-gud/body)))

(defhydra hydra-one-key-help (:color pink :hint nil)
  "
Help operations.

_a_: apropos search
_A_: info apropos
_e_: open elisp manual
_E_: open emacs manual
_h_: open my hydra configuration file
_i_: open info
_q_: quit this hydra
"
  ("a" apropos)
  ("A" info-apropos)
  ("e" open-elisp-manual)
  ("E" open-emacs-manual)
  ("h" (lambda () (interactive) (find-file "~/.emacs.d/site-lisp/config/init/common/init-hydra-one-key.el")))
  ("i" info)  
  ("q" nil :color blue))
(global-set-key (kbd "C-c h") 'hydra-one-key-help/body)

;;;; org-mode ;;;;
(defhydra hydra-one-key-org-mode (:color pink :hint nil)
  "
Shortcut for org-mode.

_C_: insert a new column at current column below quickly in org-table
_d_: org delete line (means add `+' to head and tail of line)
_e_: export dispatch
_i_: operate a region, or word at point, insert a character both at the position of head and tail
_l_: toggle link display
_n_: insert s&f note
_R_: insert a new row at current row below quickly in org-table
_s_: insert code src block
_S_: edit code src block
_t_: modify a line to a chapter title
_M-n_: move down
_M-p_: move up
_{_: shrink parent leve headline
_[_: shrink current leve headline
_+_: open org-indent-mode
_-_: close org-indent-mode
_,_: select org-table field
_q_: quit this hydra
"
  ("C" my-org-table-insert-column-below)
  ("d" my-org-delete-line)
  ("e" org-export-dispatch)
  ("i" my-org-insert-str-to-head-tail)
  ("l" org-toggle-link-display)
  ("n" insert-s-or-f-note)
  ("R" my-org-table-insert-row-below)
  ("s" org-insert-src-block)
  ("S" org-edit-src-code)
  ("t" make-line-to-title)
  ("M-n" org-metadown)
  ("M-p" org-metaup)
  ("{" shrink-parent-level-headline)
  ("[" shrink-current-level-headline)
  ("+" indent-mode-on)
  ("-" indent-mode-off)
  ("," my-org-table-select-field)
  ("q" nil :color blue))
(add-hook 'org-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-c o") 'hydra-one-key-org-mode/body)))

(defhydra hydra-one-key-window-operation (:color pink :hint nil)
  "
Common window operations.

_+_: increase text scale                                    
_-_: decrease text scale
_<left>_: shrink window horizontally
_<right>_: enlarge window horizontally
_<down>_: shrink window
_<up>_: enlarge window
_q_: quit this hydra
"
  ("+" text-scale-increase)
  ("-" text-scale-decrease)
  ("<left>" shrink-window-horizontally)
  ("<right>" enlarge-window-horizontally)
  ("<down>" shrink-window)
  ("<up>" enlarge-window)
  ("q" nil :color blue))
(global-set-key (kbd "C-c w") 'hydra-one-key-window-operation/body)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-hydra-one-key)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-hydra-one-key ends here
