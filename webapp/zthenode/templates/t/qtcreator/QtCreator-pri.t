%########################################################################
%# Copyright (c) 1988-2021 $organization$
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
%#   File: QtCreator-pri.t
%#
%# Author: $author$
%#   Date: 8/22/2021
%########################################################################
%with(%
%is_include_path,%(%else-then(%is_include_path%,%(%is_Include_path%)%)%)%,%
%include_path,%(%else-then(%if-no(%is_include_path%,,%(%include_path%)%)%,%(%if-no(%is_include_path%,,%(%filepath(%input%)%)%)%)%)%)%,%
%Include_path,%(%else-then(%if-no(%is_include_path%,,%(%Include_path%)%)%,%(%if-no(%is_include_path%,,%(%include_path%)%)%)%)%)%,%
%INCLUDE_PATH,%(%else-then(%INCLUDE_PATH%,%(%toupper(%Include_path%)%)%)%)%,%
%include_path,%(%else-then(%_include_path%,%(%tolower(%Include_path%)%)%)%)%,%
%is_framework,%(%else-then(%is_framework%,%(%is_Framework%)%)%)%,%
%framework,%(%else-then(%if-no(%is_framework%,,%(%framework%)%)%,%(%if-no(%is_framework%,,%(framework)%)%)%)%)%,%
%Framework,%(%else-then(%if-no(%is_framework%,,%(%Framework%)%)%,%(%if-no(%is_framework%,,%(%framework%)%)%)%)%)%,%
%FRAMEWORK,%(%else-then(%FRAMEWORK%,%(%toupper(%Framework%)%)%)%)%,%
%framework,%(%else-then(%_framework%,%(%tolower(%Framework%)%)%)%)%,%
%is_depends,%(%else-then(%is_depends%,%(%is_Depends%)%)%)%,%
%depends,%(%else-then(%if-no(%is_depends%,,%(%depends%)%)%,%(%if-no(%is_depends%,,%(Depends)%)%)%)%)%,%
%Depends,%(%else-then(%if-no(%is_depends%,,%(%Depends%)%)%,%(%if-no(%is_depends%,,%(%depends%)%)%)%)%)%,%
%DEPENDS,%(%else-then(%DEPENDS%,%(%toupper(%Depends%)%)%)%)%,%
%depends,%(%else-then(%_depends%,%(%tolower(%Depends%)%)%)%)%,%
%is_source,%(%else-then(%is_source%,%(%is_Source%)%)%)%,%
%source,%(%else-then(%if-no(%is_source%,,%(%source%)%)%,%(%if-no(%is_source%,,%(source)%)%)%)%)%,%
%Source,%(%else-then(%if-no(%is_source%,,%(%Source%)%)%,%(%if-no(%is_source%,,%(%source%)%)%)%)%)%,%
%SOURCE,%(%else-then(%SOURCE%,%(%toupper(%Source%)%)%)%)%,%
%source,%(%else-then(%_source%,%(%tolower(%Source%)%)%)%)%,%
%%(%
%%include(%Include_path%/QtCreator-file-pri-pro.t)%%
%%include(%Include_path%/QtCreator-file-depends-pri-pro.t)%%
%
OTHER_PKG = ../../../../../..
OTHER_PRJ = ../../../../..
OTHER_BLD = ..

THIRDPARTY_NAME = thirdparty
THIRDPARTY_PKG = $${OTHER_PKG}/$${THIRDPARTY_NAME}
THIRDPARTY_PRJ = $${OTHER_PRJ}/$${THIRDPARTY_NAME}
THIRDPARTY_SRC = $${OTHER_PRJ}/%Source%/$${THIRDPARTY_NAME}
%parse(%Depends%,;,,,,%(%
%%with(%
%DEPENDS,%(%else-then(%_DEPENDS%,%(%toupper(%Depends%)%)%)%)%,%
%%(%
%
########################################################################
# %Depends%
%DEPENDS%_VERSION_MAJOR = 0
%DEPENDS%_VERSION_MINOR = 0
%DEPENDS%_VERSION_RELEASE = 0
%DEPENDS%_VERSION = $${%DEPENDS%_VERSION_MAJOR}.$${%DEPENDS%_VERSION_MINOR}.$${%DEPENDS%_VERSION_RELEASE}
%DEPENDS%_NAME = %Depends%
%DEPENDS%_GROUP = $${%DEPENDS%_NAME}
%DEPENDS%_SOURCE = %Source%
%DEPENDS%_DIR = $${%DEPENDS%_GROUP}/$${%DEPENDS%_NAME}-$${%DEPENDS%_VERSION}
%DEPENDS%_PKG_DIR = $${%DEPENDS%_NAME}%then-if(%Language%,/)%%then-if(%Style%,/)%
%DEPENDS%_HOME_BUILD = $${HOME}/build/$${%DEPENDS%_NAME}
%DEPENDS%_HOME_BUILD_INCLUDE = $${%DEPENDS%_HOME_BUILD}/include
%DEPENDS%_HOME_BUILD_LIB = $${%DEPENDS%_HOME_BUILD}/lib
%DEPENDS%_THIRDPARTY_PKG = $${THIRDPARTY_PKG}/$${%DEPENDS%_DIR}
%DEPENDS%_THIRDPARTY_PRJ = $${THIRDPARTY_PRJ}/$${%DEPENDS%_DIR}
%DEPENDS%_THIRDPARTY_SRC = $${THIRDPARTY_SRC}/$${%DEPENDS%_PKG_DIR}
%DEPENDS%_THIRDPARTY_SRC_GROUP = $${%DEPENDS%_NAME}
%DEPENDS%_THIRDPARTY_SRC_NAME = $${%DEPENDS%_NAME}
%DEPENDS%_THIRDPARTY_SRC_SOURCE = $${%DEPENDS%_SOURCE}
%DEPENDS%_THIRDPARTY_SRC_DIR = $${THIRDPARTY_SRC}/$${%DEPENDS%_THIRDPARTY_SRC_GROUP}/$${%DEPENDS%_THIRDPARTY_SRC_NAME} 
%DEPENDS%_PKG = $${OTHER_PKG}/$${%DEPENDS%_PKG_DIR}
%DEPENDS%_PRJ = $${OTHER_PRJ}/$${%DEPENDS%_PKG_DIR}
#%DEPENDS%_SRC = $${%DEPENDS%_THIRDPARTY_SRC_DIR}/$${%DEPENDS%_THIRDPARTY_SRC_SOURCE}
#%DEPENDS%_SRC = $${%DEPENDS%_THIRDPARTY_PKG}/$${%DEPENDS%_SOURCE}
#%DEPENDS%_SRC = $${%DEPENDS%_THIRDPARTY_PRJ}/$${%DEPENDS%_SOURCE}
%DEPENDS%_SRC = $${%DEPENDS%_PKG}/$${%DEPENDS%_SOURCE}
#%DEPENDS%_SRC = $${%DEPENDS%_PRJ}/$${%DEPENDS%_SOURCE}

# %Depends% INCLUDEPATH
#
%Depends%_INCLUDEPATH += \
$${%DEPENDS%_SRC} \

# %Depends% DEFINES
#
%Depends%_DEFINES += \

#%Depends%_OBJECTIVE_HEADERS += \
#$${%DEPENDS%_SRC}/%Depends%.hh \

#%Depends%_OBJECTIVE_SOURCES += \
#$${%DEPENDS%_SRC}/%Depends%.mm \

#%Depends%_HEADERS += \
#$${%DEPENDS%_SRC}/%Depends%.hpp \

#%Depends%_SOURCES += \
#$${%DEPENDS%_SRC}/%Depends%.cpp \
)%)%%
%)%,Depends)%
########################################################################
# %Framework%
%FRAMEWORK%_NAME = %Framework%
%FRAMEWORK%_SOURCE = %Source%

%FRAMEWORK%_PKG = ../../../../..
%FRAMEWORK%_BLD = ../..

%FRAMEWORK%_PRJ = $${%FRAMEWORK%_PKG}
%FRAMEWORK%_BIN = $${%FRAMEWORK%_BLD}/bin
%FRAMEWORK%_LIB = $${%FRAMEWORK%_BLD}/lib
%FRAMEWORK%_SRC = $${%FRAMEWORK%_PKG}/$${%FRAMEWORK%_SOURCE}

# %Framework% BUILD_CONFIG
#
CONFIG(debug, debug|release) {
BUILD_CONFIG = Debug
%Framework%_DEFINES += DEBUG_BUILD
} else {
BUILD_CONFIG = Release
%Framework%_DEFINES += RELEASE_BUILD
} # CONFIG(debug, debug|release)

# %Framework% INCLUDEPATH
#
%Framework%_INCLUDEPATH += \
$${%FRAMEWORK%_SRC} \
%reverse-parse(%Depends%,;,,,,%(%
%%with(%
%DEPENDS,%(%else-then(%_DEPENDS%,%(%toupper(%Depends%)%)%)%)%,%
%%($${%Depends%_INCLUDEPATH} \
)%)%%
%)%,Depends)%%
%$${build_%Framework%_INCLUDEPATH} \

# %Framework% DEFINES
#
%Framework%_DEFINES += \
%parse(%Depends%,;,,,,%(%
%%with(%
%DEPENDS,%(%else-then(%_DEPENDS%,%(%toupper(%Depends%)%)%)%)%,%
%%($${%Depends%_DEFINES} \
)%)%%
%)%,Depends)%%
%$${build_%Framework%_DEFINES} \

# %Framework% LIBS
#
%Framework%_LIBS += \
-L$${%FRAMEWORK%_LIB}/lib$${%FRAMEWORK%_NAME} \
-l$${%FRAMEWORK%_NAME} \

%
%)%)%