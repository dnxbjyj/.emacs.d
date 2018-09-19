;;;;;;;;;; init-virtualenvwrapper模块 ;;;;;;;;;;
;;;; Desc: init-virtualenvwrapper扩展配置

;;;; init-virtualenvwrapper start here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:
(require 'virtualenvwrapper)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:
(venv-initialize-interactive-shells) ;; if you want interactive shell support
(venv-initialize-eshell) ;; if you want eshell support
;; note that setting `venv-location` is not necessary if you
;; use the default location (`~/.virtualenvs`), or if the
;; the environment variable `WORKON_HOME` points to the right place
(setq venv-location "e:/code/env/.py2env/")

(venv-initialize-eshell)

(venv-mkvirtualenv "py2env")

;; Use M-x venv-workon to activate virtualenvs and M-x venv-deactivate deactivate them

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-virtualenvwrapper)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-virtualenvwrapper end here
