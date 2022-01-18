(library (opencl1_2)
  ;; /usr/include/CL/cl.h
  ;; /usr/include/CL/cl_platform.h
  ;; /usr/include/CL/cl_gl.h
  ;; /System/Library/Frameworks/OpenCL.framework/Versions/A/Headers/cl.h
  ;; /System/Library/Frameworks/OpenCL.framework/Versions/A/Headers/cl_platform.h
  ;; /System/Library/Frameworks/OpenCL.framework/Versions/A/Headers/cl_gl.h
  (export
    CL_DEVICE_NOT_FOUND
    CL_DEVICE_TYPE_DEFAULT CL_DEVICE_TYPE_CPU
    CL_DEVICE_TYPE_GPU CL_DEVICE_TYPE_ACCELERATOR
    CL_DEVICE_TYPE_CUSTOM CL_DEVICE_TYPE_ALL CL_SUCCESS
    CL_INVALID_VALUE CL_PLATFORM_PROFILE
    CL_PLATFORM_VERSION CL_PLATFORM_NAME
    CL_PLATFORM_VENDOR CL_PLATFORM_EXTENSIONS
    CL_MEM_READ_WRITE CL_MEM_WRITE_ONLY
    CL_MEM_READ_ONLY CL_MEM_USE_HOST_PTR
    CL_MEM_ALLOC_HOST_PTR CL_MEM_COPY_HOST_PTR CL_FALSE
    CL_INVALID_WORK_GROUP_SIZE CL_DEVICE_TYPE
    CL_CONTEXT_PLATFORM CL_GL_CONTEXT_KHR CL_GLX_DISPLAY_KHR
    ;;
    libOcl define-function-ocl
    ;;
    cl_uint cl_int cl_bool cl_context cl_platform_id
    cl_device_id cl_command_queue cl_mem cl_program
    cl_kernel cl_event cl_sampler cl_addressing_mode
    cl_buffer_create_type cl_build_status
    cl_channel_order cl_channel_type
    cl_command_queue_info cl_command_queue_properties
    cl_command_type cl_context_info
    cl_context_properties cl_d3d10_device_set_khr
    cl_d3d10_device_source_khr cl_d3d11_device_set_khr
    cl_d3d11_device_source_khr
    cl_device_affinity_domain
    cl_device_exec_capabilities cl_device_fp_config
    cl_device_info cl_device_local_mem_type
    cl_device_mem_cache_type
    cl_device_partition_property cl_device_type
    cl_event_info cl_filter_mode cl_gl_context_info
    cl_gl_object_type cl_gl_texture_info cl_image_info
    cl_kernel_arg_address_qualifier
    cl_kernel_arg_access_qualifier cl_kernel_arg_info
    cl_kernel_info cl_kernel_work_group_info
    cl_map_flags cl_mem_flags cl_mem_info
    cl_mem_migration_flags cl_mem_object_type
    cl_platform_info cl_profiling_info
    cl_program_binary_type cl_program_build_info
    cl_program_info cl_sampler_info
    ;;
    pfn_notify_create_context
    clCreateContext
    clGetPlatformIDs clGetPlatformInfo clGetDeviceIDs
    clGetDeviceInfo clCreateCommandQueue clCreateBuffer
    clEnqueueReadBuffer clEnqueueWriteBuffer 
    clCreateProgramWithSource
    pfn_notify_build_program
    clBuildProgram clCreateKernel clSetKernelArg
    clEnqueueNDRangeKernel clReleaseMemObject clReleaseKernel
    clReleaseProgram clReleaseCommandQueue clReleaseContext
    clReleaseEvent clWaitForEvents
    clFinish
    ;; gee-el
    clEnqueueAcquireGLObjects
    clEnqueueReleaseGLObjects
    cl_GLuint
    clCreateFromGLBuffer)
  
  (import (chezscheme) (interop))

  (define CL_DEVICE_NOT_FOUND -1)
  (define CL_DEVICE_TYPE_DEFAULT         1)
  (define CL_DEVICE_TYPE_CPU             2) 
  (define CL_DEVICE_TYPE_GPU             4)
  (define CL_DEVICE_TYPE_ACCELERATOR     8)
  (define CL_DEVICE_TYPE_CUSTOM          16)
  (define CL_DEVICE_TYPE_ALL             -1)
  (define CL_SUCCESS 0)
  (define CL_INVALID_VALUE -30)
  (define CL_PLATFORM_PROFILE    #x0900)
  (define CL_PLATFORM_VERSION    #x0901)
  (define CL_PLATFORM_NAME       #x0902)
  (define CL_PLATFORM_VENDOR     #x0903)
  (define CL_PLATFORM_EXTENSIONS #x0904)
  (define CL_MEM_READ_WRITE 1)
  (define CL_MEM_WRITE_ONLY 2)
  (define CL_MEM_READ_ONLY 4)
  (define CL_MEM_USE_HOST_PTR 8)
  (define CL_MEM_ALLOC_HOST_PTR 16)
  (define CL_MEM_COPY_HOST_PTR 32)
  (define CL_FALSE 0)
  (define CL_INVALID_WORK_GROUP_SIZE -54)
  (define CL_DEVICE_TYPE #x1000)
  (define CL_CONTEXT_PLATFORM #x1084)

  (define libOcl
    (cond
      ((is-windows?)
       (load-shared-object "opencl.dll"))
      ((is-osx?)
       (load-shared-object
         (string-append
           "/System/Library/Frameworks/"
           "OpenCL.framework/OpenCL")))
      ((is-linux?)
       (load-shared-object
         "/usr/lib/libOpenCL.so"))))
  
  (define-syntax define-function-ocl
    (syntax-rules ()
      ((_ ret name args)
       (define-ftype-fn1 name
         (function args ret)))))

  ;;

  ;; typedef int8_t          cl_char;
  ;; typedef uint8_t         cl_uchar;
  ;; typedef int16_t         cl_short    __attribute__((aligned(2)));
  ;; typedef uint16_t        cl_ushort   __attribute__((aligned(2)));
  ;; typedef int32_t         cl_int      __attribute__((aligned(4)));
  ;; typedef uint32_t        cl_uint     __attribute__((aligned(4)));
  ;; typedef int64_t         cl_long     __attribute__((aligned(8)));
  ;; typedef uint64_t        cl_ulong    __attribute__((aligned(8)));

  ;; typedef uint16_t        cl_half     __attribute__((aligned(2)));
  ;; typedef float           cl_float    __attribute__((aligned(4)));
  ;; typedef double          cl_double   __attribute__((aligned(8)));

 
  (define-ftype cl_uint unsigned-int)
  (define-ftype cl_int unsigned-int)
  ;; (define-ftype cl_bool unsigned-int)

  ;; adts
  ;; https://www.khronos.org/registry/OpenCL/sdk/1.2/docs/man/xhtml/abstractDataTypes.html
  (define-ftype cl_platform_id void*)
  (define-ftype cl_device_id void*)
  (define-ftype cl_context void*)
  (define-ftype cl_command_queue void*)
  (define-ftype cl_mem void*)
  (define-ftype cl_program void*)
  (define-ftype cl_kernel void*)
  (define-ftype cl_event void*)
  (define-ftype cl_sampler void*)

  ;; enumerated types
  ;; https://www.khronos.org/registry/OpenCL/sdk/1.2/docs/man/xhtml/enums.html#cl_context_properties
  (define-ftype cl_addressing_mode enum)
  (define-ftype cl_bool enum)
  (define-ftype cl_buffer_create_type enum)
  (define-ftype cl_build_status enum)
  (define-ftype cl_channel_order enum)
  (define-ftype cl_channel_type enum)
  (define-ftype cl_command_queue_info enum)
  (define-ftype cl_command_queue_properties enum)
  (define-ftype cl_command_type enum)
  (define-ftype cl_context_info enum)
  (define-ftype cl_context_properties iptr) ;; kdr was enum
  (define-ftype cl_d3d10_device_set_khr  enum)
  (define-ftype cl_d3d10_device_source_khr  enum)
  (define-ftype cl_d3d11_device_set_khr enum)
  (define-ftype cl_d3d11_device_source_khr enum)
  (define-ftype cl_device_affinity_domain enum)
  (define-ftype cl_device_exec_capabilities enum)
  (define-ftype cl_device_fp_config enum)
  (define-ftype cl_device_info enum)
  (define-ftype cl_device_local_mem_type enum)
  (define-ftype cl_device_mem_cache_type enum)
  (define-ftype cl_device_partition_property enum)
  (define-ftype cl_device_type enum)
  (define-ftype cl_event_info enum)
  (define-ftype cl_filter_mode enum)
  (define-ftype cl_gl_context_info enum)
  (define-ftype cl_gl_object_type enum)
  (define-ftype cl_gl_texture_info enum)
  (define-ftype cl_image_info enum)
  (define-ftype cl_kernel_arg_address_qualifier enum)
  (define-ftype cl_kernel_arg_access_qualifier enum)
  (define-ftype cl_kernel_arg_info enum)
  (define-ftype cl_kernel_info enum)
  (define-ftype cl_kernel_work_group_info enum)
  (define-ftype cl_map_flags enum)
  (define-ftype cl_mem_flags enum)
  (define-ftype cl_mem_info enum)
  (define-ftype cl_mem_migration_flags enum)
  (define-ftype cl_mem_object_type enum)
  (define-ftype cl_platform_info enum)
  (define-ftype cl_profiling_info enum)
  (define-ftype cl_program_binary_type enum)
  (define-ftype cl_program_build_info enum)
  (define-ftype cl_program_info enum)
  (define-ftype cl_sampler_info enum)

  
  ;; https://www.khronos.org/registry/OpenCL/sdk/1.2/docs/man/xhtml/clCreateContext.html 
  (define-ftype pfn_notify_create_context
    (function (string void* size_t void*) void))
  (define-ftype-fn1 clCreateContext
    (function
      ((* cl_context_properties)
       cl_uint
       (* cl_device_id)
       (* pfn_notify_create_context)
       void*
       (* cl_int))
      cl_context))

  ;; https://www.khronos.org/registry/OpenCL/sdk/1.2/docs/man/xhtml
  
  (define-ftype-fn1 clGetPlatformIDs
    (function
      (cl_uint             ;; num_entries
        (* cl_platform_id) ;; platforms
        (* cl_uint))       ;; num_platforms
      cl_int))
  
  ;; _____________________________________________
  
  (define-ftype-fn1 clGetPlatformInfo
    (function
      (cl_platform_id ;; platform,
        cl_platform_info ;; param_name,
        size_t  ;; param_value_size,
        void* ;; param_value,
        (* size_t) ;; param_value_size_ret)
        )
      cl_int))

  (define-ftype-fn1 clGetDeviceIDs
    (function
      (cl_platform_id  ;; platform 
        cl_device_type  ;; device_type 
        cl_uint  ;; num_entries 
        (* cl_device_id)  ;; devices 
        (* cl_uint)  ;; num_devices
        )
      cl_int))

  (define-ftype-fn1 clGetDeviceInfo
    (function
      (cl_device_id ;;  device 
        cl_device_info  ;; param_name 
        size_t  ;; param_value_size 
        void* ;; param_value 
        (* size_t) ;;   param_value_size_ret
        )
      cl_int))

  (define-ftype-fn1 clCreateCommandQueue
    (function
      (cl_context ;; context,
        cl_device_id ;; device,
        cl_command_queue_properties ;; properties,
        (* cl_int) ;; errcode_ret
        )
      cl_command_queue))

  (define-ftype-fn1 clCreateBuffer
    (function
      (cl_context ;; context,
        cl_mem_flags ;; flags,
        size_t ;; size,
        void* ;; host_ptr,
        (* cl_int) ;;  errcode_ret
        )
      cl_mem))
  
  (define-ftype-fn1 clEnqueueReadBuffer
    (function
      (cl_command_queue ;;command_queue,
        cl_mem ;; buffer,
        cl_bool ;; blocking_read,
        size_t ;; offset,
        size_t ;; size,
        void* ; ;ptr,
        cl_uint ;; num_events_in_wait_list,
        (* cl_event) ;; event_wait_list,
        (* cl_event) ;; event)
        )
      cl_int))

  (define-ftype-fn1 clEnqueueWriteBuffer 
    (function
      (cl_command_queue ;; command_queue,
        cl_mem ;; buffer 
        cl_bool ;; blocking_write,
        size_t ;; offset,
        size_t ;; size,
        void* ;; ptr,
        cl_uint ;; num_events_in_wait_list,
        (* cl_event) ;; event_wait_list,
        (* cl_event) ;; event)
        )
      cl_int))

  (define-ftype-fn1 clCreateProgramWithSource
    (function
      (cl_context    ; context
        cl_uint      ; count
        (* char*) ; strings
        (* size_t)   ; lengths
        (* cl_int))  ; errcode_ret)
      cl_program))

  (define-ftype pfn_notify_build_program
    (function
      (cl_program void*)
      void))

  ;; https://www.khronos.org/registry/OpenCL/sdk/1.2/docs/man/xhtml/clBuildProgram.html
  (define-ftype-fn1 clBuildProgram
    (function
      (cl_program ;; program,
        cl_uint ;; num_devices
        (* cl_device_id) ;; device_list
        (* char) ;;  options
        (* pfn_notify_build_program) ;; pfn_notify
        void* ;; user_data
        )
      cl_int))

  (define-ftype-fn1  clCreateKernel
    (function
      (cl_program ;; program,
        (* char) ;; kernel_name,
        (* cl_int) ;; errcode_ret
        )
      cl_kernel))

  (define-ftype-fn1 clSetKernelArg
    (function
      (cl_kernel ;; kernel,
        cl_uint ;; arg_index,
        size_t ;; arg_size,
        void* ;; arg_value)
        )
      cl_int))
  
  (define-ftype-fn1 clEnqueueNDRangeKernel
    (function
      (cl_command_queue ;; command_queue,
        cl_kernel ;; kernel,
        cl_uint ;; work_dim,
        (* size_t) ;; global_work_offset,
        (* size_t) ;; global_work_size,
        (* size_t) ;; local_work_size,
        cl_uint ;; num_events_in_wait_list,
        (* cl_event) ;; event_wait_list,
        (* cl_event) ;; event)
        )
      cl_int))

  (define-ftype-fn1 clReleaseMemObject
    (function
      (cl_mem ;; memobj
        )
      cl_int))

  (define-ftype-fn1 clReleaseKernel
    (function
      (cl_kernel) ;; kernel
      cl_int))
  
  (define-ftype-fn1  clReleaseProgram
    (function
      (cl_program) ;; program
      cl_int))
  
  (define-ftype-fn1  clReleaseCommandQueue
    (function
      (cl_command_queue) ;;  command_queue)
      cl_int))
  
  (define-ftype-fn1  clReleaseContext
    (function
      (cl_context) ;; context)
      cl_int))
  
  (define-ftype-fn1  clReleaseEvent 
    (function
      (cl_event) ;; event))
      cl_int))
  
  (define-ftype-fn1  clWaitForEvents
    (function
      (cl_uint ;; num_events
        (* cl_event) ;; event_list)
        )
      cl_int))

  ;; ==
  
  ;; CL/cl.h
  ;;
  ;; extern CL_API_ENTRY cl_int CL_API_CALL
  ;; clGetProgramBuildInfo(
  ;;      cl_program            /* program */,
  ;;      cl_device_id          /* device */,
  ;;      cl_program_build_info /* param_name */,
  ;;      size_t                /* param_value_size */,
  ;;      void *                /* param_value */,
  ;;      size_t *              /* param_value_size_ret */)
  ;;  CL_API_SUFFIX__VERSION_1_0

  (define-ftype-fn1 clGetProgramBuildInfo
    (function
      (cl_program             ; /* program */,
        cl_device_id          ; /* device */,
        cl_program_build_info ; /* param_name */,
        size_t                ; /* param_value_size */,
        void*                 ; /* param_value */,
        (* size_t))           ; /* param_value_size_ret */)
      cl_int))

  ;; extern CL_API_ENTRY cl_int CL_API_CALL
  ;; clFinish(
  ;;  cl_command_queue /* command_queue */)
  ;;  CL_API_SUFFIX__VERSION_1_0;

  (define-ftype-fn1 clFinish
    (function
      (cl_command_queue) ; command_queue
      cl_int))

  ;; CL/cl_gl.h

  (define CL_GL_CONTEXT_KHR  #x2008)
  (define CL_GLX_DISPLAY_KHR #x200A)

  ;; extern CL_API_ENTRY cl_int CL_API_CALL
  ;; clEnqueueAcquireGLObjects(
  ;;          cl_command_queue  /* command_queue
  ;;          cl_uint           /* num_objects
  ;;          const cl_mem *    /* mem_objects
  ;;          cl_uint           /* num_events_in_wait_list
  ;;          const cl_event *  /* event_wait_list
  ;;          cl_event *        /* event
  ;;  )
  ;;  CL_API_SUFFIX__VERSION_1_0;

  (define-ftype-fn1 clEnqueueAcquireGLObjects
    (function
      (cl_command_queue ; command_queue
        cl_uint         ; num_objects
        (* cl_mem)      ; mem_objects
        cl_uint         ; num_events_in_wait_list
        (* cl_event)    ; event_wait_list
        (* cl_event))   ; event
      cl_int))

  ;; extern CL_API_ENTRY cl_int CL_API_CALL
  ;; clEnqueueReleaseGLObjects(
  ;;          cl_command_queue  /* command_queue
  ;;          cl_uint           /* num_objects
  ;;          const cl_mem *    /* mem_objects
  ;;          cl_uint           /* num_events_in_wait_list
  ;;          const cl_event *  /* event_wait_list */,
  ;;          cl_event *        /* event */
  ;;  )
  ;;  CL_API_SUFFIX__VERSION_1_0;

  (define-ftype-fn1 clEnqueueReleaseGLObjects
    (function
      (cl_command_queue ; command_queue
        cl_uint         ; num_objects
        (* cl_mem)      ; mem_objects
        cl_uint         ; num_events_in_wait_list
        (* cl_event)    ; event_wait_list
        (* cl_event))   ; event
      cl_int))

  ;; extern CL_API_ENTRY cl_mem CL_API_CALL
  ;; clCreateFromGLBuffer(cl_context     /* context */,
  ;;                       cl_mem_flags   /* flags */,
  ;;                       cl_GLuint      /* bufobj */,
  ;;                       int *          /* errcode_ret */) CL_API_SUFFIX__VERSION_1_0;
  (define-ftype cl_GLuint unsigned-int)

  (define-ftype-fn1 clCreateFromGLBuffer
    (function
      (cl_context    ;     /* context */,
        cl_mem_flags ;   /* flags */,
        cl_GLuint    ; /* bufobj */,
        (* int))     ; /* errcode_ret */) CL_API_SUFFIX__VERSION_1_0;
      cl_mem))
  )

;; ((device          cl_device)
;;  (queue           cl_command_queue)
;;  (event           cl_event)
;;  (memory          cl_mem)
;;  (grid            NDRange)
;;  (block           work-group)
;;  (thread          work-item)
;;  (warp            sub-group)
;;  (thread-index    "get_local_id(0)")
;;  (block-index     "get_group_id(0)")
;;  (block-dim       "get_local_size(0)")
;;  (grid-dim-       "get_global_size(0)")
;;  (device-kernel   __kernel)
;;  (device-func     implied-in-device-compilation)
;;  (host-func       implied-in-host-compilation.)
;;  (host/devce-func -function no-equivalent)
;;  (kernel-launch   clEnqueueNDRangeKernel)
;;  (global-memory   __global)
;;  (group-memory    __local)
;;  (constant        __constant)
;;  (__syncthreads   "barrier(CLK_LOCAL_MEMFENCE)")
;;  (atomic-builtins atomic_add)
;;  (precise-math    "cos(f)")
;;  (fast-math       "native_cos(f)")
;;  (vector          float4))
