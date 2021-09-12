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
%#   File: hxx-cxx.t
%#
%# Author: $author$
%#   Date: 11/26/2019, 1/15/2021
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%is_organization,%(%else-then(%is_organization%,%(%is_Organization%)%)%)%,%
%organization,%(%else-then(%if-no(%is_organization%,,%(%organization%)%)%,%(%if-no(%is_organization%,,%($organization$)%)%)%)%)%,%
%Organization,%(%else-then(%if-no(%is_organization%,,%(%Organization%)%)%,%(%if-no(%is_organization%,,%(%organization%)%)%)%)%)%,%
%ORGANIZATION,%(%else-then(%ORGANIZATION%,%(%toupper(%Organization%)%)%)%)%,%
%organization,%(%else-then(%_organization%,%(%tolower(%Organization%)%)%)%)%,%
%is_author,%(%else-then(%is_author%,%(%is_Author%)%)%)%,%
%author,%(%else-then(%if-no(%is_author%,,%(%author%)%)%,%(%if-no(%is_author%,,%($author$)%)%)%)%)%,%
%Author,%(%else-then(%if-no(%is_author%,,%(%Author%)%)%,%(%if-no(%is_author%,,%(%author%)%)%)%)%)%,%
%AUTHOR,%(%else-then(%AUTHOR%,%(%toupper(%Author%)%)%)%)%,%
%author,%(%else-then(%_author%,%(%tolower(%Author%)%)%)%)%,%
%is_date,%(%else-then(%is_date%,%(%is_Date%)%)%)%,%
%date,%(%else-then(%if-no(%is_date%,,%(%date%)%)%,%(%if-no(%is_date%,,%(%date()%)%)%)%)%)%,%
%Date,%(%else-then(%if-no(%is_date%,,%(%Date%)%)%,%(%if-no(%is_date%,,%(%date%)%)%)%)%)%,%
%DATE,%(%else-then(%DATE%,%(%toupper(%Date%)%)%)%)%,%
%date,%(%else-then(%_date%,%(%tolower(%Date%)%)%)%)%,%
%is_year,%(%else-then(%is_year%,%(%is_Year%)%)%)%,%
%year,%(%else-then(%if-no(%is_year%,,%(%year%)%)%,%(%if-no(%is_year%,,%(%year()%)%)%)%)%)%,%
%Year,%(%else-then(%if-no(%is_year%,,%(%Year%)%)%,%(%if-no(%is_year%,,%(%year%)%)%)%)%)%,%
%YEAR,%(%else-then(%YEAR%,%(%toupper(%Year%)%)%)%)%,%
%year,%(%else-then(%_year%,%(%tolower(%Year%)%)%)%)%,%
%is_namespace,%(%else-then(%is_namespace%,%(%is_Namespace%)%)%)%,%
%namespace,%(%else-then(%if-no(%is_namespace%,,%(%namespace%)%)%,%(%if-no(%is_namespace%,,%(xos)%)%)%)%)%,%
%Namespace,%(%else-then(%if-no(%is_namespace%,,%(%Namespace%)%)%,%(%namespace%)%)%)%,%
%NAMESPACE,%(%else-then(%NAMESPACE%,%(%toupper(%Namespace%)%)%)%)%,%
%namespace,%(%else-then(%_Namespace%,%(%tolower(%Namespace%)%)%)%)%,%
%is_ifndef,%(%else-then(%is_ifndef%,%(%is_Ifndef%)%)%)%,%
%ifndef,%(%else-then(%if-no(%is_ifndef%,,%(%ifndef%)%)%,%(%if-no(%is_ifndef%,,%(%if-no(%is_namespace%,,%(%else-then(%Namespace%,xos/base)%)%)%)%)%)%)%)%,%
%Ifndef,%(%else-then(%if-no(%is_ifndef%,,%(%Ifndef%)%)%,%(%ifndef%)%)%)%,%
%Ifndef,%(%parse(%Ifndef%,/,,_)%)%,%
%IFNDEF,%(%else-then(%IFNDEF%,%(%toupper(%Ifndef%)%)%)%)%,%
%ifndef,%(%else-then(%_Ifndef%,%(%tolower(%Ifndef%)%)%)%)%,%
%is_include,%(%else-then(%is_include%,%(%is_Include%)%)%)%,%
%include,%(%else-then(%if-no(%is_include%,,%(%include%)%)%,%(%if-no(%is_include%,,%(xos/base/base.hpp)%)%)%)%)%,%
%Include,%(%else-then(%if-no(%is_include%,,%(%Include%)%)%,%(%include%)%)%)%,%
%INCLUDE,%(%else-then(%INCLUDE%,%(%toupper(%Include%)%)%)%)%,%
%include,%(%else-then(%_Include%,%(%tolower(%Include%)%)%)%)%,%
%is_sys_include,%(%else-then(%is_sys_include%,%(%is_Sys_include%)%)%)%,%
%sys_include,%(%else-then(%if-no(%is_sys_include%,,%(%sys_include%)%)%,%(%if-no(%is_sys_include%,,%(stdio.h)%)%)%)%)%,%
%Sys_include,%(%else-then(%if-no(%is_sys_include%,,%(%Sys_include%)%)%,%(%sys_include%)%)%)%,%
%SYS_INCLUDE,%(%else-then(%SYS_INCLUDE%,%(%toupper(%Sys_include%)%)%)%)%,%
%sys_include,%(%else-then(%_Sys_include%,%(%tolower(%Sys_include%)%)%)%)%,%
%is_class,%(%else-then(%is_class%,%(%is_Class%)%)%)%,%
%class,%(%else-then(%if-no(%is_class%,,%(%class%)%)%,%(%if-no(%is_class%,,%(c)%)%)%)%)%,%
%Class,%(%else-then(%if-no(%is_class%,,%(%Class%)%)%,%(%if-no(%is_class%,,%(%class%)%)%)%)%)%,%
%CLASS,%(%else-then(%CLASS%,%(%toupper(%Class%)%)%)%)%,%
%class,%(%else-then(%_class%,%(%tolower(%Class%)%)%)%)%,%
%is_name,%(%else-then(%is_name%,%(%is_Name%)%)%)%,%
%name,%(%else-then(%if-no(%is_name%,,%(%name%)%)%,%(%if-no(%is_name%,,%(%Class%)%)%)%)%)%,%
%Name,%(%else-then(%if-no(%is_name%,,%(%Name%)%)%,%(%name%)%)%)%,%
%NAME,%(%else-then(%NAME%,%(%toupper(%Name%)%)%)%)%,%
%name,%(%else-then(%_Name%,%(%tolower(%Name%)%)%)%)%,%
%is_file,%(%else-then(%is_file%,%(%is_File%)%)%)%,%
%file,%(%else-then(%if-no(%is_file%,,%(%file%)%)%,%(%if-no(%is_file%,,%(%Name%)%)%)%)%)%,%
%File,%(%else-then(%if-no(%is_file%,,%(%File%)%)%,%(%file%)%)%)%,%
%FILE,%(%else-then(%FILE%,%(%toupper(%File%)%)%)%)%,%
%file,%(%else-then(%_File%,%(%tolower(%File%)%)%)%)%,%
%is_base,%(%else-then(%is_base%,%(%is_Base%)%)%)%,%
%base,%(%else-then(%if-no(%is_base%,,%(%base%)%)%,%(%if-no(%is_base%,,%(%filebase(%File%)%)%)%)%)%)%,%
%Base,%(%else-then(%if-no(%is_base%,,%(%Base%)%)%,%(%base%)%)%)%,%
%BASE,%(%else-then(%BASE%,%(%toupper(%Base%)%)%)%)%,%
%base,%(%else-then(%_Base%,%(%tolower(%Base%)%)%)%)%,%
%is_extension,%(%else-then(%is_extension%,%(%is_Extension%)%)%)%,%
%extension,%(%else-then(%if-no(%is_extension%,,%(%extension%)%)%,%(%if-no(%is_extension%,,%(%fileextension(%File%)%)%)%)%)%)%,%
%Extension,%(%else-then(%if-no(%is_extension%,,%(%Extension%)%)%,%(%extension%)%)%)%,%
%EXTENSION,%(%else-then(%EXTENSION%,%(%toupper(%Extension%)%)%)%)%,%
%extension,%(%else-then(%_Extension%,%(%tolower(%Extension%)%)%)%)%,%
%is_h,%(%else-then(%is_h%,%(%is_H%)%)%)%,%
%h,%(%else-then(%if-no(%is_h%,,%(%h%)%)%,%(%if-no(%is_h%,,%(%equal(h,%Extension%)%)%)%)%)%)%,%
%H,%(%else-then(%if-no(%is_h%,,%(%H%)%)%,%(%h%)%)%)%,%
%H,%(%else-then(%H%,%(%toupper(%H%)%)%)%)%,%
%h,%(%else-then(%_H%,%(%tolower(%H%)%)%)%)%,%
%is_c,%(%else-then(%is_c%,%(%is_C%)%)%)%,%
%c,%(%else-then(%if-no(%is_c%,,%(%c%)%)%,%(%if-no(%is_c%,,%(%equal(c,%Extension%)%)%)%)%)%)%,%
%C,%(%else-then(%if-no(%is_c%,,%(%C%)%)%,%(%c%)%)%)%,%
%C,%(%else-then(%C%,%(%toupper(%C%)%)%)%)%,%
%c,%(%else-then(%_C%,%(%tolower(%C%)%)%)%)%,%
%is_m,%(%else-then(%is_m%,%(%is_M%)%)%)%,%
%m,%(%else-then(%if-no(%is_m%,,%(%m%)%)%,%(%if-no(%is_m%,,%(%equal(m,%Extension%)%)%)%)%)%)%,%
%M,%(%else-then(%if-no(%is_m%,,%(%M%)%)%,%(%if-no(%is_m%,,%(%m%)%)%)%)%)%,%
%M,%(%else-then(%M%,%(%toupper(%M%)%)%)%)%,%
%m,%(%else-then(%_m%,%(%tolower(%M%)%)%)%)%,%
%is_hh,%(%else-then(%is_hh%,%(%is_HH%)%)%)%,%
%hh,%(%else-then(%if-no(%is_hh%,,%(%hh%)%)%,%(%if-no(%is_hh%,,%(%equal(hh,%Extension%)%)%)%)%)%)%,%
%HH,%(%else-then(%if-no(%is_hh%,,%(%HH%)%)%,%(%if-no(%is_hh%,,%(%hh%)%)%)%)%)%,%
%HH,%(%else-then(%HH%,%(%toupper(%HH%)%)%)%)%,%
%hh,%(%else-then(%_hh%,%(%tolower(%HH%)%)%)%)%,%
%is_cc,%(%else-then(%is_cc%,%(%is_CC%)%)%)%,%
%cc,%(%else-then(%if-no(%is_cc%,,%(%cc%)%)%,%(%if-no(%is_cc%,,%(%equal(cc,%Extension%)%)%)%)%)%)%,%
%CC,%(%else-then(%if-no(%is_cc%,,%(%CC%)%)%,%(%if-no(%is_cc%,,%(%cc%)%)%)%)%)%,%
%CC,%(%else-then(%CC%,%(%toupper(%CC%)%)%)%)%,%
%cc,%(%else-then(%_cc%,%(%tolower(%CC%)%)%)%)%,%
%is_mm,%(%else-then(%is_mm%,%(%is_MM%)%)%)%,%
%mm,%(%else-then(%if-no(%is_mm%,,%(%mm%)%)%,%(%if-no(%is_mm%,,%(%equal(mm,%Extension%)%)%)%)%)%)%,%
%MM,%(%else-then(%if-no(%is_mm%,,%(%MM%)%)%,%(%if-no(%is_mm%,,%(%mm%)%)%)%)%)%,%
%MM,%(%else-then(%MM%,%(%toupper(%MM%)%)%)%)%,%
%mm,%(%else-then(%_mm%,%(%tolower(%MM%)%)%)%)%,%
%is_hpp,%(%else-then(%is_hpp%,%(%is_Hpp%)%)%)%,%
%hpp,%(%else-then(%if-no(%is_hpp%,,%(%hpp%)%)%,%(%if-no(%is_hpp%,,%(%equal(hpp,%Extension%)%)%)%)%)%)%,%
%Hpp,%(%else-then(%if-no(%is_hpp%,,%(%Hpp%)%)%,%(%if-no(%is_hpp%,,%(%hpp%)%)%)%)%)%,%
%HPP,%(%else-then(%HPP%,%(%toupper(%Hpp%)%)%)%)%,%
%hpp,%(%else-then(%_hpp%,%(%tolower(%Hpp%)%)%)%)%,%
%is_cpp,%(%else-then(%is_cpp%,%(%is_Cpp%)%)%)%,%
%cpp,%(%else-then(%if-no(%is_cpp%,,%(%cpp%)%)%,%(%if-no(%is_cpp%,,%(%equal(cpp,%Extension%)%)%)%)%)%)%,%
%Cpp,%(%else-then(%if-no(%is_cpp%,,%(%Cpp%)%)%,%(%if-no(%is_cpp%,,%(%cpp%)%)%)%)%)%,%
%CPP,%(%else-then(%CPP%,%(%toupper(%Cpp%)%)%)%)%,%
%cpp,%(%else-then(%_cpp%,%(%tolower(%Cpp%)%)%)%)%,%
%is_hxx,%(%else-then(%is_hxx%,%(%is_Hxx%)%)%)%,%
%hxx,%(%else-then(%if-no(%is_hxx%,,%(%hxx%)%)%,%(%if-no(%is_hxx%,,%(%if(%H%%C%%M%,h,%(%if(%HPP%%CPP%%HH%%CC%%MM%,hpp,hxx)%)%)%)%)%)%)%)%,%
%Hxx,%(%else-then(%if-no(%is_hxx%,,%(%Hxx%)%)%,%(%hxx%)%)%)%,%
%HXX,%(%else-then(%HXX%,%(%toupper(%Hxx%)%)%)%)%,%
%hxx,%(%else-then(%_Hxx%,%(%tolower(%Hxx%)%)%)%)%,%
%is_cxx,%(%else-then(%is_cxx%,%(%is_Cxx%)%)%)%,%
%cxx,%(%else-then(%if-no(%is_cxx%,,%(%cxx%)%)%,%(%if-no(%is_cxx%,,%(%Extension%)%)%)%)%)%,%
%Cxx,%(%else-then(%if-no(%is_cxx%,,%(%Cxx%)%)%,%(%cxx%)%)%)%,%
%CXX,%(%else-then(%CXX%,%(%toupper(%Cxx%)%)%)%)%,%
%cxx,%(%else-then(%_Cxx%,%(%tolower(%Cxx%)%)%)%)%,%
%is_base_hxx,%(%else-then(%is_base_hxx%,%(%is_Base_Hxx%)%)%)%,%
%base_hxx,%(%else-then(%if-no(%is_base_hxx%,,%(%base_hxx%)%)%,%(%if-no(%is_base_hxx%,,%(%Base%%then-if(%Hxx%,.)%)%)%)%)%)%,%
%Base_Hxx,%(%else-then(%if-no(%is_base_hxx%,,%(%Base_Hxx%)%)%,%(%if-no(%is_base_hxx%,,%(%base_hxx%)%)%)%)%)%,%
%BASE_HXX,%(%else-then(%BASE_HXX%,%(%toupper(%Base_Hxx%)%)%)%)%,%
%base_hxx,%(%else-then(%_base_hxx%,%(%tolower(%Base_Hxx%)%)%)%)%,%
%is_basehxx,%(%else-then(%is_basehxx%,%(%is_BaseHxx%)%)%)%,%
%basehxx,%(%else-then(%if-no(%is_basehxx%,,%(%basehxx%)%)%,%(%if-no(%is_basehxx%,,%(%if(%is_lowercase_file%,%base_hxx%,%Base_Hxx%)%)%)%)%)%)%,%
%BaseHxx,%(%else-then(%if-no(%is_basehxx%,,%(%BaseHxx%)%)%,%(%if-no(%is_basehxx%,,%(%basehxx%)%)%)%)%)%,%
%BASEHXX,%(%else-then(%BASEHXX%,%(%toupper(%BaseHxx%)%)%)%)%,%
%basehxx,%(%else-then(%_basehxx%,%(%tolower(%BaseHxx%)%)%)%)%,%
%is_lcomment,%(%else-then(%is_lcomment%,%(%is_LComment%)%)%)%,%
%lcomment,%(%else-then(%if-no(%is_lcomment%,,%(%lcomment%)%)%,%(%if-no(%is_lcomment%,,%(%if(%H%%C%%M%,/*/,%(%if(%HPP%%CPP%%HH%%CC%%MM%,///,/*)%)%)%)%)%)%)%)%,%
%LComment,%(%else-then(%if-no(%is_lcomment%,,%(%LComment%)%)%,%(%if-no(%is_lcomment%,,%(%lcomment%)%)%)%)%)%,%
%LCOMMENT,%(%else-then(%LCOMMENT%,%(%toupper(%LComment%)%)%)%)%,%
%lcomment,%(%else-then(%_lcomment%,%(%tolower(%LComment%)%)%)%)%,%
%is_rcomment,%(%else-then(%is_rcomment%,%(%is_RComment%)%)%)%,%
%rcomment,%(%else-then(%if-no(%is_rcomment%,,%(%rcomment%)%)%,%(%if-no(%is_rcomment%,,%(%if(%H%%C%%M%,/*/,%(%if(%HPP%%CPP%%HH%%CC%%MM%,,*/)%)%)%)%)%)%)%)%,%
%RComment,%(%else-then(%if-no(%is_rcomment%,,%(%RComment%)%)%,%(%if-no(%is_rcomment%,,%(%rcomment%)%)%)%)%)%,%
%RCOMMENT,%(%else-then(%RCOMMENT%,%(%toupper(%RComment%)%)%)%)%,%
%rcomment,%(%else-then(%_rcomment%,%(%tolower(%RComment%)%)%)%)%,%
%is_ifndef_instance_begin,%(%else-then(%is_ifndef_instance_begin%,%(%is_Ifndef_instance_begin%)%)%)%,%
%ifndef_instance_begin,%(%else-then(%if-no(%is_ifndef_instance_begin%,,%(%ifndef_instance_begin%)%)%,%(%if-no(%is_ifndef_instance_begin%,,%(#if defined(%IFNDEF%_%BASE%_INSTANCE)
)%)%)%)%)%,%
%Ifndef_instance_begin,%(%else-then(%if-no(%is_ifndef_instance_begin%,,%(%Ifndef_instance_begin%)%)%,%(%if-no(%is_ifndef_instance_begin%,,%(%ifndef_instance_begin%)%)%)%)%)%,%
%IFNDEF_INSTANCE_BEGIN,%(%else-then(%IFNDEF_INSTANCE_BEGIN%,%(%toupper(%Ifndef_instance_begin%)%)%)%)%,%
%ifndef_instance_begin,%(%else-then(%_ifndef_instance_begin%,%(%tolower(%Ifndef_instance_begin%)%)%)%)%,%
%is_ifndef_instance_end,%(%else-then(%is_ifndef_instance_end%,%(%is_Ifndef_instance_end%)%)%)%,%
%ifndef_instance_end,%(%else-then(%if-no(%is_ifndef_instance_end%,,%(%ifndef_instance_end%)%)%,%(%if-no(%is_ifndef_instance_end%,,%(
#endif %LComment% defined(%IFNDEF%_%BASE%_INSTANCE) %RComment%)%)%)%)%)%,%
%Ifndef_instance_end,%(%else-then(%if-no(%is_ifndef_instance_end%,,%(%Ifndef_instance_end%)%)%,%(%if-no(%is_ifndef_instance_end%,,%(%ifndef_instance_end%)%)%)%)%)%,%
%IFNDEF_INSTANCE_END,%(%else-then(%IFNDEF_INSTANCE_END%,%(%toupper(%Ifndef_instance_end%)%)%)%)%,%
%ifndef_instance_end,%(%else-then(%_ifndef_instance_end%,%(%tolower(%Ifndef_instance_end%)%)%)%)%,%
%is_ifndef_begin,%(%else-then(%is_ifndef_begin%,%(%is_Ifndef_begin%)%)%)%,%
%ifndef_begin,%(%else-then(%if-no(%is_ifndef_begin%,,%(%ifndef_begin%)%)%,%(%if-no(%is_ifndef_begin%,,%(#ifndef %IFNDEF%_%BASE%_%EXTENSION%
#define %IFNDEF%_%BASE%_%EXTENSION%
)%)%)%)%)%,%
%Ifndef_begin,%(%else-then(%if-no(%is_ifndef_begin%,,%(%Ifndef_begin%)%)%,%(%ifndef_begin%)%)%)%,%
%IFNDEF_BEGIN,%(%else-then(%IFNDEF_BEGIN%,%(%toupper(%Ifndef_begin%)%)%)%)%,%
%ifndef_begin,%(%else-then(%_Ifndef_begin%,%(%tolower(%Ifndef_begin%)%)%)%)%,%
%is_ifndef_end,%(%else-then(%is_ifndef_end%,%(%is_Ifndef_end%)%)%)%,%
%ifndef_end,%(%else-then(%if-no(%is_ifndef_end%,,%(%ifndef_end%)%)%,%(%if-no(%is_ifndef_end%,,%(#endif %LComment% ndef %IFNDEF%_%BASE%_%EXTENSION% %RComment%)%)%)%)%)%,%
%Ifndef_end,%(%else-then(%if-no(%is_ifndef_end%,,%(%Ifndef_end%)%)%,%(%ifndef_end%)%)%)%,%
%IFNDEF_END,%(%else-then(%IFNDEF_END%,%(%toupper(%Ifndef_end%)%)%)%)%,%
%ifndef_end,%(%else-then(%_Ifndef_end%,%(%tolower(%Ifndef_end%)%)%)%)%,%
%is_ifndef_directory,%(%else-then(%is_ifndef_directory%,%(%is_Ifndef_directory%)%)%)%,%
%ifndef_directory,%(%else-then(%if-no(%is_ifndef_directory%,,%(%ifndef_directory%)%)%,%(%if-no(%is_ifndef_directory%,,%(%
%%parse(%Ifndef%,_,,/,%(%Ifndef%)%,Ifndef)%%
%)%)%)%)%)%,%
%Ifndef_directory,%(%else-then(%if-no(%is_ifndef_directory%,,%(%Ifndef_directory%)%)%,%(%ifndef_directory%)%)%)%,%
%IFNDEF_DIRECTORY,%(%else-then(%IFNDEF_DIRECTORY%,%(%toupper(%Ifndef_directory%)%)%)%)%,%
%ifndef_directory,%(%else-then(%_Ifndef_directory%,%(%tolower(%Ifndef_directory%)%)%)%)%,%
%is_ifndef_include,%(%else-then(%is_ifndef_include%,%(%is_Ifndef_include%)%)%)%,%
%ifndef_include,%(%else-then(%if-no(%is_ifndef_include%,,%(%ifndef_include%)%)%,%(%if-no(%is_ifndef_include%,,%(%
%#include "%if-then(%Ifndef_directory%,/)%%BaseHxx%"
%
%)%)%)%)%)%,%
%Ifndef_include,%(%else-then(%if-no(%is_ifndef_include%,,%(%Ifndef_include%)%)%,%(%ifndef_include%)%)%)%,%
%IFNDEF_INCLUDE,%(%else-then(%IFNDEF_INCLUDE%,%(%toupper(%Ifndef_include%)%)%)%)%,%
%ifndef_include,%(%else-then(%_Ifndef_include%,%(%tolower(%Ifndef_include%)%)%)%)%,%
%is_includes,%(%else-then(%is_includes%,%(%is_Includes%)%)%)%,%
%includes,%(%else-then(%if-no(%is_includes%,,%(%includes%)%)%,%(%if-no(%is_includes%,,%(%
%%parse(%Include%,;,,,,%(#include "%include%"
)%,include)%%
%)%)%)%)%)%,%
%Includes,%(%else-then(%if-no(%is_includes%,,%(%Includes%)%)%,%(%includes%)%)%)%,%
%INCLUDES,%(%else-then(%INCLUDES%,%(%toupper(%Includes%)%)%)%)%,%
%includes,%(%else-then(%_Includes%,%(%tolower(%Includes%)%)%)%)%,%
%is_sys_includes,%(%else-then(%is_sys_includes%,%(%is_Sys_includes%)%)%)%,%
%sys_includes,%(%else-then(%if-no(%is_sys_includes%,,%(%sys_includes%)%)%,%(%if-no(%is_sys_includes%,,%(%
%%parse(%Sys_include%,;,,,,%(#include <%include%>
)%,include)%%
%)%)%)%)%)%,%
%Sys_includes,%(%else-then(%if-no(%is_sys_includes%,,%(%Sys_includes%)%)%,%(%sys_includes%)%)%)%,%
%SYS_INCLUDES,%(%else-then(%SYS_INCLUDES%,%(%toupper(%Sys_includes%)%)%)%)%,%
%sys_includes,%(%else-then(%_Sys_includes%,%(%tolower(%Sys_includes%)%)%)%)%,%
%is_namespace_begin,%(%else-then(%is_namespace_begin%,%(%is_Namespace_begin%)%)%)%,%
%namespace_begin,%(%else-then(%if-no(%is_namespace_begin%,,%(%namespace_begin%)%)%,%(%if-no(%is_namespace_begin%,,%(%
%%parse(%Namespace%,/,,,,%(namespace %ns% {
)%,ns)%%
%)%)%)%)%)%,%
%Namespace_begin,%(%else-then(%if-no(%is_namespace_begin%,,%(%Namespace_begin%)%)%,%(%namespace_begin%)%)%)%,%
%NAMESPACE_BEGIN,%(%else-then(%NAMESPACE_BEGIN%,%(%toupper(%Namespace_begin%)%)%)%)%,%
%namespace_begin,%(%else-then(%_Namespace_begin%,%(%tolower(%Namespace_begin%)%)%)%)%,%
%is_namespace_end,%(%else-then(%is_namespace_end%,%(%is_Namespace_end%)%)%)%,%
%namespace_end,%(%else-then(%if-no(%is_namespace_end%,,%(%namespace_end%)%)%,%(%if-no(%is_namespace_end%,,%(%
%%reverse-parse(%Namespace%,/,,,,%(} %LComment% namespace %ns% %RComment%
)%,ns)%%
%)%)%)%)%)%,%
%Namespace_end,%(%else-then(%if-no(%is_namespace_end%,,%(%Namespace_end%)%)%,%(%namespace_end%)%)%)%,%
%NAMESPACE_END,%(%else-then(%NAMESPACE_END%,%(%toupper(%Namespace_end%)%)%)%)%,%
%namespace_end,%(%else-then(%_Namespace_end%,%(%tolower(%Namespace_end%)%)%)%)%,%
%%(%
%%include(%include_path%/file-hxx-cxx.t)%%
%%include(%include_path%/%Prefix%%Cxx%-%Cxx%.t)%%
%)%)%