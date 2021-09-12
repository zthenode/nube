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
%#   File: depends-qtcreator-pri.t
%#
%# Author: $author$
%#   Date: 11/7/2019
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%is_which,%(%else-then(%is_which%,%(%is_Which%)%)%)%,%
%which,%(%else-then(%which%,%(Generic)%)%)%,%
%Which,%(%else-then(%Which%,%(%which%)%)%)%,%
%WHICH,%(%else-then(%WHICH%,%(%toupper(%Which%)%)%)%)%,%
%which,%(%else-then(%_Which%,%(%tolower(%Which%)%)%)%)%,%
%is_exe,%(%else-then(%is_exe%,%(%else-then(%is_Exe%,%(no)%)%)%)%)%,%
%is_depends,%(%else-then(%is_depends%,%(%is_Depends%)%)%)%,%
%depends,%(%else-then(%if-no(%is_depends%,,%depends%)%,%(%if-no(%is_depends%,,Depends)%)%)%)%,%
%Depends,%(%else-then(%if-no(%is_depends%,,%Depends%)%,%(%depends%)%)%)%,%
%DEPENDS,%(%else-then(%DEPENDS%,%(%toupper(%Depends%)%)%)%)%,%
%depends,%(%else-then(%_Depends%,%(%tolower(%Depends%)%)%)%)%,%
%is_framework,%(%else-then(%is_framework%,%(%is_Framework%)%)%)%,%
%framework,%(%else-then(%if-no(%is_framework%,,%framework%)%,%(%if-no(%is_framework%,,Framework)%)%)%)%,%
%Framework,%(%else-then(%if-no(%is_framework%,,%Framework%)%,%(%framework%)%)%)%,%
%FRAMEWORK,%(%else-then(%FRAMEWORK%,%(%toupper(%Framework%)%)%)%)%,%
%framework,%(%else-then(%_Framework%,%(%tolower(%Framework%)%)%)%)%,%
%is_source,%(%else-then(%is_source%,%()%)%)%,%
%source,%(%else-then(%source%,%(src)%)%)%,%
%Source,%(%else-then(%Source%,%(%source%)%)%)%,%
%SOURCE,%(%else-then(%SOURCE%,%(%toupper(%Source%)%)%)%)%,%
%source,%(%else-then(%_Source%,%(%tolower(%Source%)%)%)%)%,%
%%(%
%%include(%include_path%/qtcreator-file.t)%%
%
%
%%include(%include_path%/qtcreator-depends.t)%%
%########################################################################
# %Framework%

# %Framework% INCLUDEPATH
#
%Framework%_INCLUDEPATH += \
$${%FRAMEWORK%_SRC} \
%reverse-parse(%Depends%,;,,,,%(%
%%with(%
%DEPENDS,%(%toupper(%Depends%)%)%,%
%%($${%Depends%_INCLUDEPATH} \
)%)%%
%)%,Depends)%%
%$${build_%Framework%_INCLUDEPATH} \

# %Framework% DEFINES
#
%Framework%_DEFINES += \
%parse(%Depends%,;,,,,%(%
%%with(%
%DEPENDS,%(%toupper(%Depends%)%)%,%
%%($${%Depends%_DEFINES} \
)%)%%
%)%,Depends)%%
%$${build_%Framework%_DEFINES} \

# %Framework% FRAMEWORKS
#
%Framework%_FRAMEWORKS += \

# %Framework% LIBS
#
%Framework%_LIBS += \

########################################################################
%
%)%)%