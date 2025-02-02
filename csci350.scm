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

(DEFINE (remove-non-numbers lis newList)
        (IF(NULL? lis)
           newList
           (IF (NUMBER? (CAR lis))
               (remove-non-numbers (CDR lis) (CONS (CAR lis) newList))
               (remove-non-numbers (CDR lis) newList)
            )
         )
 )
(DEFINE (find-lowest lis lowestNum)
        (IF (NULL? lis)
            lowestNum
            (IF (< (CAR lis) lowestNum)
                (find-lowest (CDR lis) (CAR lis))
                (find-lowest (CDR lis) lowestNum)
                ))
        )
(DEFINE (filter-too-low lis newList lowest)
        (IF (NULL? lis)
            (IF (NULL? newList)
                (not(NULL? newList))
                (find-lowest newList (CAR newList)))
            (IF (> (CAR lis) lowest)
                (filter-too-low (CDR lis) (CONS (CAR lis) newList) lowest)
                (filter-too-low (CDR lis) newList lowest))
            ))
(DEFINE (min-above-min L1 L2)
        (IF (NULL? (remove-non-numbers L2 '()))
            (IF (NULL? (remove-non-numbers L1 '()))
                (not (NULL? (remove-non-numbers L1 '())))
                (find-lowest (remove-non-numbers L1 '()) (CAR (remove-non-numbers L1 '())))
                )
            (IF (NULL? (remove-non-numbers L1 '()))
                (not (NULL? (remove-non-numbers L1 '())))
                (filter-too-low (remove-non-numbers L1 '()) '() (find-lowest (remove-non-numbers L2 '()) (CAR (remove-non-numbers L2 '()))))
                )
            )
        )