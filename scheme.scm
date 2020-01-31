(DEFINE (reverse-general L newList)
    (reverse-general (CDR L) (CONS (CAR L) newList))
 )
(reverse-general (READ) '())