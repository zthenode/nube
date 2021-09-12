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
%#   File: os-gcc-makefile-target.t
%#
%# Author: $author$
%#   Date: 11/15/2019
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%out,%(%else-then(%out%,%(Lib)%)%)%,%
%Out,%(%else-then(%Out%,%(%out%)%)%)%,%
%OUT,%(%else-then(%OUT%,%(%toupper(%Out%)%)%)%)%,%
%out,%(%else-then(%_Out%,%(%tolower(%Out%)%)%)%)%,%
%slib,%(%else-then(%slib%,%(%else(%equal(EXE,%OUT%)%%equal(LIB,%OUT%)%,Lib)%)%)%)%,%
%SLib,%(%else-then(%SLib%,%(%slib%)%)%)%,%
%SLIB,%(%else-then(%SLIB%,%(%toupper(%SLib%)%)%)%)%,%
%slib,%(%else-then(%_SLib%,%(%tolower(%SLib%)%)%)%)%,%
%lib,%(%else-then(%lib%,%(%else(%equal(EXE,%OUT%)%%equal(SLIB,%OUT%)%,Lib)%)%)%)%,%
%Lib,%(%else-then(%Lib%,%(%lib%)%)%)%,%
%LIB,%(%else-then(%LIB%,%(%toupper(%Lib%)%)%)%)%,%
%lib,%(%else-then(%_Lib%,%(%tolower(%Lib%)%)%)%)%,%
%output,%(%else-then(%output%,%(%else(%Lib%%SLib%,Executable,%if(%SLib%,Shared )%Library)%)%)%)%,%
%Output,%(%else-then(%Output%,%(%output%)%)%)%,%
%OUTPUT,%(%else-then(%OUTPUT%,%(%toupper(%Output%)%)%)%)%,%
%output,%(%else-then(%_Output%,%(%tolower(%Output%)%)%)%)%,%
%target,%(%else-then(%target%,%(%slib%%lib%%Framework%)%)%)%,%
%Target,%(%else-then(%Target%,%(%target%)%)%)%,%
%TARGET,%(%else-then(%TARGET%,%(%toupper(%Target%)%)%)%)%,%
%target,%(%else-then(%_Target%,%(%tolower(%Target%)%)%)%)%,%
%exe,%(%else-then(%exe%,%(%else(%Lib%%SLib%,%(%if(%equal(%Target%,%Framework%)%,%(_exe)%)%)%)%)%)%)%,%
%Exe,%(%else-then(%Exe%,%(%exe%)%)%)%,%
%EXE,%(%else-then(%EXE%,%(%toupper(%Exe%)%)%)%)%,%
%exe,%(%else-then(%_Exe%,%(%tolower(%Exe%)%)%)%)%,%
%%(%
%PKG = ../../../../../..

BMK = build/Makefile/Gcc
MAK = projects/Makefile/Gcc
PRJ = projects/os/Makefile/Gcc
SRC = src

include $(PKG)/$(BMK)/Makedefines
include $(PKG)/$(MAK)/Makedefines
include $(PKG)/$(MAK)/Makefile
include $(PKG)/$(BMK)/Makefile
include $(PKG)/$(MAK)/%if(%Lib%,lib,app)%/%Target%/Makefile

#
# target
#
%OUT%TARGET = ${%Target%%Exe%_%OUT%TARGET}

#
# headers
#
%OUT%HEADERS = ${%Target%%Exe%_%OUT%HEADERS}

########################################################################

#
# user defines
#
USRDEFINES += \
${%Target%%Exe%_USRDEFINES}

#
# user includes
#
USRINCLUDES += \
${%Target%%Exe%_USRINCLUDES}

#
# user libdirs
#
USRLIBDIRS += \
${%Target%%Exe%_USRLIBDIRS}

#
# user c++ flags
#
USRCXXFLAGS += \
${%Target%%Exe%_USRCXXFLAGS}

#
# user c flags
#
USRCFLAGS += \
${%Target%%Exe%_USRCFLAGS}

#
# user ld flags
#
USRLDFLAGS += \
${%Target%%Exe%_USRLDFLAGS}

########################################################################

#
# %Output% C sources
#
%OUT%_C_SOURCES += \
${%Target%%Exe%_%OUT%_C_SOURCES}

#
# %Output% C++ .cc sources
#
%OUT%_CC_SOURCES += \
${%Target%%Exe%_%OUT%_CC_SOURCES}

#
# %Output% C++ .cxx sources
#
%OUT%_CXX_SOURCES += \
${%Target%%Exe%_%OUT%_CXX_SOURCES}

#
# %Output% C++ .cpp sources
#
%OUT%_CPP_SOURCES += \
${%Target%%Exe%_%OUT%_CPP_SOURCES}

#
# %Output% Objective C .m sources
#
%OUT%_M_SOURCES += \
${%Target%%Exe%_%OUT%_M_SOURCES}

#
# %Output% Objective C++ .mm sources
#
%OUT%_MM_SOURCES += \
${%Target%%Exe%_%OUT%_MM_SOURCES}

%else(%Lib%,%(%
%########################################################################

#
# %Output% libraries
#
LIBS += \
${%Target%%Exe%_LIBS}

)%)%########################################################################

#
# %Output% depends
#
#%OUT%DEP += \
#$(PKG)/$(BLD)/libsomelib \
#
%OUT%DEP += \

#
# %Output% depend dirs
#
#%OUT%DEP_DIRS += \
#../libsomelib
#
%OUT%DEP_DIRS += \

include $(PKG)/$(MAK)/Makerules

#
# %Output% depend rules
#
#$(PKG)/$(BLD)/libsomelib.a:
#	@(echo Building libsomelib.a ...;\
#	  pushd ../libsomelib;\
#	  ((make) || (exit 1));\
#	  popd)
#
%
%)%)%