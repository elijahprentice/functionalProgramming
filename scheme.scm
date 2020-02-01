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
(DEFINE (sum-up-numbers-simple L newList)
        (IF (NUMBER? (CAR L))
            (sum-up-numbers-simple (CDR L) (CONS (CAR L) newList))
            (sum-up-numbers-simple (CDR L) newList)
         ))