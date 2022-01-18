(library (glfw)
  ;; /usr/include/GLFW/glfw3.h
  (export
    glfwInit glfwCreateWindow
    glfwTerminate glfwMakeContextCurrent
    glfwWindowShouldClose glfwSwapBuffers
    glfwPollEvents glfwSetErrorCallback
    glfwDestroyWindow glfwSetKeyCallback
    glfwGetTime glfwGetFramebufferSize
    glfwSetWindowPos glfwSetWindowSize
    glfwSetWindowSizeCallback
    glfwGetWindowSize GLFWwindowsizefun-fn
    GLFWwindowsizefun

    glfwWindowHint
    ;;
    GLFWmonitor
    GLFWwindow
    GLFWerrorfun-fn GLFWerrorfun
    GLFWkeyfun-fn GLFWkeyfun
    ;;
    GLFW_SAMPLES
    GLFW_OPENGL_CORE_PROFILE
    GLFW_CONTEXT_VERSION_MAJOR  
    GLFW_CONTEXT_VERSION_MINOR  
    GLFW_OPENGL_FORWARD_COMPAT  
    GLFW_OPENGL_DEBUG_CONTEXT   
    GLFW_OPENGL_PROFILE
    GLFW_TRUE GLFW_FALSE

    GLFW_CLIENT_API
    GLFW_CONTEXT_CREATION_API
    GLFW_OPENGL_ES_API
    GLFW_NATIVE_CONTEXT_API
    )

  (import (chezscheme) (interop))
 
  ;; typedef void (* GLFWwindowsizefun)(GLFWwindow*,int,int);
  ;; GLFWAPI GLFWwindowsizefun glfwSetWindowSizeCallback(
  ;;  GLFWwindow* window, GLFWwindowsizefun cbfun);
  ;; typedef void (* GLFWframebuffersizefun)(GLFWwindow*,int,int);
  ;; GLFWAPI void glfwGetFramebufferSize(GLFWwindow* window, int* width, int* height);
  ;; GLFWAPI GLFWframebuffersizefun glfwSetFramebufferSizeCallback(
  ;;   GLFWwindow* window, GLFWframebuffersizefun cbfun);
  ;; glViewport (0, 0, g_fb_width, g_fb_height); 

  (define GLFW_SAMPLES                #x0002100D)
  (define GLFW_OPENGL_CORE_PROFILE    #x00032001)
  (define GLFW_CONTEXT_VERSION_MAJOR  #x00022002)
  (define GLFW_CONTEXT_VERSION_MINOR  #x00022003)
  (define GLFW_OPENGL_FORWARD_COMPAT  #x00022006)
  (define GLFW_OPENGL_DEBUG_CONTEXT   #x00022007)
  (define GLFW_OPENGL_PROFILE         #x00022008)
  
  (define GLFW_TRUE  1)
  (define GLFW_FALSE 0)

  ;; (load-shared-object "glfw3.dll")
  ;; (load-shared-object "wave.dll"))

  (define libglfw
    (load-shared-object
      (cond
        [(is-windows?) "glfw3.dll"]
        [(is-osx?)     "libglfw.dylib"]
        [(is-linux?)   "libglfw.so"]
        [else (error "glfw/libglfw"
                "unhandled-os")])))
  
  ;; int glfwInit(void);
  (define-ftype-fn1 glfwInit
    (function () int))

  ;; void glfwWindowHint(int target, int hint);
  (define-ftype-fn1 glfwWindowHint
    (function
      (int ;; hint
        int) ;; value
      void))

  (define-ftype GLFWmonitor (struct))
  (define-ftype GLFWwindow (struct))
  
  ;; GLFWwindow* glfwCreateWindow(int width,
  ;; int height,
  ;;  const char* title, GLFWmonitor* monitor,
  ;; GLFWwindow* share);
  (define-ftype-fn1 glfwCreateWindow
    (function
      (int ;; width 
        int ;; height
        string ;; title
        (* GLFWmonitor) ;; monitor
        (* GLFWwindow)) ;; share
      (* GLFWwindow)))

  ;; void glfwTerminate(void);
  (define-ftype-fn1 glfwTerminate
    (function () void))

  ;; void glfwMakeContextCurrent(GLFWwindow*
  ;;  window
  (define-ftype-fn1 glfwMakeContextCurrent
    (function
      ((* GLFWwindow)) void))

  ;; int glfwWindowShouldClose(GLFWwindow*
  ;;  window)
  (define-ftype-fn1 glfwWindowShouldClose
    (function
      ((* GLFWwindow)) int))

  ;; void glfwSwapBuffers(GLFWwindow* window);
  (define-ftype-fn1 glfwSwapBuffers
    (function
      ((* GLFWwindow)) void))

  ;; void glfwPollEvents(void);
  (define-ftype-fn1 glfwPollEvents
    (function
      () void))

  ;; void glfwDestroyWindow(GLFWwindow* window)
  (define-ftype-fn1 glfwDestroyWindow
    (function
      ((* GLFWwindow))
      void))

  ;; typedef void (* GLFWkeyfun)(GLFWwindow*,
  ;;  int,int,int, int);
  (define-ftype GLFWkeyfun-fn
    (function
      ((* GLFWwindow) ;; window
       int ;; key
       int ;; scancode
       int ;; action
       int ;; mods
       )
      void))
  (define-ftype GLFWkeyfun (* GLFWkeyfun-fn))

  ;; GLFWkeyfun glfwSetKeyCallback (GLFWwindow
  ;;  *window, GLFWkeyfun cbfun)
  (define-ftype-fn1 glfwSetKeyCallback
    (function
      ((* GLFWwindow)
       (* GLFWkeyfun-fn))
      (* GLFWkeyfun-fn)))
  
  ;; double glfwGetTime(void);
  (define-ftype-fn1 glfwGetTime
    (function () double))

  ;; void glfwGetFramebufferSize(GLFWwindow*
  ;;  window,  int* width, int* height)
  (define-ftype-fn1 glfwGetFramebufferSize
    (function
      ((* GLFWwindow)
       (* int)
       (* int))
      void))

  ;; void glfwSetWindowPos(GLFWwindow* window,
  ;;  int xpos, int ypos);
  (define-ftype-fn1 glfwSetWindowPos
    (function
      ((* GLFWwindow)
       int  ;; xpos
       int) ;; ypos
      void))

  ;; void glfwSetWindowSize(GLFWwindow* window,
  ;;  int width, int height);
  (define-ftype-fn1 glfwSetWindowSize
    (function
      ((* GLFWwindow)
       int ;; width
       int) ;; height
      void))

  (define-ftype-fn1 glfwGetWindowSize
    (function
      ((* GLFWwindow)
       (* int) ;; width
       (* int)) ;; height
      void))

  ;; typedef void (* GLFWerrorfun)(int,
  ;;   const char*);
  (define-ftype GLFWerrorfun-fn
    (function
      (int     ;; error
        string) ;; description (* char)
      void))
  
  (define-ftype GLFWerrorfun
    (* GLFWerrorfun-fn))

  ;; GLFWerrorfun glfwSetErrorCallback
  ;;  (GLFWerrorfun cbfun);
  (define-ftype-fn1 glfwSetErrorCallback
    (function
      ((* GLFWerrorfun-fn))
      (* GLFWerrorfun-fn)))
  
  ;; typedef void (* GLFWwindowsizefun)(GLFWwindow*,int,int);
  (define-ftype GLFWwindowsizefun-fn
    (function
      ((* GLFWwindow) ;; ???
       int            ;; ???
        int)          ;; ???
      void))
  
  (define-ftype GLFWwindowsizefun
    (* GLFWwindowsizefun-fn))
  
  ;; GLFWAPI GLFWwindowsizefun
  ;;  glfwSetWindowSizeCallback(
  ;;     GLFWwindow* window,
  ;;     GLFWwindowsizefun cbfun);
  (define-ftype-fn1 glfwSetWindowSizeCallback
    (function
      ((* GLFWwindow)            ; window
       (* GLFWwindowsizefun-fn)) ; cbfun
      (* GLFWwindowsizefun-fn)))

  ;; typedef void (* GLFWframebuffersizefun)(GLFWwindow*,int,int);
  ;;
  ;; (define-ftype GLFWwindowsizefun
  ;;   (* GLFWwindowsizefun-fn))
  ;;
  ;; GLFWAPI GLFWwindowsizefun
  ;;  glfwSetWindowSizeCallback(
  ;;     GLFWwindow* window,
  ;;     GLFWwindowsizefun cbfun);
  ;; (define-ftype-fn1 glfwSetWindowSizeCallback
  ;;   (function
  ;;     ((* GLFWwindow)            ; window
  ;;      (* GLFWwindowsizefun-fn)) ; cbfun
  ;;     (* GLFWwindowsizefun-fn)))
  ;;
  ;; GLFWAPI GLFWframebuffersizefun
  ;; glfwSetFramebufferSizeCallback(GLFWwindow*
  ;; window, GLFWframebuffersizefun cbfun);

  (define GLFW_CLIENT_API #x00022001)
  (define GLFW_CONTEXT_CREATION_API #x0002200B)
  (define GLFW_OPENGL_ES_API #x00030002)
  (define GLFW_NATIVE_CONTEXT_API #x00036001)
  )
