(library (jpeg)
  (export jpeg-lib)
  (import
    (interop) (chezscheme))

  (define jpeg-lib
    (load-shared-object    
      (cond
        [(is-linux?)   "turbojpeg.so"]
        ;; [(is-osx?)    "lib.dylib"]
        [(is-windows?) "dll/libjpeg-9.dll"]
        [else (error "jpeg" "unhandled-os")]))))
