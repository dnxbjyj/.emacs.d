;;;;;;;;;; init-cmuscheme module ;;;;;;;;;;
;;;; Desc:

;;;; init-cmuscheme starts here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:
(require 'cmuscheme)

(add-to-list 'auto-mode-alist '("\\.scm\\'" . scheme-mode))

;; precondition: should install racket, and add its executable path to environment path
(setq scheme-program-name "racket")

;; bypass the interactive question and start the default interpreter
(defun scheme-proc ()
  "Return the current Scheme process, starting one if necessary."
  (unless (and scheme-buffer
               (get-buffer scheme-buffer)
               (comint-check-proc scheme-buffer))
    (save-window-excursion
      (run-scheme scheme-program-name)))
  (or (scheme-get-process)
      (error "No current process. See variable `scheme-buffer'")))

(defun scheme-split-window ()
  (cond
   ((= 1 (count-windows))
    (delete-other-windows)
    (split-window-vertically (floor (* 0.68 (window-height))))
    (other-window 1)
    (switch-to-buffer "*scheme*")
    (other-window 1))
   ((not (find "*scheme*"
               (mapcar (lambda (w) (buffer-name (window-buffer w)))
                       (window-list))
               :test 'equal))
    (other-window 1)
    (switch-to-buffer "*scheme*")
    (other-window -1))))

(defun scheme-send-last-sexp-split-window ()
  (interactive)
  (goto-char (line-end-position))
  (scheme-split-window)
  (scheme-send-last-sexp))

(defun scheme-send-definition-split-window ()
  (interactive)
  (scheme-split-window)
  (scheme-send-definition))

;; key bindings
(add-hook 'scheme-mode-hook
	  (lambda ()
	    (paredit-mode 1)
	    (define-key scheme-mode-map (kbd "C-<f11>") 'scheme-send-last-sexp-split-window)
	    (define-key scheme-mode-map (kbd "<f12>") 'scheme-send-definition-split-window)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-cmuscheme)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-cmuscheme ends here
