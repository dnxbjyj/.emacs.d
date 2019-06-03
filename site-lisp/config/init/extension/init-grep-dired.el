;;;;;;;;;; init-grep-dired module ;;;;;;;;;;
;;;; Desc:
;; attention: NOT for windows system now!

;;;; init-grep-dired starts here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:
(require 'grep-dired)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:
;; change the find program path to location find exe file
(setq find-program "D:/program/Git/usr/bin/find.exe")

;; set key bindings
(global-set-key (kbd "C-M-g") 'grep-dired-dwim)
(global-set-key (kbd "C-M-S-g") 'grep-dired)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-grep-dired)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-grep-dired ends here
