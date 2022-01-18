(library (gles2)
  (export
    define-ftype-fn1-gl
    GL_ES_VERSION_2_0 GLbyte GLclampf GLfixed
    GLshort GLushort GLsync GLint64 GLuint64 GLenum
    GLuint GLchar GLchar* GLfloat GLsizeiptr GLintptr
    GLbitfield GLint GLboolean GLsizei GLubyte
    GL_DEPTH_BUFFER_BIT GL_STENCIL_BUFFER_BIT
    GL_COLOR_BUFFER_BIT GL_FALSE GL_TRUE
    GL_POINTS GL_LINES GL_LINE_LOOP
    GL_LINE_STRIP GL_TRIANGLES GL_TRIANGLE_STRIP
    GL_TRIANGLE_FAN GL_ZERO GL_ONE GL_SRC_COLOR
    GL_ONE_MINUS_SRC_COLOR GL_SRC_ALPHA
    GL_ONE_MINUS_SRC_ALPHA GL_DST_ALPHA
    GL_ONE_MINUS_DST_ALPHA GL_DST_COLOR
    GL_ONE_MINUS_DST_COLOR GL_SRC_ALPHA_SATURATE
    GL_FUNC_ADD GL_BLEND_EQUATION
    GL_BLEND_EQUATION_RGB
    GL_BLEND_EQUATION_ALPHA GL_FUNC_SUBTRACT
    GL_FUNC_REVERSE_SUBTRACT GL_BLEND_DST_RGB
    GL_BLEND_SRC_RGB GL_BLEND_DST_ALPHA
    GL_BLEND_SRC_ALPHA GL_CONSTANT_COLOR
    GL_ONE_MINUS_CONSTANT_COLOR
    GL_CONSTANT_ALPHA
    GL_ONE_MINUS_CONSTANT_ALPHA GL_BLEND_COLOR
    GL_ARRAY_BUFFER GL_ELEMENT_ARRAY_BUFFER
    GL_ARRAY_BUFFER_BINDING
    GL_ELEMENT_ARRAY_BUFFER_BINDING
    GL_STREAM_DRAW GL_STATIC_DRAW
    GL_DYNAMIC_DRAW GL_BUFFER_SIZE
    GL_BUFFER_USAGE GL_CURRENT_VERTEX_ATTRIB
    GL_FRONT GL_BACK GL_FRONT_AND_BACK
    GL_TEXTURE_2D GL_CULL_FACE GL_BLEND
    GL_DITHER GL_STENCIL_TEST GL_DEPTH_TEST
    GL_SCISSOR_TEST GL_POLYGON_OFFSET_FILL
    GL_SAMPLE_ALPHA_TO_COVERAGE
    GL_SAMPLE_COVERAGE GL_NO_ERROR
    GL_INVALID_ENUM GL_INVALID_VALUE
    GL_INVALID_OPERATION GL_OUT_OF_MEMORY GL_CW
    GL_CCW GL_LINE_WIDTH
    GL_ALIASED_POINT_SIZE_RANGE
    GL_ALIASED_LINE_WIDTH_RANGE
    GL_CULL_FACE_MODE GL_FRONT_FACE
    GL_DEPTH_RANGE GL_DEPTH_WRITEMASK
    GL_DEPTH_CLEAR_VALUE GL_DEPTH_FUNC
    GL_STENCIL_CLEAR_VALUE GL_STENCIL_FUNC
    GL_STENCIL_FAIL GL_STENCIL_PASS_DEPTH_FAIL
    GL_STENCIL_PASS_DEPTH_PASS GL_STENCIL_REF
    GL_STENCIL_VALUE_MASK GL_STENCIL_WRITEMASK
    GL_STENCIL_BACK_FUNC GL_STENCIL_BACK_FAIL
    GL_STENCIL_BACK_PASS_DEPTH_FAIL
    GL_STENCIL_BACK_PASS_DEPTH_PASS
    GL_STENCIL_BACK_REF
    GL_STENCIL_BACK_VALUE_MASK
    GL_STENCIL_BACK_WRITEMASK GL_VIEWPORT
    GL_SCISSOR_BOX GL_COLOR_CLEAR_VALUE
    GL_COLOR_WRITEMASK GL_UNPACK_ALIGNMENT
    GL_PACK_ALIGNMENT GL_MAX_TEXTURE_SIZE
    GL_MAX_VIEWPORT_DIMS GL_SUBPIXEL_BITS
    GL_RED_BITS GL_GREEN_BITS GL_BLUE_BITS
    GL_ALPHA_BITS GL_DEPTH_BITS GL_STENCIL_BITS
    GL_POLYGON_OFFSET_UNITS
    GL_POLYGON_OFFSET_FACTOR
    GL_TEXTURE_BINDING_2D GL_SAMPLE_BUFFERS
    GL_SAMPLES GL_SAMPLE_COVERAGE_VALUE
    GL_SAMPLE_COVERAGE_INVERT
    GL_NUM_COMPRESSED_TEXTURE_FORMATS
    GL_COMPRESSED_TEXTURE_FORMATS GL_DONT_CARE
    GL_FASTEST GL_NICEST GL_GENERATE_MIPMAP_HINT
    GL_BYTE GL_UNSIGNED_BYTE GL_SHORT
    GL_UNSIGNED_SHORT GL_INT GL_UNSIGNED_INT
    GL_FLOAT GL_FIXED GL_DEPTH_COMPONENT
    GL_ALPHA GL_RGB GL_RGBA GL_LUMINANCE
    GL_LUMINANCE_ALPHA GL_UNSIGNED_SHORT_4_4_4_4
    GL_UNSIGNED_SHORT_5_5_5_1
    GL_UNSIGNED_SHORT_5_6_5 GL_FRAGMENT_SHADER
    GL_VERTEX_SHADER GL_MAX_VERTEX_ATTRIBS
    GL_MAX_VERTEX_UNIFORM_VECTORS
    GL_MAX_VARYING_VECTORS
    GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS
    GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS
    GL_MAX_TEXTURE_IMAGE_UNITS
    GL_MAX_FRAGMENT_UNIFORM_VECTORS
    GL_SHADER_TYPE GL_DELETE_STATUS
    GL_LINK_STATUS GL_VALIDATE_STATUS
    GL_ATTACHED_SHADERS GL_ACTIVE_UNIFORMS
    GL_ACTIVE_UNIFORM_MAX_LENGTH
    GL_ACTIVE_ATTRIBUTES
    GL_ACTIVE_ATTRIBUTE_MAX_LENGTH
    GL_SHADING_LANGUAGE_VERSION
    GL_CURRENT_PROGRAM GL_NEVER GL_LESS GL_EQUAL
    GL_LEQUAL GL_GREATER GL_NOTEQUAL GL_GEQUAL
    GL_ALWAYS GL_KEEP GL_REPLACE GL_INCR GL_DECR
    GL_INVERT GL_INCR_WRAP GL_DECR_WRAP
    GL_VENDOR GL_RENDERER GL_VERSION
    GL_EXTENSIONS GL_NEAREST GL_LINEAR
    GL_NEAREST_MIPMAP_NEAREST
    GL_LINEAR_MIPMAP_NEAREST
    GL_NEAREST_MIPMAP_LINEAR
    GL_LINEAR_MIPMAP_LINEAR
    GL_TEXTURE_MAG_FILTER GL_TEXTURE_MIN_FILTER
    GL_TEXTURE_WRAP_S GL_TEXTURE_WRAP_T
    GL_TEXTURE GL_TEXTURE_CUBE_MAP
    GL_TEXTURE_BINDING_CUBE_MAP
    GL_TEXTURE_CUBE_MAP_POSITIVE_X
    GL_TEXTURE_CUBE_MAP_NEGATIVE_X
    GL_TEXTURE_CUBE_MAP_POSITIVE_Y
    GL_TEXTURE_CUBE_MAP_NEGATIVE_Y
    GL_TEXTURE_CUBE_MAP_POSITIVE_Z
    GL_TEXTURE_CUBE_MAP_NEGATIVE_Z
    GL_MAX_CUBE_MAP_TEXTURE_SIZE GL_TEXTURE0
    GL_TEXTURE1 GL_TEXTURE2 GL_TEXTURE3
    GL_TEXTURE4 GL_TEXTURE5 GL_TEXTURE6
    GL_TEXTURE7 GL_TEXTURE8 GL_TEXTURE9
    GL_TEXTURE10 GL_TEXTURE11 GL_TEXTURE12
    GL_TEXTURE13 GL_TEXTURE14 GL_TEXTURE15
    GL_TEXTURE16 GL_TEXTURE17 GL_TEXTURE18
    GL_TEXTURE19 GL_TEXTURE20 GL_TEXTURE21
    GL_TEXTURE22 GL_TEXTURE23 GL_TEXTURE24
    GL_TEXTURE25 GL_TEXTURE26 GL_TEXTURE27
    GL_TEXTURE28 GL_TEXTURE29 GL_TEXTURE30
    GL_TEXTURE31 GL_ACTIVE_TEXTURE GL_REPEAT
    GL_CLAMP_TO_EDGE GL_MIRRORED_REPEAT
    GL_FLOAT_VEC2 GL_FLOAT_VEC3 GL_FLOAT_VEC4
    GL_INT_VEC2 GL_INT_VEC3 GL_INT_VEC4 GL_BOOL
    GL_BOOL_VEC2 GL_BOOL_VEC3 GL_BOOL_VEC4
    GL_FLOAT_MAT2 GL_FLOAT_MAT3 GL_FLOAT_MAT4
    GL_SAMPLER_2D GL_SAMPLER_CUBE
    GL_VERTEX_ATTRIB_ARRAY_ENABLED
    GL_VERTEX_ATTRIB_ARRAY_SIZE
    GL_VERTEX_ATTRIB_ARRAY_STRIDE
    GL_VERTEX_ATTRIB_ARRAY_TYPE
    GL_VERTEX_ATTRIB_ARRAY_NORMALIZED
    GL_VERTEX_ATTRIB_ARRAY_POINTER
    GL_VERTEX_ATTRIB_ARRAY_BUFFER_BINDING
    GL_IMPLEMENTATION_COLOR_READ_TYPE
    GL_IMPLEMENTATION_COLOR_READ_FORMAT
    GL_COMPILE_STATUS GL_INFO_LOG_LENGTH
    GL_SHADER_SOURCE_LENGTH GL_SHADER_COMPILER
    GL_SHADER_BINARY_FORMATS
    GL_NUM_SHADER_BINARY_FORMATS GL_LOW_FLOAT
    GL_MEDIUM_FLOAT GL_HIGH_FLOAT GL_LOW_INT
    GL_MEDIUM_INT GL_HIGH_INT GL_FRAMEBUFFER
    GL_RENDERBUFFER GL_RGBA4 GL_RGB5_A1
    GL_RGB565 GL_DEPTH_COMPONENT16
    GL_STENCIL_INDEX8 GL_RENDERBUFFER_WIDTH
    GL_RENDERBUFFER_HEIGHT
    GL_RENDERBUFFER_INTERNAL_FORMAT
    GL_RENDERBUFFER_RED_SIZE
    GL_RENDERBUFFER_GREEN_SIZE
    GL_RENDERBUFFER_BLUE_SIZE
    GL_RENDERBUFFER_ALPHA_SIZE
    GL_RENDERBUFFER_DEPTH_SIZE
    GL_RENDERBUFFER_STENCIL_SIZE
    GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE
    GL_FRAMEBUFFER_ATTACHMENT_OBJECT_NAME
    GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL
    GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE
    GL_COLOR_ATTACHMENT0 GL_DEPTH_ATTACHMENT
    GL_STENCIL_ATTACHMENT GL_NONE
    GL_FRAMEBUFFER_COMPLETE
    GL_FRAMEBUFFER_INCOMPLETE_ATTACHMENT
    GL_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT
    GL_FRAMEBUFFER_INCOMPLETE_DIMENSIONS
    GL_FRAMEBUFFER_UNSUPPORTED
    GL_FRAMEBUFFER_BINDING
    GL_RENDERBUFFER_BINDING
    GL_MAX_RENDERBUFFER_SIZE
    GL_INVALID_FRAMEBUFFER_OPERATION
    glActiveTexture glAttachShader
    glBindAttribLocation glBindBuffer
    glBindFramebuffer glBindRenderbuffer
    glBindTexture glBlendColor glBlendEquation
    glBlendEquationSeparate glBlendFunc
    glBlendFuncSeparate glBufferData
    glBufferSubData glCheckFramebufferStatus
    glClear glClearColor glClearDepthf
    glClearStencil glColorMask glCompileShader
    glCompressedTexImage2D
    glCompressedTexSubImage2D glCopyTexImage2D
    glCopyTexSubImage2D glCreateProgram
    glCreateShader glCullFace glDeleteBuffers
    glDeleteFramebuffers glDeleteProgram
    glDeleteRenderbuffers glDeleteShader
    glDeleteTextures glDepthFunc glDepthMask
    glDepthRangef glDetachShader glDisable
    glDisableVertexAttribArray glDrawArrays
    glDrawElements glEnable
    glEnableVertexAttribArray glFinish glFlush
    glFramebufferRenderbuffer
    glFramebufferTexture2D glFrontFace
    glGenBuffers glGenerateMipmap
    glGenFramebuffers glGenRenderbuffers
    glGenTextures glGetActiveAttrib
    glGetActiveUniform glGetAttachedShaders
    glGetAttribLocation glGetBooleanv
    glGetBufferParameteriv glGetError
    glGetFloatv
    glGetFramebufferAttachmentParameteriv
    glGetIntegerv glGetProgramiv
    glGetProgramInfoLog
    glGetRenderbufferParameteriv glGetShaderiv
    glGetShaderInfoLog
    glGetShaderPrecisionFormat glGetShaderSource
    glGetString glGetTexParameterfv
    glGetTexParameteriv glGetUniformfv
    glGetUniformiv glGetUniformLocation
    glGetVertexAttribfv glGetVertexAttribiv
    glGetVertexAttribPointerv glHint glIsBuffer
    glIsEnabled glIsFramebuffer glIsProgram
    glIsRenderbuffer glIsShader glIsTexture
    glLineWidth glLinkProgram glPixelStorei
    glPolygonOffset glReadPixels
    glReleaseShaderCompiler
    glRenderbufferStorage glSampleCoverage
    glScissor glShaderBinary glShaderSource
    glStencilFunc glStencilFuncSeparate
    glStencilMask glStencilMaskSeparate
    glStencilOp glStencilOpSeparate glTexImage2D
    glTexParameterf glTexParameterfv
    glTexParameteri glTexParameteriv
    glTexSubImage2D glUniform1f glUniform1fv
    glUniform1i glUniform1iv glUniform2f
    glUniform2fv glUniform2i glUniform2iv
    glUniform3f glUniform3fv glUniform3i
    glUniform3iv glUniform4f glUniform4fv
    glUniform4i glUniform4iv glUniformMatrix2fv
    glUniformMatrix3fv glUniformMatrix4fv
    glUseProgram glValidateProgram
    glVertexAttrib1f glVertexAttrib1fv
    glVertexAttrib2f glVertexAttrib2fv
    glVertexAttrib3f glVertexAttrib3fv
    glVertexAttrib4f glVertexAttrib4fv
    glVertexAttribPointer glViewport
    )
  (import (chezscheme) (interop) (khronos))

  (define gles2-libdir
    (string-append "/System/Library/Frameworks/"
      "OpenGL.framework/Libraries/"))  
  ;; "OpenGL.framework/OpenGL"

  (define lib-gles2
    (load-shared-object
      (cond
        [(is-windows?) "glew32.dll"]
        [(is-osx?)     (string-append
                         gles2-libdir
                         "libGL.dylib")]
        [(is-linux?)   "/usr/lib/libGL.so"]
        [else          (error 'glfw/libGL
                         "uhandled-os")])))
  
  (define-syntax define-ftype-fn1-gl
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
  
  ;; (define-ftype-fn1 wglGetProcAddress
  ;;   (function (string) uptr))
  ;;
  ;; (define-syntax define-ftype-fn1-gl
  ;;   (lambda (x)
  ;;     (syntax-case x (lambda)
  ;;       ((_ name signature)
  ;;        (let ([make-name-syntax
  ;;                (lambda (name1 after-str1)
  ;;                  (datum->syntax-object
  ;;                    name1
  ;;                    (string->symbol
  ;;                      (string-append 
  ;;                        (symbol->string
  ;;                          (syntax-object->datum
  ;;                            name1))
  ;;                        (syntax-object->datum
  ;;                          after-str1)))))])
  ;;          (with-syntax
  ;;            ([ftype-name
  ;;               ;; y-be-low-kneaded? 
  ;;               (make-name-syntax 
  ;;                 (syntax name)
  ;;                 "-t")]
  ;;             [func-str
  ;;               ;; be-low u-d-knt-hr 
  ;;               (symbol->string   
  ;;                 (syntax-object->datum
  ;;                   (syntax name)))])
  ;;            (syntax
  ;;              (begin
  ;;                (define-ftype ftype-name signature)
  ;;                (define name 
  ;;                  (ftype-ref ftype-name
  ;;                    ()
  ;;                    (make-ftype-pointer
  ;;                      ftype-name
  ;;                      (if (is-windows?)
  ;;                        (wglGetProcAddress
  ;;                          func-str)))))))))))))

  (define GL_ES_VERSION_2_0 1)
  ;; gles2-typedefs
  (define-ftype GLbyte khronos_int8_t)
  (define-ftype GLclampf khronos_float_t)
  (define-ftype GLfixed khronos_int32_t)
  (define-ftype GLshort short)
  (define-ftype GLushort unsigned-short)
  ;; typedef void GLvoid
  ;; typedef struct __GLsync* GLsync
  (define-ftype GLsync void*)
  (define-ftype GLint64 khronos_int64_t)
  (define-ftype GLuint64 khronos_uint64_t)
  (define-ftype GLenum unsigned-int)
  (define-ftype GLuint unsigned-int)
  (define-ftype GLchar char)
  (define-ftype GLchar* (* char)) ;; kdr
  (define-ftype GLfloat khronos_float_t)
  (define-ftype GLsizeiptr khronos_ssize_t)
  (define-ftype GLintptr khronos_intptr_t)
  (define-ftype GLbitfield unsigned-int)
  (define-ftype GLint int)
  ;; (define-ftype GLboolean unsigned-char)
  (define-ftype GLboolean unsigned-8) ;; kdr
  (define-ftype GLsizei int)
  (define-ftype GLubyte khronos_uint8_t)

  ;; gle2-defines
  (define GL_DEPTH_BUFFER_BIT 256)
  (define GL_STENCIL_BUFFER_BIT 1024)
  (define GL_COLOR_BUFFER_BIT 16384)
  (define GL_FALSE 0)
  (define GL_TRUE 1)
  (define GL_POINTS 0)
  (define GL_LINES 1)
  (define GL_LINE_LOOP 2)
  (define GL_LINE_STRIP 3)
  (define GL_TRIANGLES 4)
  (define GL_TRIANGLE_STRIP 5)
  (define GL_TRIANGLE_FAN 6)
  (define GL_ZERO 0)
  (define GL_ONE 1)
  (define GL_SRC_COLOR 768)
  (define GL_ONE_MINUS_SRC_COLOR 769)
  (define GL_SRC_ALPHA 770)
  (define GL_ONE_MINUS_SRC_ALPHA 771)
  (define GL_DST_ALPHA 772)
  (define GL_ONE_MINUS_DST_ALPHA 773)
  (define GL_DST_COLOR 774)
  (define GL_ONE_MINUS_DST_COLOR 775)
  (define GL_SRC_ALPHA_SATURATE 776)
  (define GL_FUNC_ADD 32774)
  (define GL_BLEND_EQUATION 32777)
  (define GL_BLEND_EQUATION_RGB 32777)
  (define GL_BLEND_EQUATION_ALPHA 34877)
  (define GL_FUNC_SUBTRACT 32778)
  (define GL_FUNC_REVERSE_SUBTRACT 32779)
  (define GL_BLEND_DST_RGB 32968)
  (define GL_BLEND_SRC_RGB 32969)
  (define GL_BLEND_DST_ALPHA 32970)
  (define GL_BLEND_SRC_ALPHA 32971)
  (define GL_CONSTANT_COLOR 32769)
  (define GL_ONE_MINUS_CONSTANT_COLOR 32770)
  (define GL_CONSTANT_ALPHA 32771)
  (define GL_ONE_MINUS_CONSTANT_ALPHA 32772)
  (define GL_BLEND_COLOR 32773)
  (define GL_ARRAY_BUFFER 34962)
  (define GL_ELEMENT_ARRAY_BUFFER 34963)
  (define GL_ARRAY_BUFFER_BINDING 34964)
  (define GL_ELEMENT_ARRAY_BUFFER_BINDING 34965)
  (define GL_STREAM_DRAW 35040)
  (define GL_STATIC_DRAW 35044)
  (define GL_DYNAMIC_DRAW 35048)
  (define GL_BUFFER_SIZE 34660)
  (define GL_BUFFER_USAGE 34661)
  (define GL_CURRENT_VERTEX_ATTRIB 34342)
  (define GL_FRONT 1028)
  (define GL_BACK 1029)
  (define GL_FRONT_AND_BACK 1032)
  (define GL_TEXTURE_2D 3553)
  (define GL_CULL_FACE 2884)
  (define GL_BLEND 3042)
  (define GL_DITHER 3024)
  (define GL_STENCIL_TEST 2960)
  (define GL_DEPTH_TEST 2929)
  (define GL_SCISSOR_TEST 3089)
  (define GL_POLYGON_OFFSET_FILL 32823)
  (define GL_SAMPLE_ALPHA_TO_COVERAGE 32926)
  (define GL_SAMPLE_COVERAGE 32928)
  (define GL_NO_ERROR 0)
  (define GL_INVALID_ENUM 1280)
  (define GL_INVALID_VALUE 1281)
  (define GL_INVALID_OPERATION 1282)
  (define GL_OUT_OF_MEMORY 1285)
  (define GL_CW 2304)
  (define GL_CCW 2305)
  (define GL_LINE_WIDTH 2849)
  (define GL_ALIASED_POINT_SIZE_RANGE 33901)
  (define GL_ALIASED_LINE_WIDTH_RANGE 33902)
  (define GL_CULL_FACE_MODE 2885)
  (define GL_FRONT_FACE 2886)
  (define GL_DEPTH_RANGE 2928)
  (define GL_DEPTH_WRITEMASK 2930)
  (define GL_DEPTH_CLEAR_VALUE 2931)
  (define GL_DEPTH_FUNC 2932)
  (define GL_STENCIL_CLEAR_VALUE 2961)
  (define GL_STENCIL_FUNC 2962)
  (define GL_STENCIL_FAIL 2964)
  (define GL_STENCIL_PASS_DEPTH_FAIL 2965)
  (define GL_STENCIL_PASS_DEPTH_PASS 2966)
  (define GL_STENCIL_REF 2967)
  (define GL_STENCIL_VALUE_MASK 2963)
  (define GL_STENCIL_WRITEMASK 2968)
  (define GL_STENCIL_BACK_FUNC 34816)
  (define GL_STENCIL_BACK_FAIL 34817)
  (define GL_STENCIL_BACK_PASS_DEPTH_FAIL 34818)
  (define GL_STENCIL_BACK_PASS_DEPTH_PASS 34819)
  (define GL_STENCIL_BACK_REF 36003)
  (define GL_STENCIL_BACK_VALUE_MASK 36004)
  (define GL_STENCIL_BACK_WRITEMASK 36005)
  (define GL_VIEWPORT 2978)
  (define GL_SCISSOR_BOX 3088)
  (define GL_COLOR_CLEAR_VALUE 3106)
  (define GL_COLOR_WRITEMASK 3107)
  (define GL_UNPACK_ALIGNMENT 3317)
  (define GL_PACK_ALIGNMENT 3333)
  (define GL_MAX_TEXTURE_SIZE 3379)
  (define GL_MAX_VIEWPORT_DIMS 3386)
  (define GL_SUBPIXEL_BITS 3408)
  (define GL_RED_BITS 3410)
  (define GL_GREEN_BITS 3411)
  (define GL_BLUE_BITS 3412)
  (define GL_ALPHA_BITS 3413)
  (define GL_DEPTH_BITS 3414)
  (define GL_STENCIL_BITS 3415)
  (define GL_POLYGON_OFFSET_UNITS 10752)
  (define GL_POLYGON_OFFSET_FACTOR 32824)
  (define GL_TEXTURE_BINDING_2D 32873)
  (define GL_SAMPLE_BUFFERS 32936)
  (define GL_SAMPLES 32937)
  (define GL_SAMPLE_COVERAGE_VALUE 32938)
  (define GL_SAMPLE_COVERAGE_INVERT 32939)
  (define GL_NUM_COMPRESSED_TEXTURE_FORMATS 34466)
  (define GL_COMPRESSED_TEXTURE_FORMATS 34467)
  (define GL_DONT_CARE 4352)
  (define GL_FASTEST 4353)
  (define GL_NICEST 4354)
  (define GL_GENERATE_MIPMAP_HINT 33170)
  (define GL_BYTE 5120)
  (define GL_UNSIGNED_BYTE 5121)
  (define GL_SHORT 5122)
  (define GL_UNSIGNED_SHORT 5123)
  (define GL_INT 5124)
  (define GL_UNSIGNED_INT 5125)
  (define GL_FLOAT 5126)
  (define GL_FIXED 5132)
  (define GL_DEPTH_COMPONENT 6402)
  (define GL_ALPHA 6406)
  (define GL_RGB 6407)
  (define GL_RGBA 6408)
  (define GL_LUMINANCE 6409)
  (define GL_LUMINANCE_ALPHA 6410)
  (define GL_UNSIGNED_SHORT_4_4_4_4 32819)
  (define GL_UNSIGNED_SHORT_5_5_5_1 32820)
  (define GL_UNSIGNED_SHORT_5_6_5 33635)
  (define GL_FRAGMENT_SHADER 35632)
  (define GL_VERTEX_SHADER 35633)
  (define GL_MAX_VERTEX_ATTRIBS 34921)
  (define GL_MAX_VERTEX_UNIFORM_VECTORS 36347)
  (define GL_MAX_VARYING_VECTORS 36348)
  (define GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS 35661)
  (define GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS 35660)
  (define GL_MAX_TEXTURE_IMAGE_UNITS 34930)
  (define GL_MAX_FRAGMENT_UNIFORM_VECTORS 36349)
  (define GL_SHADER_TYPE 35663)
  (define GL_DELETE_STATUS 35712)
  (define GL_LINK_STATUS 35714)
  (define GL_VALIDATE_STATUS 35715)
  (define GL_ATTACHED_SHADERS 35717)
  (define GL_ACTIVE_UNIFORMS 35718)
  (define GL_ACTIVE_UNIFORM_MAX_LENGTH 35719)
  (define GL_ACTIVE_ATTRIBUTES 35721)
  (define GL_ACTIVE_ATTRIBUTE_MAX_LENGTH 35722)
  (define GL_SHADING_LANGUAGE_VERSION 35724)
  (define GL_CURRENT_PROGRAM 35725)
  (define GL_NEVER 512)
  (define GL_LESS 513)
  (define GL_EQUAL 514)
  (define GL_LEQUAL 515)
  (define GL_GREATER 516)
  (define GL_NOTEQUAL 517)
  (define GL_GEQUAL 518)
  (define GL_ALWAYS 519)
  (define GL_KEEP 7680)
  (define GL_REPLACE 7681)
  (define GL_INCR 7682)
  (define GL_DECR 7683)
  (define GL_INVERT 5386)
  (define GL_INCR_WRAP 34055)
  (define GL_DECR_WRAP 34056)
  (define GL_VENDOR 7936)
  (define GL_RENDERER 7937)
  (define GL_VERSION 7938)
  (define GL_EXTENSIONS 7939)
  (define GL_NEAREST 9728)
  (define GL_LINEAR 9729)
  (define GL_NEAREST_MIPMAP_NEAREST 9984)
  (define GL_LINEAR_MIPMAP_NEAREST 9985)
  (define GL_NEAREST_MIPMAP_LINEAR 9986)
  (define GL_LINEAR_MIPMAP_LINEAR 9987)
  (define GL_TEXTURE_MAG_FILTER 10240)
  (define GL_TEXTURE_MIN_FILTER 10241)
  (define GL_TEXTURE_WRAP_S 10242)
  (define GL_TEXTURE_WRAP_T 10243)
  (define GL_TEXTURE 5890)
  (define GL_TEXTURE_CUBE_MAP 34067)
  (define GL_TEXTURE_BINDING_CUBE_MAP 34068)
  (define GL_TEXTURE_CUBE_MAP_POSITIVE_X 34069)
  (define GL_TEXTURE_CUBE_MAP_NEGATIVE_X 34070)
  (define GL_TEXTURE_CUBE_MAP_POSITIVE_Y 34071)
  (define GL_TEXTURE_CUBE_MAP_NEGATIVE_Y 34072)
  (define GL_TEXTURE_CUBE_MAP_POSITIVE_Z 34073)
  (define GL_TEXTURE_CUBE_MAP_NEGATIVE_Z 34074)
  (define GL_MAX_CUBE_MAP_TEXTURE_SIZE 34076)
  (define GL_TEXTURE0 33984)
  (define GL_TEXTURE1 33985)
  (define GL_TEXTURE2 33986)
  (define GL_TEXTURE3 33987)
  (define GL_TEXTURE4 33988)
  (define GL_TEXTURE5 33989)
  (define GL_TEXTURE6 33990)
  (define GL_TEXTURE7 33991)
  (define GL_TEXTURE8 33992)
  (define GL_TEXTURE9 33993)
  (define GL_TEXTURE10 33994)
  (define GL_TEXTURE11 33995)
  (define GL_TEXTURE12 33996)
  (define GL_TEXTURE13 33997)
  (define GL_TEXTURE14 33998)
  (define GL_TEXTURE15 33999)
  (define GL_TEXTURE16 34000)
  (define GL_TEXTURE17 34001)
  (define GL_TEXTURE18 34002)
  (define GL_TEXTURE19 34003)
  (define GL_TEXTURE20 34004)
  (define GL_TEXTURE21 34005)
  (define GL_TEXTURE22 34006)
  (define GL_TEXTURE23 34007)
  (define GL_TEXTURE24 34008)
  (define GL_TEXTURE25 34009)
  (define GL_TEXTURE26 34010)
  (define GL_TEXTURE27 34011)
  (define GL_TEXTURE28 34012)
  (define GL_TEXTURE29 34013)
  (define GL_TEXTURE30 34014)
  (define GL_TEXTURE31 34015)
  (define GL_ACTIVE_TEXTURE 34016)
  (define GL_REPEAT 10497)
  (define GL_CLAMP_TO_EDGE 33071)
  (define GL_MIRRORED_REPEAT 33648)
  (define GL_FLOAT_VEC2 35664)
  (define GL_FLOAT_VEC3 35665)
  (define GL_FLOAT_VEC4 35666)
  (define GL_INT_VEC2 35667)
  (define GL_INT_VEC3 35668)
  (define GL_INT_VEC4 35669)
  (define GL_BOOL 35670)
  (define GL_BOOL_VEC2 35671)
  (define GL_BOOL_VEC3 35672)
  (define GL_BOOL_VEC4 35673)
  (define GL_FLOAT_MAT2 35674)
  (define GL_FLOAT_MAT3 35675)
  (define GL_FLOAT_MAT4 35676)
  (define GL_SAMPLER_2D 35678)
  (define GL_SAMPLER_CUBE 35680)
  (define GL_VERTEX_ATTRIB_ARRAY_ENABLED 34338)
  (define GL_VERTEX_ATTRIB_ARRAY_SIZE 34339)
  (define GL_VERTEX_ATTRIB_ARRAY_STRIDE 34340)
  (define GL_VERTEX_ATTRIB_ARRAY_TYPE 34341)
  (define GL_VERTEX_ATTRIB_ARRAY_NORMALIZED 34922)
  (define GL_VERTEX_ATTRIB_ARRAY_POINTER 34373)
  (define GL_VERTEX_ATTRIB_ARRAY_BUFFER_BINDING 34975)
  (define GL_IMPLEMENTATION_COLOR_READ_TYPE 35738)
  (define GL_IMPLEMENTATION_COLOR_READ_FORMAT 35739)
  (define GL_COMPILE_STATUS 35713)
  (define GL_INFO_LOG_LENGTH 35716)
  (define GL_SHADER_SOURCE_LENGTH 35720)
  (define GL_SHADER_COMPILER 36346)
  (define GL_SHADER_BINARY_FORMATS 36344)
  (define GL_NUM_SHADER_BINARY_FORMATS 36345)
  (define GL_LOW_FLOAT 36336)
  (define GL_MEDIUM_FLOAT 36337)
  (define GL_HIGH_FLOAT 36338)
  (define GL_LOW_INT 36339)
  (define GL_MEDIUM_INT 36340)
  (define GL_HIGH_INT 36341)
  (define GL_FRAMEBUFFER 36160)
  (define GL_RENDERBUFFER 36161)
  (define GL_RGBA4 32854)
  (define GL_RGB5_A1 32855)
  (define GL_RGB565 36194)
  (define GL_DEPTH_COMPONENT16 33189)
  (define GL_STENCIL_INDEX8 36168)
  (define GL_RENDERBUFFER_WIDTH 36162)
  (define GL_RENDERBUFFER_HEIGHT 36163)
  (define GL_RENDERBUFFER_INTERNAL_FORMAT 36164)
  (define GL_RENDERBUFFER_RED_SIZE 36176)
  (define GL_RENDERBUFFER_GREEN_SIZE 36177)
  (define GL_RENDERBUFFER_BLUE_SIZE 36178)
  (define GL_RENDERBUFFER_ALPHA_SIZE 36179)
  (define GL_RENDERBUFFER_DEPTH_SIZE 36180)
  (define GL_RENDERBUFFER_STENCIL_SIZE 36181)
  (define GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE 36048)
  (define GL_FRAMEBUFFER_ATTACHMENT_OBJECT_NAME 36049)
  (define GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL 36050)
  (define GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE 36051)
  (define GL_COLOR_ATTACHMENT0 36064)
  (define GL_DEPTH_ATTACHMENT 36096)
  (define GL_STENCIL_ATTACHMENT 36128)
  (define GL_NONE 0)
  (define GL_FRAMEBUFFER_COMPLETE 36053)
  (define GL_FRAMEBUFFER_INCOMPLETE_ATTACHMENT 36054)
  (define GL_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT 36055)
  (define GL_FRAMEBUFFER_INCOMPLETE_DIMENSIONS 36057)
  (define GL_FRAMEBUFFER_UNSUPPORTED 36061)
  (define GL_FRAMEBUFFER_BINDING 36006)
  (define GL_RENDERBUFFER_BINDING 36007)
  (define GL_MAX_RENDERBUFFER_SIZE 34024)
  (define GL_INVALID_FRAMEBUFFER_OPERATION 1286)
  ;; gles2-funcs
  (define-ftype-fn1-gl glActiveTexture 
    (function (GLenum) void))
  (define-ftype-fn1-gl glAttachShader 
    (function (GLuint GLuint) void))
  (define-ftype-fn1-gl glBindAttribLocation 
    (function (GLuint GLuint (* GLchar)) void))
  (define-ftype-fn1-gl glBindBuffer 
    (function (GLenum GLuint) void))
  (define-ftype-fn1-gl glBindFramebuffer 
    (function (GLenum GLuint) void))
  (define-ftype-fn1-gl glBindRenderbuffer 
    (function (GLenum GLuint) void))
  (define-ftype-fn1-gl glBindTexture 
    (function (GLenum GLuint) void))
  (define-ftype-fn1-gl glBlendColor 
    (function (GLfloat GLfloat GLfloat GLfloat) void))
  (define-ftype-fn1-gl glBlendEquation 
    (function (GLenum) void))
  (define-ftype-fn1-gl glBlendEquationSeparate 
    (function (GLenum GLenum) void))
  (define-ftype-fn1-gl glBlendFunc 
    (function (GLenum GLenum) void))
  (define-ftype-fn1-gl glBlendFuncSeparate 
    (function (GLenum GLenum GLenum GLenum) void))
  (define-ftype-fn1-gl glBufferData 
    (function (GLenum GLsizeiptr void* GLenum) void))
  (define-ftype-fn1-gl glBufferSubData 
    (function (GLenum GLintptr GLsizeiptr void*) void))
  (define-ftype-fn1-gl glCheckFramebufferStatus 
    (function (GLenum) GLenum))
  (define-ftype-fn1-gl glClear 
    (function (GLbitfield) void))
  (define-ftype-fn1-gl glClearColor 
    (function (GLfloat GLfloat GLfloat GLfloat) void))
  (define-ftype-fn1-gl glClearDepthf 
    (function (GLfloat) void))
  (define-ftype-fn1-gl glClearStencil 
    (function (GLint) void))
  (define-ftype-fn1-gl glColorMask 
    (function (GLboolean GLboolean GLboolean GLboolean) void))
  (define-ftype-fn1-gl glCompileShader 
    (function (GLuint) void))
  (define-ftype-fn1-gl glCompressedTexImage2D 
    (function (GLenum GLint GLenum GLsizei GLsizei GLint GLsizei void*) void))
  (define-ftype-fn1-gl glCompressedTexSubImage2D 
    (function (GLenum GLint GLint GLint GLsizei GLsizei GLenum GLsizei void*) void))
  (define-ftype-fn1-gl glCopyTexImage2D 
    (function (GLenum GLint GLenum GLint GLint GLsizei GLsizei GLint) void))
  (define-ftype-fn1-gl glCopyTexSubImage2D 
    (function (GLenum GLint GLint GLint GLint GLint GLsizei GLsizei) void))
  (define-ftype-fn1-gl glCreateProgram 
    (function () GLuint))
  (define-ftype-fn1-gl glCreateShader 
    (function (GLenum) GLuint))
  (define-ftype-fn1-gl glCullFace 
    (function (GLenum) void))
  (define-ftype-fn1-gl glDeleteBuffers 
    (function (GLsizei (* GLuint)) void))
  (define-ftype-fn1-gl glDeleteFramebuffers 
    (function (GLsizei (* GLuint)) void))
  (define-ftype-fn1-gl glDeleteProgram 
    (function (GLuint) void))
  (define-ftype-fn1-gl glDeleteRenderbuffers 
    (function (GLsizei (* GLuint)) void))
  (define-ftype-fn1-gl glDeleteShader 
    (function (GLuint) void))
  (define-ftype-fn1-gl glDeleteTextures 
    (function (GLsizei (* GLuint)) void))
  (define-ftype-fn1-gl glDepthFunc 
    (function (GLenum) void))
  (define-ftype-fn1-gl glDepthMask 
    (function (GLboolean) void))
  (define-ftype-fn1-gl glDepthRangef 
    (function (GLfloat GLfloat) void))
  (define-ftype-fn1-gl glDetachShader 
    (function (GLuint GLuint) void))
  (define-ftype-fn1-gl glDisable 
    (function (GLenum) void))
  (define-ftype-fn1-gl glDisableVertexAttribArray 
    (function (GLuint) void))
  (define-ftype-fn1-gl glDrawArrays 
    (function (GLenum GLint GLsizei) void))
  (define-ftype-fn1-gl glDrawElements 
    (function (GLenum GLsizei GLenum void*) void))
  (define-ftype-fn1-gl glEnable 
    (function (GLenum) void))
  (define-ftype-fn1-gl glEnableVertexAttribArray 
    (function (GLuint) void))
  (define-ftype-fn1-gl glFinish 
    (function () void))
  (define-ftype-fn1-gl glFlush 
    (function () void))
  (define-ftype-fn1-gl glFramebufferRenderbuffer 
    (function (GLenum GLenum GLenum GLuint) void))
  (define-ftype-fn1-gl glFramebufferTexture2D 
    (function (GLenum GLenum GLenum GLuint GLint) void))
  (define-ftype-fn1-gl glFrontFace 
    (function (GLenum) void))
  (define-ftype-fn1-gl glGenBuffers 
    (function (GLsizei (* GLuint)) void))
  (define-ftype-fn1-gl glGenerateMipmap 
    (function (GLenum) void))
  (define-ftype-fn1-gl glGenFramebuffers 
    (function (GLsizei (* GLuint)) void))
  (define-ftype-fn1-gl glGenRenderbuffers 
    (function (GLsizei (* GLuint)) void))
  (define-ftype-fn1-gl glGenTextures 
    (function (GLsizei (* GLuint)) void))
  (define-ftype-fn1-gl glGetActiveAttrib 
    (function (GLuint GLuint GLsizei (* GLsizei) (* GLint) (* GLenum) (* GLchar)) void))
  (define-ftype-fn1-gl glGetActiveUniform 
    (function (GLuint GLuint GLsizei (* GLsizei) (* GLint) (* GLenum) (* GLchar)) void))
  (define-ftype-fn1-gl glGetAttachedShaders 
    (function (GLuint GLsizei (* GLsizei) (* GLuint)) void))
  (define-ftype-fn1-gl glGetAttribLocation 
    (function (GLuint (* GLchar)) GLint))
  (define-ftype-fn1-gl glGetBooleanv 
    (function (GLenum (* GLboolean)) void))
  (define-ftype-fn1-gl glGetBufferParameteriv 
    (function (GLenum GLenum (* GLint)) void))
  (define-ftype-fn1-gl glGetError 
    (function () GLenum))
  (define-ftype-fn1-gl glGetFloatv 
    (function (GLenum (* GLfloat)) void))
  (define-ftype-fn1-gl glGetFramebufferAttachmentParameteriv 
    (function (GLenum GLenum GLenum (* GLint)) void))
  (define-ftype-fn1-gl glGetIntegerv 
    (function (GLenum (* GLint)) void))
  (define-ftype-fn1-gl glGetProgramiv 
    (function (GLuint GLenum (* GLint)) void))
  (define-ftype-fn1-gl glGetProgramInfoLog 
    (function (GLuint GLsizei (* GLsizei) (* GLchar)) void))
  (define-ftype-fn1-gl glGetRenderbufferParameteriv 
    (function (GLenum GLenum (* GLint)) void))
  (define-ftype-fn1-gl glGetShaderiv 
    (function (GLuint GLenum (* GLint)) void))
  (define-ftype-fn1-gl glGetShaderInfoLog 
    (function (GLuint GLsizei (* GLsizei) (* GLchar)) void))
  (define-ftype-fn1-gl glGetShaderPrecisionFormat 
    (function (GLenum GLenum (* GLint) (* GLint)) void))
  (define-ftype-fn1-gl glGetShaderSource 
    (function (GLuint GLsizei (* GLsizei) (* GLchar)) void))
  (define-ftype-fn1-gl glGetString 
    (function (GLenum) (* GLubyte)))
  (define-ftype-fn1-gl glGetTexParameterfv 
    (function (GLenum GLenum (* GLfloat)) void))
  (define-ftype-fn1-gl glGetTexParameteriv 
    (function (GLenum GLenum (* GLint)) void))
  (define-ftype-fn1-gl glGetUniformfv 
    (function (GLuint GLint (* GLfloat)) void))
  (define-ftype-fn1-gl glGetUniformiv 
    (function (GLuint GLint (* GLint)) void))
  (define-ftype-fn1-gl glGetUniformLocation 
    (function (GLuint (* GLchar)) GLint))
  (define-ftype-fn1-gl glGetVertexAttribfv 
    (function (GLuint GLenum (* GLfloat)) void))
  (define-ftype-fn1-gl glGetVertexAttribiv 
    (function (GLuint GLenum (* GLint)) void))
  (define-ftype-fn1-gl glGetVertexAttribPointerv 
    (function (GLuint GLenum (* void*)) void))
  (define-ftype-fn1-gl glHint 
    (function (GLenum GLenum) void))
  (define-ftype-fn1-gl glIsBuffer 
    (function (GLuint) GLboolean))
  (define-ftype-fn1-gl glIsEnabled 
    (function (GLenum) GLboolean))
  (define-ftype-fn1-gl glIsFramebuffer 
    (function (GLuint) GLboolean))
  (define-ftype-fn1-gl glIsProgram 
    (function (GLuint) GLboolean))
  (define-ftype-fn1-gl glIsRenderbuffer 
    (function (GLuint) GLboolean))
  (define-ftype-fn1-gl glIsShader 
    (function (GLuint) GLboolean))
  (define-ftype-fn1-gl glIsTexture 
    (function (GLuint) GLboolean))
  (define-ftype-fn1-gl glLineWidth 
    (function (GLfloat) void))
  (define-ftype-fn1-gl glLinkProgram 
    (function (GLuint) void))
  (define-ftype-fn1-gl glPixelStorei 
    (function (GLenum GLint) void))
  (define-ftype-fn1-gl glPolygonOffset 
    (function (GLfloat GLfloat) void))
  (define-ftype-fn1-gl glReadPixels 
    (function (GLint GLint GLsizei GLsizei GLenum GLenum void*) void))
  (define-ftype-fn1-gl glReleaseShaderCompiler 
    (function () void))
  (define-ftype-fn1-gl glRenderbufferStorage 
    (function (GLenum GLenum GLsizei GLsizei) void))
  (define-ftype-fn1-gl glSampleCoverage 
    (function (GLfloat GLboolean) void))
  (define-ftype-fn1-gl glScissor 
    (function (GLint GLint GLsizei GLsizei) void))
  (define-ftype-fn1-gl glShaderBinary 
    (function (GLsizei (* GLuint) GLenum void* GLsizei) void))
  (define-ftype-fn1-gl glShaderSource 
    (function (GLuint GLsizei (* GLchar*) (* GLint)) void))
  (define-ftype-fn1-gl glStencilFunc 
    (function (GLenum GLint GLuint) void))
  (define-ftype-fn1-gl glStencilFuncSeparate 
    (function (GLenum GLenum GLint GLuint) void))
  (define-ftype-fn1-gl glStencilMask 
    (function (GLuint) void))
  (define-ftype-fn1-gl glStencilMaskSeparate 
    (function (GLenum GLuint) void))
  (define-ftype-fn1-gl glStencilOp 
    (function (GLenum GLenum GLenum) void))
  (define-ftype-fn1-gl glStencilOpSeparate 
    (function (GLenum GLenum GLenum GLenum) void))
  (define-ftype-fn1-gl glTexImage2D 
    (function (GLenum GLint GLint GLsizei GLsizei GLint GLenum GLenum void*) void))
  (define-ftype-fn1-gl glTexParameterf 
    (function (GLenum GLenum GLfloat) void))
  (define-ftype-fn1-gl glTexParameterfv 
    (function (GLenum GLenum (* GLfloat)) void))
  (define-ftype-fn1-gl glTexParameteri 
    (function (GLenum GLenum GLint) void))
  (define-ftype-fn1-gl glTexParameteriv 
    (function (GLenum GLenum (* GLint)) void))
  (define-ftype-fn1-gl glTexSubImage2D 
    (function (GLenum GLint GLint GLint GLsizei GLsizei GLenum GLenum void*) void))
  (define-ftype-fn1-gl glUniform1f 
    (function (GLint GLfloat) void))
  (define-ftype-fn1-gl glUniform1fv 
    (function (GLint GLsizei (* GLfloat)) void))
  (define-ftype-fn1-gl glUniform1i 
    (function (GLint GLint) void))
  (define-ftype-fn1-gl glUniform1iv 
    (function (GLint GLsizei (* GLint)) void))
  (define-ftype-fn1-gl glUniform2f 
    (function (GLint GLfloat GLfloat) void))
  (define-ftype-fn1-gl glUniform2fv 
    (function (GLint GLsizei (* GLfloat)) void))
  (define-ftype-fn1-gl glUniform2i 
    (function (GLint GLint GLint) void))
  (define-ftype-fn1-gl glUniform2iv 
    (function (GLint GLsizei (* GLint)) void))
  (define-ftype-fn1-gl glUniform3f 
    (function (GLint GLfloat GLfloat GLfloat) void))
  (define-ftype-fn1-gl glUniform3fv 
    (function (GLint GLsizei (* GLfloat)) void))
  (define-ftype-fn1-gl glUniform3i 
    (function (GLint GLint GLint GLint) void))
  (define-ftype-fn1-gl glUniform3iv 
    (function (GLint GLsizei (* GLint)) void))
  (define-ftype-fn1-gl glUniform4f 
    (function (GLint GLfloat GLfloat GLfloat GLfloat) void))
  (define-ftype-fn1-gl glUniform4fv 
    (function (GLint GLsizei (* GLfloat)) void))
  (define-ftype-fn1-gl glUniform4i 
    (function (GLint GLint GLint GLint GLint) void))
  (define-ftype-fn1-gl glUniform4iv 
    (function (GLint GLsizei (* GLint)) void))
  (define-ftype-fn1-gl glUniformMatrix2fv 
    (function (GLint GLsizei GLboolean (* GLfloat)) void))
  (define-ftype-fn1-gl glUniformMatrix3fv 
    (function (GLint GLsizei GLboolean (* GLfloat)) void))
  (define-ftype-fn1-gl glUniformMatrix4fv 
    (function (GLint GLsizei GLboolean (* GLfloat)) void))
  (define-ftype-fn1-gl glUseProgram 
    (function (GLuint) void))
  (define-ftype-fn1-gl glValidateProgram 
    (function (GLuint) void))
  (define-ftype-fn1-gl glVertexAttrib1f 
    (function (GLuint GLfloat) void))
  (define-ftype-fn1-gl glVertexAttrib1fv 
    (function (GLuint (* GLfloat)) void))
  (define-ftype-fn1-gl glVertexAttrib2f 
    (function (GLuint GLfloat GLfloat) void))
  (define-ftype-fn1-gl glVertexAttrib2fv 
    (function (GLuint (* GLfloat)) void))
  (define-ftype-fn1-gl glVertexAttrib3f 
    (function (GLuint GLfloat GLfloat GLfloat) void))
  (define-ftype-fn1-gl glVertexAttrib3fv 
    (function (GLuint (* GLfloat)) void))
  (define-ftype-fn1-gl glVertexAttrib4f 
    (function (GLuint GLfloat GLfloat GLfloat GLfloat) void))
  (define-ftype-fn1-gl glVertexAttrib4fv 
    (function (GLuint (* GLfloat)) void))
  (define-ftype-fn1-gl glVertexAttribPointer 
    (function (GLuint GLint GLenum GLboolean GLsizei void*) void))
  (define-ftype-fn1-gl glViewport 
    (function (GLint GLint GLsizei GLsizei) void))
  )
