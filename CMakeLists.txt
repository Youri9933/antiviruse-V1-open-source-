cmake_minimum_required(VERSION 3.15)
project(antivirusse_maison C)

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)

# Options de build
option(BUILD_SHARED_LIBS "Construire des bibliothèques partagées" ON)
option(BUILD_TESTS "Construire les tests" ON)

# Dossiers source
add_subdirectory(core/scanner)
add_subdirectory(core/firewall)

# Tests
if(BUILD_TESTS)
    enable_testing()
    add_subdirectory(tests)
endif()

# Message de confirmation
message(STATUS "Antivirus Maison - Configuration C/CMake terminée")
message(STATUS "Build type: ${CMAKE_BUILD_TYPE}")
message(STATUS "Shared libs: ${BUILD_SHARED_LIBS}")
