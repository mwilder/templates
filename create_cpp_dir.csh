#!/usr/bin/env csh -f
#
# Creates a C++ development template dir 

if ($#argv != 1) then
    echo "Usage: $0 <dir>"
    echo "  creates a C++ development template directory"
    exit 1
else
    set dir = $1
    if (-e $dir) then
        echo "Dir: $dir already exists, exiting ..."
        exit 1
    endif
    mkdir -p $dir/bin $dir/build $dir/doc $dir/include $dir/lib $dir/play $dir/src $dir/test
    # Generic makefile
    printf '# Generic C++ makefile \
\
CC := g++ \
#CC := clang --analyze \
SRCDIR := src\
INCDIR := include\
BUILDDIR := build\
TARGET := bin/my_app\
\
SRCEXT := cpp\
INCEXT := h\
SOURCES := $(shell find $(SRCDIR) -type f -name *.$(SRCEXT)) \
HEADERS := $(shell find $(SRCDIR) $(INCDIR) -type f -name *.$(INCEXT)) \
OBJECTS := $(patsubst $(SRCDIR)/%%,$(BUILDDIR)/%%,$(SOURCES:.$(SRCEXT)=.o)) \
CFLAGS := -g # -Wall \
LIB := -L lib \
INC := -I include \
\
$(TARGET): $(OBJECTS) \
\t@echo " Linking..." \
\t@echo " $(CC) $^ -o $(TARGET) $(LIB)"; $(CC) $^ -o $(TARGET) $(LIB) \
\
$(BUILDDIR)/%%.o: $(SRCDIR)/%%.$(SRCEXT) $(HEADERS)\
\t@mkdir -p $(BUILDDIR) \
\t@echo " $(CC) $(CFLAGS) $(INC) -c -o $@ $<"; $(CC) $(CFLAGS) $(INC) -c -o $@ $< \
\
clean: \
\t@echo " Cleaning..."; \
\t@echo " $(RM) -r $(BUILDDIR) $(TARGET)"; $(RM) -r $(BUILDDIR) $(TARGET) \
\
# Tests \
tester: \
\t@echo " Tester..."; \
\t$(CC) $(CFLAGS) test/tester.cpp $(INC) $(LIB) -o bin/tester \
\
# Play \
idea1: \
\t@echo " Building idea 1 ..."; \
\t$(CC) $(CFLAGS) play/idea1.cpp $(INC) $(LIB) -o bin/idea1 \
\
.PHONY: clean \
' > $dir/Makefile

    # Generic C++ main file
    printf '// Generic C++ main \
\
#include <stdio.h> \
#include <stdlib.h> \
#include "main.h" \
\
int main (int argc, char *argv[]) { \
    if (argc < 2) { \
        fprintf(stdout, "%%s Version %%d.%%d\\n", \
                argv[0], \
                VERSION_MAJOR, \
                VERSION_MINOR); \
        return 1; \
    } \
\
    fprintf(stdout, "Example C++ program\\n"); \
    return 0; \
} \
' > $dir/src/main.cpp

    # Generic C++ include file
    printf '// Generic C++ include \
\
#define VERSION_MAJOR 0 \
#define VERSION_MINOR 0 \
' > $dir/src/main.h
    
endif