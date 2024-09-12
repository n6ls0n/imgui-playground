cmake_minimum_required(VERSION 3.10)
project(ImGuiGLFWOpenGL3Example)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Find OpenGL
find_package(OpenGL REQUIRED)

# Set paths to look for libraries and includes
set(LIBS_DIR "${CMAKE_CURRENT_SOURCE_DIR}/../../libs")
set(INCLUDE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/../../include")

# Set GLFW settings
set(GLFW_DIR "${LIBS_DIR}/glfw")
set(GLFW_INCLUDE_DIR "${INCLUDE_DIR}/GLFW")
set(GLFW_LIBRARY "${GLFW_DIR}/glfw3.lib")

# Set GLAD settings
set(GLAD_INCLUDE_DIR "${INCLUDE_DIR}/glad")

# Add ImGui source files
set(IMGUI_DIR ${CMAKE_SOURCE_DIR}/../../libs/imgui)
set(IMGUI_SOURCES
    ${IMGUI_DIR}/imgui.cpp
    ${IMGUI_DIR}/imgui_demo.cpp
    ${IMGUI_DIR}/imgui_draw.cpp
    ${IMGUI_DIR}/imgui_tables.cpp
    ${IMGUI_DIR}/imgui_widgets.cpp
    ${IMGUI_DIR}/backends/imgui_impl_glfw.cpp
    ${IMGUI_DIR}/backends/imgui_impl_opengl3.cpp
)

# Add GLAD source
set(GLAD_SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/glad.c
)

# Add your main source file
add_executable(${PROJECT_NAME}
    main.cpp
    ${IMGUI_SOURCES}
    ${GLAD_SOURCES}
)

# Include directories
target_include_directories(${PROJECT_NAME} PRIVATE
    ${IMGUI_DIR}
    ${IMGUI_DIR}/backends
    ${OPENGL_INCLUDE_DIR}
    ${INCLUDE_DIR}
    ${GLFW_INCLUDES_DIR}
    ${GLAD_INCLUDE_DIR}
)

# Link libraries
target_link_libraries(${PROJECT_NAME} PRIVATE
    ${OPENGL_LIBRARIES}
    OpenGL::GL
    ${GLFW_LIBRARY}
)
