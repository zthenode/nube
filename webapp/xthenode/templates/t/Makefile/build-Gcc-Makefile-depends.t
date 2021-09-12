%########################################################################
%# Copyright (c) 1988-2017 $organization$
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
%#   File: build-Gcc-Makefile-depends.t
%#
%# Author: $author$
%#   Date: 7/16/2017
%########################################################################
%with(%
%is_depends,%(%else-then(%is_depends%,%(%is_Depends%)%)%)%,%
%depends,%(%else-then(%if-no(%is_depends%,,%(%depends%)%)%,%(%if-no(%is_depends%,,%(depends)%)%)%)%)%,%
%Depends,%(%else-then(%if-no(%is_depends%,,%(%Depends%)%)%,%(%if-no(%is_depends%,,%(%depends%)%)%)%)%)%,%
%DEPENDS,%(%else-then(%DEPENDS%,%(%toupper(%Depends%)%)%)%)%,%
%depends,%(%else-then(%_depends%,%(%tolower(%Depends%)%)%)%)%,%
%%(%
%%parse(%Depends%,;,,,,%(%parse(%Depends%,%(,)%,,,,%(
########################################################################
# build %Depends%
#
# pkg-config --cflags --libs %Depends%
#

ifndef USE_HOME_BUILD_%Depends%
USE_HOME_BUILD_%Depends% = no
endif #ndef USE_HOME_BUILD_%Depends%

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

else # eq ($(USE_HOME_BUILD_%Depends%),yes)
#
# build %Depends%
#
build_%Depends%_USRDEFINES += \

build_%Depends%_USRINCLUDES += \

build_%Depends%_USRCXXFLAGS += \

build_%Depends%_USRLIBDIRS += \

build_%Depends%_LIBS += \

build_%Depends%_FRAMEWORKS += \

endif # eq ($(USE_HOME_BUILD_%Depends%),yes)
)%,Depends)%)%,Depends)%%
%)%)%