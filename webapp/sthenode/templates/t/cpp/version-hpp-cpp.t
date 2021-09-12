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
%#   File: version-hpp-cpp.t
%#
%# Author: $author$
%#   Date: 10/23/2019
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%is_framework,%(%else-then(%is_framework%,%()%)%)%,%
%framework,%(%else-then(%framework%,%(Framework)%)%)%,%
%Framework,%(%else-then(%Framework%,%(%framework%)%)%)%,%
%FRAMEWORK,%(%else-then(%FRAMEWORK%,%(%toupper(%Framework%)%)%)%)%,%
%framework,%(%else-then(%_Framework%,%(%tolower(%Framework%)%)%)%)%,%
%is_name,%(%else-then(%is_name%,%()%)%)%,%
%name,%(%else-then(%name%,%(Name)%)%)%,%
%Name,%(%else-then(%Name%,%(%name%)%)%)%,%
%NAME,%(%else-then(%NAME%,%(%toupper(%Name%)%)%)%)%,%
%name,%(%else-then(%_Name%,%(%tolower(%Name%)%)%)%)%,%
%File_name,%(%else-then(%File_name%,%(%if(%is_lowercase_file%,%name%,%Name%)%)%)%)%,%
%File_namet,%(%else-then(%File_namet%,%(%File_name%%if-no(%is_template%,,%if(%is_lowercase_file%,t,T)%)%)%)%)%,%
%file,%(%else-then(%do(%file%)%,%(%else-then(%if(%is_t_file%,%File_namet%,%File_name%)%,%(name)%)%)%)%)%,%
%File,%(%else-then(%File%,%(%file%)%)%)%,%
%FILE,%(%else-then(%FILE%,%(%toupper(%File%)%)%)%)%,%
%file,%(%else-then(%_File%,%(%tolower(%File%)%)%)%)%,%
%base,%(%else-then(%base%,%(%filebase(%File%)%)%)%)%,%
%Base,%(%else-then(%Base%,%(%base%)%)%)%,%
%BASE,%(%else-then(%BASE%,%(%toupper(%Base%)%)%)%)%,%
%base,%(%else-then(%_Base%,%(%tolower(%Base%)%)%)%)%,%
%header,%(%else-then(%header%,%(hpp)%)%)%,%
%Header,%(%else-then(%Header%,%(%header%)%)%)%,%
%HEADER,%(%else-then(%HEADER%,%(%toupper(%Header%)%)%)%)%,%
%header,%(%else-then(%_Header%,%(%tolower(%Header%)%)%)%)%,%
%extension,%(%else-then(%extension%,%(hpp)%)%)%,%
%Extension,%(%else-then(%Extension%,%(%extension%)%)%)%,%
%EXTENSION,%(%else-then(%EXTENSION%,%(%toupper(%Extension%)%)%)%)%,%
%extension,%(%else-then(%_Extension%,%(%tolower(%Extension%)%)%)%)%,%
%namespace,%(%else-then(%namespace%,%(Namespace)%)%)%,%
%Namespace,%(%else-then(%Namespace%,%(%namespace%)%)%)%,%
%Namespace,%(%if-then(%Namespace%,%(%then-if(%Framework%,/)%)%)%)%,%
%NAMESPACE,%(%else-then(%NAMESPACE%,%(%toupper(%Namespace%)%)%)%)%,%
%namespace,%(%else-then(%_Namespace%,%(%tolower(%Namespace%)%)%)%)%,%
%directory,%(%else-then(%if-no(%is_directory%,,%directory%)%,%(%else-then(%if-no(%is_ifndef%,,%else-then(%ifndef_directory%,%namespace%)%)%,%(%if-no(%is_ifndef%,,xos)%)%)%)%)%)%,%
%Directory,%(%else-then(%Directory%,%(%directory%)%)%)%,%
%DIRECTORY,%(%else-then(%DIRECTORY%,%(%toupper(%Directory%)%)%)%)%,%
%directory,%(%else-then(%_Directory%,%(%tolower(%Directory%)%)%)%)%,%
%defined_directory,%(%else-then(%defined_directory%,%(%Directory%)%)%)%,%
%Defined_directory,%(%else-then(%Defined_directory%,%(%defined_directory%)%)%)%,%
%Defined_directory,%(%parse(%Defined_directory%,/,,_)%)%,%
%DEFINED_DIRECTORY,%(%else-then(%DEFINED_DIRECTORY%,%(%toupper(%Defined_directory%)%)%)%)%,%
%defined_directory,%(%else-then(%_Defined_directory%,%(%tolower(%Defined_directory%)%)%)%)%,%
%ifndef_directory,%(%else-then(%if-no(%is_ifndef%,,%ifndef_directory%)%,%(%if-no(%is_ifndef%,,%Directory%)%)%)%)%,%
%Ifndef_directory,%(%else-then(%Ifndef_directory%,%(%ifndef_directory%)%)%)%,%
%Ifndef_directory,%(%
%%then-if(%parse(%Ifndef_directory%,/,,_)%,_)%%
%)%,%
%IFNDEF_DIRECTORY,%(%else-then(%IFNDEF_DIRECTORY%,%(%toupper(%Ifndef_directory%)%)%)%)%,%
%ifndef_directory,%(%else-then(%_Ifndef_directory%,%(%tolower(%Ifndef_directory%)%)%)%)%,%
%include_directory,%(%else-then(%include_directory%,%(%Directory%)%)%)%,%
%Include_directory,%(%else-then(%Include_directory%,%(%include_directory%)%)%)%,%
%include,%(%else-then(%do(%if-no(%is_include%,,%include%)%)%,%(%if-no(%is_include%,,xos/base/Base.hpp)%)%)%)%,%
%Include,%(%else-then(%Include%,%(%include%)%)%)%,%
%sys_include,%(%else-then(%sys_include%,%()%)%)%,%
%Sys_include,%(%else-then(%Sys_include%,%(%sys_include%)%)%)%,%
%is_namespace,%(%else-then(%is_namespace%,%()%)%)%,%
%Namespace_begin,%(%else-then(%Namespace_begin%,%(%
%%if(%Namespace%,%(%parse(%Namespace%,/,,,,%(namespace %ns% {
)%,ns)%
)%)%)%)%)%,%
%Namespace_end,%(%else-then(%Namespace_end%,%(%
%%if(%Namespace%,%(
%reverse-parse(%Namespace%,/,,,,%(} /// namespace %ns%
)%,ns)%)%)%)%)%)%,%
%%(%
%%include(%include_path%/file-hpp-cpp.t)%%
%%include(%include_path%/version-%Extension%.t)%%
%)%)%