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
%#   File: class-hpp.t
%#
%# Author: $author$
%#   Date: 4/1/2018
%########################################################################
%with(%
%extension,%(%else-then(%extension%,%(hpp)%)%)%,%
%Extension,%(%else-then(%Extension%,%(%extension%)%)%)%,%
%EXTENSION,%(%else-then(%EXTENSION%,%(%toupper(%Extension%)%)%)%)%,%
%extension,%(%else-then(%_Extension%,%(%tolower(%Extension%)%)%)%)%,%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%%(%
%%include(%include_path%/file-hpp-cpp.t)%%
%#ifndef %IFNDEF_DIRECTORY%_%BASE%_%EXTENSION%
#define %IFNDEF_DIRECTORY%_%BASE%_%EXTENSION%

%if-then(%parse(%Include%,%(,)%,,,,%(#include "%Include%"
)%,Include)%%parse(%Sys_include%,%(,)%,,,,%(#include <%Include%>
)%,Include)%,
)%%
%%Namespace_begin%%
%%if-no(%is_name%,,%(%if(%Extends%,%(%if(%Name_implements%,%(typedef implement_base %Implementst%_implements;
///////////////////////////////////////////////////////////////////////
///  Class: %Implementst%
///////////////////////////////////////////////////////////////////////
%if-no(%is_template%,,%(template <class TImplements = %Implementst%_implements>
)%)%class %Exported% %Implementst%: virtual public %if-no(%is_template%,%Implementst%_implements,TImplements)% {
public:
    typedef %if-no(%is_template%,%Implementst%_implements,TImplements)% %Typedef_implements%;

    ///////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////
}; /// class %Exported% %Implementst%
%if-no(%is_template%,,%(typedef %Implementst%<> %Implements%;
)%)%
)%)%%if(%Implements%,%(typedef %Implements% %Namet%_implements;
)%)%typedef %Extends% %Namet%_extends;
///////////////////////////////////////////////////////////////////////
///  Class: %Namet%
///////////////////////////////////////////////////////////////////////
%if-no(%is_template%,,%(template <%if(%Implements%,%(class TImplements = %Namet%_implements, )%)%class TExtends = %Namet%_extends>
)%)%class %Exported% %Namet%: %if(%Implements%,%(virtual public %if-no(%is_template%,%Namet%_implements,TImplements)%, )%)%public %if-no(%is_template%,%Namet%_extends,TExtends)% {
public:
    %if(%Implements%,%(typedef %if-no(%is_template%,%Namet%_implements,TImplements)% %Typedef_implements%;
    )%)%typedef %if-no(%is_template%,%Namet%_extends,TExtends)% %Typedef_extends%;
    typedef %Namet% %Typedef_derives%;
    %if(%Copy_constructor%%Constructor%%if_Destructor%,%(
    ///////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////%
%)%)%%if(%Copy_constructor%,%(%if(%unequal(public,%Copy_constructor_access%)%,%(
%Copy_constructor_access%:)%)%
    %Namet%(const %Namet% &copy) {
    })%)%%if(%Constructor%,%(%if(%if(%Copy_constructor%,%(%unequal(public,%Copy_constructor_access%)%)%)%%unequal(public,%Constructor_access%)%,%(
%Constructor_access%:)%)%
    %Namet%() {
    })%)%%if(%if_Destructor%,%(%if(%if(%Constructor%,%(%unequal(public,%Constructor_access%)%)%,%(%if(%Copy_constructor%,%(%unequal(public,%Copy_constructor_access%)%)%)%)%)%%unequal(public,%Destructor_access%)%,%(
%Destructor_access%:)%)%
    %if-then(%Destructor%,%( )%)%~%Namet%() {
    })%)%
    ///////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////
}; /// class %Exported% %Namet%
%if-no(%is_template%,,%(typedef %Namet%<> %Name%;
)%)%)%,%(%if(%Implements%,%(typedef %Implements% %Namet%_implements;
///////////////////////////////////////////////////////////////////////
///  Class: %Namet%
///////////////////////////////////////////////////////////////////////
%if-no(%is_template%,,template <class TImplements = %Namet%_implements>
)%class %Exported% %Namet%: virtual public %if-no(%is_template%,%Namet%_implements,TImplements)% {
public:
    typedef %if-no(%is_template%,%Namet%_implements,TImplements)% %Typedef_implements%;
    typedef %Namet% %Typedef_derives%;
    %if(%Copy_constructor%%Constructor%%if_Destructor%,%(
    ///////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////%
%)%)%%if(%Copy_constructor%,%(%if(%unequal(public,%Copy_constructor_access%)%,%(
%Copy_constructor_access%:)%)%
    %Namet%(const %Namet% &copy) {
    })%)%%if(%Constructor%,%(%if(%if(%Copy_constructor%,%(%unequal(public,%Copy_constructor_access%)%)%)%%unequal(public,%Constructor_access%)%,%(
%Constructor_access%:)%)%
    %Namet%() {
    })%)%%if(%if_Destructor%,%(%if(%if(%Constructor%,%(%unequal(public,%Constructor_access%)%)%,%(%if(%Copy_constructor%,%(%unequal(public,%Copy_constructor_access%)%)%)%)%)%%unequal(public,%Destructor_access%)%,%(
%Destructor_access%:)%)%
    %if-then(%Destructor%,%( )%)%~%Namet%() {
    })%)%
    ///////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////
}; /// class %Exported% %Namet%
%if-no(%is_template%,,typedef %Namet%<> %Name%;
)%)%,%(///////////////////////////////////////////////////////////////////////
///  Class: %Name%
///////////////////////////////////////////////////////////////////////
class %Exported% %Name% {
public:
    typedef %Name% %Typedef_derives%;
    %if(%Copy_constructor%%Constructor%%if_Destructor%,%(
    ///////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////%
%)%)%%if(%Copy_constructor%,%(%if(%unequal(public,%Copy_constructor_access%)%,%(
%Copy_constructor_access%:)%)%
    %Namet%(const %Namet% &copy) {
    })%)%%if(%Constructor%,%(%if(%if(%Copy_constructor%,%(%unequal(public,%Copy_constructor_access%)%)%)%%unequal(public,%Constructor_access%)%,%(
%Constructor_access%:)%)%
    %Namet%() {
    })%)%%if(%if_Destructor%,%(%if(%if(%Constructor%,%(%unequal(public,%Constructor_access%)%)%,%(%if(%Copy_constructor%,%(%unequal(public,%Copy_constructor_access%)%)%)%)%)%%unequal(public,%Destructor_access%)%,%(
%Destructor_access%:)%)%
    %if-then(%Destructor%,%( )%)%~%Namet%() {
    })%)%
    ///////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////
}; /// class %Exported% %Name%
)%)%)%)%)%)%%Namespace_end%
#endif /// %IFNDEF_DIRECTORY%_%BASE%_%EXTENSION%
%
%)%)%