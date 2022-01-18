(library (stdint)
  (export
    int8_t uint8_t
    int16_t uint16_t
    int32_t uint32_t
    int64_t uint64_t)
  (import
    (chezscheme))
  (define-ftype int8_t  integer-8)
  (define-ftype uint8_t unsigned-8)
  (define-ftype int16_t  integer-16)
  (define-ftype uint16_t unsigned-16)
  (define-ftype int32_t  integer-32)
  (define-ftype uint32_t unsigned-32)
  (define-ftype int64_t  integer-64)
  (define-ftype uint64_t unsigned-64)
  )
