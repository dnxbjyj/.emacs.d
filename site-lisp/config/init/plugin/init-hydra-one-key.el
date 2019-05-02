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
(defhydra hydra-one-key-access (:color pink :hint nil)
  "
Access operations (access to position, file, directory, buffer, etc.).

_e_: open elisp manual
_f_: search file        
_h_: search and list hooks         
_j_: jump to line
_m_: switch to minibuffer window
_o_: other window
_r_: show recent opened files
_<f9>_: open config dir
_C-<f9>_: open init config
_C-<tab>_: cycle next buffer
_S-<tab>_: cycle previous buffer
_q_: quit this hydra
"
  ("e" open-elisp-manual)
  ("f" find-lisp-find-dired)
  ("h" my-list-hooks)
  ("j" goto-line)
  ("m" switch-to-minibuffer-window)
  ("o" other-window)
  ("r" recentf-open-files)
  ("<f9>" open-config-dir)
  ("C-<f9>" open-init-config)
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

(defhydra hydra-one-key-better-default (global-map  "C-c d")
  "Better default operations"
  ("h" (message "") "show this shortcut list")
  ("d" toggle-debug-on-error "toggle debug on error"))

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
