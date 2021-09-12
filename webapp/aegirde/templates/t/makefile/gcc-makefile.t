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
%#   File: gcc-makefile.t
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
%is_depends,%(%else-then(%is_depends%,%(%is_Depends%)%)%)%,%
%depends,%(%else-then(%if-no(%is_depends%,,%depends%)%,%(%if-no(%is_depends%,,Depends)%)%)%)%,%
%Depends,%(%else-then(%Depends%,%(%depends%)%)%)%,%
%DEPENDS,%(%else-then(%DEPENDS%,%(%toupper(%Depends%)%)%)%)%,%
%depends,%(%else-then(%_Depends%,%(%tolower(%Depends%)%)%)%)%,%
%is_framework,%(%else-then(%is_framework%,%()%)%)%,%
%framework,%(%else-then(%framework%,%(Framework)%)%)%,%
%Framework,%(%else-then(%Framework%,%(%framework%)%)%)%,%
%FRAMEWORK,%(%else-then(%FRAMEWORK%,%(%toupper(%Framework%)%)%)%)%,%
%framework,%(%else-then(%_Framework%,%(%tolower(%Framework%)%)%)%)%,%
%is_target,%(%else-then(%is_target%,%()%)%)%,%
%target,%(%else-then(%target%,%()%)%)%,%
%Target,%(%else-then(%Target%,%(%target%)%)%)%,%
%TARGET,%(%else-then(%TARGET%,%(%toupper(%Target%)%)%)%)%,%
%target,%(%else-then(%_Target%,%(%tolower(%Target%)%)%)%)%,%
%is_include,%(%else-then(%is_include%,%()%)%)%,%
%include,%(%else-then(%include%,%(gcc-makefile-include.t)%)%)%,%
%Include,%(%else-then(%Include%,%(%include%)%)%)%,%
%INCLUDE,%(%else-then(%INCLUDE%,%(%toupper(%Include%)%)%)%)%,%
%include,%(%else-then(%_Include%,%(%tolower(%Include%)%)%)%)%,%
%%(%
%%include(%include_path%/gcc-makefile-file.t)%%
%
OTHER_VERSION_PKG = ${PKG}%if(%Language%,/..)%%if(%Style%,/..)%
OTHER_DEPENDS_PKG = ${PKG}%if(%Language%,/..)%%if(%Style%,/..)%/..
OTHER_THIRDPARTY_NAME = thirdparty
OTHER_THIRDPARTY_VERSION_PKG = ${OTHER_VERSION_PKG}/${OTHER_THIRDPARTY_NAME}

%FRAMEWORK%_PKG = ${PKG}
%FRAMEWORK%_SRC = ${%FRAMEWORK%_PKG}/src
%FRAMEWORK%_BLD = ${%FRAMEWORK%_PKG}/${BLD}/${BUILD_TYPE}
%FRAMEWORK%_LIB = ${%FRAMEWORK%_BLD}/lib
%FRAMEWORK%_BIN = ${%FRAMEWORK%_BLD}/bin

%parse(%Depends%,;,,,,%(%
%%with(%
%DEPENDS,%(%else-then(%_DEPENDS%,%(%toupper(%Depends%)%)%)%)%,%
%depends,%(%else-then(%_depends%,%(%tolower(%Depends%)%)%)%)%,%
%%(%
%########################################################################
# %Depends%
%DEPENDS%_VERSION_MAJOR = 0
%DEPENDS%_VERSION_MINOR = 0
%DEPENDS%_VERSION_RELEASE = 0
%DEPENDS%_VERSION = ${%DEPENDS%_VERSION_MAJOR}.${%DEPENDS%_VERSION_MINOR}.${%DEPENDS%_VERSION_RELEASE}
%DEPENDS%_NAME = %Depends%
%DEPENDS%_GROUP = ${%DEPENDS%_NAME}
%DEPENDS%_VERSION_DIR = ${%DEPENDS%_GROUP}/${%DEPENDS%_NAME}-${%DEPENDS%_VERSION}
%DEPENDS%_DEPENDS_DIR = ${%DEPENDS%_NAME}%then-if(%Language%,/)%%then-if(%Style%,/)%

#%DEPENDS%_PKG = ${OTHER_THIRDPARTY_VERSION_PKG}/${%DEPENDS%_VERSION_DIR}
#%DEPENDS%_PKG = ${OTHER_VERSION_PKG}/${%DEPENDS%_VERSION_DIR}
%DEPENDS%_PKG = ${OTHER_DEPENDS_PKG}/${%DEPENDS%_DEPENDS_DIR}
#%DEPENDS%_SRC = ${%DEPENDS%_PKG}/src/${BN_GROUP}/${BN_NAME}
%DEPENDS%_SRC = ${%DEPENDS%_PKG}/src
%DEPENDS%_BLD = ${%DEPENDS%_PKG}/${BLD}/${BUILD_TYPE}
%DEPENDS%_LIB = ${%DEPENDS%_BLD}/lib
%DEPENDS%_BIN = ${%DEPENDS%_BLD}/bin

# %Depends% USRDEFINES
#
%Depends%_USRDEFINES += \

# %Depends% USRINCLUDES
#
%Depends%_USRINCLUDES += \
-I${%DEPENDS%_SRC} \

# %Depends% USRCXXFLAGS
#
%Depends%_USRCXXFLAGS += \

# %Depends% USRLIBDIRS
#
%Depends%_USRLIBDIRS += \
-L${%DEPENDS%_LIB} \

# %Depends% LIBS
#
%Depends%_LIBS += \
-l%Depends% \

# %Depends% FRAMEWORKS
#
%Depends%_FRAMEWORKS += \

)%)%)%,Depends)%
########################################################################
# %Framework%

# %Framework% USRDEFINES
#
%Framework%_USRDEFINES += \
%parse(%Depends%,;,,,,%(%
%%with(%
%DEPENDS,%(%else-then(%_DEPENDS%,%(%toupper(%Depends%)%)%)%)%,%
%%(${%Depends%_USRDEFINES} \
)%)%)%,Depends)%%
%${build_%Framework%_USRDEFINES} \

# %Framework% USRINCLUDES
#
%Framework%_USRINCLUDES += \
-I${%FRAMEWORK%_SRC} \
%reverse-parse(%Depends%,;,,,,%(%
%%with(%
%DEPENDS,%(%else-then(%_DEPENDS%,%(%toupper(%Depends%)%)%)%)%,%
%%(${%Depends%_USRINCLUDES} \
)%)%)%,Depends)%%
%${build_%Framework%_USRINCLUDES} \

# %Framework% USRCXXFLAGS
#
%Framework%_USRCXXFLAGS += \
%parse(%Depends%,;,,,,%(%
%%with(%
%DEPENDS,%(%else-then(%_DEPENDS%,%(%toupper(%Depends%)%)%)%)%,%
%%(${%Depends%_USRCXXFLAGS} \
)%)%)%,Depends)%%
%${build_%Framework%_USRCXXFLAGS} \

# %Framework% USRLIBDIRS
#
%Framework%_USRLIBDIRS += \
-L${%FRAMEWORK%_LIB} \
%reverse-parse(%Depends%,;,,,,%(%
%%with(%
%DEPENDS,%(%else-then(%_DEPENDS%,%(%toupper(%Depends%)%)%)%)%,%
%%(${%Depends%_USRLIBDIRS} \
)%)%)%,Depends)%%
%${build_%Framework%_USRLIBDIRS} \

# %Framework% LIBS
#
%Framework%_LIBS += \
-l%Framework% \
%reverse-parse(%Depends%,;,,,,%(%
%%with(%
%DEPENDS,%(%else-then(%_DEPENDS%,%(%toupper(%Depends%)%)%)%)%,%
%%(${%Depends%_LIBS} \
)%)%)%,Depends)%%
%${build_%Framework%_LIBS} \

########################################################################
%
%)%)%