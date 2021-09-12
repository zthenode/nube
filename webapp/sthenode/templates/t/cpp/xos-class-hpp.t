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
%#   File: xos-class-hpp.t
%#
%# Author: $author$
%#   Date: 7/27/2018
%########################################################################
%with(%
%is_derived,%(%else-then(%if-no(%is_derived%,,%is_derived%)%,%(%if-no(%is_derived%,,%Implements%%Extends%)%)%)%)%,%
%both,%(%else-then(%both%,%(%and(%Implements%,%Extends%)%)%)%)%,%
%%(%
%%include(%filepath(%input%)%/xos-file-hpp-cpp.t)%%
%#ifndef %IFNDEF_DIRECTORY%_%BASE%_%EXTENSION%
#define %IFNDEF_DIRECTORY%_%BASE%_%EXTENSION%

%if-then(%parse(%Include%,%(,)%,,,,%(#include "%Include%"
)%,Include)%%parse(%Sys_include%,%(,)%,,,,%(#include <%Include%>
)%,Include)%,
)%%Namespace_begin%%if(%Implements%,%(typedef %Implements_base% %Implements%;
)%)%%if(%Extends%,%(typedef %Extends_base% %Extends%;
)%)%///////////////////////////////////////////////////////////////////////
//  Class: %Name%
///////////////////////////////////////////////////////////////////////
class %EXPORT_CLASS%%Name%%if(%is_derived%,%(: %if(%Implements%,virtual public %Implements%)%%if(%both%,%(,)% )%%if(%Extends%,public %Extends%)%)%)% {
public:%if(%Implements%,
    typedef %Implements% implements;)%%if(%Extends%,
    typedef %Extends% extends;)%%if(%is_constructor%%is_destructor%,
)%%if(%is_constructor%,
    %Constructor%%Name%%(()%%())% {
    })%%if(%is_destructor%,
    %Destructor%~%Name%%(()%%())% {
    })%
}; %CCComment% class %EXPORT_CLASS%%Name%
%Namespace_end%
#endif %CCComment% %IFNDEF_DIRECTORY%_%BASE%_%EXTENSION% 
%
%)%)%