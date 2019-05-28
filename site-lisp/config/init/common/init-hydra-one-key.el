;;;;;;;;;; init-hydra-one-key module ;;;;;;;;;;
;;;; Desc:
;;;; init-hydra-one-key starts here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:
(require 'hydra)
(require 'init-my-function)
(require 'init-quick-access)
(require 'init-org-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:
;;-----------------common quick shortcut-----------------;;
;; quickly open this file
(global-set-key (kbd "C-c h") '(lambda () (interactive) (find-file "~/.emacs.d/site-lisp/config/init/common/init-hydra-one-key.el")))

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

;; 执行当前行的S式
(global-set-key (kbd "C-<f11>") (lambda () (interactive)
			       (goto-char (line-end-position))
			       (eval-last-sexp nil)))

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

;;-----------------common hydra-----------------;;
(defhydra hydra-one-key-access (:color pink :hint nil)
  "
Access operations (access to position, file, directory, buffer, etc.).

_a_: apropos search
_c_: open cmd window
_e_: open elisp manual
_f_: search file        
_h_: search and list hooks         
_j_: jump to line
_m_: search and list key maps
_M_: switch to minibuffer window
_o_: open explorer
_p_: open powershell window
_r_: show recent opened files
_s_: search symbol
_C-<tab>_: cycle next buffer
_S-<tab>_: cycle previous buffer
_q_: quit this hydra
"
  ("a" apropos)
  ("c" open-cmd)
  ("e" open-elisp-manual)
  ("f" find-lisp-find-dired)
  ("h" my-list-hooks)
  ("j" goto-line)
  ("m" my-list-key-maps)
  ("M" switch-to-minibuffer-window)
  ("o" open-explorer)
  ("p" open-powershell)
  ("r" recentf-open-files)
  ("s" search-symbol)
  ("C-<tab>" bs-cycle-next)
  ("S-<tab>" bs-cycle-previous)
  ("q" nil :color blue))
(global-set-key (kbd "C-c a") 'hydra-one-key-access/body)

(defhydra hydra-one-key-code-operation (:color pink :hint nil)
  "
Code operations.

_j_: format JSON at point or in region
_/_: comment/uncomment region code
_q_: quit this hydra
"
  ("j" json-pretty-print)
  ("/" my-comment-or-uncomment-region)
  ("q" nil :color blue))
(global-set-key (kbd "C-c c") 'hydra-one-key-code-operation/body)

(defhydra hydra-one-key-better-default (:color pink :hint nil)
  "
Better default operations.
_d_: toggle debug on error
"
  ("d" toggle-debug-on-error)
  ("q" nil :color blue))
(global-set-key (kbd "C-c d") 'hydra-one-key-better-defaultca/body)

(defhydra hydra-one-key-edit-operation (:color pink :hint nil)
  "
Common edit operations.

_c_: show current buffer coding
_C_: set current buffer coding system
_f_: find and replace
_k_: kill all other buffers
_l_: select current line
_L_: copy current line
_n_: insert current datetime string
_s_: select text between two nearest quotation marks
_t_: insert today's date string
_T_: insert tomorrow's date string
_u_: set current buffer coding system to utf-8-unix
_w_: show white space character
_y_: insert yesterday's date string
_q_: quit this hydra
"
  ("c" show-current-buffer-coding)
  ("C" set-current-buffer-coding-system)
  ("f" search-and-replace)
  ("k" kill-all-other-buffers)
  ("l" select-current-line)
  ("L" copy-current-line)
  ("n" now)
  ("s" select-text-between-quotations)
  ("t" today)
  ("T" tomorrow)
  ("u" set-current-buffer-coding-system-utf-8-unix)
  ("w" whitespace-mode)
  ("y" yesterday)
  ("q" nil :color blue))
(global-set-key (kbd "C-c e") 'hydra-one-key-edit-operation/body)

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

;;-----------------mode hydra-----------------;;
;;;; org-mode ;;;;
(defhydra hydra-one-key-org-mode (:color pink :hint nil)
  "
Shortcut for org-mode.

_{_: shrink parent leve headline
_[_: shrink current leve headline
_+_: open org-indent-mode
_-_: close org-indent-mode
_C_: insert a new column at current column below quickly in org-table
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
_q_: quit this hydra
"
  ("{" shrink-parent-level-headline)
  ("[" shrink-current-level-headline)
  ("+" indent-mode-on)
  ("-" indent-mode-off)
  ("C" my-org-table-insert-column-below)
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
  ("q" nil :color blue))
(add-hook 'org-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-c o") 'hydra-one-key-org-mode/body)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-hydra-one-key)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-hydra-one-key ends here
