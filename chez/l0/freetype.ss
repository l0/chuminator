(library (freetype)
  ;; /usr/include/freetype2/freetype/freetype.h
  ;; /usr/include/freetype2/freetype/ftimage.h
  ;; /usr/include/freetype2/freetype/fttypes.h
  ;; /usr/include/freetype2/freetype/
  (export
    freetype-lib
    FT_Bitmap FT_Generic_Finalizer-fn
    FT_Generic_Finalizer
    FT_Generic FT_Pos FT_Glyph_Metrics FT_Vector
    FT_Outline
    FT_BBox
    FT_ListNode FT_ListNodeRec
    FT_List FT_ListRec
    FT_UShort FT_Short FT_String
    FT_Error FT_Pointer FT_Fixed FT_Long FT_ULong
    FT_UInt FT_Int
    FT_Int32 FT_Library FT_Face_Internal
    FT_SubGlyph
    FT_Stream
    FT_Slot_Internal FT_Driver FT_Memory FT_Size
    FT_CharMap
    FT_Glyph_Format FT_Bitmap_Size
    FT_GlyphSlot FT_GlyphSlotRec
    FT_FaceRec
    FT_FaceRec*
    FT_Init_FreeType
    FT_New_Face FT_Set_Pixel_Sizes FT_Load_Char
    FT_F26Dot6
    FT_Set_Char_Size
    FT_LOAD_RENDER
    FT_LOAD_DEFAULT)

  (import (chezscheme) (interop) (z))

  (define FT_LOAD_DEFAULT #x0)
  (define FT_LOAD_RENDER  #x4)
  
  ;; '(FT_LOAD_NO_SCALE                     ( 1L << 0 )
  ;;    FT_LOAD_NO_HINTING                   ( 1L << 1 )
  ;;    FT_LOAD_RENDER                       ( 1L << 2 ) ;; 4
  ;;    FT_LOAD_NO_BITMAP                    ( 1L << 3 )
  ;;    FT_LOAD_VERTICAL_LAYOUT              ( 1L << 4 )
  ;;    FT_LOAD_FORCE_AUTOHINT               ( 1L << 5 )
  ;;    FT_LOAD_CROP_BITMAP                  ( 1L << 6 )
  ;;    FT_LOAD_PEDANTIC                     ( 1L << 7 )
  ;;    FT_LOAD_IGNORE_GLOBAL_ADVANCE_WIDTH  ( 1L << 9 )
  ;;    FT_LOAD_NO_RECURSE                   ( 1L << 10 )
  ;;    FT_LOAD_IGNORE_TRANSFORM             ( 1L << 11 )
  ;;    FT_LOAD_MONOCHROME                   ( 1L << 12 )
  ;;    FT_LOAD_LINEAR_DESIGN                ( 1L << 13 )
  ;;    FT_LOAD_NO_AUTOHINT                  ( 1L << 15 )
  ;;    /* Bits 16-19 are used by `FT_LOAD_TARGET_` */
  ;;    FT_LOAD_COLOR                        ( 1L << 20 )
  ;;    FT_LOAD_COMPUTE_METRICS              ( 1L << 21 )
  ;;    FT_LOAD_BITMAP_METRICS_ONLY          ( 1L << 22 ))

  (define freetype-lib
    (begin
      z-lib
      (if (is-osx?)
        (load-shared-object
          "/usr/local/lib/libfreetype.dylib")
        (if (is-linux?)
          (load-shared-object
            (string-append
              ;; "/usr/lib/x86_64-linux-gnu/"
              "/usr/lib/libfreetype.so"))
          (load-shared-object
            "dll/libfreetype-6.dll")))))

  ;; fti
  (define-ftype FT_Bitmap
    (struct
      [rows         unsigned-int] 
      [width        unsigned-int]
      [pitch        int]
      [buffer       (* unsigned-char)]
      [num_grays    unsigned-short]
      [pixel_mode   unsigned-char]
      [palette_mode unsigned-char]
      [palette      void*]))

  ;; ftt
  (define-ftype FT_Generic_Finalizer-fn
    (function 
      (void* ;; object
        )
      void))
  (define-ftype FT_Generic_Finalizer
    (* FT_Generic_Finalizer-fn))

  ;; ft
  (define-ftype FT_Generic
    (struct
      [data      void*]
      [finalizer FT_Generic_Finalizer]))

  ;; fti
  (define-ftype FT_Pos long)

  ;; ft
  (define-ftype FT_Glyph_Metrics
    (struct
      [width        FT_Pos]
      [height       FT_Pos]
      [horiBearingX FT_Pos]
      [horiBearingY FT_Pos]
      [horiAdvance  FT_Pos]
      [vertBearingX FT_Pos]
      [vertBearingY FT_Pos]
      [vertAdvance  FT_Pos]))

  ;; fti 
  (define-ftype FT_Vector
    (struct
      [x FT_Pos]
      [y FT_Pos]))

  ;; fti 
  (define-ftype FT_Outline
    (struct
      [n_contours short]
      [n_points   short]
      [points     (* FT_Vector)] 
      [tags       (* char)]
      [contours   (* short)] 
      [flags      int]))

  ;; ftimage 116
  (define-ftype FT_BBox
    (struct
      [xMin FT_Pos]
      [yMin FT_Pos]
      [xMax FT_Pos]
      [yMax FT_Pos]))

  ;; ftt
  (define-ftype
    [FT_ListNode (* FT_ListNodeRec)]
    [FT_ListNodeRec
      (struct
        [prev FT_ListNode]
        [next FT_ListNode]
        [data void*])])
  
  ;; ftt
  (define-ftype
    [FT_List (* FT_ListRec)]
    [FT_ListRec
      (struct 
        [head FT_ListNode] ;; FT_ListNode ;; (ftypes 511)
        [tail FT_ListNode] ;; FT_ListNode
        )])

  (define-ftype FT_UShort unsigned-short)
  (define-ftype FT_Short short)
  (define-ftype FT_String char)
  (define-ftype FT_Error int)
  (define-ftype FT_Pointer void*)
  (define-ftype FT_Fixed long)
  (define-ftype FT_Long long)
  (define-ftype FT_ULong unsigned-long)
  (define-ftype FT_UInt unsigned-int)
  (define-ftype FT_Int int)
  (define-ftype FT_Int32 integer-32)
  ;;
  (define-ftype FT_Library void*)
  (define-ftype FT_Face_Internal void*)
  (define-ftype FT_SubGlyph void*)
  (define-ftype FT_Stream void*)
  (define-ftype FT_Slot_Internal void*)
  (define-ftype FT_Driver void*)
  (define-ftype FT_Memory void*)
  (define-ftype FT_Size void*)
  (define-ftype FT_CharMap void*)
  (define-ftype FT_Glyph_Format enum)
  ;;
  (define-ftype FT_F26Dot6 long) ; signed-long

  ;; ft
  (define-ftype FT_Bitmap_Size
    (struct 
      [height FT_Short]
      [width FT_Short]
      [size FT_Pos]
      [x_ppem    FT_Pos]
      [y_ppem    FT_Pos]))

  (define-ftype
    ;; [FT_Face                 (* FT_FaceRec)]
    [FT_GlyphSlot            (* FT_GlyphSlotRec)] ;; ft
    [FT_FaceRec ;; (freetype.h 919)
      (struct
        [num_faces           FT_Long]
        [face_index          FT_Long]
        [face_flags          FT_Long]
        [style_flags         FT_Long]
        [num_glyphs          FT_Long]
        [family_name         (* FT_String)] 
        [style_name          (* FT_String)]
        [num_fixed_sizes     FT_Int] 
        [available_sizes     (* FT_Bitmap_Size)]
        [num_charmaps        FT_Int]
        [charmaps            (* FT_CharMap)]
        [generic             FT_Generic]
        [bbox                FT_BBox]
        [units_per_EM        FT_UShort]
        [ascender            FT_Short]
        [descender           FT_Short]
        [height              FT_Short]
        [max_advance_width   FT_Short]
        [max_advance_height  FT_Short]
        [underline_position  FT_Short]
        [underline_thickness FT_Short]
        [glyph               FT_GlyphSlot]
        [size                FT_Size]
        [charmap             FT_CharMap]
        [driver              FT_Driver]
        [memory              FT_Memory]
        [stream              FT_Stream]
        [sizes_list          FT_ListRec]
        [autohint            FT_Generic]
        [extensions          void*]
        [internal            FT_Face_Internal])]    
    [FT_GlyphSlotRec    ;; ft
      (struct
        [library           FT_Library] 
        [face              (* FT_FaceRec)] 
        [next              FT_GlyphSlot]
        [reserved          FT_UInt] 
        [generic           FT_Generic]
        [metrics           FT_Glyph_Metrics]
        [linearHoriAdvance FT_Fixed]
        [linearVertAdvance FT_Fixed]
        [advance           FT_Vector]
        [format            FT_Glyph_Format]
        [bitmap            FT_Bitmap]
        [bitmap_left       FT_Int] 
        [bitmap_top        FT_Int] 
        [outline           FT_Outline]
        [num_subglyphs     FT_UInt] 
        [subglyphs         FT_SubGlyph]
        [control_data      void*]
        [control_len       long]
        [lsb_delta         FT_Pos]
        [rsb_delta         FT_Pos]
        [other             void*]
        [internal          FT_Slot_Internal] 
        )])

  (define-ftype FT_FaceRec* (* FT_FaceRec))
    
  (define-ftype-fn1 FT_Init_FreeType
    (function 
      ((* FT_Library))
      FT_Error))
  
  (define-ftype-fn1 FT_New_Face
    (function
      (FT_Library        ;; library
        (* char)         ;; filepathname
        FT_Long          ;; face_index
        (* FT_FaceRec*)) ;; aface
      FT_Error))
  
  ;; FT_Set_Pixel_Sizes( FT_Face  face,
  ;;                     FT_UInt  pixel_width,
  ;;                     FT_UInt  pixel_height );

  (define-ftype-fn1 FT_Set_Pixel_Sizes
    (function
      ((* FT_FaceRec)
       FT_UInt
       FT_UInt)
      FT_Error))

  (define-ftype-fn1 FT_Load_Char
    (function 
      ((* FT_FaceRec) ;; face
       FT_ULong       ;; char_code
       FT_Int32)      ;; load_flags
      FT_Error))

  ;; FT_Set_Char_Size( FT_Face face, FT_F26Dot6
  ;;               char_width, FT_F26Dot6 char_height,
  ;;               FT_UInt horz_resolution, FT_UInt
  ;;               vert_resolution );
  (define-ftype-fn1 FT_Set_Char_Size
    (function
      ((* FT_FaceRec)  ; face      
        FT_F26Dot6     ; char_width       
        FT_F26Dot6     ; char_height
        FT_UInt        ; horz_resolution  
        FT_UInt)       ; vert_resolution
      FT_Error))
  )
