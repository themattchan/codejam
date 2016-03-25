#lang racket

;; directory struct is map of (dirname . subdirs)

(define (add-path! path ds)
  (if (null? path) ds
    (let* ((subdir (hash-ref! ds (car path) (make-hash)))
           (subdir1 (add-path! (cdr path) subdir)))
      (hash-set! ds (car path) subdir1)
      ds)))
          
(define (get-path-or-mkdir ds path)
  (define (go ds path count)
    (if (null? path) `(,ds ,count)
        (match-let*
            ((subdir 
              (hash-ref ds (car path) null))
             (`(,subdir1 ,count1) 
              (go (if (null? subdir) (make-hash) subdir) 
                  (cdr path) 
                  (if (null? subdir) (add1 count) count))))
          (hash-set! ds (car path) subdir1)
          `(,ds ,count1))))                               
  (go ds path 0))
 

(define (parse-path path)
  (map string->symbol (string-split path "/")))


(define (run-case)
  (match-let* 
      ((`(,N-dataset ,M-newdirs) 
        (map string->number (string-split (read-line) " ")))
       
       (filesystem 
        (foldl add-path!
               (make-hash)
               (for/list ([_ (range 0 N-dataset)]) (parse-path (read-line)))))
       
       (cc
        (foldl (λ (path acc)
                 (match-let* ((`(,filesystem ,count) acc)
                              (`(,filesystem1 ,count1) (get-path-or-mkdir filesystem path)))
                   `(,filesystem1 ,(+ count count1))))
               `(,filesystem 0)
               (for/list ([_ (range 0 M-newdirs)]) (parse-path (read-line))))))
    
    (cadr cc)
    ))
;(run-case)

(define (main)
  (let ((out (open-output-file "A-large-practice.out" #:mode 'text #:exists 'replace)))
    (parameterize ([current-output-port out])
    (for ((i (range 0 (string->number (read-line)))))
      (displayln (~a "Case #" (add1 i) ": " (run-case))))
    (close-output-port out))))
                     
(with-input-from-file "A-large-practice.in" main #:mode 'text)

