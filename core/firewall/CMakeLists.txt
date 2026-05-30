# Firewall Module (C)
# Placeholder pour Windows WinDivert / WinPcap

add_library(firewall firewall.c)

target_include_directories(firewall PUBLIC 
    ${CMAKE_CURRENT_SOURCE_DIR}/../..
)

# Sur Windows, lier les libs réseau
if(WIN32)
    target_link_libraries(firewall PRIVATE ws2_32 iphlpapi)
endif()

# Installation
install(TARGETS firewall 
    LIBRARY DESTINATION lib
    RUNTIME DESTINATION bin
)
install(FILES firewall.h DESTINATION include)
