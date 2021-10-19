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
%#   File: target-QtCreator-pri.t
%#
%# Author: $author$
%#   Date: 8/22/2021
%########################################################################
%with(%
%is_framework,%(%else-then(%is_framework%,%(%is_Framework%)%)%)%,%
%framework,%(%else-then(%if-no(%is_framework%,,%(%framework%)%)%,%(%if-no(%is_framework%,,%(framework)%)%)%)%)%,%
%Framework,%(%else-then(%if-no(%is_framework%,,%(%Framework%)%)%,%(%if-no(%is_framework%,,%(%framework%)%)%)%)%)%,%
%FRAMEWORK,%(%else-then(%FRAMEWORK%,%(%toupper(%Framework%)%)%)%)%,%
%framework,%(%else-then(%_framework%,%(%tolower(%Framework%)%)%)%)%,%
%is_target,%(%else-then(%is_target%,%(%is_Target%)%)%)%,%
%target,%(%else-then(%if-no(%is_target%,,%(%target%)%)%,%(%if-no(%is_target%,,%(%Framework%)%)%)%)%)%,%
%Target,%(%else-then(%if-no(%is_target%,,%(%Target%)%)%,%(%if-no(%is_target%,,%(%target%)%)%)%)%)%,%
%TARGET,%(%else-then(%TARGET%,%(%toupper(%Target%)%)%)%)%,%
%target,%(%else-then(%_target%,%(%tolower(%Target%)%)%)%)%,%
%is_target_namespace,%(%else-then(%is_target_namespace%,%(%is_Target_namespace%)%)%)%,%
%target_namespace,%(%else-then(%if-no(%is_target_namespace%,,%(%target_namespace%)%)%,%(%if-no(%is_target_namespace%,,%(%else-then(%Framework%,xos)%/app/console/%Target%)%)%)%)%)%,%
%Target_namespace,%(%else-then(%if-no(%is_target_namespace%,,%(%Target_namespace%)%)%,%(%if-no(%is_target_namespace%,,%(%target_namespace%)%)%)%)%)%,%
%TARGET_NAMESPACE,%(%else-then(%TARGET_NAMESPACE%,%(%toupper(%Target_namespace%)%)%)%)%,%
%target_namespace,%(%else-then(%_target_namespace%,%(%tolower(%Target_namespace%)%)%)%)%,%
%is_target_class,%(%else-then(%is_target_class%,%(%is_Target_class%)%)%)%,%
%target_class,%(%else-then(%if-no(%is_target_class%,,%(%target_class%)%)%,%(%if-no(%is_target_class%,,%(main)%)%)%)%)%,%
%Target_class,%(%else-then(%if-no(%is_target_class%,,%(%Target_class%)%)%,%(%if-no(%is_target_class%,,%(%target_class%)%)%)%)%)%,%
%TARGET_CLASS,%(%else-then(%TARGET_CLASS%,%(%toupper(%Target_class%)%)%)%)%,%
%target_class,%(%else-then(%_target_class%,%(%tolower(%Target_class%)%)%)%)%,%
%is_target_instance,%(%else-then(%is_target_instance%,%(%is_Target_instance%)%)%)%,%
%target_instance,%(%else-then(%if-no(%is_target_instance%,,%(%target_instance%)%)%,%(%if-no(%is_target_instance%,,%(%parse(%Target_namespace%,/,,_)%)%)%)%)%)%,%
%Target_instance,%(%else-then(%if-no(%is_target_instance%,,%(%Target_instance%)%)%,%(%if-no(%is_target_instance%,,%(%target_instance%)%)%)%)%)%,%
%TARGET_INSTANCE,%(%else-then(%TARGET_INSTANCE%,%(%toupper(%Target_instance%)%)%)%)%,%
%target_instance,%(%else-then(%_target_instance%,%(%tolower(%Target_instance%)%)%)%)%,%
%is_target_base,%(%else-then(%is_target_base%,%(%is_Target_base%)%)%)%,%
%target_base,%(%else-then(%if-no(%is_target_base%,,%(%target_base%)%)%,%(%if-no(%is_target_base%,,%(%Target_namespace%/%Target_class%)%)%)%)%)%,%
%Target_base,%(%else-then(%if-no(%is_target_base%,,%(%Target_base%)%)%,%(%if-no(%is_target_base%,,%(%target_base%)%)%)%)%)%,%
%TARGET_BASE,%(%else-then(%TARGET_BASE%,%(%toupper(%Target_base%)%)%)%)%,%
%target_base,%(%else-then(%_target_base%,%(%tolower(%Target_base%)%)%)%)%,%
%is_lib,%(%else-then(%is_lib%,%(%is_Lib%)%)%)%,%
%lib,%(%else-then(%if-no(%is_lib%,,%(%lib%)%)%,%(%if-no(%is_lib%,,%(%equal(lib,%Out%)%)%)%)%)%)%,%
%Lib,%(%else-then(%if-no(%is_lib%,,%(%Lib%)%)%,%(%if-no(%is_lib%,,%(%lib%)%)%)%)%)%,%
%LIB,%(%else-then(%LIB%,%(%toupper(%Lib%)%)%)%)%,%
%lib,%(%else-then(%_lib%,%(%tolower(%Lib%)%)%)%)%,%
%is_slib,%(%else-then(%is_slib%,%(%is_SLib%)%)%)%,%
%slib,%(%else-then(%if-no(%is_slib%,,%(%slib%)%)%,%(%if-no(%is_slib%,,%(%equal(slib,%Out%)%)%)%)%)%)%,%
%SLib,%(%else-then(%if-no(%is_slib%,,%(%SLib%)%)%,%(%if-no(%is_slib%,,%(%slib%)%)%)%)%)%,%
%SLIB,%(%else-then(%SLIB%,%(%toupper(%SLib%)%)%)%)%,%
%slib,%(%else-then(%_slib%,%(%tolower(%SLib%)%)%)%)%,%
%is_exe,%(%else-then(%is_exe%,%(%is_Exe%)%)%)%,%
%exe,%(%else-then(%if-no(%is_exe%,,%(%exe%)%)%,%(%if-no(%is_exe%,,%(%if(%HasExe%%equal(%Target%,%Framework%)%,%(%else(%lib%%slib%,_exe)%)%)%)%)%)%)%)%,%
%Exe,%(%else-then(%if-no(%is_exe%,,%(%Exe%)%)%,%(%if-no(%is_exe%,,%(%exe%)%)%)%)%)%,%
%EXE,%(%else-then(%EXE%,%(%toupper(%Exe%)%)%)%)%,%
%exe,%(%else-then(%_exe%,%(%tolower(%Exe%)%)%)%)%,%
%is_default_logging_levels,%(%else-then(%is_default_logging_levels%,%(%is_Default_logging_levels%)%)%)%,%
%default_logging_levels,%(%else-then(%if-no(%is_default_logging_levels%,,%(%default_logging_levels%)%)%,%(%if-no(%is_default_logging_levels%,,%(ERROR)%)%)%)%)%,%
%Default_logging_levels,%(%else-then(%if-no(%is_default_logging_levels%,,%(%Default_logging_levels%)%)%,%(%if-no(%is_default_logging_levels%,,%(%default_logging_levels%)%)%)%)%)%,%
%DEFAULT_LOGGING_LEVELS,%(%else-then(%DEFAULT_LOGGING_LEVELS%,%(%toupper(%Default_logging_levels%)%)%)%)%,%
%default_logging_levels,%(%else-then(%_default_logging_levels%,%(%tolower(%Default_logging_levels%)%)%)%)%,%
%%(%
%
########################################################################
# %lib%%Target%

# %lib%%Target%%exe% TARGET
#
%lib%%Target%%exe%_TARGET = %Target%%
%%if(%Lib%%SLib%,%(
%lib%%Target%%exe%_TEMPLATE = lib%if(%Lib%,%(
%lib%%Target%%exe%_CONFIG += staticlib)%)%)%)%

# %lib%%Target%%exe% INCLUDEPATH
#
%lib%%Target%%exe%_INCLUDEPATH += \
$${%Framework%_INCLUDEPATH} \

# %lib%%Target%%exe% DEFINES
#
%lib%%Target%%exe%_DEFINES += \
$${%Framework%_DEFINES} \

#DEFAULT_LOGGING_LEVELS_%DEFAULT_LOGGING_LEVELS% \
#%TARGET_INSTANCE%_%TARGET_CLASS%_INSTANCE \

########################################################################
# %lib%%Target%%exe% OBJECTIVE_HEADERS
#
#%lib%%Target%%exe%_OBJECTIVE_HEADERS += \
#$${%FRAMEWORK%_SRC}/%Target_base%.hh \

# %lib%%Target%%exe% OBJECTIVE_SOURCES
#
#%lib%%Target%%exe%_OBJECTIVE_SOURCES += \
#$${%FRAMEWORK%_SRC}/%Target_base%.mm \

########################################################################
# %lib%%Target%%exe% HEADERS
#
#%lib%%Target%%exe%_HEADERS += \
#$${%FRAMEWORK%_SRC}/%Target_base%.hpp \

# %lib%%Target%%exe% SOURCES
#
#%lib%%Target%%exe%_SOURCES += \
#$${%FRAMEWORK%_SRC}/%Target_base%.cpp \

########################################################################
%else(%lib%,%(# %lib%%Target%%exe% FRAMEWORKS
#
%lib%%Target%%exe%_FRAMEWORKS += \
$${%Framework%_FRAMEWORKS} \

# %lib%%Target%%exe% LIBS
#
%lib%%Target%%exe%_LIBS += \
$${%Framework%_LIBS} \
)%)%
%
%)%)%