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
%#   File: class-hpp-hpp.t
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
%%(%
%%include(%Include_path%/hpp-hpp-begin.t)%%
%/// class %ClassT%%if(%is_template%,%(
template <%
%%if(%Extends%,class TExtends = %Extends%)%%
%%if(%and(%Implements%,%Extends%)%,%(, )%)%%
%%if(%Implements%,class TImplements = %Implements%)%%
%>)%)%
class %if-then(%Exported%, )%%ClassT%%then-if(%
%%parse(%TImplements%,;,,%(,)%,,%(virtual public %Implements%)%,Implements)%%
%%if(%and(%Implements%,%Extends%)%,%(, )%)%%
%%parse(%TExtends%,;,,%(,)%,,%(public %Extends%)%,Extends)%%
%,%(: )%)% {
public:
    %if(%Implements%,%(typedef %TImplements% %typedef_Implements%;
    )%)%%if(%Extends%,%(typedef %TExtends% %typedef_Extends%;
    )%)%typedef %ClassT% %typedef_Derives%;

    %if(1,%(/// constructors / destructor
    %ClassT%(const %ClassT%& copy%())%%if(%Extends%,%(: %typedef_Extends%(copy%())%)%)% {
    }
    %ClassT%() {
    }
    virtual ~%ClassT%() {
    })%)%
}; /// class %ClassT%

%
%%include(%Include_path%/hpp-hpp-end.t)%%
%)%)%