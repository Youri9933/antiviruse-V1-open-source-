#include "scanner.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <dirent.h>

#ifdef _WIN32
    #include <windows.h>
#else
    #include <unistd.h>
#endif


