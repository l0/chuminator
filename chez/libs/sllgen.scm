(library (sllgen)
  (export
    ;; pretty-print
    eopl:printf
    make-string-parser
    make-stream-scanner make-string-scanner
    make-define-datatypes show-define-datatypes
    list-define-datatypes make-stream-parser
    make-rep-loop make-parser ;; the-table
    build-parse-table check
    grammar-check-syntax production-check-syntax
    rhs-check-syntax rhs-item-check-syntax
    really-separated-list? pair-of list-of
    tuple-of either grammar->productions
    grammar->start-symbol make-production
    production->lhs production->rhs
    production->action productions->non-terminals
    arbno? arbno->rhs separated-list?
    separated-list->nonterm
    separated-list->separator separated-list->rhs
    goto-action emit-list-action
    grammar->string-literals rhs->string-literals
    grammar->string-literal-scanner-spec
    make-initial-table add-value-to-table!
    table-lookup uniq union rember
    ;; gensym
    ;; arbno-table
    arbno-initialize-table! arbno-add-entry!
    arbno-assv ;; non-terminal-table
    initialize-non-terminal-table!
    non-terminal-add! non-terminal?
    eliminate-arbnos-from-rhs
    eliminate-arbnos-from-production
    eliminate-arbnos-from-productions
    rhs-data-length first-table
    iterate-over-first-table first-of-list
    follow-table group-productions
    productions->parsing-table
    make-parse-table-non-terminal-entry
    make-parse-table-production-entry
    make-parse-table-rhs-entry check-table
    check-productions make-scanner
    parse-scanner-spec parse-init-state
    check-syntax-init-state parse-regexp
    string->regexp symbol->regexp
    make-tester-regexp make-or-regexp
    make-arbno-regexp make-concat-regexp
    tester-regexp? or-regexp? arbno-regexp?
    concat-regexp? select-variant
    unparse-regexp tester-symbol-list
    apply-tester make-char-tester tester?
    action-preference-list find-preferred-action
    is-all-skip? cook-token action?
    make-local-state scanner-inner-loop
    xapply scanner-outer-loop make-token
    token->class token->data
    token->location stream-get!
    empty-stream make-stream list->stream
    stream->list constant-stream
    stream-add-sentinel-via-thunk char-stream-get!
    char-stream-push-back! char-stream->location
    set-location! string->stream
    stdin-char-stream char-stream->list
    char-stream->list2 increment-location
    decrement-location find-production
    apply-actions unzip-buffer
    apply-reduction-stub generic-node-constructor
    ;; apply-reduction
    eval-reduction
    use-generic-node-constructor
    use-eval-reduction
    build-define-datatype-definitions
    make-scanner-datatypes-alist last
    make-rhs-datatype-list
    non-terminal->tester-name
    variant->constructor-name
    make-datatype-definition make-variant
    ;; error
    ;;
    ;; lex2 gram2 show2
    ;; ;; test-stuff
    ;; ;; parse2
    ;; gen2 gram3 show3 list3
    ;; ;; parse3
    ;; gen3 gram4
    ;; ;; parse4
    ;; gen4 show4
    )
  ;; (export
  ;;   make-string-parser)
  (import
    (except (chezscheme) error gensym)
    ;; (chezscheme)
    ;; (only (chezscheme)
    ;;   pretty-print define quote printf assq +
    ;;   lambda let let* if null? set! eq? append for-each eval
    ;;   interaction-environment display write newline or apply
    ;;   quasiquote symbol? eqv?  string? and pair? car > length cdr
    ;;   cond else list cadr caddr map cons cdar member begin set-cdr!
    ;;   string->symbol string-append number->string symbol->string
    ;;   assv not memv cadar letrec => list? = char? case string->list
    ;;   cddr char=?
    ;;   )
    )
  ;; sllgen -- Scheme LL(1) parser generator
  ;; (let ((time-stamp "Time-stamp: <2000-09-25 11:48:47 wand>"))
  ;;   (display (string-append
  ;;              "sllgen.scm "
  ;;              (substring time-stamp 13 29)
  ;;              (string #\newline))))

  ;; Grammar :: = ( { Production } ∗ )
  ;; Production :: = (Lhs ( { Rhs-item } ∗ ) Prod-name)
  ;;   Lhs
  ;;   :: = Symbol
  ;;   Rhs-item :: = Symbol | String
  ;;            :: = (arbno { Rhs-item } ∗ )
  ;;            :: = (separated-list { Rhs-item } ∗ String)
  ;; Prod-name :: = Symbol

  ;; ****************************************************************

  ;; Table of contents:

  ;; top.s                     top-level entries
  ;; parser-gen.scm            organization of parser generator
  ;; syntax.s                  concrete syntax for grammars, etc.
  ;; eliminate-arbno.s         replaces (ARBNO lhs) items with new productions
  ;; first-and-follow.s        calculate first and follow sets
  ;; gen-table.s               take list of productions, first and
  ;;                           follow tables, and generate parsing table
  ;; check-table.s             take a parse table and check for conflicts
  ;; scan.s                    scanner using streams
  ;; parse.s                   run the generated parser
  ;; error handling
  ;; tests

  ;; ****************************************************************

  ;; Mon Sep 25 11:48:13 2000 added scanner outcomes symbol, number,
  ;; string to replace make-symbol, make-number, and make-string.

  ;; Wed Apr 12 14:15:24 2000 version intended to be R5RS-compliant,
  ;; based on suggestions by Will Clinger.

  ;; ****************************************************************

  ;; be sure to load compatibility files!!

  ;; ****************************************************************

  ;; top.s

  ;; user-level entry points

  ;; (map cadr '(
  ;; (define pretty-print pretty-print)
  (define eopl:printf printf)
  
  (define make-string-parser
    (lambda (scanner-spec grammar)
      (let ((parser (make-parser grammar))
            (scanner (make-scanner
                       (append
                         (grammar->string-literal-scanner-spec
                           grammar)
                         scanner-spec))))
        (lambda (string)
          (let* ((char-stream (string->stream string))
                 (token-stream (scanner char-stream))
                 (last-line (char-stream->location char-stream)))
            (parser
              (stream-add-sentinel-via-thunk
                token-stream
                (lambda ()
                  (make-token 'end-marker #f
                    (char-stream->location char-stream))))
              (lambda (tree token token-stream)
                (if (null? token)
                  (stream-get! token-stream
                    (lambda (tok1 str1)
                      (set! token tok1)
                      (set! token-stream str1))
                    (lambda ()
                      (error 'string-parser
                        (string-append
                          "~%Internal error: shouldn't run off end of"
                          " stream with sentinels")))))
                (if (eq? (token->class token) 'end-marker)
                  tree
                  (error 'parsing
                    "at line ~s~%Symbols left over: ~s ~s etc..."
                    (token->location token)
                    (token->class token)
                    (token->data token))))))))))

  (define make-stream-scanner
    (lambda (scanner-spec grammar)
      (make-scanner
        (append
          (grammar->string-literal-scanner-spec
            grammar)
          scanner-spec))))

  (define make-string-scanner
    (lambda (scanner-spec grammar)
      (let ((scanner (make-stream-scanner scanner-spec grammar)))
        (lambda (string)
          (stream->list
            (scanner (string->stream string)))))))

  (define make-define-datatypes
    (lambda (scanner-spec grammar)
      (let ((datatype-definitions
              (build-define-datatype-definitions scanner-spec grammar)))
        ;;(pretty-print datatype-definitions)
        (for-each
          (lambda (dd) (eval dd (interaction-environment)))
          datatype-definitions))))

  (define show-define-datatypes
    (lambda (scanner-spec grammar)
      (let ((datatype-definitions
              (build-define-datatype-definitions scanner-spec grammar)))
        (for-each
          pretty-print
          datatype-definitions))))

  (define list-define-datatypes
    (lambda (scanner-spec grammar)
      (build-define-datatype-definitions scanner-spec grammar)))

  (define make-stream-parser
    (lambda (scanner-spec grammar)
      (let ((parser (make-parser grammar))
            (scanner (make-scanner
                       (append
                         (grammar->string-literal-scanner-spec
                           grammar)
                         scanner-spec))))
        (lambda (char-stream)
          (let ((stream
                  (stream-add-sentinel-via-thunk
                    (scanner char-stream)
                    (lambda ()
                      (make-token 'end-marker #f
                        (char-stream->location char-stream))))))
            (let loop ((stream stream))
              (lambda (fn eos)
                ((parser stream
                   (lambda (tree token token-stream)
                     (make-stream 'tag1
                       tree
                       (lambda (fn eos)   ; prevent evaluation for now
                         ((loop
                            ;; push the lookahead token back on the
                            ;; stream iff it's there.
                            (if (null? token)
                              token-stream
                              (make-stream 'tag2 token token-stream)))
                          fn eos)))))
                 fn eos))))))))

  (define make-rep-loop
    (lambda (prompt eval-fn stream-parser)
      (lambda ()
        (display prompt)
        (let loop
            ((ast-stream (stream-parser (stdin-char-stream))))
          ;; these seem not to make a difference
          ;; (flush-output-port)               ; chez
          ;; (flush-output)                    ; dr scheme
          (stream-get! ast-stream
            (lambda (tree stream)
              (write (eval-fn tree))
              (newline)
              (display prompt)
              (loop stream))
            (lambda () #t))))))



  ;; ****************************************************************
  ;; ****************************************************************

  ;; parser-gen.scm

  ;; Steps in parser generation:

  ;; 1.  Eliminate arbno's by making new nonterms with goto's and
  ;; emit-list's.

  ;; 2.  Factor productions with common prefixes (not in this version).

  ;; 3.  Compute first and follow sets

  ;; 4.  Compute prediction table & generate actions

  ;; ****************************************************************

  ;; parser = token-stream * ((tree * token * token-stream) -> ans) -> ans
  ;; token-stream should be terminated by end-marker token.

  (define make-parser
    (lambda (grammar)
      (grammar-check-syntax grammar)
      (initialize-non-terminal-table! grammar)
      (arbno-initialize-table!)
      (let ((parse-table (build-parse-table grammar))
            (start-symbol (grammar->start-symbol grammar)))
        (lambda (token-stream k)       ; k : (tree * token * token-stream) -> ans
          (find-production start-symbol parse-table
            '() '() token-stream k)))))


  (define the-table 'ignored)

  (define build-parse-table
    (lambda (grammar)
      (let* ((g (eliminate-arbnos-from-productions grammar))
             (first-table (first-table g))
             (follow-table (follow-table
                             (grammar->start-symbol grammar)
                             g
                             first-table))
             (table
               (productions->parsing-table g first-table
                 follow-table)))
        ;;       (pretty-print first-table)
        ;;       (pretty-print follow-table)
        ;;        (pretty-print table)
        (set! the-table table)
        (check-table table)
        table)))


  ;; ****************************************************************

  ;; syntax.s :  concrete syntax for grammars, etc.

  ;; ****************************************************************

  ;; Concrete Syntax for grammars

  ;; <Grammar> ::= (<production> ...)  ;; nonterm of first prod is
  ;;                                      start symbol.
  ;; <production> ::= (lhs rhs action)
  ;;
  ;; lhs ::= symbol                    ;; a symbol that appears in a
  ;;                                      lhs is a non-term, all others
  ;;                                      are terminals
  ;; rhs ::= (rhs-item ...)
  ;;
  ;; rhs-item ::= string | symbol | (ARBNO . rhs) | (SEPARATED-LIST nt token)
  ;;
  ;; action ::= symbol | EMIT-LIST | (GOTO lhs)
  ;; EMIT-LIST and (GOTO lhs) are not allowed in user input.

  ;; ****************************************************************

  ;; Auxiliaries for dealing with syntax of grammars

  ;; need to define grammar-check-syntax

  (define check
    (lambda (test format . args)
      (lambda (obj)
        (or (test obj)
          (apply error
            `(parser-generation ,format . ,args))))))

  (define grammar-check-syntax
    (lambda (grammar)
      ((list-of production-check-syntax)
       grammar)))

  (define production-check-syntax
    (lambda (production)
      ((tuple-of
         (check symbol? "lhs of production not a symbol: ~s"
           production)
         (rhs-check-syntax production)
         (check symbol?
           "action of production not a symbol: ~s"
           production))
       production)))

  (define rhs-check-syntax
    (lambda (production)
      (list-of
        (rhs-item-check-syntax production))))

  (define rhs-item-check-syntax
    (lambda (production)
      (lambda (rhs-item)
        ((check
           (either
             string?
             symbol?
             (pair-of
               (lambda (v) (eqv? v 'arbno))
               (rhs-check-syntax production))
             really-separated-list?
             )
           "illegal rhs item ~s in production ~s"
           rhs-item production)
         rhs-item))))

  (define really-separated-list?
    (lambda (rhs-item)
      (and (pair? rhs-item)
        (eq? (car rhs-item) 'separated-list)
        (> (length rhs-item) 2)
        (rhs-check-syntax (cdr rhs-item))
        (let
            ;; ((last-item (car (last-pair rhs-item))))
            ((last-item (last rhs-item)))
          (or (symbol? last-item) (string? last-item))))))

  (define pair-of
    (lambda (pred1 pred2)
      (lambda (obj)
        (and (pair? obj)
          (pred1 (car obj))
          (pred2 (cdr obj))))))

  (define list-of
    (lambda (pred)
      (lambda (obj)
        (or (null? obj)
          (and (pair? obj)
            (pred (car obj))
            ((list-of pred) (cdr obj)))))))

  (define tuple-of
    (lambda preds
      (lambda (obj)
        (let loop ((preds preds) (obj obj))
          (if (null? preds)
            (null? obj)
            (and (pair? obj)
              ((car preds) (car obj))
              (loop (cdr preds) (cdr obj))))))))

  (define either
    (lambda preds
      (lambda (obj)
        (let loop ((preds preds))
          (cond
            ((null? preds) #f)
            (((car preds) obj) #t)
            (else (loop (cdr preds))))))))


  (define grammar->productions
    (lambda (gram) gram))                 ; nothing else now, but this
  ;; might change

  (define grammar->start-symbol
    (lambda (gram)
      (production->lhs
        (car
          (grammar->productions gram)))))

  (define make-production
    (lambda (lhs rhs action)
      (list lhs rhs action)))

  (define production->lhs car)
  (define production->rhs cadr)
  (define production->action caddr)

  (define productions->non-terminals
    (lambda (productions)
      (map production->lhs productions)))

  (define arbno?
    (lambda (rhs-item)
      (and (pair? rhs-item)
        (eq? (car rhs-item) 'arbno))))

  (define arbno->rhs cdr)

  (define separated-list?
    (lambda (rhs-item)
      (and (pair? rhs-item)
        (eq? (car rhs-item) 'separated-list)
        (> (length rhs-item) 2))))

  ;; (separated-list rhs-item ... separator)

  (define separated-list->nonterm cadr)

  (define separated-list->separator
    (lambda (item)
      (let loop ((items (cdr item)))
        (cond
          ((null? (cdr items)) (car items))
          (else (loop (cdr items)))))))

  (define separated-list->rhs
    (lambda (item)
      (let loop ((items (cdr item)))
        (cond
          ((null? (cdr items)) '())
          (else (cons (car items) (loop (cdr items))))))))

  (define goto-action
    (lambda (lhs) (list 'goto lhs)))

  (define emit-list-action
    (lambda () '(emit-list)))

  (define grammar->string-literals ; apply this after arbnos have
    ;; been eliminated.
    (lambda (grammar)
      (apply append
        (map
          (lambda (production)
            (rhs->string-literals
              (production->rhs production)))
          grammar))))

  (define rhs->string-literals
    (lambda (rhs)
      (let loop ((rhs rhs))
        (cond
          ((null? rhs) '())
          ((string? (car rhs)) (cons (car rhs) (loop (cdr rhs))))
          ((pair? (car rhs)) (append (loop (cdar rhs)) (loop (cdr rhs))))
          (else (loop (cdr rhs)))))))

  (define grammar->string-literal-scanner-spec
    (lambda (grammar)
      (let ((class (gensym 'literal-string)))
        (map
          (lambda (string) (list class (list string) 'make-string))
          (grammar->string-literals grammar)))))

  ;; ****************************************************************

  ;; updatable associative tables

  ;; table ::= ((symbol . list) ...)


  (define make-initial-table       ; makes table with all entries
    ;; initialized to empty
    (lambda (symbols)
      (map list symbols)))

  (define add-value-to-table!
    (lambda (table key value)
      (let ((pair (assq key table)))
        (if (member value (cdr pair))
          #f
          (begin
            (set-cdr! pair (cons value (cdr pair)))
            #t)))))

  (define table-lookup
    (lambda (table key)
      (cdr (assq key table))))

  (define uniq
    (lambda (l)
      (if (null? l) '()
        (let ((z (uniq (cdr l))))
          (if (member (car l) z)
            z
            (cons (car l) z))))))

  (define union
    (lambda (s1 s2)                       ; s1 and s2 already unique
      (if (null? s1) s2
        (if (member (car s1) s2)
          (union (cdr s1) s2)
          (cons (car s1) (union (cdr s1) s2))))))

  ;; this is only called with '(), so the eqv? is ok.
  (define rember
    (lambda (a s)
      (cond
        ((null? s) s)
        ((eqv? a (car s)) (cdr s))
        (else (cons (car s) (rember a (cdr s)))))))


  (define gensym
    (let ((n 0))
      (lambda (s)
        (set! n (+ n 1))
        (let ((s (if (string? s) s (symbol->string s))))
          (string->symbol
            (string-append s (number->string n)))))))


  ;; ****************************************************************

  ;; a table for keeping the arity of the generated nonterminals for
  ;; arbno.

  (define arbno-table '())

  (define arbno-initialize-table!
    (lambda ()
      (set! arbno-table '())))

  (define arbno-add-entry!
    (lambda (sym val)
      (set! arbno-table
        (cons (cons sym val) arbno-table))))

  (define arbno-assv
    (lambda (ref)
      (assv ref arbno-table)))

  (define non-terminal-table '())

  (define initialize-non-terminal-table!
    (lambda (productions)
      (set! non-terminal-table '())
      (for-each
        (lambda (prod)
          (non-terminal-add!
            (production->lhs prod)))
        productions)))

  (define non-terminal-add!
    (lambda (sym)
      (if (not (memv sym non-terminal-table))
        (set! non-terminal-table
          (cons sym non-terminal-table)))))

  (define non-terminal?
    (lambda (sym)
      (memv sym non-terminal-table)))

  ;; ****************************************************************

  ;; eliminate-arbno.s

  ;; replaces (ARBNO lhs) items with new productions

  (define eliminate-arbnos-from-rhs
    (lambda (rhs k)
      ;; returns to its continuation the new rhs and the list of
      ;; new productions
      (cond
        ((null? rhs)
         (k rhs '()))
        ((arbno? (car rhs))
         (let ((new-nonterm (gensym
                              (if (symbol? (cadar rhs)) (cadar rhs) 'arbno)))
               (local-rhs (arbno->rhs (car rhs))))
           (arbno-add-entry!
             new-nonterm
             (rhs-data-length local-rhs))
           (eliminate-arbnos-from-rhs
             (cdr rhs)
             (lambda (new-rhs new-prods)
               (eliminate-arbnos-from-rhs
                 local-rhs
                 (lambda (new-local-rhs new-local-prods)
                   (k
                     (cons new-nonterm new-rhs)
                     (cons
                       (make-production
                         new-nonterm '() (emit-list-action))
                       (cons
                         (make-production
                           new-nonterm
                           new-local-rhs
                           (goto-action new-nonterm))
                         (append new-local-prods new-prods))))))))))
        ((separated-list? (car rhs))
         ;; A -> ((sep-list B1 B2 ... C) ...)
         (let* ((local-rhs (separated-list->rhs (car rhs)))
                (separator (separated-list->separator (car rhs)))
                (seed (if (symbol? local-rhs) local-rhs 'seplist))
                (new-nonterm1 (gensym seed))
                (new-nonterm2 (gensym seed))
                (new-nonterm3 (gensym seed)))
           (arbno-add-entry!
             new-nonterm1
             (rhs-data-length local-rhs))
           (eliminate-arbnos-from-rhs
             (cdr rhs)
             (lambda (new-rhs new-prods)
               (eliminate-arbnos-from-rhs
                 local-rhs
                 (lambda (new-local-rhs new-local-prods)
                   (k
                     (cons new-nonterm1 new-rhs) ; A -> (g1 ...)
                     (append
                       (list
                         (make-production  ; g1  -> e
                           new-nonterm1 '()
                           (emit-list-action))
                         (make-production  ; g1 -> B1 B2 (goto g3)
                           new-nonterm1
                           new-local-rhs
                           (goto-action new-nonterm3))
                         (make-production ; g2 -> B1 B2 (goto g3).
                           new-nonterm2
                           new-local-rhs
                           (goto-action new-nonterm3))
                         (make-production     ; g3 -> e (emit-list)
                           new-nonterm3
                           '() (emit-list-action))
                         (make-production ; g3 -> C (goto g2)
                           new-nonterm3
                           (list separator)
                           (goto-action new-nonterm2)))
                       new-local-prods
                       new-prods))))))))
        (else
          (eliminate-arbnos-from-rhs (cdr rhs)
            (lambda (new-rhs new-prods)
              (k (cons (car rhs) new-rhs)
                new-prods)))))))

  (define eliminate-arbnos-from-production
    (lambda (production)
      ;; returns list of productions
      (eliminate-arbnos-from-rhs
        (production->rhs production)
        (lambda (new-rhs new-prods)
          (let ((new-production
                  (make-production
                    (production->lhs production)
                    new-rhs
                    (production->action production))))
            (cons new-production
              (eliminate-arbnos-from-productions new-prods)))))))

  (define eliminate-arbnos-from-productions
    (lambda (productions)
      (let loop ((productions productions))
        (if (null? productions)
          '()
          (append
            (eliminate-arbnos-from-production (car productions))
            (loop (cdr productions)))))))

  (define rhs-data-length
    (lambda (rhs)
      (let ((report-error
              (lambda (rhs-item msg)
                (error 'parser-generation
                  "illegal item ~s (~a) in rhs ~s"
                  rhs-item msg rhs))))
        (letrec
            ((loop
               (lambda (rhs)
                 ;; (eopl:printf "~s~%" rhs)
                 (if (null? rhs) 0
                   (let ((rhs-item (car rhs))
                         (rest (cdr rhs)))
                     (cond
                       ((and
                          (symbol? rhs-item)
                          (non-terminal? rhs-item))
                        ;;                    (eopl:printf "found nonterminal~%")
                        (+ 1 (loop rest)))
                       ((symbol? rhs-item)
                        ;;                    (eopl:printf "found terminal~%")
                        (+ 1 (loop rest)))
                       ((arbno? rhs-item)
                        ;;                    (eopl:printf "found arbno~%")
                        (+
                          (loop (arbno->rhs rhs-item))
                          (loop rest)))
                       ((separated-list? rhs-item)
                        ;;                     (eopl:printf "found seplist~%")
                        (+
                          (loop (separated-list->rhs rhs-item))
                          (loop rest)))
                       ((string? rhs-item)
                        ;;                     (eopl:printf "found string~%")
                        (loop rest))
                       (else
                         ;;                      (eopl:printf "found error~%")
                         (report-error rhs-item "unrecognized item"))))))))
          (loop rhs)))))

  ;; ****************************************************************

  ;; first-and-follow.s

  ;; calculate first and follow sets

  ;; base conditions:

  ;; A -> a ...   => a in first(A)
  ;; A -> ()      => nil in first(A)

  ;; closure conditions:

  ;; A -> (B1 ... Bk c ...) & nil in first(B1)...first(Bk) => c in first(A)
  ;; A -> (B1 ... Bk C ...) & nil in first(B1)...first(Bk) & c in first(C) =>
  ;;                                                         c in first(A)
  ;; A -> (B1 ... Bk) & nil in first(B1)...first(Bk) => nil in first(A)

  (define first-table
    (lambda (productions)
      (let* ((non-terminals
               (uniq (map production->lhs productions)))
             (table (make-initial-table non-terminals)))
        (letrec
            ((loop
               ;; initialize with the base conditions and return the
               ;; productions to be considered for the closure
               (lambda (productions)
                 (cond
                   ((null? productions) '())
                   ((null? (production->rhs (car productions)))
                    ;; A -> ()      => nil in first(A)
                    (add-value-to-table! table
                      (production->lhs (car productions))
                      '())
                    (loop (cdr productions)))
                   ((member (car
                              (production->rhs
                                (car productions)))
                      non-terminals)
                    ;; this one is for the closure
                    (cons (car productions)
                      (loop (cdr productions))))
                   (else
                     ;; this one must start with a terminal symbol
                     (add-value-to-table! table
                       (production->lhs (car productions))
                       (car
                         (production->rhs
                           (car productions)))))))))
          (let ((closure-productions (loop productions)))
            (iterate-over-first-table table productions
              non-terminals))))))


  (define iterate-over-first-table
    (lambda (table productions non-terminals)
      (let* ((changed? '**uninitialized**)
             (add-value!
               (lambda (key value)
                 (let ((not-there?
                         (add-value-to-table! table key value)))
                   (set! changed? (or changed? not-there?)))))
             (first (lambda (key) (table-lookup table key))))
        (letrec
            ((rhs-loop
               (lambda (lhs rhs)
                 ;; assume everything in the rhs up to this point has () in
                 ;; its first set
                 (cond
                   ((null? rhs)
                    ;; A -> (B1 ... Bk) & nil in first(B1)...first(Bk) =>
                    ;; nil in first(A)
                    (add-value! lhs '()))
                   ;; A -> (B1 ... Bk C ...) & nil in first(B1)...first(Bk)
                   ((member (car rhs) non-terminals)
                    (for-each
                      (lambda (sym)
                        (if (not (null? sym))
                          ;; & c in first(C) => c in first(A)
                          (add-value! lhs sym)
                          ;; e in first(C) -- continue to search down rhs
                          (rhs-loop lhs (cdr rhs))))
                      (first (car rhs))))
                   (else
                     ;; A -> (B1 ... Bk c ...) & nil in
                     ;; first(B1)...first(Bk) => c in first(A)
                     (add-value! lhs (car rhs))))))
             (main-loop
               (lambda ()
                 (set! changed? #f)
                 (for-each
                   (lambda (production)
                     (rhs-loop
                       (production->lhs production)
                       (production->rhs production)))
                   productions)
                 (if changed?
                   (main-loop)
                   table))))
          (main-loop)))))

  (define first-of-list
    (lambda (first-table non-terminals items)
      (let ((get-nonterminal
              (lambda (item)
                (cond
                  ((member item non-terminals) item)
                  ((symbol? item) #f)
                  ((string? item) #f)
                  ((eq? (car item) 'goto) (cadr item))
                  (else #f)))))
        (letrec
            ((loop (lambda (items)
                     (cond
                       ((null? items) '(()))                 ; ans = {e}
                       ((get-nonterminal (car items)) =>
                        (lambda (nonterminal)
                          (let ((these
                                  (table-lookup first-table nonterminal)))
                            (if (member '() these)
                              (let ((others (loop (cdr items))))
                                (let inner ((these these))
                                  (cond
                                    ((null? these) others)
                                    ((null? (car these))
                                     (inner (cdr these)))
                                    ((member (car these) others)
                                     (inner (cdr these)))
                                    (else
                                      (cons (car these)
                                        (inner (cdr these)))))))
                              these))))
                       (else (list (car items)))))))
          (loop items)))))

  (define follow-table
    (lambda (start-symbol productions first-table)
      (let* ((non-terminals
               (uniq (map production->lhs productions)))
             (table (make-initial-table non-terminals))
             (changed? '**uninitialized**)
             (add-value!
               (lambda (key value)
                 (let ((not-there?
                         (add-value-to-table! table key value)))
                   (set! changed? (or changed? not-there?)))))
             ;; closure-rules ::= ((a b) ...) means follow(a) \subset
             ;; follow(b)
             (closure-rules '())
             (get-nonterminal
               (lambda (item)
                 (cond
                   ((member item non-terminals) item)
                   (else #f)))))
        (add-value! start-symbol 'end-marker)
        (letrec
            ((init-loop
               ;; loops through productions once, adding starting values
               ;; to follow-table and other productions to closure-rules
               (lambda (productions)
                 (if (null? productions)
                   #t
                   (let* ((production (car productions))
                          (lhs (production->lhs production))
                          (rhs (production->rhs production))
                          (action (production->action production)))
                     (rhs-loop
                       lhs
                       (append rhs ;; add back the goto as a nonterminal
                         (if (and (pair? action) (eq? (car action) 'goto))
                           (list (cadr action))
                           '())))
                     (init-loop (cdr productions))))))
             (rhs-loop
               (lambda (lhs rhs)
                 ;; (eopl:printf "rhs-loop lhs=~s rhs=~s~%" lhs rhs)
                 (cond
                   ((null? rhs) #t)
                   ((get-nonterminal (car rhs)) =>
                    (lambda (nonterminal)
                      ;; we've found a nonterminal.  What's it followed by?
                      (let* ((rest (cdr rhs))
                             (first-of-rest
                               (first-of-list
                                 first-table non-terminals rest)))
                        (for-each
                          (lambda (sym)
                            (if (not (null? sym))
                              ;; A -> (... B C ...) => first(C...) \subset follow(B)
                              (add-value! nonterminal sym)
                              ;; A -> (... B C ...) & e \in first(C ...) =>
                              ;; follow(A) \subset follow (B)
                              (begin
                                (set! closure-rules
                                  (cons (list lhs nonterminal)
                                    closure-rules))
                                ;; (eopl:printf "~s~%" (list lhs nonterminal))
                                )))
                          first-of-rest))
                      ;; now keep looking
                      (rhs-loop lhs (cdr rhs))))
                   (else
                     ;; this one's not a non-terminal.  Keep looking.
                     (rhs-loop lhs (cdr rhs))))))
             (closure-loop
               (lambda ()
                 (set! changed? #f)
                 (for-each
                   (lambda (rule)
                     (let ((a (car rule))
                           (b (cadr rule)))
                       ;; follow(a) \subset follow(b)
                       (for-each
                         (lambda (sym)
                           (add-value! b sym))
                         (table-lookup table a))))
                   closure-rules)
                 (if changed?
                   (closure-loop)
                   table))))
          (init-loop productions)
          ;;       (pretty-print closure-rules)
          (closure-loop)))))


  ;; ****************************************************************

  ;; gen-table.s

  ;; gen-table.s  take list of productions, first and follow tables,
  ;; and generate parsing table

  ;; table ::= ((non-terminal (list-of-items action ...)....) ...)

  ;; the list of items is the first(rhs) for each production (or
  ;; follow(lhs) if the production is empty.  We should probably check
  ;; to see that these are non-intersecting, but we probably won't on
  ;; this pass.

  ;; First thing to do: collect all the productions for a given
  ;; non-terminal.  This gives data structure of the form

  ;; ((lhs production ...) ...)

  ;; We'll do this using updatable tables.

  (define group-productions
    (lambda (productions)
      (let* ((non-terminals
               (uniq (map production->lhs productions)))
             (table (make-initial-table non-terminals)))
        (for-each
          (lambda (production)
            (let
                ((lhs (production->lhs production)))
              (add-value-to-table! table lhs production)))
          productions)
        table)))

  ;; this one uses the list structure of tables.  [Watch out]

  (define productions->parsing-table
    (lambda (productions first-table follow-table)
      (let ((non-terminals
              (uniq (map production->lhs productions)))
            (table (group-productions productions)))
        (map
          (lambda (table-entry)
            (make-parse-table-non-terminal-entry
              (car table-entry)
              (map
                (lambda (production)
                  (make-parse-table-production-entry
                    production non-terminals first-table follow-table))
                (cdr table-entry))))
          table))))

  (define make-parse-table-non-terminal-entry
    (lambda (lhs entries)
      (cons lhs entries)))

  (define make-parse-table-production-entry
    (lambda (production non-terminals first-table follow-table)
      (let* ((rhs (production->rhs production))
             (first-of-rhs (first-of-list
                             first-table non-terminals
                             (production->rhs production)))
             (steering-items
               (if (member '() first-of-rhs)
                 (union
                   (table-lookup
                     follow-table
                     (production->lhs production))
                   (rember '() first-of-rhs))
                 first-of-rhs)))
        (cons steering-items
          (make-parse-table-rhs-entry
            non-terminals
            (production->rhs production)
            (production->action production))))))

  (define make-parse-table-rhs-entry
    (lambda (non-terminals rhs action)
      (let loop ((rhs rhs))
        (cond
          ((null? rhs)
           ;; at end -- emit reduce action or emit-list action
           (if (symbol? action)
             ;; symbols become "reduce",
             ;; (emit-list) and (goto nt) stay the same
             (list (list 'reduce action))
             (list action)))
          ((arbno-assv (car rhs)) =>
           (lambda (pair)                 ; (cdr pair) is the count for
             ;; the arbno
             (cons
               (list 'arbno (car rhs) (cdr pair))
               (loop (cdr rhs)))))
          ((member (car rhs) non-terminals)
           (cons (list 'non-term (car rhs))
             (loop (cdr rhs))))
          ((symbol? (car rhs))
           (cons (list 'term (car rhs))
             (loop (cdr rhs))))
          ((string? (car rhs))
           (cons (list 'string (car rhs))
             (loop (cdr rhs))))
          (else
            (error 'parser-generation
              "unknown rhs entry ~s"
              (car rhs)))))))

  ;; ****************************************************************

  ;; check-table.s

  ;; take a parse table and check for conflicts

  ;; table ::= ((non-terminal (list-of-items action ...)....) ...)

  (define check-table
    (lambda (table)
      (for-each check-productions table)))

  (define check-productions
    (lambda (non-terminal-entry)
      (let ((non-terminal (car non-terminal-entry))
            (productions (cdr non-terminal-entry)))
        ;; see if the list-of-items are pairwise disjoint
        (let loop ((productions productions))
          (if (null? productions)
            #t                            ; no more to check
            (let ((this-production (car productions))
                  (other-productions (cdr productions)))
              ;; check this production
              (for-each
                (lambda (class)
                  (let inner ((others other-productions))
                    (cond
                      ((null? others) #t)
                      ;; memq changed to member Tue Nov 16 14:26:32
                      ;; 1999, since class could be a string.
                      ((member class (car (car others)))
                       (error 'parser-generation
                         (string-append
                           "~%Grammar not LL(1): Shift conflict detected"
                           " for class ~s in nonterminal ~s:~%~s~%~s~%")
                         class non-terminal this-production (car others)))
                      (else (inner (cdr others))))))
                (car this-production))
              ;; and check the others
              (loop other-productions)))))))


  ;; ****************************************************************

  ;; scan.scm

  ;; Scanner based on regexps and longest-match property

  ;; new version using proper lookahead in scanner-inner-loop
  ;; Tue Dec 01 11:42:53 1998

  ;; External syntax of scanner:

  ;; scanner ::= (init-state ...)
  ;; init-state ::= (classname (regexp ...) action-opcode)
  ;; regexp = etester | (or regexp ...) | (arbno regexp)
  ;;        | (concat regexp ...)
  ;; etester ::= string | LETTER | DIGIT | WHITESPACE | ANY | (NOT char)

  ;; top level stream transducer:

  (define make-scanner
    (lambda (init-states)
      (let ((start-states (parse-scanner-spec init-states)))
        (lambda (input-stream)
          (scanner-outer-loop start-states input-stream)))))

  ;; Conversion of external to internal rep

  (define parse-scanner-spec
    (lambda (init-states)
      (map parse-init-state init-states)))

  (define parse-init-state
    (lambda (init-state)
      (check-syntax-init-state init-state)
      (let ((classname (car init-state))
            (regexps (cadr init-state))
            (opcode (caddr init-state)))
        (make-local-state
          (map parse-regexp regexps)
          (cons opcode classname)))))

  (define check-syntax-init-state
    (lambda (v)
      (or
        (and
          (list? v)
          (= (length v) 3)
          (symbol? (car v))
          (list? (cadr v))
          (symbol? (caddr v))
          (member (caddr v) action-preference-list))
        (error 'scanner-generation "bad scanner item ~s" v))))

  (define parse-regexp
    (lambda (regexp)
      (cond
        ((char? regexp) (make-tester-regexp regexp))
        ((string? regexp) (string->regexp regexp))
        ((symbol? regexp) (symbol->regexp regexp))
        ((and (pair? regexp) (symbol? (car regexp)))
         (case (car regexp)
           ((or)
            (make-or-regexp (map parse-regexp (cdr regexp))))
           ((concat)
            (make-concat-regexp (map parse-regexp (cdr regexp))))
           ((arbno)
            (and
              (or (pair? (cdr regexp))
                (error 'scanner-generation "bad regexp ~s" regexp))
              (make-arbno-regexp (parse-regexp (cadr regexp)))))
           ((not) (and
                    (or (and (pair? (cdr regexp))
                          (char? (cadr regexp)))
                      (error 'parse-regexp "bad regexp ~s" regexp))
                    (make-tester-regexp regexp)))))
        (else (error 'scanner-generation "bad regexp ~s" regexp)))))

  (define string->regexp
    (lambda (string)
      (make-concat-regexp
        (map make-tester-regexp
          (map make-char-tester (string->list string))))))

  (define symbol->regexp
    (lambda (sym)
      (if (member sym tester-symbol-list)
        (make-tester-regexp sym)
        (error 'scanner-generation "unknown tester ~s" sym))))

  ;; regexps
  ;; regexp = tester | (or regexp ...) | (arbno regexp)
  ;;        | (concat regexp ...)


  ;; (define-datatype regexp
  ;;   (tester-regexp tester?)
  ;;   (or-regexp (list-of regexp?))
  ;;   (arbno-regexp regexp?)
  ;;   (concat-regexp (list-of regexp?)))

  (define make-tester-regexp (lambda (x) x))
  (define make-or-regexp (lambda (res) (cons 'or res)))
  (define make-arbno-regexp (lambda (re) (list 'arbno re)))
  (define make-concat-regexp (lambda (rs) (cons 'concat rs)))

  (define tester-regexp?
    (lambda (x)
      (and (tester? x) (lambda (f) (f x)))))

  (define or-regexp?
    (lambda (x)
      (and (eq? (car x) 'or)
        (lambda (f) (f (cdr x))))))

  (define arbno-regexp?
    (lambda (x)
      (and (eq? (car x) 'arbno)
        (lambda (f) (f (cadr x))))))

  (define concat-regexp?
    (lambda (x)
      (and (eq? (car x) 'concat)
        (lambda (f) (f (cdr x))))))

  ;; (select-variant obj selector1 receiver1 ... [err-thunk])

  (define select-variant
    (lambda (obj . alts)
      (let loop ((alts alts))
        (cond
          ((null? alts)
           (error 'select-variant
             "~%Internal error: nothing matched ~a" obj))
          ((null? (cdr alts)) ((car alts)))
          (((car alts) obj) => (lambda (f) (f (cadr alts))))
          (else (loop (cddr alts)))))))


  (define unparse-regexp ;; deals with regexps or actions
    (lambda (regexp)
      (if (action? regexp)
        regexp
        (select-variant regexp
          tester-regexp?
          (lambda (tester) tester)
          arbno-regexp?
          (lambda (regexp)
            (list 'arbno (unparse-regexp regexp)))
          concat-regexp?
          (lambda (regexps)
            (cons 'concat (map unparse-regexp regexps)))
          or-regexp?
          (lambda (regexps)
            (cons 'or (map unparse-regexp regexps)))))))

  ;; testers
  ;; tester ::= char | LETTER | DIGIT | ANY | WHITESPACE | (NOT char)

  (define tester-symbol-list '(letter digit any whitespace))

  (define apply-tester
    (lambda (tester ch)
      (cond
        ((char? tester) (char=? tester ch))
        ((symbol? tester)
         (case tester
           ((whitespace) (char-whitespace? ch))
           ((letter) (char-alphabetic? ch))
           ((digit) (char-numeric? ch))
           ((any) #t) ;; ELSE is not really a tester
           (else (error 'apply-tester
                   "~%Internal error: unknown tester ~s" tester))))
        ((eq? (car tester) 'not)
         (not (char=? (cadr tester) ch)))
        (else (error 'apply-tester
                "~%Internal error: unknown tester ~s"
                tester)))))

  (define make-char-tester
    (lambda (char)
      (and (or (char? char)
             (error 'scanner-generation "illegal character ~s" char))
        char)))

  (define tester?
    (lambda (v)
      (or (char? v)
        (member v tester-symbol-list)
        (and (pair? v)
          (eq? (car v) 'not)
          (pair? (cdr v))
          (char? (cadr v))))))


  ;; actions
  ;; action        ::= (action-opcode . classname)
  ;; action-opcode :: = skip | symbol | number | string

  ;; make-symbol, make-number, and make-string are supported
  ;; alternates, but are deprecated.

  ;; the classname becomes the the name of token.

  ;; if multiple actions are possible, do the one that appears here
  ;; first.  make-string is first, so literal strings trump identifiers.

  ;; (define action-preference-list
  ;;   '(make-string make-symbol make-number skip))

  (define action-preference-list
    '(string make-string symbol make-symbol number make-number skip))

  (define find-preferred-action
    (lambda (action-opcodes)
      (let loop ((preferences action-preference-list))
        (cond
          ((null? preferences)
           (error 'scanning "~%No known actions in ~s"
             action-opcodes))
          ((member (car preferences) action-opcodes)
           (car preferences))
          (else (loop (cdr preferences)))))))

  (define is-all-skip?
    (lambda (actions)
      (let ((opcode  (find-preferred-action (map car actions))))
        (eq? opcode 'skip))))

  (define cook-token
    (lambda (buffer actions loc)
      (let* ((opcode (find-preferred-action (map car actions)))
             (classname (cdr (assq opcode actions))))
        (case opcode
          ((skip) (error 'cook-token
                    "~%Internal error: skip should have been handled earlier ~s"
                    actions))
          ((make-symbol symbol)
           (make-token classname
             (string->symbol (list->string (reverse buffer)))
             loc))
          ((make-number number)
           (make-token classname
             (string->number (list->string (reverse buffer)))
             loc))
          ((make-string string)
           (make-token classname
             (list->string (reverse buffer))
             loc))
          (else
            (error 'scanning
              "~%Unknown opcode selected from action list ~s"
              actions))))))

  ;; (define cook-token
  ;;   (lambda (buffer actions loc)
  ;;     (let* ((opcode (find-preferred-action (map car actions)))
  ;;            ;; (classname (cdr (assq opcode actions)))
  ;;            )
  ;;       (case opcode
  ;;         ((skip) (error 'cook-token
  ;;                   "~%Internal error: skip should have been handled earlier ~s"
  ;;                   actions))
  ;;         ((make-symbol identifier)
  ;;          (make-token 'identifier
  ;;            (string->symbol (list->string (reverse buffer)))
  ;;            loc))
  ;;         ((make-number number)
  ;;          (make-token 'number
  ;;            (string->number (list->string (reverse buffer)))
  ;;            loc))
  ;;         ((make-string string)
  ;;          (make-token 'string
  ;;            (list->string (reverse buffer))
  ;;            loc))
  ;;         (else
  ;;           (error 'scanning
  ;;             "~%Unknown opcode selected from action list ~s"
  ;;             actions))))))

  (define action?
    (lambda (action)
      (and
        (pair? action)
        (member (car action) action-preference-list)
        (symbol? (cdr action)))))

  ;; tokens

  ;; (define-record token (symbol? (lambda (v) #t)))
  ;; (define make-token list)

  ;; localstate = regexp* x action

  ;; (define-record local-state ((list-of regexp?) action?))

  (define make-local-state
    (lambda (regexps action)
      (append regexps (list action))))

  ;; k = (actions * newstates * char * stream) -> val
  (define scanner-inner-loop
    (lambda (local-states stream k)
      (let ((actions '())
            (newstates '())
            (char '())
            (eos-found? #f))              ; do we need to return this too?
        ;;(eopl:printf "initializing scanner-inner-loop~%")
        (let loop ((local-states local-states)) ; local-states
          ;;         '(begin
          ;;            (eopl:printf
          ;;             (string-append
          ;;                "scanner-inner-loop char = ~s "
          ;;                "actions=~s local-states =~%")
          ;;              char actions)
          ;;            (for-each
          ;;              (lambda (local-state)
          ;;                (pretty-print
          ;;                   (map unparse-regexp local-state)))
          ;;              local-states)
          ;;            (eopl:printf "newstates = ~%")
          ;;            (for-each
          ;;              (lambda (local-state)
          ;;                (pretty-print
          ;;                   (map unparse-regexp local-state)))
          ;;              newstates))
          (if (null? local-states)
            ;; no more states to consider
            (begin
              ;; '(eopl:printf
              ;;    (string-append
              ;;       "scanner-inner-loop returning with actions = ~s "
              ;;       "char = ~s newstates = ~%")
              ;;    actions char)
              ;;    '(for-each
              ;;    (lambda (local-state)
              ;;    (pretty-print (map unparse-regexp local-state)))
              ;;               newstates)
              (k actions newstates char stream))
            (let ((state        (car local-states)))
              ;;           (eopl:printf "first state:~%")
              ;;           (pretty-print state)
              (cond
                ((action? (car state))    ; state should never be null
                 ;; recommend accepting what's in the buffer
                 (set! actions (cons (car state) actions))
                 (loop (cdr local-states)))
                ((tester-regexp? (car state))
                 =>
                 (xapply
                   (lambda (tester)
                     ;; get a character if one hasn't been gotten and we
                     ;; haven't discovered eos.
                     (if (and (null? char) (not eos-found?))
                       (char-stream-get! stream
                         (lambda (ch1)
                           '(printf "read character ~s~%" ch1)
                           (set! char ch1))
                         (lambda ()
                           (set! eos-found? #t))))
                     '(printf "applying tester ~s to ~s~%" tester char)
                     (if (and (not (null? char))
                           (apply-tester tester char))
                       ;; passed the test -- shift is possible
                       (set! newstates (cons (cdr state) newstates)))
                     ;; either way, continue with the other local-states
                     (loop (cdr local-states)))))
                ((or-regexp? (car state))
                 =>
                 (xapply
                   (lambda (alternatives)
                     ;; its ((or alts) regexps action)
                     (loop (append
                             (map (lambda (alt) (cons alt (cdr state)))
                               alternatives)
                             (cdr local-states))))))
                ((arbno-regexp? (car state))
                 =>
                 (xapply
                   (lambda (regexp1)
                     ;; it's ((arbno regexp1) regexps action)
                     ;; so its either (regexps action) or
                     ;; (regexp1 (arbno regexp1) regexps action)
                     (loop
                       (append
                         (list
                           (cdr state)    ; 0 occurrences
                           (cons regexp1 state) ; >= 1 occurrences
                           )
                         (cdr local-states))))))
                ((concat-regexp? (car state))
                 =>
                 (xapply
                   (lambda (sequents)
                     ;; (printf "processing concat: sequents = ~s~%" sequents)
                     (loop
                       (cons
                         (append sequents (cdr state))
                         (cdr local-states)))))))))))))

  (define xapply (lambda (x) (lambda (y) (y x))))

  (define scanner-outer-loop
    (lambda (start-states input-stream)   ; -> (token stream), same as before
      (let
          ((states start-states)            ; list of local-states
           (buffer '())                     ; characters accumulated so far
           (success-buffer '())             ; characters for the last
           ;; candidate token (a sublist
           ;; of buffer)
           (actions '())                    ; actions we might perform on succ-buff
           (stream input-stream)
           )
        (letrec
            ((process-stream
               (lambda ()
                 (scanner-inner-loop states stream
                   (lambda (new-actions new-states char new-stream)
                     (if (not (null? new-actions))
                       ;; ok, the current buffer is a candidate token
                       (begin
                         (set! success-buffer buffer)
                         ;; (printf "success-buffer =~s~%" success-buffer)
                         (set! actions new-actions))
                       ;; otherwise leave success-buffer and actions alone
                       )
                     (if (null? new-states)
                       ;; we are definitely at the end of this token
                       (process-buffer char new-stream)
                       ;; there might be more -- absorb another character and
                       ;; consider what to do next.
                       (begin
                         (set! buffer (cons char buffer))
                         (set! stream  new-stream)
                         (set! states new-states)
                         (process-stream)))))))
             (process-buffer                ; can't absorb any more chars,
               ;; better make do with what we have.
               (lambda (char new-stream)
                 ;; first, push the lookahead character back on the
                 ;; stream.
                 (if (not (null? char))
                   (char-stream-push-back! char new-stream))
                 (set! stream new-stream)
                 (if (null? buffer)
                   ;; any characters in the buffer?  If not, the stream
                   ;; must have been empty, so return the empty stream.
                   empty-stream
                   ;; otherwise, push back any unused characters into the stream
                   (begin
                     (let push-back-loop ()
                       (if (eq? buffer success-buffer)
                         ;; this really is reference equality.
                         #t
                         (begin
                           ;; (eopl:printf "pushing back ~s~%" (car buff))
                           (char-stream-push-back! (car buffer) stream)
                           (set! buffer (cdr buffer))
                           (push-back-loop))))
                     ;; next, look at actions.
                     (cond
                       ((null? actions)
                        ;; no actions possible?  Must be a mistake
                        (error 'scanning
                          "~%No actions found for ~s" (reverse buffer)))
                       ((is-all-skip? actions)
                        ;; If only action is SKIP,
                        ;; then discard buffer and start again.
                        (set! buffer '())
                        (set! success-buffer '())
                        (set! states start-states) ;!
                        (process-stream))
                       ;;    Otherwise, perform action on the success-buffer
                       ;;    and create a token stream.
                       (else
                         (let ((token
                                 (cook-token
                                   success-buffer
                                   actions
                                   (char-stream->location stream))))
                           (make-stream 'tag5
                             token
                             (lambda (fcn eos-fcn)
                               ((scanner-outer-loop start-states stream)
                                fcn eos-fcn)))))))))))
          ;; start by trying to absorb a character
          (process-stream)))))

  ;; Watch out for examples like:
  ;; ("a" | "b" | "c" | "abcdef")  matched against "abc" should produce
  ;; 3 tokens before reaching eos.

  ;; tokens

  ;; (define-record token (symbol? (lambda (v) #t)))

  (define make-token list)
  (define token->class car)
  (define token->data cadr)
  (define token->location caddr)

  ;; streams

  ;; (stream-get!
  ;;  (make-stream tag char stream) fcn eos-fcn) = (fcn char stream)

  ;; this is banged, because doing it on some streams may cause a side-effect.
  (define stream-get!
    (lambda (str fcn eos-fcn)
      (str fcn eos-fcn)))

  (define empty-stream
    (lambda (fcn eos-fcn)
      (eos-fcn)))

  (define make-stream
    (lambda (tag char stream)
      ;;(eopl:printf "make-stream: building stream at ~s with ~s~%" tag char)
      (lambda (fcn eos-fcn)
        ;;(eopl:printf "make-stream: emitting ~s~%" char)
        (fcn char stream))))

  (define list->stream
    (lambda (l)
      (if (null? l) empty-stream
        (make-stream 'list->stream (car l)
          (list->stream (cdr l))))))

  ;; ;; brute force for now.
  ;; (define string->stream
  ;;   (lambda (string) (list->stream (string->list string))))

  ;; ;; this one has state:
  ;; (define stdin-char-stream
  ;;   (lambda (fcn eos-fcn)
  ;;     (let ((char (read-char)))
  ;;       (if (eof-object? char)
  ;;         (eos-fcn)
  ;;         (fcn char stdin-char-stream)))))

  (define stream->list
    (lambda (stream)
      (stream-get! stream
        (lambda (val stream)
          (cons val (stream->list stream)))
        (lambda () '()))))

  (define constant-stream
    (lambda (val)
      (lambda (fn eos)
        (fn val (constant-stream val)))))

  ;; takes a stream and produces another stream that produces the
  ;; sentinel instead of an end-of-stream
  ;; (define stream-add-sentinel
  ;;   (lambda (stream sentinel)
  ;;     (lambda (fn eos)                    ; here's what to do on a get
  ;;       (stream-get! stream
  ;;         (lambda (val str)
  ;;           (fn val (stream-add-sentinel str sentinel)))
  ;;         (lambda ()
  ;;           (fn sentinel (constant-stream sentinel)))))))

  ;; (define stream-add-sentinel-via-thunk
  ;;   (lambda (stream sentinel-fcn)
  ;;     (lambda (fn eos)                    ; here's what to do on a get
  ;;       (stream-get! stream
  ;;         (lambda (val str)
  ;;           (fn val (stream-add-sentinel-via-thunk str sentinel-fcn)))
  ;;         (lambda ()
  ;;           (fn (sentinel-fcn) (constant-stream (sentinel-fcn))))))))

  (define stream-add-sentinel-via-thunk
    (lambda (stream sentinel-fcn)
      (lambda (fn eos)                    ; here's what to do on a get
        (stream-get! stream
          (lambda (val str)
            (fn val (stream-add-sentinel-via-thunk str sentinel-fcn)))
          (lambda ()
            ;; when the stream runs out, try this
            (let ((sentinel (sentinel-fcn)))
              ;;            (eopl:printf "~s~%" sentinel)
              (fn sentinel (constant-stream sentinel))))))))

  ;; no longer used
  ;; (define stream-get
  ;;   (lambda (stream fcn)
  ;;     (stream-get! stream fcn
  ;;       (lambda ()
  ;;         (error 'stream-get
  ;;           "internal error: old streams aren't supposed to produce eos")))))


  ;; ****************************************************************

  ;; imperative character streams Tue Apr 11 12:09:32 2000

  ;; interface:

  ;; string->stream  : string -> charstream
  ;; stdin-char-stream : () -> charstream

  ;; char-stream-get! : !charstream * (char -> ans) * (() -> ans)
  ;;                             -> ans
  ;;                           [modifies charstream]
  ;; char-stream-push-back! : char * !charstream -> ()
  ;; char-stream->location : charstream -> location

  ;; for the moment, a location is a line number

  ;; we have two kinds of streams-- those built by string->stream and
  ;; those built by stdin-char-stream.  We'll use a little OO here.

  ;; represent by a vector

  ;; [get-fn ; push-back-fn ; location ; other stuff]

  (define char-stream-get!
    (lambda (cstr sk th)
      ((vector-ref cstr 0) cstr sk th)))

  (define char-stream-push-back!
    (lambda (ch cstr)
      ((vector-ref cstr 1) ch cstr)))

  (define char-stream->location
    (lambda (cstr)
      (vector-ref cstr 2)))

  (define set-location!
    (lambda (vec val)
      (vector-set! vec 2 val)))

  ;; for a string-built stream, the other stuff consists of an index
  ;; into the string  for the next unread character, and a string.

  (define string->stream
    (lambda (string)
      (let ((len (string-length string)))
        (vector
          ;; the get! function
          (lambda (vec sk th)
            (let ((index (vector-ref vec 3)))
              (if (>= index len)
                (th)
                (begin
                  (vector-set! vec 3 (+ 1 index))
                  (let ((ch (string-ref (vector-ref vec 4) index)))
                    (set-location! vec
                      (increment-location ch
                        (char-stream->location vec)))
                    (sk ch))))))
          ;; the push-back function
          (lambda (ch vec)
            (set-location! vec
              (decrement-location ch
                (char-stream->location vec)))
            (vector-set! vec 3 (- (vector-ref vec 3) 1)))
          ;; the location is initially 1
          1
          ;; the index is initially 0
          0
          string                          ;; the string
          ))))


  ;; (define stdin-char-stream
  ;;   (lambda (fcn eos-fcn)
  ;;     (let ((char (read-char)))
  ;;       (if (eof-object? char)
  ;;         (eos-fcn)
  ;;         (fcn char stdin-char-stream)))))

  ;; for stdin-char-stream, we have
  ;; [get-fn ; push-back-fn ; location ; push-back stack]

  (define stdin-char-stream
    ;; this must be a thunk to reset the
    ;;  line number
    (lambda ()
      (vector
        ;; the get! fcn
        (lambda (vec sk th)
          (let ((read-back-stack (vector-ref vec 3)))
            (if (null? read-back-stack)
              (let ((char (read-char)))
                (if (eof-object? char)
                  (th)
                  (begin
                    (set-location! vec
                      (increment-location char
                        (char-stream->location vec)))
                    (sk char))))
              (let ((char (car read-back-stack)))
                (set-location! vec
                  (increment-location char
                    (char-stream->location vec)))
                (vector-set! vec 3 (cdr read-back-stack))
                (sk char)))))
        ;; the push back
        (lambda (ch vec)
          (set-location! vec
            (decrement-location ch
              (char-stream->location vec)))
          (vector-set! vec 3 (cons ch (vector-ref vec 3))))
        0                                 ; location is initially 0 to
        ;;  swallow the initial newline
        '()                               ; push-back is initially empty
        )))

  (define char-stream->list
    (lambda (cstr)
      (let loop ()
        (char-stream-get! cstr
          (lambda (ch) (cons ch (loop)))
          (lambda () '())))))

  (define char-stream->list2
    (lambda (cstr)
      (let loop ()
        (char-stream-get! cstr
          (lambda (ch)
            (cons
              (cons ch (char-stream->location cstr))
              (loop)))
          (lambda () '())))))


  (define increment-location
    (lambda (ch n)
      (if (eqv? ch #\newline) (+ 1 n) n)))

  (define decrement-location
    (lambda (ch n)
      (if (eqv? ch #\newline) (- n 1) n)))

  ;; see tests.s for examples.

  ;; ****************************************************************

  ;; parse.s

  ;; parse.s -- run the generated parser

  ;; parsing table is of following form:

  ;; table ::= ((non-terminal alternative ...) ...)
  ;; alternative ::= (list-of-items action ...)
  ;; action ::= (TERM symbol) | (NON-TERM symbol) | (GOTO symbol)
  ;;            | (EMIT-LIST) | (REDUCE symbol)

  ;; The token register can either contain an token or '() -- the latter
  ;; signifying an empty buffer, to be filled when necessary.

  ;; (define-record parser-result (tree token stream))

  ;; k = (lambda (tree token stream) ...)
  ;; token may be a token or nil.
  (define find-production
    (lambda (non-terminal parser buf token stream k)
      (if (null? token)
        (stream-get! stream
          (lambda (next-token next-stream)
            ;; '(eopl:printf "find-production: filling token buffer with ~s~%" token)
            (set! token next-token)
            (set! stream next-stream))
          (lambda ()
            (error 'find-production
              "~%Internal error: shouldn't run off end of stream"))))
      ;;    '(eopl:printf "find-production: nonterminal = ~s token = ~s~%"
      ;;       non-terminal token)
      (let loop
          ((alternatives (cdr (assq non-terminal parser))))
        (cond
          ((null? alternatives)
           (error 'parsing
             "at line ~s~%Nonterminal <~s> can't begin with ~s ~s"
             (token->location token)
             non-terminal
             (token->class token)
             (token->data token)))
          ((member (token->class token) (car (car alternatives)))
           ;;         '(eopl:printf "find-production: using ~s~%~%"
           ;;            (cdr (car alternatives)))
           (apply-actions non-terminal (cdr (car alternatives))
             parser buf token stream k))
          ((and (string? (token->data token))
             (member (token->data token) (car (car alternatives))))
           (apply-actions non-terminal (cdr (car alternatives))
             parser buf token stream k))
          (else (loop (cdr alternatives)))))))

  (define apply-actions
    (lambda (lhs action-list parser buf token stream k)
      (let loop ((actions action-list)
                 (buf buf)
                 (token token)
                 (stream stream))
        (let ((fill-token!                ; fill-token! is a macro in mzscheme
                (lambda ()
                  (if (null? token)
                    (stream-get! stream
                      (lambda (next-token next-stream)
                        (set! token next-token)
                        (set! stream next-stream))
                      (lambda ()
                        (error 'apply-actions
                          "~%Internal error: shouldn't run off end of stream"
                          ))))))
              (report-error
                (lambda (target)
                  (error 'parsing
                    "at line ~s~%Looking for ~s, found ~s ~s in production~%~s"
                    (token->location token)
                    target
                    (token->class token)
                    (token->data token)
                    action-list))))
          (let ((action      (car actions))
                (next-action (cdr actions)))
            ;; (eopl:printf "actions = ~s~%token = ~s buf = ~s~%~%" actions token buf)
            (case (car action)
              ((term)
               (fill-token!)
               (let ((class (cadr action)))
                 (if (eq? (token->class token) class)
                   ;; ok, this matches, proceed, but don't get next token --
                   ;; after all, this might be the last one.
                   (loop next-action
                     (cons (token->data token) buf)
                     '()                  ; token register is now empty
                     stream)
                   ;; nope, fail.
                   (report-error class))))
              ((string)
               (let ((the-string (cadr action)))
                 (fill-token!)
                 (if (and
                       (not (eq? (token->class token) 'end-marker))
                       (string? (token->data token))
                       (string=? (token->data token) the-string))
                   (loop next-action buf '() stream)
                   ;; nope, fail.
                   (report-error the-string))))
              ((non-term)
               (let ((non-terminal (cadr action)))
                 (find-production non-terminal parser
                   '() token stream
                   (lambda (tree token stream)
                     (loop next-action (cons tree buf) token stream)))))
              ((arbno)
               (let ((non-terminal (cadr action))
                     (count       (caddr action)))
                 (find-production non-terminal parser
                   '() token stream
                   (lambda (trees token stream)
                     (loop next-action
                       (unzip-buffer trees count buf)
                       token stream)))))

              ((goto)
               (let ((non-terminal (cadr action)))
                 (find-production non-terminal parser buf token
                   stream k)))
              ((emit-list)
               (k buf token stream))
              ((reduce)
               (let ((opcode (cadr action)))
                 (k
                   ;;               (apply (make-record-from-name opcode)
                   ;;                      (reverse buf))
                   (apply-reduction lhs opcode (reverse buf))
                   token
                   stream)))
              (else
                (error 'apply-actions
                  "~%Internal error: unknown instruction ~s"
                  action))))))))

  (define unzip-buffer
    (lambda (trees n buf)
      (let ((ans (let consloop ((n n))
                   (if (zero? n) buf (cons '() (consloop (- n 1)))))))
        (let loop ((trees trees)
                   (ptr ans)
                   (ctr n))
          ;;     (eopl:printf "ctr = ~s trees = ~s~%" ctr trees)
          (cond
            ((null? trees) ans)
            ((zero? ctr) (loop trees ans n))
            (else
              (set-car! ptr (cons (car trees) (car ptr)))
              (loop (cdr trees) (cdr ptr) (- ctr 1))))))))

  ;; next are several alternative definitions for apply-reduction

  ;; just a stub.
  (define apply-reduction-stub
    (lambda (lhs prod-name args)
      (error 'sllgen-configuration "need to set apply-reduction")))

  ;; just construct a list
  (define generic-node-constructor
    (lambda (lhs production-name args)
      (cons production-name args)))

  ;; this is the default, since it lets sllgen stand alone.
  (define apply-reduction generic-node-constructor)

  ;; here are alternative bindings:

  ;; Alas, define-datatype:constructor-back-door no longer exists.  This
  ;; was supposed to be a way to get at the constructor from its name,
  ;; so that we could write sllgen without knowing the representation of
  ;; trees used by define-datatype.  But (alas!) it no longer exists.
  ;; Maybe it will be put back in some future version of d-d.
  ;; --mw Mon Apr 24 15:07:20 2000
  ;;
  ;; look up the constructor in the define-datatype table
  ;; (define apply-datatype-backdoor
  ;;   (lambda (lhs variant-name args)
  ;;     (apply (define-datatype:constructor-back-door lhs variant-name)
  ;;       args)))

  (define eval-reduction
    (lambda (lhs opcode args)
      (apply (eval opcode (interaction-environment))
        args)))

  ;; and procedures to install them:

  (define use-generic-node-constructor
    (lambda ()
      (set! apply-reduction generic-node-constructor)))

  ;; (define use-datatype-backdoor
  ;;   (lambda ()
  ;;     (set! apply-reduction apply-datatype-backdoor)))

  (define use-eval-reduction
    (lambda ()
      (set! apply-reduction eval-reduction)))


  ;; temporary
  ;; (define make-record-from-name
  ;;   (lambda (sym)
  ;;     (lambda args
  ;;       (cons sym args))))


  ;; ****************************************************************

  ;; go through a grammar and generate the appropriate define-datatypes.

  ;; define-datatype syntax is:
  ;;(define-datatype Type-name Predicate-name
  ;;  (Variant-name (Field-name Predicate-exp) ...) ...)


  (define build-define-datatype-definitions
    (lambda (scanner-spec grammar)
      (let* ((scanner-datatypes-alist
               (make-scanner-datatypes-alist scanner-spec))
             (non-terminals
               (uniq (map production->lhs
                              (grammar->productions grammar))))
             (datatype-table (make-initial-table non-terminals)))
        ;; for each production, add an entry to the table.  Each entry is
        ;; (prod-name . datatype-list)
        (for-each
          (lambda (production)
            (add-value-to-table! datatype-table
              (production->lhs production)
              (cons
                (production->action production)
                (make-rhs-datatype-list
                  (production->rhs production)
                  non-terminals
                  scanner-datatypes-alist))))
          (grammar->productions grammar))
        ;; now generate the list of datatypes for each table entry
        (map
          (lambda (non-terminal)
            (make-datatype-definition non-terminal
              (table-lookup datatype-table non-terminal)))
          non-terminals))))


  (define make-scanner-datatypes-alist
    (lambda (init-states)
      (let
          ((opcode-type-alist
             '((make-symbol . symbol?)
               (symbol . symbol?)
               (make-string . string?)
               (string . string?)
               (make-number . number?)
               (number . number?))))
        (let loop ((init-states init-states))
          (if (null? init-states) '()
            (let ((init-state  (car init-states))
                  (init-states (cdr init-states)))
              (let ((class (car init-state))
                    (type-pair (assq (last init-state) opcode-type-alist)))
                (if (not type-pair)
                  (loop init-states)
                  (cons (cons class (cdr type-pair))
                    (loop init-states))))))))))

  (define last
    (lambda (x)
      (and
        (or (pair? x)
          (error 'last "~%Can't take last of non-pair ~s" x))
        (if (null? (cdr x))
          (car x)
          (last (cdr x))))))

  ;; rhs ::= (rhs-item ...)
  ;;
  ;; rhs-item ::= string | symbol | (ARBNO . rhs) | (SEPARATED-LIST rhs
  ;;                                                         token)

  (define make-rhs-datatype-list
    (lambda (rhs non-terminals scanner-datatypes-alist)
      (let ((report-error
              (lambda (rhs-item msg)
                (error 'defining-datatypes
                  "~%Illegal item ~s (~a) in rhs ~s"
                  rhs-item msg rhs))))
        (let loop ((rhs rhs))
          (if (null? rhs) '()
            (let ((rhs-item (car rhs))
                  (rest (cdr rhs)))
              (cond
                ((and (symbol? rhs-item) (member rhs-item non-terminals))
                 ;; this is a non-terminal
                 (cons (non-terminal->tester-name rhs-item)
                   (loop rest)))
                ((symbol? rhs-item)
                 ;; this must be a terminal symbol
                 (let ((type (assq rhs-item scanner-datatypes-alist)))
                   (if type
                     (cons (cdr type) (loop rest))
                     (report-error rhs-item "unknown symbol"))))
                ((arbno? rhs-item)
                 (append
                   (map
                     (lambda (x) (list 'list-of x))
                     (loop (arbno->rhs rhs-item)))
                   (loop rest)))
                ((separated-list? rhs-item)
                 (append
                   (map
                     (lambda (x) (list 'list-of x))
                     (loop (separated-list->rhs rhs-item)))
                   (loop rest)))
                ((string? rhs-item)
                 (loop rest))
                (else (report-error rhs-item "unrecognized item")))))))))

  (define non-terminal->tester-name
    (lambda (x)
      (string->symbol (string-append (symbol->string x) "?"))))

  ;; variants are now the same as constructors
  (define variant->constructor-name
    (lambda (x) x))


  (define make-datatype-definition
    (lambda (non-terminal entries)
      (let ((tester-name
              (non-terminal->tester-name non-terminal))
            (entries
              ;; reverse gets the entries in the same order as the productions
              (map make-variant (reverse entries))))
        `(define-datatype ,non-terminal ,tester-name . ,entries))))

  (define make-variant
    (lambda (entry)
      `(,(car entry)
        . ,(map
             (lambda (pred)
               (list (gensym (car entry)) pred))
             (cdr entry)))))

  ;; ****************************************************************
  ;; error handling
  ;; ****************************************************************

  (define error
    (lambda (who format . data)
      ;; print the message
      (eopl:printf "Error reported by sllgen during ~s:~%" who)
      (apply printf (cons format data))
      (newline)
      (error "( sllgen )" who data )
      ))

  ;; ****************************************************************
  ;; ****************************************************************

  ;; sample input  (test-sllgen2.scm)

  ;; (define lex2
  ;;    '((whitespace (whitespace) skip)
  ;;      (comment ("%" (arbno (not #\newline))) skip)
  ;;      (identifier (letter (arbno (or letter digit))) make-symbol)
  ;;      (number (digit (arbno digit)) make-number)))

  ;; (define gram2
  ;;   '((expression
  ;;       (number)
  ;;       lit-exp)
  ;;     (expression
  ;;       (identifier)
  ;;       var-exp)
  ;;     (expression
  ;;       ("let" (separated-list declaration ";") "in" expression)
  ;;       let-exp)
  ;;     (expression
  ;;       ("(" expression (arbno expression) ")")
  ;;       app-exp)
  ;;     (declaration
  ;;       (identifier "=" expression)
  ;;       decl)))

  ;; (define test2 '*)
  ;; (define scan2 '*)

  ;; (define gen2
  ;;   (lambda ()
  ;;     ; if define-datatypes is loaded:
  ;;    ; (generate-define-datatypes lex2 gram2)
  ;;     (set! test2
  ;;       (let ((parser (make-string-parser lex2 gram2)))
  ;;         (lambda (string)
  ;;           (pretty-print (parser string)))))
  ;;     (set! scan2
  ;;       (make-string-scanner lex2 gram2))))

  ;; (define rep
  ;;   (lambda ()
  ;;     (make-rep-loop "--> " (lambda (x) (pretty-print x) #t)
  ;;       (make-stream-parser lex2 gram2))))

  ;; (define rsp
  ;;   (lambda ()
  ;;     (make-rep-loop "--> " (lambda (x) x)
  ;;       (make-stream-scanner lex2 gram2))))


  ;; Welcome to MzScheme version 53, Copyright (c) 1995-98 PLT (Matthew Flatt)
  ;; > (load "sllgen.scm")
  ;; sllgen.scm 2.3.4 Time-stamp: <1998-12-31 15:35:02 Mitch>
  ;; > (load "test-sllgen2.scm")
  ;; > (gen2)
  ;; > (test2 "let x = 3; y=4 in (f x y)")
  ;; (let-exp
  ;;   ((decl x (lit-exp 3)) (decl y (lit-exp 4)))
  ;;   (app-exp (var-exp f) ((var-exp x) (var-exp y))))
  ;; > (rep)
  ;; --> x
  ;; (var-exp x)
  ;; #t
  ;; --> (f y)
  ;; (app-exp (var-exp f) ((var-exp y)))
  ;; #t
  ;; --> user break
  ;; > (list-define-datatypes lex2 gram2)
  ;; (define-datatype
  ;;   expression
  ;;   expression?
  ;;   expression-case
  ;;   (lit-exp make-lit-exp (lit-exp39 number?))
  ;;   (var-exp make-var-exp (var-exp40 symbol?))
  ;;   (let-exp
  ;;     make-let-exp
  ;;     (let-exp41 (list-of declaration?))
  ;;     (let-exp42 expression?))
  ;;   (app-exp
  ;;     make-app-exp
  ;;     (app-exp43 expression?)
  ;;     (app-exp44 (list-of expression?))))
  ;; (define-datatype
  ;;   declaration
  ;;   declaration?
  ;;   declaration-case
  ;;   (decl make-decl (decl45 symbol?) (decl46 expression?)))
  ;; >

  ;; =======================
  
  ;; sample input  (test-sllgen2.scm)

  ;; (define lex2
  ;;   '((whitespace (whitespace) skip)
  ;;     (comment ("%" (arbno (not #\newline))) skip)
  ;;     (identifier (letter (arbno (or letter digit))) make-symbol)
  ;;     (number (digit (arbno digit)) make-number)))

  ;; (define gram2
  ;;   '((expression
  ;;       (number)
  ;;       lit-exp)
  ;;     (expression
  ;;       (identifier)
  ;;       var-exp)
  ;;     (expression
  ;;       ("let" (arbno declaration) "in" expression)
  ;;       let-exp)
  ;;     (expression
  ;;       ("mvlet"
  ;;        (separated-list  (separated-list identifier ",")
  ;;          "=" expression ";") "in" expression)
  ;;       lets-exp)
  ;;     (expression
  ;;       ("(" expression (arbno expression) ")")
  ;;       app-exp)
  ;;     (declaration
  ;;       (identifier "=" expression)
  ;;       decl)))

  ;; ;; (make-define-datatypes lex2 gram2)

  ;; (define show2
  ;;   (lambda () (list-define-datatypes lex2 gram2)))

  ;; (define parse2 '*)

  ;; (define gen2
  ;;   (lambda () (set! parse2 (make-string-parser lex2 gram2))))

  ;; (define gram3
  ;;   '((expression
  ;;       (number)
  ;;       lit-exp)
  ;;     (expression
  ;;       (identifier)
  ;;       var-exp)
  ;;     (expression
  ;;       ("let" (arbno identifier "=" expression) "in" expression)
  ;;       let-exp)
  ;;     (expression
  ;;       ("mvlet" (arbno (arbno identifier) "=" expression) "in" expression)
  ;;       mvlet-exp)
  ;;     (expression
  ;;       ("(" expression (arbno expression) ")")
  ;;       app-exp)
  ;;     (declaration
  ;;       (identifier "=" (arbno expression))
  ;;       decl)))

  ;; (define show3
  ;;   (lambda () (list-define-datatypes lex2 gram3)))

  ;; (define list3
  ;;   (lambda () (list-define-datatypes lex2 gram3)))

  ;; (define parse3 '*)

  ;; (define gen3
  ;;   (lambda () (set! parse3 (make-string-parser lex2 gram3))))


  ;; (define gram4
  ;;   '((expression
  ;;       ("let" (separated-list (separated-list identifier "," ) "=" expression ";" )
  ;;        "in" expression)
  ;;       let-exp)
  ;;     (expression
  ;;       (number)
  ;;       lit-exp)))

  ;; (define parse4 '*)

  ;; (define gen4
  ;;   (lambda () (set! parse4 (make-string-parser lex2 gram4))))

  ;; (define show4
  ;;   (lambda () (list-define-datatypes lex2 gram4)))
  )
