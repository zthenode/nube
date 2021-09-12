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
%#   File: hxx-hxx.t
%#
%# Author: $author$
%#   Date: 10/16/2019
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%is_header,%(%else-then(%is_header%,%(%is_Header%)%)%)%,%
%header,%(%else-then(%header%,%(hxx)%)%)%,%
%Header,%(%else-then(%Header%,%(%header%)%)%)%,%
%HEADER,%(%else-then(%HEADER%,%(%toupper(%Header%)%)%)%)%,%
%header,%(%else-then(%_Header%,%(%tolower(%Header%)%)%)%)%,%
%is_ifndef_begin,%(%else-then(%is_ifndef_begin%,%(%is_Ifndef_begin%)%)%)%,%
%ifndef_begin,%(%else-then(%ifndef_begin%,%(#ifndef %IFNDEF%_%BASE%_%EXTENSION%
#define %IFNDEF%_%BASE%_%EXTENSION%
)%)%)%,%
%Ifndef_begin,%(%else-then(%Ifndef_begin%,%(%ifndef_begin%)%)%)%,%
%IFNDEF_BEGIN,%(%else-then(%IFNDEF_BEGIN%,%(%toupper(%Ifndef_begin%)%)%)%)%,%
%ifndef_begin,%(%else-then(%_Ifndef_begin%,%(%tolower(%Ifndef_begin%)%)%)%)%,%
%is_ifndef_end,%(%else-then(%is_ifndef_end%,%(%is_Ifndef_end%)%)%)%,%
%ifndef_end,%(%else-then(%ifndef_end%,%(#endif /// ndef %IFNDEF%_%BASE%_%EXTENSION%
)%)%)%,%
%Ifndef_end,%(%else-then(%Ifndef_end%,%(%ifndef_end%)%)%)%,%
%IFNDEF_END,%(%else-then(%IFNDEF_END%,%(%toupper(%Ifndef_end%)%)%)%)%,%
%ifndef_end,%(%else-then(%_Ifndef_end%,%(%tolower(%Ifndef_end%)%)%)%)%,%
%is_include,%(%else-then(%is_include%,%()%)%)%,%
%include,%(%else-then(%include%,%()%)%)%,%
%Include,%(%else-then(%Include%,%(%include%)%)%)%,%
%INCLUDE,%(%else-then(%INCLUDE%,%(%toupper(%Include%)%)%)%)%,%
%include,%(%else-then(%_Include%,%(%tolower(%Include%)%)%)%)%,%
%is_includes,%(%else-then(%is_includes%,%()%)%)%,%
%includes,%(%else-then(%includes%,%(%parse(%Include%,;,,,,%(#include "%Include%"
)%,Include)%)%)%)%,%
%Includes,%(%else-then(%Includes%,%(%includes%)%)%)%,%
%INCLUDES,%(%else-then(%INCLUDES%,%(%toupper(%Includes%)%)%)%)%,%
%includes,%(%else-then(%_Includes%,%(%tolower(%Includes%)%)%)%)%,%
%is_sys_include,%(%else-then(%is_sys_include%,%()%)%)%,%
%sys_include,%(%else-then(%sys_include%,%()%)%)%,%
%Sys_include,%(%else-then(%Sys_include%,%(%sys_include%)%)%)%,%
%SYS_INCLUDE,%(%else-then(%SYS_INCLUDE%,%(%toupper(%Sys_include%)%)%)%)%,%
%sys_include,%(%else-then(%_Sys_include%,%(%tolower(%Sys_include%)%)%)%)%,%
%is_sys_includes,%(%else-then(%is_sys_includes%,%()%)%)%,%
%sys_includes,%(%else-then(%sys_includes%,%(%parse(%Sys_include%,;,,,,%(#include <%Include%>
)%,Include)%)%)%)%,%
%Sys_includes,%(%else-then(%Sys_includes%,%(%sys_includes%)%)%)%,%
%SYS_INCLUDES,%(%else-then(%SYS_INCLUDES%,%(%toupper(%Sys_includes%)%)%)%)%,%
%sys_includes,%(%else-then(%_Sys_includes%,%(%tolower(%Sys_includes%)%)%)%)%,%
%%(%
%%Ifndef_begin%%
%%then-if(%Includes%%Sys_includes%,
)%%
%%then-if(%Namespace_begin%,
)%%
%%include(%include_path%/%Prefix%hxx.t)%%
%%then-if(%Namespace_end%,
)%%
%%then-if(%Ifndef_end%,
)%%
%)%)%