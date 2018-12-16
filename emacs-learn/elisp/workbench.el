;; 判断一个整数是不是素数
(defun is-prime (n)
  (interactive)
  (let ((i 2) (prime-flag t))
    (catch 'break
      (while (<= i (+ 1 (sqrt n)))
	(if (= (% n i) 0)
	    (progn
	      (setq prime-flag nil)	      
	      (throw 'break nil)))
	(incf i))
      )
    (print prime-flag)))

;; 求max以内的所有素数
(defun print-primes (max)
  (interactive)
  (let ((i 2))
    (while (<= i max)
      (if (is-prime i)
	  (print i))
      (incf i))))

(print-primes 100)
