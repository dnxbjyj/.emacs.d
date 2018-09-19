(defun greeting(name)
  (let ((my-name (read-from-minibuffer "Enter your name:")))
  (insert (format "Hello %s! I am %s." name my-name))))
(greeting "you")



