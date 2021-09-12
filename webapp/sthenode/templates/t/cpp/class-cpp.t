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
%#   File: class-cpp.t
%#
%# Author: $author$
%#   Date: 4/1/2018
%########################################################################
%with(%
%extension,%(%else-then(%extension%,%(cpp)%)%)%,%
%Extension,%(%else-then(%Extension%,%(%extension%)%)%)%,%
%EXTENSION,%(%else-then(%EXTENSION%,%(%toupper(%Extension%)%)%)%)%,%
%extension,%(%else-then(%_Extension%,%(%tolower(%Extension%)%)%)%)%,%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%%(%
%%include(%include_path%/file-hpp-cpp.t)%%
%#include "%if-then(%Include_directory%,/)%%Base%.hpp"

%Namespace_begin%%
%%if-no(%is_implements%,,%(%if(%Name_implements%,%(///////////////////////////////////////////////////////////////////////
///  Class: %Implementst%
///////////////////////////////////////////////////////////////////////

)%)%)%)%%if-no(%is_name%,,%(///////////////////////////////////////////////////////////////////////
///  Class: %Namet%
///////////////////////////////////////////////////////////////////////
)%)%%
%%Namespace_end%%
%
%
%)%)%