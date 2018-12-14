(defun eval-this-buffer()
  (interactive)
  (eval-buffer nil (get-buffer-create "output"))
  (switch-to-buffer-other-window "output"))

(+ 1 2)
(* 9 9)
