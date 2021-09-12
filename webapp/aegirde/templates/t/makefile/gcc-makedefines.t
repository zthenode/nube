%########################################################################
%# Copyright (c) 1988-2019 $organization$
%#
%# This software is provided by the author and contributors ``as is'' 
%# and any express or implied warranties, including, but not limited to, 
%# the implied warranties of merchantability and fitness for a particular 
%# purpose are disclaimed. In no event shall the author or contributors 
%# be liable for any direct, indirect, incidental, special, exemplary, 
%# or consequential damages (including, but not limited to, procurement 
%# of substitute goods or services; loss of use, data, or profits; or 
%# business interruption) however caused and on any theory of liability, 
%# whether in contract, strict liability, or tort (including negligence 
%# or otherwise) arising in any way out of the use of this software, 
%# even if advised of the possibility of such damage.
%#
%#   File: gcc-makedefines.t
%#
%# Author: $author$
%#   Date: 11/14/2019
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%is_os,%(%else-then(%is_os%,%()%)%)%,%
%os,%(%else-then(%os%,%(Generic)%)%)%,%
%Os,%(%else-then(%Os%,%(%os%)%)%)%,%
%OS,%(%else-then(%OS%,%(%toupper(%Os%)%)%)%)%,%
%os,%(%else-then(%_Os%,%(%tolower(%Os%)%)%)%)%,%
%is_makefile,%(%else-then(%is_makefile%,%()%)%)%,%
%makefile,%(%else-then(%makefile%,%(Makedefines)%)%)%,%
%Makefile,%(%else-then(%Makefile%,%(%makefile%)%)%)%,%
%MAKEFILE,%(%else-then(%MAKEFILE%,%(%toupper(%Makefile%)%)%)%)%,%
%makefile,%(%else-then(%_Makefile%,%(%tolower(%Makefile%)%)%)%)%,%
%is_framework,%(%else-then(%is_framework%,%(no)%)%)%,%
%%(%
%%include(%include_path%/gcc-makefile-file.t)%%
%
ifndef BUILD_HOME
BUILD_HOME = $(HOME)
endif

ifndef BUILD_TYPE
BUILD_TYPE = Debug
endif

ifeq ($(BUILD_TYPE),Debug)
DBGFLAGS = -D_DEBUG -g
BUILD_DEFINE = -DDEBUG_BUILD
else
DBGFLAGS = -D_RELEASE
BUILD_DEFINE = -DRELEASE_BUILD
endif

ifndef UNAME
UNAME = $(shell uname)
endif

ifndef OS
ifneq ($(UNAME),Darwin)
OS = linux
else
OS = macosx
endif
endif

ifndef BUILD_OS
BUILD_OS = $(OS)
endif

ifndef BLD
BLD = build/$(BUILD_OS)
endif

ifndef INS
INS = $(BUILD_HOME)/$(BLD)
endif

PKGROOT = $(PKG)
PKGBLD = $(PKG)/$(BLD)/$(BUILD_TYPE)
BINDIR = $(PKGBLD)/bin
LIBDIR = $(PKGBLD)/lib
INSBIN = $(INS)/bin
INSLIB = $(INS)/lib

COMPILER_PATH =
COMPILER_PREFIX =

DEFINES = \
$(DBGFLAGS) \
$(BUILD_DEFINE) \

INCLUDES = \
-I$(PKG)/$(SRC) \
-I$(PKG) \

LIBDIRS	= \
-L$(LIBDIR) \

ifeq ($(OS),macosx)
STDLIBS	= \
-lpthread \
-ldl
else
STDLIBS	= \
-lpthread \
-ldl \
-lrt
endif

#
# C
#
CC = $(COMPILER_PATH)$(COMPILER_PREFIX)gcc
CCLD = $(CC)
CCDSO = $(CCLD)
OPTIM = -fpic
CFLAGS = $(OPTIM) $(USRINCLUDES) $(INCLUDES) $(DEFINES) $(USRDEFINES) $(USRDEFS) $(OPTIONS) $(USRCFLAGS) $(USRFLAGS)

#
# C++
#
CXX = $(COMPILER_PATH)$(COMPILER_PREFIX)g++
CXXLD = $(CXX)
CXXDSO = $(CXXLD)
CXXOPTIM = -fno-rtti
CXXFLAGS = $(OPTIM) $(CXXVERSION) $(CXXOPTIM) $(USRINCLUDES) $(INCLUDES) $(DEFINES) $(USRDEFINES) $(USRDEFS) $(OPTIONS) $(USRCXXFLAGS) $(USRFLAGS)

#
# Librarian
#
AR = $(COMPILER_PATH)$(COMPILER_PREFIX)ar
RANLIB = ranlib
STRIP = strip
LIBTOOL =
LIBEXT = a

ifeq ($(OS),macosx)
SLIBEXT = dylib
else
SLIBEXT = so
endif

#
# Filesystem
#
CHMOD =	chmod
CP =	cp
LN =	ln -sf
MV =	mv
RM =	rm -f
MKDIR =	mkdir -p
D2U  =	dos2unix

DSOFLAGS = -shared $(USRDSOFLAGS)
LDFLAGS = $(LIBDIRS) $(USRLIBDIRS) $(USRLDFLAGS) $(OPTIM) $(CXXOPTIM)
ARFLAGS = crs $(USRARFLAGS)

OPTIONS := $(shell if [ "$(BUILD_TYPE)" = "Debug" ] ; then echo -g; fi)
STRIP := $(shell if [ "$(BUILD_TYPE)" = "Debug" ] ; then echo "@echo Not Stripping"; else echo strip; fi)

#
# Rules
#
.cpp.o:
	@echo Compiling $(BUILD_TYPE) $< ...
	@$(CXX) -c $(CXXFLAGS) -o $@ $<

.cxx.o:
	@echo Compiling $(BUILD_TYPE) $< ...
	@$(CXX) -c $(CXXFLAGS) -o $@ $<

.cc.o:
	@echo Compiling $(BUILD_TYPE) $< ...
	@$(CXX) -c $(CXXFLAGS) -o $@ $<

.mm.o:
	@echo Compiling $(BUILD_TYPE) $< ...
	@$(CXX) -c $(CXXFLAGS) -o $@ $<

.c.o:
	@echo Compiling $(BUILD_TYPE) $< ...
	@$(CC) -c $(CFLAGS) -o $@ $<

.m.o:
	@echo Compiling $(BUILD_TYPE) $< ...
	@$(CC) -c $(CFLAGS) -o $@ $<

.S.o:
	@$(CC) -c -o $*.o $<

.s.o:
	@$(AS) -o $*.o $<
%
%)%)%