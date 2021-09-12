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
%#   File: gcc-makerules.t
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
%makefile,%(%else-then(%makefile%,%(Makerules)%)%)%,%
%Makefile,%(%else-then(%Makefile%,%(%makefile%)%)%)%,%
%MAKEFILE,%(%else-then(%MAKEFILE%,%(%toupper(%Makefile%)%)%)%)%,%
%makefile,%(%else-then(%_Makefile%,%(%tolower(%Makefile%)%)%)%)%,%
%is_framework,%(%else-then(%is_framework%,%(no)%)%)%,%
%%(%
%%include(%include_path%/gcc-makefile-file.t)%%
%
ifdef LIBHEADERS
INCLUDEINSTALL = install-include
endif

ifdef LIBTARGET
LIBINSTALL = install-lib
endif

ifdef SLIBTARGET
SLIBINSTALL = install-slib
endif

ifdef EXETARGET
EXEINSTALL = install-exe
endif

LIB_C_OBJS=$(LIB_C_SOURCES:.c=.o)
LIB_M_OBJS=$(LIB_M_SOURCES:.m=.o)
LIB_CC_OBJS=$(LIB_CC_SOURCES:.cc=.o)
LIB_MM_OBJS=$(LIB_MM_SOURCES:.mm=.o)
LIB_CPP_OBJS=$(LIB_CPP_SOURCES:.cpp=.o)
LIB_CXX_OBJS=$(LIB_CXX_SOURCES:.cxx=.o)
LIB_OBJS = $(LIB_C_OBJS) $(LIB_M_OBJS) $(LIB_CC_OBJS) $(LIB_MM_OBJS) $(LIB_CPP_OBJS) $(LIB_CXX_OBJS)

SLIB_C_OBJS=$(SLIB_C_SOURCES:.c=.o)
SLIB_M_OBJS=$(SLIB_M_SOURCES:.m=.o)
SLIB_CC_OBJS=$(SLIB_CC_SOURCES:.cc=.o)
SLIB_MM_OBJS=$(SLIB_MM_SOURCES:.mm=.o)
SLIB_CPP_OBJS=$(SLIB_CPP_SOURCES:.cpp=.o)
SLIB_CXX_OBJS=$(SLIB_CXX_SOURCES:.cxx=.o)
SLIB_OBJS = $(SLIB_C_OBJS) $(SLIB_M_OBJS) $(SLIB_CC_OBJS) $(SLIB_MM_OBJS) $(SLIB_CPP_OBJS)  $(SLIB_CXX_OBJS)

EXE_C_OBJS=$(EXE_C_SOURCES:.c=.o)
EXE_M_OBJS=$(EXE_M_SOURCES:.m=.o)
EXE_CC_OBJS=$(EXE_CC_SOURCES:.cc=.o)
EXE_MM_OBJS=$(EXE_MM_SOURCES:.mm=.o)
EXE_CPP_OBJS=$(EXE_CPP_SOURCES:.cpp=.o)
EXE_CXX_OBJS=$(EXE_CXX_SOURCES:.cxx=.o)
EXE_OBJS = $(EXE_C_OBJS) $(EXE_M_OBJS) $(EXE_CC_OBJS) $(EXE_MM_OBJS) $(EXE_CPP_OBJS) $(EXE_CXX_OBJS)

ALL_OBJS = $(OBJS) $(LIB_OBJS) $(SLIB_OBJS) $(EXE_OBJS)
ALL_TARGETS = $(EXETARGET) $(LIBTARGET) $(SLIBTARGET) $(USRTARGET)

#
# rules
#

all: ${LIBTARGET} ${SLIBTARGET} ${KMODTARGET} ${EXETARGET}

install: ${LIBINSTALL} ${SLIBINSTALL} ${EXEINSTALL}

again: clean all

this-again: clean-this all

clean-this:
	$(RM) $(ALL_OBJS)

clean:
	@for dir in $(SLIB_DIRS) $(SLIBDEP_DIRS); do \
		(cd $$dir && make clean) || (echo "Make $$dir clean Failed") ; \
	done
	@for dir in $(EXE_DIRS) $(EXEDEP_DIRS); do \
		(cd $$dir && make clean) || (echo "Make $$dir clean Failed") ; \
	done
	$(RM) $(ALL_OBJS)

veryclean:
	@for dir in $(SLIB_DIRS) $(SLIBDEP_DIRS); do \
		(cd $$dir && make veryclean) || (echo "Make $$dir veryclean Failed") ; \
	done
	@for dir in $(EXE_DIRS) $(EXEDEP_DIRS); do \
		(cd $$dir && make veryclean) || (echo "Make $$dir veryclean Failed") ; \
	done
	$(RM) $(ALL_OBJS) $(ALL_TARGETS)

build-type:
	@echo "BUILD_TYPE =" $(BUILD_TYPE)

#
# echo
#

uname:
	@echo "UNAME =" $(UNAME)

os:
	@echo "OS =" $(OS)

build_os:
	@echo "BUILD_OS =" $(BUILD_OS)

cxxflags:
	@echo "CXXFLAGS =" $(CXXFLAGS)

cflags:
	@echo "CFLAGS =" $(CFLAGS)

ldflags:
	@echo "LDFLAGS =" $(LDFLAGS)

libdir:
	@echo "LIBDIR =" $(LIBDIR)

libdirs:
	@echo "LIBDIRS =" $(LIBDIRS)

usrlibdirs:
	@echo "USRLIBDIRS =" $(USRLIBDIRS)

arflags:
	@echo "ARFLAGS =" $(ARFLAGS)

ar:
	@echo "AR =" $(AR) $(ARFLAGS) ${LIBTARGET} $(LIB_OBJS)

cxxld:
	@echo "CXXLD =" $(CXXLD) ${USRINCLUDES} ${INCLUDES} $(LDFLAGS) -o ${EXETARGET} $(EXE_OBJS) $(EXE_USROBJS) $(LIBS) $(STDLIBS)

exe_objs:
	@echo "EXE_OBJS =" $(EXE_OBJS)

slib_objs:
	@echo "SLIB_OBJS =" $(SLIB_OBJS)

lib_objs:
	@echo "LIB_OBJS =" $(LIB_OBJS)

objs: lib_objs slib_objs exe_objs

lib_sources:
	@echo "LIB_SOURCES =" $(LIB_C_SOURCES) $(LIB_CXX_SOURCES) $(LIB_CPP_SOURCES) $(LIB_M_SOURCES) $(LIB_MM_SOURCES)

slib_sources:
	@echo "SLIB_SOURCES =" $(SLIB_C_SOURCES) $(SLIB_CXX_SOURCES) $(SLIB_CPP_SOURCES) $(SLIB_M_SOURCES) $(SLIB_MM_SOURCES)

exe_sources:
	@echo "EXE_SOURCES =" $(EXE_C_SOURCES) $(EXE_CXX_SOURCES) $(EXE_CPP_SOURCES) $(EXE_M_SOURCES) $(EXE_MM_SOURCES)

sources: lib_sources slib_sources exe_sources

#
# install
#

install-include: ${LIBHEADERS} ${INSINCLUDE}
	@(echo "Installing Include - " ${LIBHEADERS}...;\
	  ((cp -r ${LIBHEADERS} $(INSINCLUDE)) || (exit 1));\
	  echo ..."Installed Include - " ${LIBHEADERS})

install-lib: ${LIBTARGET} ${INSLIB}
	@(echo "Installing Lib - " ${LIBTARGET}...;\
	  ((cp -r $(LIBDIR)/${LIBTARGET} $(INSLIB)) || (exit 1));\
	  echo ..."Installed Lib - " ${LIBTARGET})

install-slib: ${SLIBTARGET} ${INSLIB}
	@(echo "Installing Shared Lib - " ${SLIBTARGET}...;\
	  ((cp -r $(LIBDIR)/${SLIBTARGET} $(INSLIB)) || (exit 1));\
	  echo ..."Installed Shared Lib - " ${SLIBTARGET})

install-exe: ${EXETARGET} ${INSBIN}
	@(echo "Installing Exe - " ${EXETARGET}...;\
	  ((cp -r $(BINDIR)/${EXETARGET} $(INSBIN)) || (exit 1));\
	  echo ..."Installed Exe - " ${EXETARGET})

${INSBIN}:
	@(echo "Makeing Binary Directory - " ${INSBIN}...;\
	  ((mkdir -p $(INSBIN)) || (exit 1));\
	  echo ..."Made Binary Directory - " ${INSBIN})

${INSLIB}:
	@(echo "Makeing Library Directory - " ${INSLIB}...;\
	  ((mkdir -p $(INSLIB)) || (exit 1));\
	  echo ..."Made Library Directory - " ${INSLIB})

${INSINCLUDE}:
	@(echo "Makeing Include Directory - " ${INSINCLUDE}...;\
	  ((mkdir -p $(INSINCLUDE)) || (exit 1));\
	  echo ..."Made Include Directory - " ${INSINCLUDE})

#
# build
#

${BINDIR}:
	@echo "Makeing Binary Directory" $@ ...
	@$(MKDIR) $(BINDIR)

${LIBDIR}:
	@echo "Makeing Library Directory" $@ ...
	@$(MKDIR) $(LIBDIR)

${LIBTARGET}: ${LIBDEP}  ${LIB_OBJS} ${LIBDIR}
	@echo "Building Static Lib" $@ ...
	@$(AR) $(ARFLAGS) $@ $(LIB_OBJS)
	@$(MV) $@ $(LIBDIR)

${SLIBTARGET}: ${SLIBDEP} ${SLIB_OBJS} ${LIBDIR}
	@echo "Building Shared Lib" $@ ...
	@for dir in $(SLIB_DIRS); do \
		echo "Make $$dir" ; \
		(cd $$dir && make) || (echo "Make $$dir Failed") ; \
	done
	@$(CXXDSO) ${USRINCLUDES} ${INCLUDES} $(DSOFLAGS) -o $@ $(LDFLAGS) $(SLIB_OBJS) $(SLIB_USROBJS) $(LIBSSO) $(STDLIBS)
	@$(MV) $@ $(LIBDIR)

${EXETARGET}: ${EXEDEP} ${EXE_OBJS} ${BINDIR}
	@echo "Building Executable" $@ ...
	@for dir in $(EXE_DIRS); do \
		echo "Make $$dir" ; \
		(cd $$dir && make) || (echo "Make $$dir Failed") ; \
	done
	@$(CXXLD) ${USRINCLUDES} ${INCLUDES} $(LDFLAGS) -o $@ $(EXE_OBJS) $(EXE_USROBJS) $(LIBS) $(STDLIBS)
	@$(STRIP) $@
	@$(MV) $@ $(BINDIR)

#
# compile
#
compiling: 
	@echo "Comping..."

compile: compiling compile-lib compile-exe
	@echo "...Compiled"

compiling-lib: 
	@echo "Comping " ${LIB_OBJS} ...

compile-lib: compiling-lib ${LIB_OBJS}
	@echo "...Compiled" ${LIB_OBJS}

compiling-exe: 
	@echo "Comping " ${EXE_OBJS} ...

compile-exe: compiling-exe ${EXE_OBJS}
	@echo "...Compiled" ${EXE_OBJS}

#
# C
#

$(LIB_C_SOURCES:.c=.o): %%.o: %%.c
	@echo Compiling $(BUILD_TYPE) $< ...
	@$(CC) -c $(CFLAGS) -o $@ $<

$(SLIB_C_SOURCES:.c=.o): %%.o: %%.c
	@echo Compiling $(BUILD_TYPE) $< ...
	@$(CC) -c $(CFLAGS) -o $@ $<

$(EXE_C_SOURCES:.c=.o): %%.o: %%.c
	@echo Compiling $(BUILD_TYPE) $< ...
	@$(CC) -c $(CFLAGS) -o $@ $<

#
# C++
#

$(LIB_CC_SOURCES:.cc=.o): %%.o: %%.cc
	@echo Compiling $(BUILD_TYPE) $< ...
	@$(CXX) -c $(CXXFLAGS) -o $@ $<

$(SLIB_CC_SOURCES:.cc=.o): %%.o: %%.cc
	@echo Compiling $(BUILD_TYPE) $< ...
	@$(CXX) -c $(CXXFLAGS) -o $@ $<

$(EXE_CC_SOURCES:.cc=.o): %%.o: %%.cc
	@echo Compiling $(BUILD_TYPE) $< ...
	@$(CXX) -c $(CXXFLAGS) -o $@ $<

$(LIB_CPP_SOURCES:.cpp=.o): %%.o: %%.cpp
	@echo Compiling $(BUILD_TYPE) $< ...
	@$(CXX) -c $(CXXFLAGS) -o $@ $<

$(SLIB_CPP_SOURCES:.cpp=.o): %%.o: %%.cpp
	@echo Compiling $(BUILD_TYPE) $< ...
	@$(CXX) -c $(CXXFLAGS) -o $@ $<

$(EXE_CPP_SOURCES:.cpp=.o): %%.o: %%.cpp
	@echo Compiling $(BUILD_TYPE) $< ...
	@$(CXX) -c $(CXXFLAGS) -o $@ $<

$(LIB_CXX_SOURCES:.cxx=.o): %%.o: %%.cxx
	@echo Compiling $(BUILD_TYPE) $< ...
	@$(CXX) -c $(CXXFLAGS) -o $@ $<

$(SLIB_CXX_SOURCES:.cxx=.o): %%.o: %%.cxx
	@echo Compiling $(BUILD_TYPE) $< ...
	@$(CXX) -c $(CXXFLAGS) -o $@ $<

$(EXE_CXX_SOURCES:.cxx=.o): %%.o: %%.cxx
	@echo Compiling $(BUILD_TYPE) $< ...
	@$(CXX) -c $(CXXFLAGS) -o $@ $<

#
# Objective-C
#

$(LIB_M_SOURCES:.m=.o): %%.o: %%.m
	@echo Compiling $(BUILD_TYPE) $< ...
	@$(CC) -c $(CFLAGS) -o $@ $<

$(SLIB_M_SOURCES:.m=.o): %%.o: %%.m
	@echo Compiling $(BUILD_TYPE) $< ...
	@$(CC) -c $(CFLAGS) -o $@ $<

$(EXE_M_SOURCES:.m=.o): %%.o: %%.m
	@echo Compiling $(BUILD_TYPE) $< ...
	@$(CC) -c $(CFLAGS) -o $@ $<

#
# Objective-C++
#

$(LIB_MM_SOURCES:.mm=.o): %%.o: %%.mm
	@echo Compiling $(BUILD_TYPE) $< ...
	@$(CXX) -c $(CXXFLAGS) -o $@ $<

$(SLIB_MM_SOURCES:.mm=.o): %%.o: %%.mm
	@echo Compiling $(BUILD_TYPE) $< ...
	@$(CXX) -c $(CXXFLAGS) -o $@ $<

$(EXE_MM_SOURCES:.mm=.o): %%.o: %%.mm
	@echo Compiling $(BUILD_TYPE) $< ...
	@$(CXX) -c $(CXXFLAGS) -o $@ $<

%
%)%)%