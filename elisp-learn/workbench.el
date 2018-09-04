(require 'cl)
(setq x 10
      total 0)
(while (> x 0)
  (incf total x)
  (decf x))
(message total)


