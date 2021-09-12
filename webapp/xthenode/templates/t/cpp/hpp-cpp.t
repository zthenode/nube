%########################################################################
%# Copyright (c) 1988-2020 $organization$
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
%#   File: hpp-cpp.t
%#
%# Author: $author$
%#   Date: 8/2/2020
%########################################################################
%with(%
%is_include_path,%(%else-then(%is_include_path%,%(%is_Include_path%)%)%)%,%
%include_path,%(%else-then(%if-no(%is_include_path%,,%(%include_path%)%)%,%(%if-no(%is_include_path%,,%(%filepath(%input%)%)%)%)%)%)%,%
%Include_path,%(%else-then(%if-no(%is_include_path%,,%(%Include_path%)%)%,%(%if-no(%is_include_path%,,%(%include_path%)%)%)%)%)%,%
%INCLUDE_PATH,%(%else-then(%INCLUDE_PATH%,%(%toupper(%Include_path%)%)%)%)%,%
%include_path,%(%else-then(%_include_path%,%(%tolower(%Include_path%)%)%)%)%,%
%is_base,%(%else-then(%is_base%,%(%is_Base%)%)%)%,%
%base,%(%else-then(%if-no(%is_base%,,%(%base%)%)%,%(%if-no(%is_base%,,%(%else-then(%filebase(%File%)%,%else-then(%Name%,file)%)%)%)%)%)%)%,%
%Base,%(%else-then(%if-no(%is_base%,,%(%Base%)%)%,%(%if-no(%is_base%,,%(%base%)%)%)%)%)%,%
%BASE,%(%else-then(%BASE%,%(%toupper(%Base%)%)%)%)%,%
%base,%(%else-then(%_base%,%(%tolower(%Base%)%)%)%)%,%
%is_extension,%(%else-then(%is_extension%,%(%is_Extension%)%)%)%,%
%extension,%(%else-then(%if-no(%is_extension%,,%(%extension%)%)%,%(%if-no(%is_extension%,,%(%else-then(%fileextension(%File%)%,hpp)%)%)%)%)%)%,%
%Extension,%(%else-then(%if-no(%is_extension%,,%(%Extension%)%)%,%(%if-no(%is_extension%,,%(%extension%)%)%)%)%)%,%
%EXTENSION,%(%else-then(%EXTENSION%,%(%toupper(%Extension%)%)%)%)%,%
%extension,%(%else-then(%_extension%,%(%tolower(%Extension%)%)%)%)%,%
%is_xpp,%(%else-then(%is_xpp%,%(%is_Xpp%)%)%)%,%
%xpp,%(%else-then(%if-no(%is_xpp%,,%(%xpp%)%)%,%(%if-no(%is_xpp%,,%(%else-then(%Extension%,hpp)%)%)%)%)%)%,%
%Xpp,%(%else-then(%if-no(%is_xpp%,,%(%Xpp%)%)%,%(%if-no(%is_xpp%,,%(%xpp%)%)%)%)%)%,%
%XPP,%(%else-then(%XPP%,%(%toupper(%Xpp%)%)%)%)%,%
%xpp,%(%else-then(%_xpp%,%(%tolower(%Xpp%)%)%)%)%,%
%is_hpp,%(%else-then(%is_hpp%,%(%is_Hpp%)%)%)%,%
%hpp,%(%else-then(%if-no(%is_hpp%,,%(%hpp%)%)%,%(%if-no(%is_hpp%,,%(%else-then(,hpp)%)%)%)%)%)%,%
%Hpp,%(%else-then(%if-no(%is_hpp%,,%(%Hpp%)%)%,%(%if-no(%is_hpp%,,%(%hpp%)%)%)%)%)%,%
%HPP,%(%else-then(%HPP%,%(%toupper(%Hpp%)%)%)%)%,%
%hpp,%(%else-then(%_hpp%,%(%tolower(%Hpp%)%)%)%)%,%
%is_cpp,%(%else-then(%is_cpp%,%(%is_Cpp%)%)%)%,%
%cpp,%(%else-then(%if-no(%is_cpp%,,%(%cpp%)%)%,%(%if-no(%is_cpp%,,%(%else-then(,cpp)%)%)%)%)%)%,%
%Cpp,%(%else-then(%if-no(%is_cpp%,,%(%Cpp%)%)%,%(%if-no(%is_cpp%,,%(%cpp%)%)%)%)%)%,%
%CPP,%(%else-then(%CPP%,%(%toupper(%Cpp%)%)%)%)%,%
%cpp,%(%else-then(%_cpp%,%(%tolower(%Cpp%)%)%)%)%,%
%is_include,%(%else-then(%is_include%,%(%is_Include%)%)%)%,%
%include,%(%else-then(%if-no(%is_include%,,%(%include%)%)%,%(%if-no(%is_include%,,%(Include.hpp)%)%)%)%)%,%
%Include,%(%else-then(%if-no(%is_include%,,%(%Include%)%)%,%(%if-no(%is_include%,,%(%include%)%)%)%)%)%,%
%INCLUDE,%(%else-then(%INCLUDE%,%(%toupper(%Include%)%)%)%)%,%
%include,%(%else-then(%_include%,%(%tolower(%Include%)%)%)%)%,%
%is_includes,%(%else-then(%is_includes%,%(%is_Includes%)%)%)%,%
%includes,%(%else-then(%if-no(%is_includes%,,%(%includes%)%)%,%(%if-no(%is_includes%,,%(%
%%parse(%Include%,;,,,,%(#include "%in%"
)%,in)%%
%)%)%)%)%)%,%
%Includes,%(%else-then(%if-no(%is_includes%,,%(%Includes%)%)%,%(%if-no(%is_includes%,,%(%includes%)%)%)%)%)%,%
%INCLUDES,%(%else-then(%INCLUDES%,%(%toupper(%Includes%)%)%)%)%,%
%includes,%(%else-then(%_includes%,%(%tolower(%Includes%)%)%)%)%,%
%is_sys_include,%(%else-then(%is_sys_include%,%(%is_Sys_include%)%)%)%,%
%sys_include,%(%else-then(%if-no(%is_sys_include%,,%(%sys_include%)%)%,%(%if-no(%is_sys_include%,,%(string)%)%)%)%)%,%
%Sys_include,%(%else-then(%if-no(%is_sys_include%,,%(%Sys_include%)%)%,%(%if-no(%is_sys_include%,,%(%sys_include%)%)%)%)%)%,%
%SYS_INCLUDE,%(%else-then(%SYS_INCLUDE%,%(%toupper(%Sys_include%)%)%)%)%,%
%sys_include,%(%else-then(%_sys_include%,%(%tolower(%Sys_include%)%)%)%)%,%
%is_sys_includes,%(%else-then(%is_sys_includes%,%(%is_Sys_includes%)%)%)%,%
%sys_includes,%(%else-then(%if-no(%is_sys_includes%,,%(%sys_includes%)%)%,%(%if-no(%is_sys_includes%,,%(%
%%parse(%Sys_include%,;,,,,%(#include <%in%>
)%,in)%%
%)%)%)%)%)%,%
%Sys_includes,%(%else-then(%if-no(%is_sys_includes%,,%(%Sys_includes%)%)%,%(%if-no(%is_sys_includes%,,%(%sys_includes%)%)%)%)%)%,%
%SYS_INCLUDES,%(%else-then(%SYS_INCLUDES%,%(%toupper(%Sys_includes%)%)%)%)%,%
%sys_includes,%(%else-then(%_sys_includes%,%(%tolower(%Sys_includes%)%)%)%)%,%
%is_namespace,%(%else-then(%is_namespace%,%(%is_Namespace%)%)%)%,%
%namespace,%(%else-then(%if-no(%is_namespace%,,%(%namespace%)%)%,%(%if-no(%is_namespace%,,%(Namespace)%)%)%)%)%,%
%Namespace,%(%else-then(%if-no(%is_namespace%,,%(%Namespace%)%)%,%(%if-no(%is_namespace%,,%(%namespace%)%)%)%)%)%,%
%NAMESPACE,%(%else-then(%NAMESPACE%,%(%toupper(%Namespace%)%)%)%)%,%
%namespace,%(%else-then(%_namespace%,%(%tolower(%Namespace%)%)%)%)%,%
%is_namespace_begin,%(%else-then(%is_namespace_begin%,%(%is_Namespace_begin%)%)%)%,%
%namespace_begin,%(%else-then(%if-no(%is_namespace_begin%,,%(%namespace_begin%)%)%,%(%if-no(%is_namespace_begin%,,%(%
%%parse(%Namespace%,/,,,,%(namespace %ns% {
)%,ns)%%
%)%)%)%)%)%,%
%Namespace_begin,%(%else-then(%if-no(%is_namespace_begin%,,%(%Namespace_begin%)%)%,%(%if-no(%is_namespace_begin%,,%(%namespace_begin%)%)%)%)%)%,%
%NAMESPACE_BEGIN,%(%else-then(%NAMESPACE_BEGIN%,%(%toupper(%Namespace_begin%)%)%)%)%,%
%namespace_begin,%(%else-then(%_namespace_begin%,%(%tolower(%Namespace_begin%)%)%)%)%,%
%is_namespace_end,%(%else-then(%is_namespace_end%,%(%is_Namespace_end%)%)%)%,%
%namespace_end,%(%else-then(%if-no(%is_namespace_end%,,%(%namespace_end%)%)%,%(%if-no(%is_namespace_end%,,%(%
%%reverse-parse(%Namespace%,/,,,,%(} /// namespace %ns%
)%,ns)%%
%)%)%)%)%)%,%
%Namespace_end,%(%else-then(%if-no(%is_namespace_end%,,%(%Namespace_end%)%)%,%(%if-no(%is_namespace_end%,,%(%namespace_end%)%)%)%)%)%,%
%NAMESPACE_END,%(%else-then(%NAMESPACE_END%,%(%toupper(%Namespace_end%)%)%)%)%,%
%namespace_end,%(%else-then(%_namespace_end%,%(%tolower(%Namespace_end%)%)%)%)%,%
%is_ndef_path,%(%else-then(%is_ndef_path%,%(%is_Ndef_path%)%)%)%,%
%ndef_path,%(%else-then(%if-no(%is_ndef_path%,,%(%ndef_path%)%)%,%(%if-no(%is_ndef_path%,,%(%
%%parse(%Namespace%,/,,_)%%
%)%)%)%)%)%,%
%Ndef_path,%(%else-then(%if-no(%is_ndef_path%,,%(%Ndef_path%)%)%,%(%if-no(%is_ndef_path%,,%(%ndef_path%)%)%)%)%)%,%
%NDEF_PATH,%(%else-then(%NDEF_PATH%,%(%toupper(%Ndef_path%)%)%)%)%,%
%ndef_path,%(%else-then(%_ndef_path%,%(%tolower(%Ndef_path%)%)%)%)%,%
%is_ndef_file,%(%else-then(%is_ndef_file%,%(%is_Ndef_file%)%)%)%,%
%ndef_file,%(%else-then(%if-no(%is_ndef_file%,,%(%ndef_file%)%)%,%(%if-no(%is_ndef_file%,,%(Ndef_file)%)%)%)%)%,%
%Ndef_file,%(%else-then(%if-no(%is_ndef_file%,,%(%Ndef_file%)%)%,%(%if-no(%is_ndef_file%,,%(%ndef_file%)%)%)%)%)%,%
%NDEF_FILE,%(%else-then(%NDEF_FILE%,%(%toupper(%Ndef_file%)%)%)%)%,%
%ndef_file,%(%else-then(%_ndef_file%,%(%tolower(%Ndef_file%)%)%)%)%,%
%is_file_ndef,%(%else-then(%is_file_ndef%,%(%is_File_ndef%)%)%)%,%
%file_ndef,%(%else-then(%if-no(%is_file_ndef%,,%(%file_ndef%)%)%,%(%if-no(%is_file_ndef%,,%(%if-then(%Ndef_path%,_)%%Ndef_file%%then-if(%Hpp%,_)%)%)%)%)%)%,%
%File_ndef,%(%else-then(%if-no(%is_file_ndef%,,%(%File_ndef%)%)%,%(%if-no(%is_file_ndef%,,%(%file_ndef%)%)%)%)%)%,%
%FILE_NDEF,%(%else-then(%FILE_NDEF%,%(%toupper(%File_ndef%)%)%)%)%,%
%file_ndef,%(%else-then(%_file_ndef%,%(%tolower(%File_ndef%)%)%)%)%,%
%%(%
%%include(%Include_path%/hpp-cpp-file.t)%%
%%include(%Include_path%/%Prefix%%Xpp%-%Xpp%.t)%%
%)%)%