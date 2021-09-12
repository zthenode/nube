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
%#   File: target-qtcreator-pri.t
%#
%# Author: $author$
%#   Date: 10/30/2019
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%is_headers,%(%else-then(%is_headers%,%(%is_Headers%)%)%)%,%
%headers,%(%else-then(%headers%,%(%Framework%/base/base.hpp)%)%)%,%
%Headers,%(%else-then(%Headers%,%(%headers%)%)%)%,%
%HEADERS,%(%else-then(%HEADERS%,%(%toupper(%Headers%)%)%)%)%,%
%headers,%(%else-then(%_Headers%,%(%tolower(%Headers%)%)%)%)%,%
%is_sources,%(%else-then(%is_sources%,%(%is_Sources%)%)%)%,%
%sources,%(%else-then(%sources%,%(%parse(%Headers%,;,,;,,%(%filebase(%Header%)%.cpp)%,Header)%)%)%)%,%
%Sources,%(%else-then(%Sources%,%(%sources%)%)%)%,%
%SOURCES,%(%else-then(%SOURCES%,%(%toupper(%Sources%)%)%)%)%,%
%sources,%(%else-then(%_Sources%,%(%tolower(%Sources%)%)%)%)%,%
%is_objectheaders,%(%else-then(%is_objectheaders%,%(%is_ObjectHeaders%)%)%)%,%
%objectheaders,%(%else-then(%if-no(%is_objectheaders%,,%(%objectheaders%)%)%,%(%if-no(%is_objectheaders%,,%(%parse(%Headers%,;,,;,,%(%filebase(%Header%)%.hh)%,Header)%)%)%)%)%)%,%
%ObjectHeaders,%(%else-then(%if-no(%is_objectheaders%,,%(%ObjectHeaders%)%)%,%(%objectheaders%)%)%)%,%
%OBJECTHEADERS,%(%else-then(%OBJECTHEADERS%,%(%toupper(%ObjectHeaders%)%)%)%)%,%
%objectheaders,%(%else-then(%_ObjectHeaders%,%(%tolower(%ObjectHeaders%)%)%)%)%,%
%is_objectsources,%(%else-then(%is_objectsources%,%(%is_ObjectSources%)%)%)%,%
%objectsources,%(%else-then(%if-no(%is_objectsources%,,%(%objectsources%)%)%,%(%if-no(%is_objectsources%,,%(%parse(%ObjectHeaders%,;,,;,,%(%filebase(%Header%)%.mm)%,Header)%)%)%)%)%)%,%
%ObjectSources,%(%else-then(%if-no(%is_objectsources%,,%(%ObjectSources%)%)%,%(%objectsources%)%)%)%,%
%OBJECTSOURCES,%(%else-then(%OBJECTSOURCES%,%(%toupper(%ObjectSources%)%)%)%)%,%
%objectsources,%(%else-then(%_ObjectSources%,%(%tolower(%ObjectSources%)%)%)%)%,%
%%(%
%
########################################################################
# %lib%%Target%

# %lib%%Target%%_exe% TARGET
#
%lib%%Target%%_exe%_TARGET = %Target%%
%%if(%Lib%%SLib%,%(
%lib%%Target%%_exe%_TEMPLATE = lib%if(%Lib%,%(
%lib%%Target%%_exe%_CONFIG += staticlib)%)%)%)%

# %lib%%Target%%_exe% INCLUDEPATH
#
%lib%%Target%%_exe%_INCLUDEPATH += \
$${%Framework%_INCLUDEPATH} \

# %lib%%Target%%_exe% DEFINES
#
%lib%%Target%%_exe%_DEFINES += \
$${%Framework%_DEFINES} \

########################################################################
# %lib%%Target%%_exe% OBJECTIVE_HEADERS
#
#%lib%%Target%%_exe%_OBJECTIVE_HEADERS += \
#%parse(%ObjectHeaders%,;,,%(\ )%,,%($${%FRAMEWORK%_SRC}/%Header%)%,Header)% \

# %lib%%Target%%_exe% OBJECTIVE_SOURCES
#
#%lib%%Target%%_exe%_OBJECTIVE_SOURCES += \
#%parse(%ObjectSources%,;,,%(\ )%,,%($${%FRAMEWORK%_SRC}/%Source%)%,Source)% \

########################################################################
# %lib%%Target%%_exe% HEADERS
#
#%lib%%Target%%_exe%_HEADERS += \
#%parse(%Headers%,;,,%(\ )%,,%($${%FRAMEWORK%_SRC}/%Header%)%,Header)% \

# %lib%%Target%%_exe% SOURCES
#
#%lib%%Target%%_exe%_SOURCES += \
#%parse(%Sources%,;,,%(\ )%,,%($${%FRAMEWORK%_SRC}/%Source%)%,Source)% \

%else(%lib%,%(########################################################################
# %lib%%Target%%_exe% FRAMEWORKS
#
%lib%%Target%%_exe%_FRAMEWORKS += \
$${%Framework%_FRAMEWORKS} \

# %lib%%Target%%_exe% LIBS
#
%lib%%Target%%_exe%_LIBS += \
$${%Framework%_LIBS} \
)%)%

%
%)%)%