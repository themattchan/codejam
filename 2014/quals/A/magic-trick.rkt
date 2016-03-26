#lang racket


; keep only the row where the chosen card is.
(define (read-grid-row)
  (let* ((chosen (sub1 (string->number (read-line)))))
    (map string->number
         (string-split 
          (list-ref (for/list ((i (range 1 5)))
                      (read-line))
                    chosen)))))

(define (do-case)
  (let ((is (set-intersect 
             (read-grid-row)
             (read-grid-row))))
    (case (set-count is)
      ((0) "Volunteer cheated!")
      ((1) (set-first is))
      (else "Bad magician!"))))

       
(define (main)
  (let ((out (open-output-file "A-small-practice.out" #:mode 'text #:exists 'replace)))
    (parameterize ([current-output-port out])
      (for ((i (range 1 (add1 (string->number (read-line))))))
        (displayln (~a "Case #" i ": " (do-case))))
      (close-output-port out))))

(with-input-from-file "A-small-practice.in" main #:mode 'text)