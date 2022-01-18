(library (khronos)
  ;; /usr/include/KHR/khrplatform.h
  (export
    khronos_int32_t khronos_uint32_t khronos_int64_t
    khronos_uint64_t KHRONOS_SUPPORT_INT64
    KHRONOS_SUPPORT_FLOAT khronos_int8_t
    khronos_uint8_t khronos_int16_t khronos_uint16_t
    khronos_intptr_t khronos_uintptr_t khronos_ssize_t
    khronos_usize_t khronos_float_t
    khronos_utime_nanoseconds_t
    khronos_stime_nanoseconds_t KHRONOS_MAX_ENUM
    khronos_boolean_enum_t KHRONOS_FALSE KHRONOS_TRUE
    KHRONOS_BOOLEAN_ENUM_FORCE_SIZE)
  (import
    (chezscheme) (interop) (stdint))
  ;; (for-each prn (map cadr '(
  (define-ftype khronos_int32_t int32_t)
  (define-ftype khronos_uint32_t uint32_t)
  (define-ftype khronos_int64_t int64_t)
  (define-ftype khronos_uint64_t uint64_t)
  (define KHRONOS_SUPPORT_INT64   1)
  (define KHRONOS_SUPPORT_FLOAT   1)

  (define-ftype khronos_int8_t  int8_t) ;; signed-char
  (define-ftype khronos_uint8_t unsigned-char)
  
  (define-ftype khronos_int16_t short)
  (define-ftype khronos_uint16_t unsigned-short)
  ;; win64
  ;; typedef signed   long long int khronos_intptr_t;
  ;; typedef unsigned long long int khronos_uintptr_t;
  ;; typedef signed   long long int khronos_ssize_t;
  ;; typedef unsigned long long int khronos_usize_t;
  ;; other
  (define-ftype khronos_intptr_t long)
  (define-ftype khronos_uintptr_t unsigned-long)
  (define-ftype khronos_ssize_t long)
  (define-ftype khronos_usize_t unsigned-long)
  ;;
  (define-ftype khronos_float_t float)
  ;;
  (define-ftype khronos_utime_nanoseconds_t
    khronos_uint64_t)
  (define-ftype khronos_stime_nanoseconds_t
    khronos_int64_t)
  ;;
  (define KHRONOS_MAX_ENUM #x7FFFFFFF)
  ;;
  (define-ftype khronos_boolean_enum_t enum)
  (define KHRONOS_FALSE 0)
  (define KHRONOS_TRUE 1)
  (define KHRONOS_BOOLEAN_ENUM_FORCE_SIZE
    KHRONOS_MAX_ENUM)
  )
