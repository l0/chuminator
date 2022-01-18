(import
  (interop) (mk) (nanopass) (sllgen)
  (gles3_1) (glfw) (opencl1_2)
  (freetype) (jpeg) (mbedtls) (z))

(begin
  (assert (c-true? (glfwInit)))
  (glfwWindowHint GLFW_CONTEXT_VERSION_MAJOR 4)
  (glfwWindowHint GLFW_CONTEXT_VERSION_MINOR 0)
  (glfwWindowHint GLFW_OPENGL_PROFILE GLFW_OPENGL_CORE_PROFILE)
  (glfwWindowHint GLFW_OPENGL_FORWARD_COMPAT GL_TRUE)
  (define win
    (glfwCreateWindow 600 600 "hel0" 
      (make-ftype-nullptr GLFWmonitor)
      (make-ftype-nullptr GLFWwindow)))
  (assert (c-true? (ftype-pointer-address win)))
  (glfwMakeContextCurrent win))
