(DEFINE (reverse-it L newList)
        (IF (NULL? L)
            newList
            (IF (LIST? (CAR L))
                (reverse-it (CDR L) (CONS (reverse-it(CAR L) '()) newList))
             (reverse-it (CDR L) (CONS (CAR L) newList))
             )
         )
 )
(DEFINE (reverse-general L)
        (reverse-it L '())
 )

(DEFINE (adder sum)
        (COND
         ((NULL? sum) 0)
         (ELSE (+ (CAR sum) (adder (CDR sum)))
)))
(DEFINE (sum-it-up L newList)
        (IF (NULL? L)
            (adder newList)
            (IF (NUMBER? (CAR L))
                (sum-it-up (CDR L) (CONS (CAR L) newList))
                (sum-it-up (CDR L) newList))
         ))
(DEFINE (sum-up-numbers-simple L)
        (sum-it-up L '()))

(DEFINE (sum-it-up2 L newList)
        (IF (NULL? L)
            (adder newList)
            (COND
             ((NUMBER? (CAR L)) (sum-it-up2 (CDR L) (CONS (CAR L) newList)))
             ((LIST? (CAR L)) (sum-it-up2 (CDR L) (CONS (sum-it-up2(CAR L) '()) newList)))
             (ELSE (sum-it-up2 (CDR L) newList))
             )
         )
 )
(DEFINE (sum-up-numbers-general L)
        (sum-it-up2 L '())
 )

(DEFINE (remove-non-numbers lis)
 )
(DEFINE (min-above-min L1 L2)
        )