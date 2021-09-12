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
%#   File: build-gcc-makefile.t
%#
%# Author: $author$
%#   Date: 11/14/2019
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%is_os,%(%else-then(%is_os%,%()%)%)%,%
%os,%(%else-then(%os%,%(Build)%)%)%,%
%Os,%(%else-then(%Os%,%(%os%)%)%)%,%
%OS,%(%else-then(%OS%,%(%toupper(%Os%)%)%)%)%,%
%os,%(%else-then(%_Os%,%(%tolower(%Os%)%)%)%)%,%
%%(%
%%include(%include_path%/gcc-makefile-file.t)%%
%%parse(%Depends%,;,,,,%(
########################################################################
# %Depends%
#
# pkg-config --cflags --libs %Depends%
#

ifndef USE_HOME_BUILD_%Depends%
USE_HOME_BUILD_%Depends% = no
endif

ifeq ($(USE_HOME_BUILD_%Depends%),yes)
#
# home build %Depends%
#
build_%Depends%_USRDEFINES += \

build_%Depends%_USRINCLUDES += \
-I$(HOME)/build/%Depends%/include \

build_%Depends%_USRCXXFLAGS += \

build_%Depends%_USRLIBDIRS += \
-L$(HOME)/build/%Depends%/lib \

build_%Depends%_LIBS += \
-l%Depends% \

build_%Depends%_FRAMEWORKS += \

else
#
# build %Depends%
#
build_%Depends%_USRDEFINES += \

build_%Depends%_USRINCLUDES += \

build_%Depends%_USRCXXFLAGS += \

build_%Depends%_USRLIBDIRS += \

build_%Depends%_LIBS += \

build_%Depends%_FRAMEWORKS += \

endif
)%,Depends)%%
%
########################################################################
# %Framework%

# build %Framework% USRDEFINES
#
build_%Framework%_USRDEFINES += \
%parse(%Depends%,;,,,,%(${build_%Depends%_USRDEFINES} \
)%,Depends)%

# build %Framework% USRINCLUDES
#
build_%Framework%_USRINCLUDES += \
%reverse-parse(%Depends%,;,,,,%(${build_%Depends%_USRINCLUDES} \
)%,Depends)%

# build %Framework% USRCXXFLAGS
#
build_%Framework%_USRCXXFLAGS += \
%parse(%Depends%,;,,,,%(${build_%Depends%_USRCXXFLAGS} \
)%,Depends)%

# build %Framework% USRLIBDIRS
#
build_%Framework%_USRLIBDIRS += \
%reverse-parse(%Depends%,;,,,,%(${build_%Depends%_USRLIBDIRS} \
)%,Depends)%

# build %Framework% FRAMEWORKS
#
build_%Framework%_FRAMEWORKS += \
%reverse-parse(%Depends%,;,,,,%(${build_%Depends%_FRAMEWORKS} \
)%,Depends)%

# build %Framework% LIBS
#
build_%Framework%_LIBS += \
%reverse-parse(%Depends%,;,,,,%(${build_%Depends%_LIBS} \
)%,Depends)%%
%${build_%Framework%_FRAMEWORKS}

%
%)%)%