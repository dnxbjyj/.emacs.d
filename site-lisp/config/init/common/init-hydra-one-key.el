;;;;;;;;;; init-hydra-one-key module ;;;;;;;;;;
;;;; Desc:
;;;; init-hydra-one-key starts here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:
(require 'hydra)
(require 'init-my-function)
(require 'init-quick-access)

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

;; 切换到另一个窗口: C-;
(global-set-key (kbd "C-;") 'other-window)

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

_e_: open elisp manual
_f_: search file        
_h_: search and list hooks         
_j_: jump to line
_m_: search and list key maps
_M_: switch to minibuffer window
_o_: open explorer
_r_: show recent opened files
_C-<tab>_: cycle next buffer
_S-<tab>_: cycle previous buffer
_q_: quit this hydra
"
  ("e" open-elisp-manual)
  ("f" find-lisp-find-dired)
  ("h" my-list-hooks)
  ("j" goto-line)
  ("m" my-list-key-maps)
  ("M" switch-to-minibuffer-window)
  ("o" open-explorer)
  ("r" recentf-open-files)
  ("C-<tab>" bs-cycle-next)
  ("S-<tab>" bs-cycle-previous)
  ("q" nil :color blue))
(global-set-key (kbd "C-c a") 'hydra-one-key-access/body)

(defhydra hydra-one-key-code-operation (:color pink :hint nil)
  "
Code operations.

_f_: prettify buffer code format
_j_: format JSON buffer
_/_: comment/uncomment region code
_q_: quit this hydra
"
  ("f" (pp-buffer))
  ("j" json-pretty-print-buffer)
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

_f_: find and replace
_k_: kill all other buffers
_l_: select current line
_L_: copy current line
_n_: insert current datetime string
_s_: select text between two nearest quotation marks
_t_: insert today's date string
_T_: insert tomorrow's date string
_w_: select word at point
_y_: insert yesterday's date string
_q_: quit this hydra
"
  ("f" search-and-replace)
  ("k" kill-all-other-buffers)
  ("l" select-current-line)
  ("L" copy-current-line)
  ("n" now)
  ("s" select-text-between-quotations)
  ("t" today)
  ("T" tomorrow)
  ("w" select-current-word)
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-hydra-one-key)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-hydra-one-key ends here
