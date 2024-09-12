cmake_minimum_required(VERSION 3.10)
project(ImGuiGLFWOpenGL3Example)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Find OpenGL
find_package(OpenGL REQUIRED)

# Add GLFW
add_subdirectory(${CMAKE_SOURCE_DIR}/../../libs/glfw ${CMAKE_BINARY_DIR}/glfw)

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

# Add your main source file
add_executable(${PROJECT_NAME}
    main.cpp
    ${IMGUI_SOURCES}
)

# Include directories
target_include_directories(${PROJECT_NAME} PRIVATE
    ${IMGUI_DIR}
    ${IMGUI_DIR}/backends
    ${OPENGL_INCLUDE_DIR}
    ${CMAKE_SOURCE_DIR}/../../libs/glfw/include
)

# Link libraries
target_link_libraries(${PROJECT_NAME} PRIVATE
    glfw
    ${OPENGL_LIBRARIES}
)

# Compiler-specific options
if(MSVC)
    target_compile_definitions(${PROJECT_NAME} PRIVATE IMGUI_IMPL_OPENGL_LOADER_CUSTOM)
endif()
