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
%#   File: main-hpp-cpp.t
%#
%# Author: $author$
%#   Date: 9/20/2019
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%is_namespace,%(%else-then(%is_namespace%,%()%)%)%,%
%namespace,%(%else-then(%namespace%,%(xos/app/console)%)%)%,%
%Namespace,%(%else-then(%Namespace%,%(%namespace%)%)%)%,%
%NAMESPACE,%(%else-then(%NAMESPACE%,%(%toupper(%Namespace%)%)%)%)%,%
%namespace,%(%else-then(%_Namespace%,%(%tolower(%Namespace%)%)%)%)%,%
%is_name,%(%else-then(%is_name%,%()%)%)%,%
%name,%(%else-then(%name%,%(main)%)%)%,%
%Name,%(%else-then(%Name%,%(%name%)%)%)%,%
%NAME,%(%else-then(%NAME%,%(%toupper(%Name%)%)%)%)%,%
%name,%(%else-then(%_Name%,%(%tolower(%Name%)%)%)%)%,%
%is_extension,%(%else-then(%is_extension%,%()%)%)%,%
%extension,%(%else-then(%extension%,%(hpp)%)%)%,%
%Extension,%(%else-then(%Extension%,%(%extension%)%)%)%,%
%EXTENSION,%(%else-then(%EXTENSION%,%(%toupper(%Extension%)%)%)%)%,%
%extension,%(%else-then(%_Extension%,%(%tolower(%Extension%)%)%)%)%,%
%is_base,%(%else-then(%is_base%,%()%)%)%,%
%base,%(%else-then(%base%,%(%Name%)%)%)%,%
%Base,%(%else-then(%Base%,%(%base%)%)%)%,%
%BASE,%(%else-then(%BASE%,%(%toupper(%Base%)%)%)%)%,%
%base,%(%else-then(%_Base%,%(%tolower(%Base%)%)%)%)%,%
%is_namespace_begin,%(%else-then(%is_namespace_begin%,%()%)%)%,%
%namespace_begin,%(%else-then(%namespace_begin%,%(%parse(%Namespace%,/,,,,%(namespace %t% {
)%,t)%)%)%)%,%
%Namespace_begin,%(%else-then(%Namespace_begin%,%(%namespace_begin%)%)%)%,%
%Namespace_begin,%(%then-if(%if-then(%Namespace_begin%,
)%,%(
)%)%)%,%
%NAMESPACE_BEGIN,%(%else-then(%NAMESPACE_BEGIN%,%(%toupper(%Namespace_begin%)%)%)%)%,%
%namespace_begin,%(%else-then(%_Namespace_begin%,%(%tolower(%Namespace_begin%)%)%)%)%,%
%is_namespace_end,%(%else-then(%is_namespace_end%,%()%)%)%,%
%namespace_end,%(%else-then(%namespace_end%,%(%reverse-parse(%Namespace%,/,,,,%(} /// namespace %t%
)%,t)%)%)%)%,%
%Namespace_end,%(%else-then(%Namespace_end%,%(%namespace_end%)%)%)%,%
%Namespace_end,%(%then-if(%Namespace_end%,%(
)%)%)%,%
%NAMESPACE_END,%(%else-then(%NAMESPACE_END%,%(%toupper(%Namespace_end%)%)%)%)%,%
%namespace_end,%(%else-then(%_Namespace_end%,%(%tolower(%Namespace_end%)%)%)%)%,%
%is_ifndef,%(%else-then(%is_ifndef%,%()%)%)%,%
%ifndef,%(%else-then(%ifndef%,%(%parse(%Namespace%,/,,_,%(%t%)%,t)%)%)%)%,%
%Ifndef,%(%else-then(%Ifndef%,%(%ifndef%)%)%)%,%
%IFNDEF,%(%else-then(%IFNDEF%,%(%toupper(%Ifndef%)%)%)%)%,%
%ifndef,%(%else-then(%_Ifndef%,%(%tolower(%Ifndef%)%)%)%)%,%
%is_ifndef_begin,%(%else-then(%is_ifndef_begin%,%()%)%)%,%
%ifndef_begin,%(%else-then(%ifndef_begin%,%(#ifndef %IFNDEF%_%NAME%_%EXTENSION%
#define %IFNDEF%_%NAME%_%EXTENSION%
)%)%)%,%
%Ifndef_begin,%(%else-then(%Ifndef_begin%,%(%ifndef_begin%)%)%)%,%
%IFNDEF_BEGIN,%(%else-then(%IFNDEF_BEGIN%,%(%toupper(%Ifndef_begin%)%)%)%)%,%
%ifndef_begin,%(%else-then(%_Ifndef_begin%,%(%tolower(%Ifndef_begin%)%)%)%)%,%
%is_ifndef_end,%(%else-then(%is_ifndef_end%,%()%)%)%,%
%ifndef_end,%(%else-then(%ifndef_end%,%(
#endif /// ndef %IFNDEF%_%NAME%_%EXTENSION%
)%)%)%,%
%Ifndef_end,%(%else-then(%Ifndef_end%,%(%ifndef_end%)%)%)%,%
%IFNDEF_END,%(%else-then(%IFNDEF_END%,%(%toupper(%Ifndef_end%)%)%)%)%,%
%ifndef_end,%(%else-then(%_Ifndef_end%,%(%tolower(%Ifndef_end%)%)%)%)%,%
%is_include,%(%else-then(%is_include%,%()%)%)%,%
%include,%(%else-then(%include%,%(xos/console/main.hpp)%)%)%,%
%Include,%(%else-then(%Include%,%(%include%)%)%)%,%
%Include,%(%if(%Include%,%(
#include "%Include%"
)%)%)%,%
%INCLUDE,%(%else-then(%INCLUDE%,%(%toupper(%Include%)%)%)%)%,%
%include,%(%else-then(%_Include%,%(%tolower(%Include%)%)%)%)%,%
%is_path,%(%else-then(%is_path%,%()%)%)%,%
%path,%(%else-then(%path%,%(%Namespace%)%)%)%,%
%Path,%(%else-then(%Path%,%(%path%)%)%)%,%
%Path,%(%if-then(%Path%,%(/)%)%)%,%
%PATH,%(%else-then(%PATH%,%(%toupper(%Path%)%)%)%)%,%
%path,%(%else-then(%_Path%,%(%tolower(%Path%)%)%)%)%,%
%is_namet,%(%else-then(%is_namet%,%()%)%)%,%
%namet,%(%else-then(%namet%,%(%Name%t)%)%)%,%
%NameT,%(%else-then(%NameT%,%(%namet%)%)%)%,%
%NAMET,%(%else-then(%NAMET%,%(%toupper(%NameT%)%)%)%)%,%
%namet,%(%else-then(%_NameT%,%(%tolower(%NameT%)%)%)%)%,%
%is_tversion,%(%else-then(%is_tversion%,%()%)%)%,%
%tversion,%(%else-then(%tversion%,%(xos::lib::version)%)%)%,%
%TVersion,%(%else-then(%TVersion%,%(%tversion%)%)%)%,%
%TVERSION,%(%else-then(%TVERSION%,%(%toupper(%TVersion%)%)%)%)%,%
%tversion,%(%else-then(%_TVersion%,%(%tolower(%TVersion%)%)%)%)%,%
%is_textends,%(%else-then(%is_textends%,%()%)%)%,%
%textends,%(%else-then(%textends%,%(main_optt<TVersion>)%)%)%,%
%TExtends,%(%else-then(%TExtends%,%(%textends%)%)%)%,%
%TEXTENDS,%(%else-then(%TEXTENDS%,%(%toupper(%TExtends%)%)%)%)%,%
%textends,%(%else-then(%_TExtends%,%(%tolower(%TExtends%)%)%)%)%,%
%is_timplements,%(%else-then(%is_timplements%,%()%)%)%,%
%timplements,%(%else-then(%timplements%,%(typename TExtends::implements)%)%)%,%
%TImplements,%(%else-then(%TImplements%,%(%timplements%)%)%)%,%
%TIMPLEMENTS,%(%else-then(%TIMPLEMENTS%,%(%toupper(%TImplements%)%)%)%)%,%
%timplements,%(%else-then(%_TImplements%,%(%tolower(%TImplements%)%)%)%)%,%
%is_implements,%(%else-then(%is_implements%,%()%)%)%,%
%implements,%(%else-then(%implements%,%(TImplements)%)%)%,%
%Implements,%(%else-then(%Implements%,%(%implements%)%)%)%,%
%IMPLEMENTS,%(%else-then(%IMPLEMENTS%,%(%toupper(%Implements%)%)%)%)%,%
%implements,%(%else-then(%_Implements%,%(%tolower(%Implements%)%)%)%)%,%
%is_extends,%(%else-then(%is_extends%,%()%)%)%,%
%extends,%(%else-then(%extends%,%(TExtends)%)%)%,%
%Extends,%(%else-then(%Extends%,%(%extends%)%)%)%,%
%EXTENDS,%(%else-then(%EXTENDS%,%(%toupper(%Extends%)%)%)%)%,%
%extends,%(%else-then(%_Extends%,%(%tolower(%Extends%)%)%)%)%,%
%%(%
%%include(%include_path%/file-hpp-cpp.t)%%
%%include(%include_path%/main-%Extension%-%Extension%.t)%%
%)%)%%
