%########################################################################
%# Copyright (c) 1988-2018 $organization$
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
%#   File: framework-depend-QtCreator-pri.t
%#
%# Author: $author$
%#   Date: 11/25/2018
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%framework,%(%else-then(%framework%,%(framework)%)%)%,%
%Framework,%(%else-then(%Framework%,%(%framework%)%)%)%,%
%FRAMEWORK,%(%else-then(%FRAMEWORK%,%(%toupper(%Framework%)%)%)%)%,%
%framework,%(%else-then(%_Framework%,%(%tolower(%Framework%)%)%)%)%,%
%depends,%(%else-then(%depends%,%(depend)%)%)%,%
%Depends,%(%else-then(%Depends%,%(%depends%)%)%)%,%
%DEPENDS,%(%else-then(%DEPENDS%,%(%toupper(%Depends%)%)%)%)%,%
%depends,%(%else-then(%_Depends%,%(%tolower(%Depends%)%)%)%)%,%
%depend,%(%else-then(%depend%,%(%else-then(%right(%Depends%,;)%,%(%Depends%)%)%)%)%)%,%
%Depend,%(%else-then(%Depend%,%(%depend%)%)%)%,%
%DEPEND,%(%else-then(%DEPEND%,%(%toupper(%Depend%)%)%)%)%,%
%depend,%(%else-then(%_Depend%,%(%tolower(%Depend%)%)%)%)%,%
%file,%(%else-then(%file%,%(%Depend%.pri)%)%)%,%
%File,%(%else-then(%File%,%(%file%)%)%)%,%
%FILE,%(%else-then(%FILE%,%(%toupper(%File%)%)%)%)%,%
%file,%(%else-then(%_File%,%(%tolower(%File%)%)%)%)%,%
%target,%(%else-then(%target%,%(%Depend%)%)%)%,%
%Target,%(%else-then(%Target%,%(%target%)%)%)%,%
%TARGET,%(%else-then(%TARGET%,%(%toupper(%Target%)%)%)%)%,%
%target,%(%else-then(%_Target%,%(%tolower(%Target%)%)%)%)%,%
%which,%(%else-then(%which%,%(build)%)%)%,%
%Which,%(%else-then(%Which%,%(%which%)%)%)%,%
%WHICH,%(%else-then(%WHICH%,%(%toupper(%Which%)%)%)%)%,%
%which,%(%else-then(%_Which%,%(%tolower(%Which%)%)%)%)%,%
%%(%
%%include(%include_path%/QtCreator-file.t)%%
%
########################################################################
# %Framework% %Depend%
#
# pkg-config --cflags --libs %Depend%
#

# %Framework% %Depend% INCLUDEPATH
#
%Framework%_%Depend%_INCLUDEPATH += \
$${build_%Depend%_INCLUDEPATH}

# %Framework% %Depend% DEFINES
#
%Framework%_%Depend%_DEFINES += \
$${build_%Depend%_DEFINES}

# %Framework% %Depend% FRAMEWORKS
#
%Framework%_%Depend%_FRAMEWORKS += \
$${build_%Depend%_FRAMEWORKS}

# %Framework% %Depend% LIBS
#
%Framework%_%Depend%_LIBS += \
$${build_%Depend%_LIBS}

)%)%