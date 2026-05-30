# Scanner Module (C)

add_library(scanner scanner.c)

# Export pour Python (ctypes)
if(BUILD_SHARED_LIBS)
    target_compile_definitions(scanner PRIVATE SCANNER_EXPORT)
endif()

# Include directories
target_include_directories(scanner PUBLIC 
    ${CMAKE_CURRENT_SOURCE_DIR}/../..
)

# Installation
install(TARGETS scanner 
    LIBRARY DESTINATION lib
    RUNTIME DESTINATION bin
)
install(FILES scanner.h DESTINATION include)

# Tests
if(BUILD_TESTS)
    add_executable(test_scanner test_scanner.c scanner.c)
    add_test(NAME scanner_test COMMAND test_scanner)
endif()
