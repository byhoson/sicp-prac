#lang sicp


(define (make-account balance pw)
  
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance 
                     (- balance amount))
               balance)
        "Insufficient funds"))
  
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  
  (define (dispatch input m)
    (if (eq? input pw)
        (cond ((eq? m 'withdraw) withdraw)
              ((eq? m 'deposit) deposit)
              (else (error "Unknown request: MAKE-ACCOUNT" m)))
        wrongpw))

  (define (wrongpw amount) "Incorrect password")
  
  dispatch)

(define acc 
  (make-account 100 'secret-password))

((acc 'secret-password 'withdraw) 800)

((acc 'some-other-password 'deposit) 100)

#|
Make sure that when you get the wrong password, it should return the function in the form
that takes as inputs exactly the same with the one when you get the correct password.
That is the reason why you should use wrongpw indirectly, instead of returning "Incorrect
password" directly as in the case "Insufficient funds". (Note that the function call on the
wrong password takes amount as parameter)
|#



