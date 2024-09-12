cmake_minimum_required(VERSION 3.10)
project(YourProjectName)

# Add GLFW subdirectory
add_subdirectory(path/to/glfw)

# Your executable
add_executable(YourExecutableName main.cpp)

# Link GLFW
target_link_libraries(YourExecutableName PRIVATE glfw)
