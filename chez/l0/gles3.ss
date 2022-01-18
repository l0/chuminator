(library (gles3)
  (export
    ;; gles3
    GL_ES_VERSION_3_0 GLhalf
    GL_READ_BUFFER GL_UNPACK_ROW_LENGTH
    GL_UNPACK_SKIP_ROWS GL_UNPACK_SKIP_PIXELS
    GL_PACK_ROW_LENGTH GL_PACK_SKIP_ROWS
    GL_PACK_SKIP_PIXELS GL_COLOR GL_DEPTH
    GL_STENCIL GL_RED GL_RGB8 GL_RGBA8
    GL_RGB10_A2 GL_TEXTURE_BINDING_3D
    GL_UNPACK_SKIP_IMAGES GL_UNPACK_IMAGE_HEIGHT
    GL_TEXTURE_3D GL_TEXTURE_WRAP_R
    GL_MAX_3D_TEXTURE_SIZE
    GL_UNSIGNED_INT_2_10_10_10_REV
    GL_MAX_ELEMENTS_VERTICES
    GL_MAX_ELEMENTS_INDICES GL_TEXTURE_MIN_LOD
    GL_TEXTURE_MAX_LOD GL_TEXTURE_BASE_LEVEL
    GL_TEXTURE_MAX_LEVEL GL_MIN GL_MAX
    GL_DEPTH_COMPONENT24 GL_MAX_TEXTURE_LOD_BIAS
    GL_TEXTURE_COMPARE_MODE
    GL_TEXTURE_COMPARE_FUNC GL_CURRENT_QUERY
    GL_QUERY_RESULT GL_QUERY_RESULT_AVAILABLE
    GL_BUFFER_MAPPED GL_BUFFER_MAP_POINTER
    GL_STREAM_READ GL_STREAM_COPY GL_STATIC_READ
    GL_STATIC_COPY GL_DYNAMIC_READ
    GL_DYNAMIC_COPY GL_MAX_DRAW_BUFFERS
    GL_DRAW_BUFFER0 GL_DRAW_BUFFER1
    GL_DRAW_BUFFER2 GL_DRAW_BUFFER3
    GL_DRAW_BUFFER4 GL_DRAW_BUFFER5
    GL_DRAW_BUFFER6 GL_DRAW_BUFFER7
    GL_DRAW_BUFFER8 GL_DRAW_BUFFER9
    GL_DRAW_BUFFER10 GL_DRAW_BUFFER11
    GL_DRAW_BUFFER12 GL_DRAW_BUFFER13
    GL_DRAW_BUFFER14 GL_DRAW_BUFFER15
    GL_MAX_FRAGMENT_UNIFORM_COMPONENTS
    GL_MAX_VERTEX_UNIFORM_COMPONENTS
    GL_SAMPLER_3D GL_SAMPLER_2D_SHADOW
    GL_FRAGMENT_SHADER_DERIVATIVE_HINT
    GL_PIXEL_PACK_BUFFER GL_PIXEL_UNPACK_BUFFER
    GL_PIXEL_PACK_BUFFER_BINDING
    GL_PIXEL_UNPACK_BUFFER_BINDING
    GL_FLOAT_MAT2x3 GL_FLOAT_MAT2x4
    GL_FLOAT_MAT3x2 GL_FLOAT_MAT3x4
    GL_FLOAT_MAT4x2 GL_FLOAT_MAT4x3 GL_SRGB
    GL_SRGB8 GL_SRGB8_ALPHA8
    GL_COMPARE_REF_TO_TEXTURE GL_MAJOR_VERSION
    GL_MINOR_VERSION GL_NUM_EXTENSIONS
    GL_RGBA32F GL_RGB32F GL_RGBA16F GL_RGB16F
    GL_VERTEX_ATTRIB_ARRAY_INTEGER
    GL_MAX_ARRAY_TEXTURE_LAYERS
    GL_MIN_PROGRAM_TEXEL_OFFSET
    GL_MAX_PROGRAM_TEXEL_OFFSET
    GL_MAX_VARYING_COMPONENTS
    GL_TEXTURE_2D_ARRAY
    GL_TEXTURE_BINDING_2D_ARRAY
    GL_R11F_G11F_B10F
    GL_UNSIGNED_INT_10F_11F_11F_REV GL_RGB9_E5
    GL_UNSIGNED_INT_5_9_9_9_REV
    GL_TRANSFORM_FEEDBACK_VARYING_MAX_LENGTH
    GL_TRANSFORM_FEEDBACK_BUFFER_MODE
    GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS
    GL_TRANSFORM_FEEDBACK_VARYINGS
    GL_TRANSFORM_FEEDBACK_BUFFER_START
    GL_TRANSFORM_FEEDBACK_BUFFER_SIZE
    GL_TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN
    GL_RASTERIZER_DISCARD
    GL_MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS
    GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS
    GL_INTERLEAVED_ATTRIBS GL_SEPARATE_ATTRIBS
    GL_TRANSFORM_FEEDBACK_BUFFER
    GL_TRANSFORM_FEEDBACK_BUFFER_BINDING
    GL_RGBA32UI GL_RGB32UI GL_RGBA16UI
    GL_RGB16UI GL_RGBA8UI GL_RGB8UI GL_RGBA32I
    GL_RGB32I GL_RGBA16I GL_RGB16I GL_RGBA8I
    GL_RGB8I GL_RED_INTEGER GL_RGB_INTEGER
    GL_RGBA_INTEGER GL_SAMPLER_2D_ARRAY
    GL_SAMPLER_2D_ARRAY_SHADOW
    GL_SAMPLER_CUBE_SHADOW GL_UNSIGNED_INT_VEC2
    GL_UNSIGNED_INT_VEC3 GL_UNSIGNED_INT_VEC4
    GL_INT_SAMPLER_2D GL_INT_SAMPLER_3D
    GL_INT_SAMPLER_CUBE GL_INT_SAMPLER_2D_ARRAY
    GL_UNSIGNED_INT_SAMPLER_2D
    GL_UNSIGNED_INT_SAMPLER_3D
    GL_UNSIGNED_INT_SAMPLER_CUBE
    GL_UNSIGNED_INT_SAMPLER_2D_ARRAY
    GL_BUFFER_ACCESS_FLAGS GL_BUFFER_MAP_LENGTH
    GL_BUFFER_MAP_OFFSET GL_DEPTH_COMPONENT32F
    GL_DEPTH32F_STENCIL8
    GL_FLOAT_32_UNSIGNED_INT_24_8_REV
    GL_FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING
    GL_FRAMEBUFFER_ATTACHMENT_COMPONENT_TYPE
    GL_FRAMEBUFFER_ATTACHMENT_RED_SIZE
    GL_FRAMEBUFFER_ATTACHMENT_GREEN_SIZE
    GL_FRAMEBUFFER_ATTACHMENT_BLUE_SIZE
    GL_FRAMEBUFFER_ATTACHMENT_ALPHA_SIZE
    GL_FRAMEBUFFER_ATTACHMENT_DEPTH_SIZE
    GL_FRAMEBUFFER_ATTACHMENT_STENCIL_SIZE
    GL_FRAMEBUFFER_DEFAULT
    GL_FRAMEBUFFER_UNDEFINED
    GL_DEPTH_STENCIL_ATTACHMENT GL_DEPTH_STENCIL
    GL_UNSIGNED_INT_24_8 GL_DEPTH24_STENCIL8
    GL_UNSIGNED_NORMALIZED
    GL_DRAW_FRAMEBUFFER_BINDING
    GL_READ_FRAMEBUFFER GL_DRAW_FRAMEBUFFER
    GL_READ_FRAMEBUFFER_BINDING
    GL_RENDERBUFFER_SAMPLES
    GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER
    GL_MAX_COLOR_ATTACHMENTS
    GL_COLOR_ATTACHMENT1 GL_COLOR_ATTACHMENT2
    GL_COLOR_ATTACHMENT3 GL_COLOR_ATTACHMENT4
    GL_COLOR_ATTACHMENT5 GL_COLOR_ATTACHMENT6
    GL_COLOR_ATTACHMENT7 GL_COLOR_ATTACHMENT8
    GL_COLOR_ATTACHMENT9 GL_COLOR_ATTACHMENT10
    GL_COLOR_ATTACHMENT11 GL_COLOR_ATTACHMENT12
    GL_COLOR_ATTACHMENT13 GL_COLOR_ATTACHMENT14
    GL_COLOR_ATTACHMENT15 GL_COLOR_ATTACHMENT16
    GL_COLOR_ATTACHMENT17 GL_COLOR_ATTACHMENT18
    GL_COLOR_ATTACHMENT19 GL_COLOR_ATTACHMENT20
    GL_COLOR_ATTACHMENT21 GL_COLOR_ATTACHMENT22
    GL_COLOR_ATTACHMENT23 GL_COLOR_ATTACHMENT24
    GL_COLOR_ATTACHMENT25 GL_COLOR_ATTACHMENT26
    GL_COLOR_ATTACHMENT27 GL_COLOR_ATTACHMENT28
    GL_COLOR_ATTACHMENT29 GL_COLOR_ATTACHMENT30
    GL_COLOR_ATTACHMENT31
    GL_FRAMEBUFFER_INCOMPLETE_MULTISAMPLE
    GL_MAX_SAMPLES GL_HALF_FLOAT GL_MAP_READ_BIT
    GL_MAP_WRITE_BIT GL_MAP_INVALIDATE_RANGE_BIT
    GL_MAP_INVALIDATE_BUFFER_BIT
    GL_MAP_FLUSH_EXPLICIT_BIT
    GL_MAP_UNSYNCHRONIZED_BIT GL_RG
    GL_RG_INTEGER GL_R8 GL_RG8 GL_R16F GL_R32F
    GL_RG16F GL_RG32F GL_R8I GL_R8UI GL_R16I
    GL_R16UI GL_R32I GL_R32UI GL_RG8I GL_RG8UI
    GL_RG16I GL_RG16UI GL_RG32I GL_RG32UI
    GL_VERTEX_ARRAY_BINDING GL_R8_SNORM
    GL_RG8_SNORM GL_RGB8_SNORM GL_RGBA8_SNORM
    GL_SIGNED_NORMALIZED
    GL_PRIMITIVE_RESTART_FIXED_INDEX
    GL_COPY_READ_BUFFER GL_COPY_WRITE_BUFFER
    GL_COPY_READ_BUFFER_BINDING
    GL_COPY_WRITE_BUFFER_BINDING
    GL_UNIFORM_BUFFER GL_UNIFORM_BUFFER_BINDING
    GL_UNIFORM_BUFFER_START
    GL_UNIFORM_BUFFER_SIZE
    GL_MAX_VERTEX_UNIFORM_BLOCKS
    GL_MAX_FRAGMENT_UNIFORM_BLOCKS
    GL_MAX_COMBINED_UNIFORM_BLOCKS
    GL_MAX_UNIFORM_BUFFER_BINDINGS
    GL_MAX_UNIFORM_BLOCK_SIZE
    GL_MAX_COMBINED_VERTEX_UNIFORM_COMPONENTS
    GL_MAX_COMBINED_FRAGMENT_UNIFORM_COMPONENTS
    GL_UNIFORM_BUFFER_OFFSET_ALIGNMENT
    GL_ACTIVE_UNIFORM_BLOCK_MAX_NAME_LENGTH
    GL_ACTIVE_UNIFORM_BLOCKS GL_UNIFORM_TYPE
    GL_UNIFORM_SIZE GL_UNIFORM_NAME_LENGTH
    GL_UNIFORM_BLOCK_INDEX GL_UNIFORM_OFFSET
    GL_UNIFORM_ARRAY_STRIDE
    GL_UNIFORM_MATRIX_STRIDE
    GL_UNIFORM_IS_ROW_MAJOR
    GL_UNIFORM_BLOCK_BINDING
    GL_UNIFORM_BLOCK_DATA_SIZE
    GL_UNIFORM_BLOCK_NAME_LENGTH
    GL_UNIFORM_BLOCK_ACTIVE_UNIFORMS
    GL_UNIFORM_BLOCK_ACTIVE_UNIFORM_INDICES
    GL_UNIFORM_BLOCK_REFERENCED_BY_VERTEX_SHADER
    GL_UNIFORM_BLOCK_REFERENCED_BY_FRAGMENT_SHADER
    GL_INVALID_INDEX
    GL_MAX_VERTEX_OUTPUT_COMPONENTS
    GL_MAX_FRAGMENT_INPUT_COMPONENTS
    GL_MAX_SERVER_WAIT_TIMEOUT GL_OBJECT_TYPE
    GL_SYNC_CONDITION GL_SYNC_STATUS
    GL_SYNC_FLAGS GL_SYNC_FENCE
    GL_SYNC_GPU_COMMANDS_COMPLETE GL_UNSIGNALED
    GL_SIGNALED GL_ALREADY_SIGNALED
    GL_TIMEOUT_EXPIRED GL_CONDITION_SATISFIED
    GL_WAIT_FAILED GL_SYNC_FLUSH_COMMANDS_BIT
    GL_TIMEOUT_IGNORED
    GL_VERTEX_ATTRIB_ARRAY_DIVISOR
    GL_ANY_SAMPLES_PASSED
    GL_ANY_SAMPLES_PASSED_CONSERVATIVE
    GL_SAMPLER_BINDING GL_RGB10_A2UI
    GL_TEXTURE_SWIZZLE_R GL_TEXTURE_SWIZZLE_G
    GL_TEXTURE_SWIZZLE_B GL_TEXTURE_SWIZZLE_A
    GL_GREEN GL_BLUE GL_INT_2_10_10_10_REV
    GL_TRANSFORM_FEEDBACK
    GL_TRANSFORM_FEEDBACK_PAUSED
    GL_TRANSFORM_FEEDBACK_ACTIVE
    GL_TRANSFORM_FEEDBACK_BINDING
    GL_PROGRAM_BINARY_RETRIEVABLE_HINT
    GL_PROGRAM_BINARY_LENGTH
    GL_NUM_PROGRAM_BINARY_FORMATS
    GL_PROGRAM_BINARY_FORMATS
    GL_COMPRESSED_R11_EAC
    GL_COMPRESSED_SIGNED_R11_EAC
    GL_COMPRESSED_RG11_EAC
    GL_COMPRESSED_SIGNED_RG11_EAC
    GL_COMPRESSED_RGB8_ETC2
    GL_COMPRESSED_SRGB8_ETC2
    GL_COMPRESSED_RGB8_PUNCHTHROUGH_ALPHA1_ETC2
    GL_COMPRESSED_SRGB8_PUNCHTHROUGH_ALPHA1_ETC2
    GL_COMPRESSED_RGBA8_ETC2_EAC
    GL_COMPRESSED_SRGB8_ALPHA8_ETC2_EAC
    GL_TEXTURE_IMMUTABLE_FORMAT
    GL_MAX_ELEMENT_INDEX GL_NUM_SAMPLE_COUNTS
    GL_TEXTURE_IMMUTABLE_LEVELS glReadBuffer
    glDrawRangeElements glTexImage3D
    glTexSubImage3D glCopyTexSubImage3D
    glCompressedTexImage3D
    glCompressedTexSubImage3D glGenQueries
    glDeleteQueries glIsQuery glBeginQuery
    glEndQuery glGetQueryiv glGetQueryObjectuiv
    glUnmapBuffer glGetBufferPointerv
    glDrawBuffers glUniformMatrix2x3fv
    glUniformMatrix3x2fv glUniformMatrix2x4fv
    glUniformMatrix4x2fv glUniformMatrix3x4fv
    glUniformMatrix4x3fv glBlitFramebuffer
    glRenderbufferStorageMultisample
    glFramebufferTextureLayer glMapBufferRange
    glFlushMappedBufferRange glBindVertexArray
    glDeleteVertexArrays glGenVertexArrays
    glIsVertexArray glGetIntegeri_v
    glBeginTransformFeedback
    glEndTransformFeedback glBindBufferRange
    glBindBufferBase glTransformFeedbackVaryings
    glGetTransformFeedbackVarying
    glVertexAttribIPointer glGetVertexAttribIiv
    glGetVertexAttribIuiv glVertexAttribI4i
    glVertexAttribI4ui glVertexAttribI4iv
    glVertexAttribI4uiv glGetUniformuiv
    glGetFragDataLocation glUniform1ui
    glUniform2ui glUniform3ui glUniform4ui
    glUniform1uiv glUniform2uiv glUniform3uiv
    glUniform4uiv glClearBufferiv
    glClearBufferuiv glClearBufferfv
    glClearBufferfi glGetStringi
    glCopyBufferSubData glGetUniformIndices
    glGetActiveUniformsiv glGetUniformBlockIndex
    glGetActiveUniformBlockiv
    glGetActiveUniformBlockName
    glUniformBlockBinding glDrawArraysInstanced
    glDrawElementsInstanced glFenceSync glIsSync
    glDeleteSync glClientWaitSync glWaitSync
    glGetInteger64v glGetSynciv
    glGetInteger64i_v glGetBufferParameteri64v
    glGenSamplers glDeleteSamplers glIsSampler
    glBindSampler glSamplerParameteri
    glSamplerParameteriv glSamplerParameterf
    glSamplerParameterfv glGetSamplerParameteriv
    glGetSamplerParameterfv
    glVertexAttribDivisor
    glBindTransformFeedback
    glDeleteTransformFeedbacks
    glGenTransformFeedbacks
    glIsTransformFeedback
    glPauseTransformFeedback
    glResumeTransformFeedback glGetProgramBinary
    glProgramBinary glProgramParameteri
    ;; glInvalidateFramebuffer ;; osx
    ;; glInvalidateSubFramebuffer ;; osx
    glTexStorage2D
    glTexStorage3D glGetInternalformativ
    ;; gles2
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
  (import
    (chezscheme) (interop) (khronos) (gles2))
  (define GL_ES_VERSION_3_0 1)
  ;; gle3-typedefs
  (define-ftype GLhalf unsigned-short)
  ;; gles3-defines
  (define GL_READ_BUFFER 3074)
  (define GL_UNPACK_ROW_LENGTH 3314)
  (define GL_UNPACK_SKIP_ROWS 3315)
  (define GL_UNPACK_SKIP_PIXELS 3316)
  (define GL_PACK_ROW_LENGTH 3330)
  (define GL_PACK_SKIP_ROWS 3331)
  (define GL_PACK_SKIP_PIXELS 3332)
  (define GL_COLOR 6144)
  (define GL_DEPTH 6145)
  (define GL_STENCIL 6146)
  (define GL_RED 6403)
  (define GL_RGB8 32849)
  (define GL_RGBA8 32856)
  (define GL_RGB10_A2 32857)
  (define GL_TEXTURE_BINDING_3D 32874)
  (define GL_UNPACK_SKIP_IMAGES 32877)
  (define GL_UNPACK_IMAGE_HEIGHT 32878)
  (define GL_TEXTURE_3D 32879)
  (define GL_TEXTURE_WRAP_R 32882)
  (define GL_MAX_3D_TEXTURE_SIZE 32883)
  (define GL_UNSIGNED_INT_2_10_10_10_REV 33640)
  (define GL_MAX_ELEMENTS_VERTICES 33000)
  (define GL_MAX_ELEMENTS_INDICES 33001)
  (define GL_TEXTURE_MIN_LOD 33082)
  (define GL_TEXTURE_MAX_LOD 33083)
  (define GL_TEXTURE_BASE_LEVEL 33084)
  (define GL_TEXTURE_MAX_LEVEL 33085)
  (define GL_MIN 32775)
  (define GL_MAX 32776)
  (define GL_DEPTH_COMPONENT24 33190)
  (define GL_MAX_TEXTURE_LOD_BIAS 34045)
  (define GL_TEXTURE_COMPARE_MODE 34892)
  (define GL_TEXTURE_COMPARE_FUNC 34893)
  (define GL_CURRENT_QUERY 34917)
  (define GL_QUERY_RESULT 34918)
  (define GL_QUERY_RESULT_AVAILABLE 34919)
  (define GL_BUFFER_MAPPED 35004)
  (define GL_BUFFER_MAP_POINTER 35005)
  (define GL_STREAM_READ 35041)
  (define GL_STREAM_COPY 35042)
  (define GL_STATIC_READ 35045)
  (define GL_STATIC_COPY 35046)
  (define GL_DYNAMIC_READ 35049)
  (define GL_DYNAMIC_COPY 35050)
  (define GL_MAX_DRAW_BUFFERS 34852)
  (define GL_DRAW_BUFFER0 34853)
  (define GL_DRAW_BUFFER1 34854)
  (define GL_DRAW_BUFFER2 34855)
  (define GL_DRAW_BUFFER3 34856)
  (define GL_DRAW_BUFFER4 34857)
  (define GL_DRAW_BUFFER5 34858)
  (define GL_DRAW_BUFFER6 34859)
  (define GL_DRAW_BUFFER7 34860)
  (define GL_DRAW_BUFFER8 34861)
  (define GL_DRAW_BUFFER9 34862)
  (define GL_DRAW_BUFFER10 34863)
  (define GL_DRAW_BUFFER11 34864)
  (define GL_DRAW_BUFFER12 34865)
  (define GL_DRAW_BUFFER13 34866)
  (define GL_DRAW_BUFFER14 34867)
  (define GL_DRAW_BUFFER15 34868)
  (define GL_MAX_FRAGMENT_UNIFORM_COMPONENTS 35657)
  (define GL_MAX_VERTEX_UNIFORM_COMPONENTS 35658)
  (define GL_SAMPLER_3D 35679)
  (define GL_SAMPLER_2D_SHADOW 35682)
  (define GL_FRAGMENT_SHADER_DERIVATIVE_HINT 35723)
  (define GL_PIXEL_PACK_BUFFER 35051)
  (define GL_PIXEL_UNPACK_BUFFER 35052)
  (define GL_PIXEL_PACK_BUFFER_BINDING 35053)
  (define GL_PIXEL_UNPACK_BUFFER_BINDING 35055)
  (define GL_FLOAT_MAT2x3 35685)
  (define GL_FLOAT_MAT2x4 35686)
  (define GL_FLOAT_MAT3x2 35687)
  (define GL_FLOAT_MAT3x4 35688)
  (define GL_FLOAT_MAT4x2 35689)
  (define GL_FLOAT_MAT4x3 35690)
  (define GL_SRGB 35904)
  (define GL_SRGB8 35905)
  (define GL_SRGB8_ALPHA8 35907)
  (define GL_COMPARE_REF_TO_TEXTURE 34894)
  (define GL_MAJOR_VERSION 33307)
  (define GL_MINOR_VERSION 33308)
  (define GL_NUM_EXTENSIONS 33309)
  (define GL_RGBA32F 34836)
  (define GL_RGB32F 34837)
  (define GL_RGBA16F 34842)
  (define GL_RGB16F 34843)
  (define GL_VERTEX_ATTRIB_ARRAY_INTEGER 35069)
  (define GL_MAX_ARRAY_TEXTURE_LAYERS 35071)
  (define GL_MIN_PROGRAM_TEXEL_OFFSET 35076)
  (define GL_MAX_PROGRAM_TEXEL_OFFSET 35077)
  (define GL_MAX_VARYING_COMPONENTS 35659)
  (define GL_TEXTURE_2D_ARRAY 35866)
  (define GL_TEXTURE_BINDING_2D_ARRAY 35869)
  (define GL_R11F_G11F_B10F 35898)
  (define GL_UNSIGNED_INT_10F_11F_11F_REV 35899)
  (define GL_RGB9_E5 35901)
  (define GL_UNSIGNED_INT_5_9_9_9_REV 35902)
  (define GL_TRANSFORM_FEEDBACK_VARYING_MAX_LENGTH 35958)
  (define GL_TRANSFORM_FEEDBACK_BUFFER_MODE 35967)
  (define GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS 35968)
  (define GL_TRANSFORM_FEEDBACK_VARYINGS 35971)
  (define GL_TRANSFORM_FEEDBACK_BUFFER_START 35972)
  (define GL_TRANSFORM_FEEDBACK_BUFFER_SIZE 35973)
  (define GL_TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN 35976)
  (define GL_RASTERIZER_DISCARD 35977)
  (define GL_MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS 35978)
  (define GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS 35979)
  (define GL_INTERLEAVED_ATTRIBS 35980)
  (define GL_SEPARATE_ATTRIBS 35981)
  (define GL_TRANSFORM_FEEDBACK_BUFFER 35982)
  (define GL_TRANSFORM_FEEDBACK_BUFFER_BINDING 35983)
  (define GL_RGBA32UI 36208)
  (define GL_RGB32UI 36209)
  (define GL_RGBA16UI 36214)
  (define GL_RGB16UI 36215)
  (define GL_RGBA8UI 36220)
  (define GL_RGB8UI 36221)
  (define GL_RGBA32I 36226)
  (define GL_RGB32I 36227)
  (define GL_RGBA16I 36232)
  (define GL_RGB16I 36233)
  (define GL_RGBA8I 36238)
  (define GL_RGB8I 36239)
  (define GL_RED_INTEGER 36244)
  (define GL_RGB_INTEGER 36248)
  (define GL_RGBA_INTEGER 36249)
  (define GL_SAMPLER_2D_ARRAY 36289)
  (define GL_SAMPLER_2D_ARRAY_SHADOW 36292)
  (define GL_SAMPLER_CUBE_SHADOW 36293)
  (define GL_UNSIGNED_INT_VEC2 36294)
  (define GL_UNSIGNED_INT_VEC3 36295)
  (define GL_UNSIGNED_INT_VEC4 36296)
  (define GL_INT_SAMPLER_2D 36298)
  (define GL_INT_SAMPLER_3D 36299)
  (define GL_INT_SAMPLER_CUBE 36300)
  (define GL_INT_SAMPLER_2D_ARRAY 36303)
  (define GL_UNSIGNED_INT_SAMPLER_2D 36306)
  (define GL_UNSIGNED_INT_SAMPLER_3D 36307)
  (define GL_UNSIGNED_INT_SAMPLER_CUBE 36308)
  (define GL_UNSIGNED_INT_SAMPLER_2D_ARRAY 36311)
  (define GL_BUFFER_ACCESS_FLAGS 37151)
  (define GL_BUFFER_MAP_LENGTH 37152)
  (define GL_BUFFER_MAP_OFFSET 37153)
  (define GL_DEPTH_COMPONENT32F 36012)
  (define GL_DEPTH32F_STENCIL8 36013)
  (define GL_FLOAT_32_UNSIGNED_INT_24_8_REV 36269)
  (define GL_FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING 33296)
  (define GL_FRAMEBUFFER_ATTACHMENT_COMPONENT_TYPE 33297)
  (define GL_FRAMEBUFFER_ATTACHMENT_RED_SIZE 33298)
  (define GL_FRAMEBUFFER_ATTACHMENT_GREEN_SIZE 33299)
  (define GL_FRAMEBUFFER_ATTACHMENT_BLUE_SIZE 33300)
  (define GL_FRAMEBUFFER_ATTACHMENT_ALPHA_SIZE 33301)
  (define GL_FRAMEBUFFER_ATTACHMENT_DEPTH_SIZE 33302)
  (define GL_FRAMEBUFFER_ATTACHMENT_STENCIL_SIZE 33303)
  (define GL_FRAMEBUFFER_DEFAULT 33304)
  (define GL_FRAMEBUFFER_UNDEFINED 33305)
  (define GL_DEPTH_STENCIL_ATTACHMENT 33306)
  (define GL_DEPTH_STENCIL 34041)
  (define GL_UNSIGNED_INT_24_8 34042)
  (define GL_DEPTH24_STENCIL8 35056)
  (define GL_UNSIGNED_NORMALIZED 35863)
  (define GL_DRAW_FRAMEBUFFER_BINDING 36006)
  (define GL_READ_FRAMEBUFFER 36008)
  (define GL_DRAW_FRAMEBUFFER 36009)
  (define GL_READ_FRAMEBUFFER_BINDING 36010)
  (define GL_RENDERBUFFER_SAMPLES 36011)
  (define GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER 36052)
  (define GL_MAX_COLOR_ATTACHMENTS 36063)
  (define GL_COLOR_ATTACHMENT1 36065)
  (define GL_COLOR_ATTACHMENT2 36066)
  (define GL_COLOR_ATTACHMENT3 36067)
  (define GL_COLOR_ATTACHMENT4 36068)
  (define GL_COLOR_ATTACHMENT5 36069)
  (define GL_COLOR_ATTACHMENT6 36070)
  (define GL_COLOR_ATTACHMENT7 36071)
  (define GL_COLOR_ATTACHMENT8 36072)
  (define GL_COLOR_ATTACHMENT9 36073)
  (define GL_COLOR_ATTACHMENT10 36074)
  (define GL_COLOR_ATTACHMENT11 36075)
  (define GL_COLOR_ATTACHMENT12 36076)
  (define GL_COLOR_ATTACHMENT13 36077)
  (define GL_COLOR_ATTACHMENT14 36078)
  (define GL_COLOR_ATTACHMENT15 36079)
  (define GL_COLOR_ATTACHMENT16 36080)
  (define GL_COLOR_ATTACHMENT17 36081)
  (define GL_COLOR_ATTACHMENT18 36082)
  (define GL_COLOR_ATTACHMENT19 36083)
  (define GL_COLOR_ATTACHMENT20 36084)
  (define GL_COLOR_ATTACHMENT21 36085)
  (define GL_COLOR_ATTACHMENT22 36086)
  (define GL_COLOR_ATTACHMENT23 36087)
  (define GL_COLOR_ATTACHMENT24 36088)
  (define GL_COLOR_ATTACHMENT25 36089)
  (define GL_COLOR_ATTACHMENT26 36090)
  (define GL_COLOR_ATTACHMENT27 36091)
  (define GL_COLOR_ATTACHMENT28 36092)
  (define GL_COLOR_ATTACHMENT29 36093)
  (define GL_COLOR_ATTACHMENT30 36094)
  (define GL_COLOR_ATTACHMENT31 36095)
  (define GL_FRAMEBUFFER_INCOMPLETE_MULTISAMPLE 36182)
  (define GL_MAX_SAMPLES 36183)
  (define GL_HALF_FLOAT 5131)
  (define GL_MAP_READ_BIT 1)
  (define GL_MAP_WRITE_BIT 2)
  (define GL_MAP_INVALIDATE_RANGE_BIT 4)
  (define GL_MAP_INVALIDATE_BUFFER_BIT 8)
  (define GL_MAP_FLUSH_EXPLICIT_BIT 16)
  (define GL_MAP_UNSYNCHRONIZED_BIT 32)
  (define GL_RG 33319)
  (define GL_RG_INTEGER 33320)
  (define GL_R8 33321)
  (define GL_RG8 33323)
  (define GL_R16F 33325)
  (define GL_R32F 33326)
  (define GL_RG16F 33327)
  (define GL_RG32F 33328)
  (define GL_R8I 33329)
  (define GL_R8UI 33330)
  (define GL_R16I 33331)
  (define GL_R16UI 33332)
  (define GL_R32I 33333)
  (define GL_R32UI 33334)
  (define GL_RG8I 33335)
  (define GL_RG8UI 33336)
  (define GL_RG16I 33337)
  (define GL_RG16UI 33338)
  (define GL_RG32I 33339)
  (define GL_RG32UI 33340)
  (define GL_VERTEX_ARRAY_BINDING 34229)
  (define GL_R8_SNORM 36756)
  (define GL_RG8_SNORM 36757)
  (define GL_RGB8_SNORM 36758)
  (define GL_RGBA8_SNORM 36759)
  (define GL_SIGNED_NORMALIZED 36764)
  (define GL_PRIMITIVE_RESTART_FIXED_INDEX 36201)
  (define GL_COPY_READ_BUFFER 36662)
  (define GL_COPY_WRITE_BUFFER 36663)
  (define GL_COPY_READ_BUFFER_BINDING 36662)
  (define GL_COPY_WRITE_BUFFER_BINDING 36663)
  (define GL_UNIFORM_BUFFER 35345)
  (define GL_UNIFORM_BUFFER_BINDING 35368)
  (define GL_UNIFORM_BUFFER_START 35369)
  (define GL_UNIFORM_BUFFER_SIZE 35370)
  (define GL_MAX_VERTEX_UNIFORM_BLOCKS 35371)
  (define GL_MAX_FRAGMENT_UNIFORM_BLOCKS 35373)
  (define GL_MAX_COMBINED_UNIFORM_BLOCKS 35374)
  (define GL_MAX_UNIFORM_BUFFER_BINDINGS 35375)
  (define GL_MAX_UNIFORM_BLOCK_SIZE 35376)
  (define GL_MAX_COMBINED_VERTEX_UNIFORM_COMPONENTS 35377)
  (define GL_MAX_COMBINED_FRAGMENT_UNIFORM_COMPONENTS 35379)
  (define GL_UNIFORM_BUFFER_OFFSET_ALIGNMENT 35380)
  (define GL_ACTIVE_UNIFORM_BLOCK_MAX_NAME_LENGTH 35381)
  (define GL_ACTIVE_UNIFORM_BLOCKS 35382)
  (define GL_UNIFORM_TYPE 35383)
  (define GL_UNIFORM_SIZE 35384)
  (define GL_UNIFORM_NAME_LENGTH 35385)
  (define GL_UNIFORM_BLOCK_INDEX 35386)
  (define GL_UNIFORM_OFFSET 35387)
  (define GL_UNIFORM_ARRAY_STRIDE 35388)
  (define GL_UNIFORM_MATRIX_STRIDE 35389)
  (define GL_UNIFORM_IS_ROW_MAJOR 35390)
  (define GL_UNIFORM_BLOCK_BINDING 35391)
  (define GL_UNIFORM_BLOCK_DATA_SIZE 35392)
  (define GL_UNIFORM_BLOCK_NAME_LENGTH 35393)
  (define GL_UNIFORM_BLOCK_ACTIVE_UNIFORMS 35394)
  (define GL_UNIFORM_BLOCK_ACTIVE_UNIFORM_INDICES 35395)
  (define GL_UNIFORM_BLOCK_REFERENCED_BY_VERTEX_SHADER 35396)
  (define GL_UNIFORM_BLOCK_REFERENCED_BY_FRAGMENT_SHADER 35398)
  (define GL_INVALID_INDEX 4294967295)
  (define GL_MAX_VERTEX_OUTPUT_COMPONENTS 37154)
  (define GL_MAX_FRAGMENT_INPUT_COMPONENTS 37157)
  (define GL_MAX_SERVER_WAIT_TIMEOUT 37137)
  (define GL_OBJECT_TYPE 37138)
  (define GL_SYNC_CONDITION 37139)
  (define GL_SYNC_STATUS 37140)
  (define GL_SYNC_FLAGS 37141)
  (define GL_SYNC_FENCE 37142)
  (define GL_SYNC_GPU_COMMANDS_COMPLETE 37143)
  (define GL_UNSIGNALED 37144)
  (define GL_SIGNALED 37145)
  (define GL_ALREADY_SIGNALED 37146)
  (define GL_TIMEOUT_EXPIRED 37147)
  (define GL_CONDITION_SATISFIED 37148)
  (define GL_WAIT_FAILED 37149)
  (define GL_SYNC_FLUSH_COMMANDS_BIT 1)
  (define GL_TIMEOUT_IGNORED 18446744073709551615)
  (define GL_VERTEX_ATTRIB_ARRAY_DIVISOR 35070)
  (define GL_ANY_SAMPLES_PASSED 35887)
  (define GL_ANY_SAMPLES_PASSED_CONSERVATIVE 36202)
  (define GL_SAMPLER_BINDING 35097)
  (define GL_RGB10_A2UI 36975)
  (define GL_TEXTURE_SWIZZLE_R 36418)
  (define GL_TEXTURE_SWIZZLE_G 36419)
  (define GL_TEXTURE_SWIZZLE_B 36420)
  (define GL_TEXTURE_SWIZZLE_A 36421)
  (define GL_GREEN 6404)
  (define GL_BLUE 6405)
  (define GL_INT_2_10_10_10_REV 36255)
  (define GL_TRANSFORM_FEEDBACK 36386)
  (define GL_TRANSFORM_FEEDBACK_PAUSED 36387)
  (define GL_TRANSFORM_FEEDBACK_ACTIVE 36388)
  (define GL_TRANSFORM_FEEDBACK_BINDING 36389)
  (define GL_PROGRAM_BINARY_RETRIEVABLE_HINT 33367)
  (define GL_PROGRAM_BINARY_LENGTH 34625)
  (define GL_NUM_PROGRAM_BINARY_FORMATS 34814)
  (define GL_PROGRAM_BINARY_FORMATS 34815)
  (define GL_COMPRESSED_R11_EAC 37488)
  (define GL_COMPRESSED_SIGNED_R11_EAC 37489)
  (define GL_COMPRESSED_RG11_EAC 37490)
  (define GL_COMPRESSED_SIGNED_RG11_EAC 37491)
  (define GL_COMPRESSED_RGB8_ETC2 37492)
  (define GL_COMPRESSED_SRGB8_ETC2 37493)
  (define GL_COMPRESSED_RGB8_PUNCHTHROUGH_ALPHA1_ETC2 37494)
  (define GL_COMPRESSED_SRGB8_PUNCHTHROUGH_ALPHA1_ETC2 37495)
  (define GL_COMPRESSED_RGBA8_ETC2_EAC 37496)
  (define GL_COMPRESSED_SRGB8_ALPHA8_ETC2_EAC 37497)
  (define GL_TEXTURE_IMMUTABLE_FORMAT 37167)
  (define GL_MAX_ELEMENT_INDEX 36203)
  (define GL_NUM_SAMPLE_COUNTS 37760)
  (define GL_TEXTURE_IMMUTABLE_LEVELS 33503)
  
  ;; gles3-funcs
  (define-ftype-fn1-gl glReadBuffer (function (GLenum) void))
  (define-ftype-fn1-gl glDrawRangeElements (function (GLenum GLuint GLuint GLsizei GLenum void*) void))
  (define-ftype-fn1-gl glTexImage3D (function (GLenum GLint GLint GLsizei GLsizei GLsizei GLint GLenum GLenum void*) void))
  (define-ftype-fn1-gl glTexSubImage3D (function (GLenum GLint GLint GLint GLint GLsizei GLsizei GLsizei GLenum GLenum void*) void))
  (define-ftype-fn1-gl glCopyTexSubImage3D (function (GLenum GLint GLint GLint GLint GLint GLint GLsizei GLsizei) void))
  (define-ftype-fn1-gl glCompressedTexImage3D (function (GLenum GLint GLenum GLsizei GLsizei GLsizei GLint GLsizei void*) void))
  (define-ftype-fn1-gl glCompressedTexSubImage3D (function (GLenum GLint GLint GLint GLint GLsizei GLsizei GLsizei GLenum GLsizei void*) void))
  (define-ftype-fn1-gl glGenQueries (function (GLsizei (* GLuint)) void))
  (define-ftype-fn1-gl glDeleteQueries (function (GLsizei (* GLuint)) void))
  (define-ftype-fn1-gl glIsQuery (function (GLuint) GLboolean))
  (define-ftype-fn1-gl glBeginQuery (function (GLenum GLuint) void))
  (define-ftype-fn1-gl glEndQuery (function (GLenum) void))
  (define-ftype-fn1-gl glGetQueryiv (function (GLenum GLenum (* GLint)) void))
  (define-ftype-fn1-gl glGetQueryObjectuiv (function (GLuint GLenum (* GLuint)) void))
  (define-ftype-fn1-gl glUnmapBuffer (function (GLenum) GLboolean))
  (define-ftype-fn1-gl glGetBufferPointerv (function (GLenum GLenum (* void*)) void))
  (define-ftype-fn1-gl glDrawBuffers (function (GLsizei (* GLenum)) void))
  (define-ftype-fn1-gl glUniformMatrix2x3fv (function (GLint GLsizei GLboolean (* GLfloat)) void))
  (define-ftype-fn1-gl glUniformMatrix3x2fv (function (GLint GLsizei GLboolean (* GLfloat)) void))
  (define-ftype-fn1-gl glUniformMatrix2x4fv (function (GLint GLsizei GLboolean (* GLfloat)) void))
  (define-ftype-fn1-gl glUniformMatrix4x2fv (function (GLint GLsizei GLboolean (* GLfloat)) void))
  (define-ftype-fn1-gl glUniformMatrix3x4fv (function (GLint GLsizei GLboolean (* GLfloat)) void))
  (define-ftype-fn1-gl glUniformMatrix4x3fv (function (GLint GLsizei GLboolean (* GLfloat)) void))
  (define-ftype-fn1-gl glBlitFramebuffer (function (GLint GLint GLint GLint GLint GLint GLint GLint GLbitfield GLenum) void))
  (define-ftype-fn1-gl glRenderbufferStorageMultisample (function (GLenum GLsizei GLenum GLsizei GLsizei) void))
  (define-ftype-fn1-gl glFramebufferTextureLayer (function (GLenum GLenum GLuint GLint GLint) void))
  (define-ftype-fn1-gl glMapBufferRange (function (GLenum GLintptr GLsizeiptr GLbitfield) void*))
  (define-ftype-fn1-gl glFlushMappedBufferRange (function (GLenum GLintptr GLsizeiptr) void))
  (define-ftype-fn1-gl glBindVertexArray (function (GLuint) void))
  (define-ftype-fn1-gl glDeleteVertexArrays (function (GLsizei (* GLuint)) void))
  (define-ftype-fn1-gl glGenVertexArrays (function (GLsizei (* GLuint)) void))
  (define-ftype-fn1-gl glIsVertexArray (function (GLuint) GLboolean))
  (define-ftype-fn1-gl glGetIntegeri_v (function (GLenum GLuint (* GLint)) void))
  (define-ftype-fn1-gl glBeginTransformFeedback (function (GLenum) void))
  (define-ftype-fn1-gl glEndTransformFeedback (function () void))
  (define-ftype-fn1-gl glBindBufferRange (function (GLenum GLuint GLuint GLintptr GLsizeiptr) void))
  (define-ftype-fn1-gl glBindBufferBase (function (GLenum GLuint GLuint) void))
  (define-ftype-fn1-gl glTransformFeedbackVaryings (function (GLuint GLsizei (* GLchar) GLenum) void))
  (define-ftype-fn1-gl glGetTransformFeedbackVarying (function (GLuint GLuint GLsizei (* GLsizei) (* GLsizei) (* GLenum) (* GLchar)) void))
  (define-ftype-fn1-gl glVertexAttribIPointer (function (GLuint GLint GLenum GLsizei void*) void))
  (define-ftype-fn1-gl glGetVertexAttribIiv (function (GLuint GLenum (* GLint)) void))
  (define-ftype-fn1-gl glGetVertexAttribIuiv (function (GLuint GLenum (* GLuint)) void))
  (define-ftype-fn1-gl glVertexAttribI4i (function (GLuint GLint GLint GLint GLint) void))
  (define-ftype-fn1-gl glVertexAttribI4ui (function (GLuint GLuint GLuint GLuint GLuint) void))
  (define-ftype-fn1-gl glVertexAttribI4iv (function (GLuint (* GLint)) void))
  (define-ftype-fn1-gl glVertexAttribI4uiv (function (GLuint (* GLuint)) void))
  (define-ftype-fn1-gl glGetUniformuiv (function (GLuint GLint (* GLuint)) void))
  (define-ftype-fn1-gl glGetFragDataLocation (function (GLuint (* GLchar)) GLint))
  (define-ftype-fn1-gl glUniform1ui (function (GLint GLuint) void))
  (define-ftype-fn1-gl glUniform2ui (function (GLint GLuint GLuint) void))
  (define-ftype-fn1-gl glUniform3ui (function (GLint GLuint GLuint GLuint) void))
  (define-ftype-fn1-gl glUniform4ui (function (GLint GLuint GLuint GLuint GLuint) void))
  (define-ftype-fn1-gl glUniform1uiv (function (GLint GLsizei (* GLuint)) void))
  (define-ftype-fn1-gl glUniform2uiv (function (GLint GLsizei (* GLuint)) void))
  (define-ftype-fn1-gl glUniform3uiv (function (GLint GLsizei (* GLuint)) void))
  (define-ftype-fn1-gl glUniform4uiv (function (GLint GLsizei (* GLuint)) void))
  (define-ftype-fn1-gl glClearBufferiv (function (GLenum GLint (* GLint)) void))
  (define-ftype-fn1-gl glClearBufferuiv (function (GLenum GLint (* GLuint)) void))
  (define-ftype-fn1-gl glClearBufferfv (function (GLenum GLint (* GLfloat)) void))
  (define-ftype-fn1-gl glClearBufferfi (function (GLenum GLint GLfloat GLint) void))
  (define-ftype-fn1-gl glGetStringi (function (GLenum GLuint) (* GLubyte)))
  (define-ftype-fn1-gl glCopyBufferSubData (function (GLenum GLenum GLintptr GLintptr GLsizeiptr) void))
  (define-ftype-fn1-gl glGetUniformIndices (function (GLuint GLsizei (* GLchar) (* GLuint)) void))
  (define-ftype-fn1-gl glGetActiveUniformsiv (function (GLuint GLsizei (* GLuint) GLenum (* GLint)) void))
  (define-ftype-fn1-gl glGetUniformBlockIndex (function (GLuint (* GLchar)) GLuint))
  (define-ftype-fn1-gl glGetActiveUniformBlockiv (function (GLuint GLuint GLenum (* GLint)) void))
  (define-ftype-fn1-gl glGetActiveUniformBlockName (function (GLuint GLuint GLsizei (* GLsizei) (* GLchar)) void))
  (define-ftype-fn1-gl glUniformBlockBinding (function (GLuint GLuint GLuint) void))
  (define-ftype-fn1-gl glDrawArraysInstanced (function (GLenum GLint GLsizei GLsizei) void))
  (define-ftype-fn1-gl glDrawElementsInstanced (function (GLenum GLsizei GLenum void* GLsizei) void))
  (define-ftype-fn1-gl glFenceSync (function (GLenum GLbitfield) GLsync))
  (define-ftype-fn1-gl glIsSync (function (GLsync) GLboolean))
  (define-ftype-fn1-gl glDeleteSync (function (GLsync) void))
  (define-ftype-fn1-gl glClientWaitSync (function (GLsync GLbitfield GLuint64) GLenum))
  (define-ftype-fn1-gl glWaitSync (function (GLsync GLbitfield GLuint64) void))
  (define-ftype-fn1-gl glGetInteger64v (function (GLenum (* GLint64)) void))
  (define-ftype-fn1-gl glGetSynciv (function (GLsync GLenum GLsizei (* GLsizei) (* GLint)) void))
  (define-ftype-fn1-gl glGetInteger64i_v (function (GLenum GLuint (* GLint64)) void))
  (define-ftype-fn1-gl glGetBufferParameteri64v (function (GLenum GLenum (* GLint64)) void))
  (define-ftype-fn1-gl glGenSamplers (function (GLsizei (* GLuint)) void))
  (define-ftype-fn1-gl glDeleteSamplers (function (GLsizei (* GLuint)) void))
  (define-ftype-fn1-gl glIsSampler (function (GLuint) GLboolean))
  (define-ftype-fn1-gl glBindSampler (function (GLuint GLuint) void))
  (define-ftype-fn1-gl glSamplerParameteri (function (GLuint GLenum GLint) void))
  (define-ftype-fn1-gl glSamplerParameteriv (function (GLuint GLenum (* GLint)) void))
  (define-ftype-fn1-gl glSamplerParameterf (function (GLuint GLenum GLfloat) void))
  (define-ftype-fn1-gl glSamplerParameterfv (function (GLuint GLenum (* GLfloat)) void))
  (define-ftype-fn1-gl glGetSamplerParameteriv (function (GLuint GLenum (* GLint)) void))
  (define-ftype-fn1-gl glGetSamplerParameterfv (function (GLuint GLenum (* GLfloat)) void))
  (define-ftype-fn1-gl glVertexAttribDivisor (function (GLuint GLuint) void))
  (define-ftype-fn1-gl glBindTransformFeedback (function (GLenum GLuint) void))
  (define-ftype-fn1-gl glDeleteTransformFeedbacks (function (GLsizei (* GLuint)) void))
  (define-ftype-fn1-gl glGenTransformFeedbacks (function (GLsizei (* GLuint)) void))
  (define-ftype-fn1-gl glIsTransformFeedback (function (GLuint) GLboolean))
  (define-ftype-fn1-gl glPauseTransformFeedback (function () void))
  (define-ftype-fn1-gl glResumeTransformFeedback (function () void))
  (define-ftype-fn1-gl glGetProgramBinary (function (GLuint GLsizei (* GLsizei) (* GLenum) void*) void))
  (define-ftype-fn1-gl glProgramBinary (function (GLuint GLenum void* GLsizei) void))
  (define-ftype-fn1-gl glProgramParameteri (function (GLuint GLenum GLint) void))
  ;; (define-ftype-fn1-gl glInvalidateFramebuffer (function (GLenum GLsizei (* GLenum)) void)) ;; osx
  ;; (define-ftype-fn1-gl glInvalidateSubFramebuffer (function (GLenum GLsizei (* GLenum) GLint GLint GLsizei GLsizei) void)) ;; osx
  (define-ftype-fn1-gl glTexStorage2D (function (GLenum GLsizei GLenum GLsizei GLsizei) void))
  (define-ftype-fn1-gl glTexStorage3D (function (GLenum GLsizei GLenum GLsizei GLsizei GLsizei) void))
  (define-ftype-fn1-gl glGetInternalformativ (function (GLenum GLenum GLenum GLsizei (* GLint)) void))
  )
