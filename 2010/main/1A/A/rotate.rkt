#lang racket

; remove all spaces, right justify, vectorify
; a grid is a vector of strings
(define (read-grid n)
  (define (pad-grid g)
    (let* ((maxlength (length (argmax length g)))
           (padby (λ (r) (- maxlength (length r))))
           (pad (λ (r) (string-append (make-string (padby r) #\.)
                                      (list->string r)))))
           (map pad g)))

  (list->vector
   (pad-grid
    (for/list ((i (range 0 n)))
      (filter (λ (c) (not (eq? #\. c)))
              (string->list (read-line)))))))

; start from bottom right, would be easier if we reflected the grid
; vertically+horizontally but that's a waste of time
(define (solve-grid g n k)
  ...)

(define (do-case)
  (let* ((nk (map string->number (string-split (read-line))))
         (n (car nk)) (k (cadr nk))
         (g (read-grid n)))
    (solve-grid g (sub1 n) k)))

(define (main)
  (let ((out (open-output-file "A-large-practice.out" #:mode 'text #:exists 'replace)))
    (parameterize ([current-output-port out])
      (for ((i (range 1 (add1 (read)))))
        (displayln (~a "Case #" i ": " (do-case))))
      (close-output-port out))))

(with-input-from-file "A-large-practice.in" main #:mode 'text)
