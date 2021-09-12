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
%#   File: cxx-cxx.t
%#
%# Author: $author$
%#   Date: 10/17/2019
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%is_header,%(%else-then(%is_header%,%(%is_Header%)%)%)%,%
%header,%(%else-then(%header%,%(hxx)%)%)%,%
%Header,%(%else-then(%Header%,%(%header%)%)%)%,%
%HEADER,%(%else-then(%HEADER%,%(%toupper(%Header%)%)%)%)%,%
%header,%(%else-then(%_Header%,%(%tolower(%Header%)%)%)%)%,%
%is_ifndef_directory,%(%else-then(%is_ifndef_directory%,%()%)%)%,%
%ifndef_directory,%(%else-then(%ifndef_directory%,%(%parse(%Ifndef%,_,,/,%(%Ifndef%)%,Ifndef)%)%)%)%,%
%Ifndef_directory,%(%else-then(%Ifndef_directory%,%(%ifndef_directory%)%)%)%,%
%IFNDEF_DIRECTORY,%(%else-then(%IFNDEF_DIRECTORY%,%(%toupper(%Ifndef_directory%)%)%)%)%,%
%ifndef_directory,%(%else-then(%_Ifndef_directory%,%(%tolower(%Ifndef_directory%)%)%)%)%,%
%is_ifndef_include,%(%else-then(%is_ifndef_include%,%()%)%)%,%
%ifndef_include,%(%else-then(%ifndef_include%,%(#include "%if-then(%Ifndef_directory%,/)%%Base%.%Header%"
)%)%)%,%
%Ifndef_include,%(%else-then(%Ifndef_include%,%(%ifndef_include%)%)%)%,%
%IFNDEF_INCLUDE,%(%else-then(%IFNDEF_INCLUDE%,%(%toupper(%Ifndef_include%)%)%)%)%,%
%ifndef_include,%(%else-then(%_Ifndef_include%,%(%tolower(%Ifndef_include%)%)%)%)%,%
%%(%
%%Ifndef_include%%
%%then-if(%Namespace_begin%,
)%%
%%include(%include_path%/%Prefix%cxx.t)%%
%%then-if(%Namespace_end%,
)%%
%)%)%