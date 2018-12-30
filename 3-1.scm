#lang sicp

(define (make-accumulator sum)
  (lambda (val)
    (begin (set! sum (+ sum val))
           sum)))

(define A (make-accumulator 5))

(A 5)
(A 10)