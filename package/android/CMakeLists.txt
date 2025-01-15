cmake_minimum_required(VERSION 3.9.0)
project(ReactNativeSoundKit)

set(CMAKE_VERBOSE_MAKEFILE ON)
set(CMAKE_CXX_STANDARD 17)

# Compile sources
add_library(
        react-native-soundkit
        SHARED
        ../cpp/SoundKitHostObject.cpp
        ../cpp/NativeSoundKitModule.cpp
)

# Add headers search paths
target_include_directories(react-native-soundkit PUBLIC ../oboe/src)
target_include_directories(react-native-soundkit PUBLIC ../cpp)

# Add Oboe core dependency
add_subdirectory(../oboe/src oboe)

target_link_libraries(
        react-native-soundkit
        oboe                        	# <-- Oboe library
        android                     	# <-- Android JNI core
        react_codegen_RNSoundKitSpec    # <-- Generated Specs from CodeGen
)