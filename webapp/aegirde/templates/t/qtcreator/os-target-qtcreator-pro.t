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
%#   File: os-target-qtcreator-pro.t
%#
%# Author: $author$
%#   Date: 10/30/2019
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%%(%
%include(../../../../../build/QtCreator/%Framework%.pri)
include(../../../../QtCreator/%Framework%.pri)
include(../../%Framework%.pri)
include(../../../../QtCreator/%Out%/%lib%%Target%/%lib%%Target%.pri)

TARGET = $${%lib%%Target%%_exe%_TARGET}%
%%if(%Lib%%SLib%,%(
TEMPLATE = $${%lib%%Target%_TEMPLATE}%if(%Lib%,%(
CONFIG += $${%lib%%Target%_CONFIG})%)%)%)%

########################################################################
# INCLUDEPATH
#
INCLUDEPATH += \
$${%lib%%Target%%_exe%_INCLUDEPATH} \

# DEFINES
# 
DEFINES += \
$${%lib%%Target%%_exe%_DEFINES} \

########################################################################
# OBJECTIVE_HEADERS
#
OBJECTIVE_HEADERS += \
$${%lib%%Target%%_exe%_OBJECTIVE_HEADERS} \

# OBJECTIVE_SOURCES
#
OBJECTIVE_SOURCES += \
$${%lib%%Target%%_exe%_OBJECTIVE_SOURCES} \

########################################################################
# HEADERS
#
HEADERS += \
$${%lib%%Target%%_exe%_HEADERS} \
$${OBJECTIVE_HEADERS} \

# SOURCES
#
SOURCES += \
$${%lib%%Target%%_exe%_SOURCES} \

%else(%lib%,%(########################################################################
# FRAMEWORKS
#
FRAMEWORKS += \
$${%lib%%Target%%_exe%_FRAMEWORKS} \

# LIBS
#
LIBS += \
$${%lib%%Target%%_exe%_LIBS} \
$${FRAMEWORKS} \
)%)%
%
%)%)%