#!r6rs

(library (mpl expand-power)

  (export expand-power)

  (import (mpl rnrs-sans)
          (mpl misc)
          (mpl arithmetic)
          (mpl factorial)
          (mpl expand-product))

  (define (expand-power u n)

    (if (sum? u)

        (let ((f (list-ref u 1)))

          (let ( (r (- u f)) )

            (let loop ( (s 0)
                        (k 0) )

              (if (> k n)

                  s

                  (let ((c (/ (! n)
                              (* (! k)
                                 (! (- n k))))))

                    (loop (+ s 
                             (expand-product (* c (^ f (- n k)))
                                             (expand-power r k)))
                          (+ k 1)))))))

        (^ u n)))

  )