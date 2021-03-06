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
%#   File: os-QtCreator-pri.t
%#
%# Author: $author$
%#   Date: 9/2/2017
%########################################################################
%with(%
%filepath,%(%else-then(%filepath%,%(%filepath(%input%)%)%)%)%,%
%Filepath,%(%else-then(%Filepath%,%(%filepath%)%)%)%,%
%FILEPATH,%(%else-then(%FILEPATH%,%(%toupper(%Filepath%)%)%)%)%,%
%filepath,%(%else-then(%_Filepath%,%(%tolower(%Filepath%)%)%)%)%,%
%organization,%(%else-then(%organization%,%($organization$)%)%)%,%
%Organization,%(%else-then(%Organization%,%(%organization%)%)%)%,%
%ORGANIZATION,%(%else-then(%ORGANIZATION%,%(%toupper(%Organization%)%)%)%)%,%
%organization,%(%else-then(%_Organization%,%(%tolower(%Organization%)%)%)%)%,%
%author,%(%else-then(%author%,%($author$)%)%)%,%
%Author,%(%else-then(%Author%,%(%author%)%)%)%,%
%AUTHOR,%(%else-then(%AUTHOR%,%(%toupper(%Author%)%)%)%)%,%
%author,%(%else-then(%_Author%,%(%tolower(%Author%)%)%)%)%,%
%date,%(%else-then(%date%,%(%date()%)%)%)%,%
%Date,%(%else-then(%Date%,%(%date%)%)%)%,%
%DATE,%(%else-then(%DATE%,%(%toupper(%Date%)%)%)%)%,%
%date,%(%else-then(%_Date%,%(%tolower(%Date%)%)%)%)%,%
%year,%(%else-then(%year%,%(%year()%)%)%)%,%
%Year,%(%else-then(%Year%,%(%year%)%)%)%,%
%YEAR,%(%else-then(%YEAR%,%(%toupper(%Year%)%)%)%)%,%
%year,%(%else-then(%_Year%,%(%tolower(%Year%)%)%)%)%,%
%month,%(%else-then(%month%,%(%month()%)%)%)%,%
%Month,%(%else-then(%Month%,%(%month%)%)%)%,%
%MONTH,%(%else-then(%MONTH%,%(%toupper(%Month%)%)%)%)%,%
%month,%(%else-then(%_Month%,%(%tolower(%Month%)%)%)%)%,%
%day,%(%else-then(%day%,%(%day()%)%)%)%,%
%Day,%(%else-then(%Day%,%(%day%)%)%)%,%
%DAY,%(%else-then(%DAY%,%(%toupper(%Day%)%)%)%)%,%
%day,%(%else-then(%_Day%,%(%tolower(%Day%)%)%)%)%,%
%depends,%(%else-then(%depends%,%()%)%)%,%
%Depends,%(%else-then(%Depends%,%(%depends%)%)%)%,%
%DEPENDS,%(%else-then(%DEPENDS%,%(%toupper(%Depends%)%)%)%)%,%
%depends,%(%else-then(%_Depends%,%(%tolower(%Depends%)%)%)%)%,%
%framework,%(%else-then(%framework%,%(framework)%)%)%,%
%Framework,%(%else-then(%Framework%,%(%framework%)%)%)%,%
%FRAMEWORK,%(%else-then(%FRAMEWORK%,%(%toupper(%Framework%)%)%)%)%,%
%framework,%(%else-then(%_Framework%,%(%tolower(%Framework%)%)%)%)%,%
%target,%(%else-then(%target%,%()%)%)%,%
%Target,%(%else-then(%Target%,%(%target%)%)%)%,%
%TARGET,%(%else-then(%TARGET%,%(%toupper(%Target%)%)%)%)%,%
%target,%(%else-then(%_Target%,%(%tolower(%Target%)%)%)%)%,%
%is_os2,%(%else-then(%is_os2%,%(%is_Os2%)%)%)%,%
%os2,%(%else-then(%if-no(%is_os2%,,%(%os2%)%)%,%(%if-no(%is_os2%,,%()%)%)%)%)%,%
%Os2,%(%else-then(%if-no(%is_os2%,,%(%Os2%)%)%,%(%if-no(%is_os2%,,%(%os2%)%)%)%)%)%,%
%OS2,%(%else-then(%OS2%,%(%toupper(%Os2%)%)%)%)%,%
%os2,%(%else-then(%_os2%,%(%tolower(%Os2%)%)%)%)%,%
%is_os,%(%else-then(%is_os%,%(%is_Os%)%)%)%,%
%os,%(%else-then(%if-no(%is_os%,,%(%os%)%)%,%(%if-no(%is_os%,,%(%else-then(%Os2%,Os)%)%)%)%)%)%,%
%Os,%(%else-then(%if-no(%is_os%,,%(%Os%)%)%,%(%if-no(%is_os%,,%(%os%)%)%)%)%)%,%
%OS,%(%else-then(%OS%,%(%toupper(%Os%)%)%)%)%,%
%os,%(%else-then(%_os%,%(%tolower(%Os%)%)%)%)%,%
%pro,%(%else-then(%pro%,%(pri)%)%)%,%
%Pro,%(%else-then(%Pro%,%(%pro%)%)%)%,%
%PRO,%(%else-then(%PRO%,%(%toupper(%Pro%)%)%)%)%,%
%pro,%(%else-then(%_Pro%,%(%tolower(%Pro%)%)%)%)%,%
%makefile,%(%else-then(%makefile%,%(QtCreator)%)%)%,%
%Makefile,%(%else-then(%Makefile%,%(%makefile%)%)%)%,%
%MAKEFILE,%(%else-then(%MAKEFILE%,%(%toupper(%Makefile%)%)%)%)%,%
%makefile,%(%else-then(%_Makefile%,%(%tolower(%Makefile%)%)%)%)%,%
%extension,%(%else-then(%extension%,%(%else-then(%fileextension(%file%)%,%(%Pro%)%)%)%)%)%,%
%Extension,%(%else-then(%Extension%,%(%extension%)%)%)%,%
%EXTENSION,%(%else-then(%EXTENSION%,%(%toupper(%Extension%)%)%)%)%,%
%extension,%(%else-then(%_Extension%,%(%tolower(%Extension%)%)%)%)%,%
%file,%(%else-then(%file%,%(%Framework%%then-if(%Extension%,.)%)%)%)%,%
%File,%(%else-then(%File%,%(%file%)%)%)%,%
%FILE,%(%else-then(%FILE%,%(%toupper(%File%)%)%)%)%,%
%file,%(%else-then(%_File%,%(%tolower(%File%)%)%)%)%,%
%title,%(%else-then(%title%,%(%if-then(%else-then(%Os%,%(Os)%)%, specific )%%Makefile%%then-if(%if-then(%Extension%, file)%, .)%%then-if(%Framework%, for )%)%)%)%,%
%Title,%(%else-then(%Title%,%(%title%)%)%)%,%
%TITLE,%(%else-then(%TITLE%,%(%toupper(%Title%)%)%)%)%,%
%title,%(%else-then(%_Title%,%(%tolower(%Title%)%)%)%)%,%
%%(%
%%include(%Filepath%/QtCreator-file.t)%%
%%then-if(%if-then(%Depends%,%(
)%)%,# depends )%%
%%if-no(%is_Os%,%(
UNAME = $$system(uname)

contains(UNAME,Darwin) {
%FRAMEWORK%_OS = macosx
} else {
contains(UNAME,Linux) {
%FRAMEWORK%_OS = linux
} else {
%FRAMEWORK%_OS = windows
} # contains(UNAME,Linux)
} # contains(UNAME,Darwin)
)%,%(%FRAMEWORK%_OS = %os%
)%)%
contains(BUILD_OS,%FRAMEWORK%_OS) {
%FRAMEWORK%_BUILD = $${%FRAMEWORK%_OS}
} else {
%FRAMEWORK%_BUILD = $${BUILD_OS}
} # contains(BUILD_OS,%FRAMEWORK%_OS)

contains(BUILD_CPP_VERSION,10) {
CONFIG += c++0x
} else {
contains(BUILD_CPP_VERSION,98|03|11|14|17) {
CONFIG += c++$${BUILD_CPP_VERSION}
} else {
} # contains(BUILD_CPP_VERSION,98|03|11|14|17)
} # contains(BUILD_CPP_VERSION,10)

contains(%FRAMEWORK%_OS,macosx) {
} else {
contains(%FRAMEWORK%_OS,linux) {
QMAKE_CXXFLAGS += -fpermissive
} else {
contains(%FRAMEWORK%_OS,windows) {
} else {
} # contains(%FRAMEWORK%_OS,windows)
} # contains(%FRAMEWORK%_OS,linux)
} # contains(%FRAMEWORK%_OS,macosx)

%parse(%Depends%,;,,,,%(%
%%with(%
%DEPENDS,%(%else-then(%_DEPENDS%,%(%toupper(%Depends%)%)%)%)%,%
%%(########################################################################
# %Depends%
%DEPENDS%_THIRDPARTY_PKG_MAKE_BLD = $${%DEPENDS%_THIRDPARTY_PKG}/build/$${%FRAMEWORK%_BUILD}/$${BUILD_CONFIG}
%DEPENDS%_THIRDPARTY_PRJ_MAKE_BLD = $${OTHER_BLD}/$${%DEPENDS%_THIRDPARTY_PRJ}/build/$${%FRAMEWORK%_BUILD}/$${BUILD_CONFIG}
%DEPENDS%_THIRDPARTY_PKG_BLD = $${%DEPENDS%_THIRDPARTY_PKG}/build/$${%FRAMEWORK%_BUILD}/QtCreator/$${BUILD_CONFIG}
%DEPENDS%_THIRDPARTY_PRJ_BLD = $${OTHER_BLD}/$${%DEPENDS%_THIRDPARTY_PRJ}/build/$${%FRAMEWORK%_BUILD}/QtCreator/$${BUILD_CONFIG}
%DEPENDS%_PKG_BLD = $${OTHER_BLD}/$${%DEPENDS%_PKG}/build/$${%FRAMEWORK%_BUILD}/QtCreator/$${BUILD_CONFIG}
%DEPENDS%_PRJ_BLD = $${OTHER_BLD}/$${%DEPENDS%_PRJ}/build/$${%FRAMEWORK%_BUILD}/QtCreator/$${BUILD_CONFIG}
#%DEPENDS%_LIB = $${%DEPENDS%_THIRDPARTY_PKG_MAKE_BLD}/lib
#%DEPENDS%_LIB = $${%DEPENDS%_THIRDPARTY_PRJ_MAKE_BLD}/lib
#%DEPENDS%_LIB = $${%DEPENDS%_THIRDPARTY_PKG_BLD}/lib
#%DEPENDS%_LIB = $${%DEPENDS%_THIRDPARTY_PRJ_BLD}/lib
%DEPENDS%_LIB = $${%DEPENDS%_PKG_BLD}/lib
#%DEPENDS%_LIB = $${%DEPENDS%_PRJ_BLD}/lib
#%DEPENDS%_LIB = $${%FRAMEWORK%_LIB}
%DEPENDS%_LIB_NAME = $${%DEPENDS%_NAME}

# %Depends% LIBS
#
%Depends%_LIBS += \
-L$${%DEPENDS%_LIB}/lib$${%DEPENDS%_LIB_NAME} \
-l$${%DEPENDS%_LIB_NAME} \

)%)%)%,Depends)%%
%########################################################################
# %Framework%

# %Framework% INCLUDEPATH
#
%Framework%_INCLUDEPATH += \

# %Framework% DEFINES
#
%Framework%_DEFINES += \

# %Framework% LIBS
#
%Framework%_LIBS += \
%reverse-parse(%Depends%,;,,,,%(%
%%with(%
%DEPENDS,%(%else-then(%_DEPENDS%,%(%toupper(%Depends%)%)%)%)%,%
%%($${%Depends%_LIBS} \
)%)%%
%)%,Depends)%%
%$${build_%Framework%_LIBS} \
%if-no(%is_Os%,%(
contains(%FRAMEWORK%_OS,macosx|linux) {
%Framework%_LIBS += \
-lpthread \
-ldl
} else {
} # contains(%FRAMEWORK%_OS,macosx|linux)

contains(%FRAMEWORK%_OS,linux) {
%Framework%_LIBS += \
-lrt
} else {
} # contains(%FRAMEWORK%_OS,linux)
)%,%(%else(,%(-lpthread \
-ldl \
)%)%%else(%equal(macosx,%os%)%%equal(windows,%os%)%,-lrt)%)%)%

%
%)%)%