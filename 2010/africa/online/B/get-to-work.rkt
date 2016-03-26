#lang racket

(define (num-cars people)
  (let* ((people (sort people >))
         (npeople (length people)))
    (define (go avail-cars num-cars cap)
      (cond 
        ((null? avail-cars) (if (< cap npeople) 'IMPOSSIBLE num-cars))
        ((< cap npeople) (go (cdr avail-cars) (add1 num-cars) (+ cap (car avail-cars))))
        (else num-cars)))
    (go people 0 0)))

(define (do-case)
  (let* ((N (read))
         (T (read))
         (E (read))
         (towns-people
          (foldl (λ (x a) (hash-update a (car x) (λ (vs) (cons (cadr x) vs)) '()))
                 (hash)              
                 (for/list ((i (range 0 E))) `(,(read) ,(read)))))
         (res
          (for/list ((i (in-range 1 (add1 N))))
            (if (= i T) 0
                (num-cars (hash-ref towns-people i '()))))))
    
    (if (memq 'IMPOSSIBLE res) (~a 'IMPOSSIBLE)
        (string-join (map number->string res)))
    ))

(define (main)
  (let ((out (open-output-file "B-large-practice.out" #:mode 'text #:exists 'replace)))
    (parameterize ([current-output-port out])
      (for ((i (range 1 (add1 (read)))))
        (displayln (~a "Case #" i ": " (do-case))))
      (close-output-port out))))

(with-input-from-file "B-large-practice.in" main #:mode 'text)
