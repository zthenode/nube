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
%#   File: config-QtCreator-lib-pro.t
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
%is_target,%(%else-then(%is_target%,%(%is_Target%)%)%)%,%
%target,%(%else-then(%if-no(%is_target%,,%(%target%)%)%,%(%if-no(%is_target%,,%(%Framework%)%)%)%)%)%,%
%Target,%(%else-then(%if-no(%is_target%,,%(%Target%)%)%,%(%if-no(%is_target%,,%(%target%)%)%)%)%)%,%
%TARGET,%(%else-then(%TARGET%,%(%toupper(%Target%)%)%)%)%,%
%target,%(%else-then(%_target%,%(%tolower(%Target%)%)%)%)%,%
%is_specific,%(%else-then(%is_specific%,%(%is_Specific%)%)%)%,%
%specific,%(%else-then(%if-no(%is_specific%,,%(%specific%)%)%,%(%if-no(%is_specific%,,%(os)%)%)%)%)%,%
%Specific,%(%else-then(%if-no(%is_specific%,,%(%Specific%)%)%,%(%if-no(%is_specific%,,%(%specific%)%)%)%)%)%,%
%SPECIFIC,%(%else-then(%SPECIFIC%,%(%toupper(%Specific%)%)%)%)%,%
%specific,%(%else-then(%_specific%,%(%tolower(%Specific%)%)%)%)%,%
%is_executable,%(%else-then(%is_executable%,%(%is_Executable%)%)%)%,%
%executable,%(%else-then(%if-no(%is_executable%,,%(%executable%)%)%,%(%if-no(%is_executable%,,%(static library)%)%)%)%)%,%
%Executable,%(%else-then(%if-no(%is_executable%,,%(%Executable%)%)%,%(%if-no(%is_executable%,,%(%executable%)%)%)%)%)%,%
%EXECUTABLE,%(%else-then(%EXECUTABLE%,%(%toupper(%Executable%)%)%)%)%,%
%executable,%(%else-then(%_executable%,%(%tolower(%Executable%)%)%)%)%,%
%is_config,%(%else-then(%is_config%,%(%is_Config%)%)%)%,%
%config,%(%else-then(%if-no(%is_config%,,%(%config%)%)%,%(%if-no(%is_config%,,%(config)%)%)%)%)%,%
%Config,%(%else-then(%if-no(%is_config%,,%(%Config%)%)%,%(%if-no(%is_config%,,%(%config%)%)%)%)%)%,%
%CONFIG,%(%else-then(%CONFIG%,%(%toupper(%Config%)%)%)%)%,%
%config,%(%else-then(%_config%,%(%tolower(%Config%)%)%)%)%,%
%is_os,%(%else-then(%is_os%,%(%is_Os%)%)%)%,%
%os,%(%else-then(%if-no(%is_os%,,%(%os%)%)%,%(%if-no(%is_os%,,%(os%)%)%)%)%)%,%
%Os,%(%else-then(%if-no(%is_os%,,%(%Os%)%)%,%(%if-no(%is_os%,,%(%os%)%)%)%)%)%,%
%OS,%(%else-then(%OS%,%(%toupper(%Os%)%)%)%)%,%
%os,%(%else-then(%_os%,%(%tolower(%Os%)%)%)%)%,%
%is_os1,%(%else-then(%is_os1%,%(%is_Os1%)%)%)%,%
%os1,%(%else-then(%if-no(%is_os1%,,%(%os1%)%)%,%(%if-no(%is_os1%,,%(%Os%)%)%)%)%)%,%
%Os1,%(%else-then(%if-no(%is_os1%,,%(%Os1%)%)%,%(%if-no(%is_os1%,,%(%os1%)%)%)%)%)%,%
%OS1,%(%else-then(%OS1%,%(%toupper(%Os1%)%)%)%)%,%
%os1,%(%else-then(%_os1%,%(%tolower(%Os1%)%)%)%)%,%
%%(%
%%include(%Include_path%/QtCreator-file-pri-pro.t)%%
%
%Framework%/build/%os1%/QtCreator/Debug/lib/lib%Target%

%Framework%/build/%os1%/QtCreator/Release/lib/lib%Target%

%Framework%/build/%os1%/QtCreator/Profile/lib/lib%Target%
%
%)%)%