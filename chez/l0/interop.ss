(library (interop)
  (export
    itoa

    c-false 
    bytevector->cbytearray cbytearray->bytevector
    
    cstring-length cstring->bytevector
    cstring->string string->cstring
    
    define-ftype-fn define-ftype-fn1
    define-ftype-fn-ptr define-array
    cast-ftype-pointer
    create-ftype-instance
    destroy-ftype-instance
    make-ftype-nullptr ftype-eq?
    ftype-nullptr?
    with-new-ftype with-existing-ftype
    ftype-set-multi!

    c-true?
    
    enum unsigned-char signed-128 unsigned-128
    long-double char* NULL

    float-size int-size

    is-linux? is-osx? is-windows?)
  
  (import (chezscheme))

  (define NULL 0)

  (define (itoa num buffer)
    (let* ([is-neg (fxnegative? num)]
           [absnum (fxabs num)]
           [num-digits (let loop ([num absnum])
                         (let* ([foo (fx/ num 10)]
                                [bar (fxmod
                                       num 10)])
                           (if (fxzero? foo)
                             1
                             (add1 (loop foo)))))]
           [digits-bvec (make-bytevector
                          (add1
                            (if is-neg
                              (add1 num-digits)
                              num-digits)))])
      (if is-neg
        (ftype-set! char () buffer 0 #\-))
      (let loop ([num absnum]
                 [pos 0])
        (let* ([foo (fx/ num 10)]
               [bar (fxmod num 10)]
               [chr (integer->char (+ bar 48))]
               [baz (fxabs
                      (- pos (sub1 num-digits)))])
          (ftype-set! char () buffer
            (if is-neg (add1 baz) baz) chr)
          (if (not (fxzero? foo))
            (loop foo (add1 pos))
            (ftype-set!
              char () buffer
              (if is-neg
                (add1 num-digits)
                num-digits)
              #\nul))))
      buffer))

  ;; NYLTHROP___
  ;; bytevector-conversions_ATTN_all_little-endian

  (define (bytevector->cbytearray x)
    (let* ([n (bytevector-length x)]
           [p (create-ftype-instance
                unsigned-8 n)])
      (let f ([i 0])
        (cond
          [(= i n) p]
          [else 
            (ftype-set! unsigned-8 () p i 
              (bytevector-u8-ref x i))
            (f (+ i 1))]))))

  (define (cbytearray->bytevector cba length)
    (let ([bvec (make-bytevector length)])
      (let loop ((i 0))
        (cond ((= i length) bvec)
          (else
            (bytevector-u8-set! bvec i
              (ftype-ref unsigned-8 () cba i))
            (loop (+ i 1)))))))

  ;; PORHTLYN
  
  (define (string->cstring str)
    (let* ([len (string-length str)]
           [ptr (make-ftype-pointer unsigned-char
                  (foreign-alloc (fx+ len 1)))])
      (do ((i 0 (fx+ 1 i))) ;; init
          ((fx= i len)      ;; test
           ptr)             ;; ret
        (ftype-set! unsigned-char () ptr i
          (string-ref str i)))
      (ftype-set! unsigned-char () ptr len
        (integer->char 0))
      ptr))

  (define (cstring-length cstr)
    (do ((i 0 (fx+ 1 i)))
        ((char=?
           (ftype-ref
             unsigned-char () cstr i) #\nul)
         i)))
  
  (define (cstring->bytevector cstr)
    (let* ([len (cstring-length cstr)]
           [bv  (make-bytevector len)])
      (do ((i 0 (fx+ 1 i)))
          ((fx= i len) bv)
        (bytevector-u8-set! bv i
          (char->integer
            (ftype-ref
              unsigned-char () cstr i))))))

  (define (cstring->string cstr)
    (utf8->string
      (cstring->bytevector cstr)))

  ;; ____

  (define-syntax create-ftype-instance 
    (syntax-rules ()
      ((_ type)
       (make-ftype-pointer type
         (foreign-alloc
           (ftype-sizeof type))))
      ((_ type n)
       (make-ftype-pointer type
         (foreign-alloc
           (fx* n (ftype-sizeof type)))))
      [(_ type setter ...)
       (let ([obj (create-ftype-instance
                    type)])
         (ftype-set-multi! type obj
           setter ...)
         obj)]))
  
  (define-syntax with-new-ftype
    (syntax-rules ()
      [(_ () exp ...)
       (begin exp ...)]
      [(_ ((name ftype size) . rest)
         exp ...)
       (let* ([name (create-ftype-instance
                      ftype size)]
              [res  (with-new-ftype
                      rest exp ...)])
         (destroy-ftype-instance name)
         res)]
      [(_ ((name ftype) . rest) exp ...)
       (with-new-ftype
         ((name ftype 1) . rest)
         exp ...)]))

  (define-syntax with-existing-ftype
    (syntax-rules ()
      [(_ () exp ...)
       (begin exp ...)]
      [(_ ((name binding) . rest) exp ...)
       (let* ([name binding]
              [res  (with-existing-ftype
                      rest exp ...)])
         (destroy-ftype-instance name)
         res)]))
  
  (define-syntax ftype-set-multi!
    (syntax-rules ()
      [(_ ftype var) var]
      [(_ ftype-name
         fptr-expr (accessors val-expr) c2 ...)
       (begin
         (ftype-set!
           ftype-name accessors fptr-expr val-expr)
         (ftype-set-multi!
           ftype-name fptr-expr c2 ...))]
      [(_ ftype-name fptr-expr
         (accessors index val-expr) c2 ...)
       (begin
         (ftype-set! ftype-name accessors
           fptr-expr index val-expr)
         (ftype-set-multi! ftype-name
           fptr-expr c2 ...))]))
  
  (define (destroy-ftype-instance obj)
    (foreign-free
      (ftype-pointer-address obj)))

  (define-syntax cast-ftype-pointer
    (syntax-rules ()
      ((_ type obj)
       (make-ftype-pointer type
         (ftype-pointer-address obj)))))
  
  (define-syntax make-ftype-nullptr
    (syntax-rules ()
      [(_ ftype)
       (make-ftype-pointer ftype 0)]))

  (define-syntax ftype-nullptr?
    (syntax-rules ()
      [(_ ftype obj)
       (and
         (eq?
           (ftype-pointer-ftype obj)
           (ftype-pointer-ftype (make-ftype-nullptr
                                  ftype)))
         (fxzero? (ftype-pointer-address obj)))]))
  
  (define (ftype-eq? ft0 ft1)
    (and
      (eq? (ftype-pointer-ftype ft0)
        (ftype-pointer-ftype ft1))
      (fx=? (ftype-pointer-address ft0)
        (ftype-pointer-address ft1))))

  (define-syntax define-ftype-fn
    (syntax-rules ()
      ((_ name ftype-name func-str
         signature)
       (begin
         (define-ftype ftype-name
           signature)
         (define name 
           (ftype-ref ftype-name ()
             (make-ftype-pointer
               ftype-name
               func-str)))))))

  (define-syntax define-ftype-fn-ptr
    (syntax-rules ()
      ((_ name ftype-name func-ptr signature)
       (begin
         (define-ftype ftype-name
           signature)
         (define name 
           (ftype-ref ftype-name ()
             (make-ftype-pointer
               ftype-name
               func-ptr)))))))

  (define-syntax define-ftype-fn1
    (lambda (x)
      (syntax-case x (lambda)
        ((_ name signature)
         (let ([make-name-syntax
                 (lambda (name1 after-str1)
                   (datum->syntax-object
                     name1
                     (string->symbol
                       (string-append 
                         (symbol->string
                           (syntax-object->datum
                             name1))
                         (syntax-object->datum
                           after-str1)))))])
           (with-syntax
             ([ftype-name
                ;; y-be-low-kneaded? 
                (make-name-syntax 
                  (syntax name)
                  "-t")]
              [func-str
                ;; be-low u-d-knt-hr 
                (symbol->string   
                  (syntax-object->datum
                    (syntax name)))])
             (syntax
               (begin
                 (define-ftype ftype-name
                   signature)
                 (define name 
                   (ftype-ref ftype-name
                     ()
                     (make-ftype-pointer
                       ftype-name
                       func-str)))))))))))

 
  (define-syntax define-array
    (syntax-rules ()
      [(_ array-name type size-name size)
       (begin
         (define size-name size)
         (define-ftype array-name
           (array size type)))]))
  
  ;; ____

  (define null-ptr 0)

  (define float-size (ftype-sizeof float))

  (define int-size (ftype-sizeof int))

  (define c-false 0)
  (define (c-true? val)
    (if (fx=? val 0) #f #t))

  ;; todo: win32?
  (define-ftype enum unsigned-32) 

  ;; cscm char supports full 0-255 range
  (define-ftype unsigned-char char)

  (define-ftype char* (* char))

  (define-ftype signed-128
    (array 16 unsigned-8))

  (define-ftype unsigned-128
    (array 16 unsigned-8))

  (define-ftype long-double
    (array 16 unsigned-8))

  ;;
  
  (define (is-osx?)
    (eq? (machine-type) 'ta6osx))
  
  (define (is-linux?)
    (eq? (machine-type) 'ta6le))
  
  (define (is-windows?)
    (or
      (eq? (machine-type) 'ta6nt)
      (eq? (machine-type) 'ti3nt)))

  ;; '(((fixnum     (integer-* unsigned-* size_t ptrdiff_t))
  ;;    (flonum     (single-float double-float))
  ;;    (char       (char))
  ;;    (boolean    (boolean))
  ;;    (bytevector (u8*))
  ;;    (string)    (utf-8))
  ;;   ((u8* (or bytevector #f)) (utf-8 (or string #f)))
  ;;   (in c false 0 all else true)
  ;;   (ftypes
  ;;     ((short unsigned-short int unsigned
  ;;        unsigned-int long unsigned-long
  ;;        long-long unsigned-long-long
  ;;        ptrdiff_t size_t char wchar_t
  ;;        float double void*)
  ;;      (iptr uptr fixnum boolean)
  ;;      (integer-8 unsigned-8 integer-16
  ;;        unsigned-16 integer-32 unsigned-32
  ;;        integer-64 unsigned-64 single-float
  ;;        double-float))))
  )
