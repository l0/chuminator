(library (z)
  (export z-lib)
  (import
    (interop) (chezscheme))

  (define z-lib
    (load-shared-object    
      (cond
        [(is-linux?)   "libz.so"]
        [(is-osx?)     "libz.dylib"]
        [(is-windows?) "dll/zlib1.dll"]
        [else (error "z" "unhandled-os")]))))
