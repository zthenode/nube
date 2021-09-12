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
%#   File: class-hxx.t
%#
%# Author: $author$
%#   Date: 5/1/2019
%########################################################################
%with(%
%c_implements,%(%else-then(%c_implements%,%(Implements)%)%)%,%
%c_Implements,%(%else-then(%c_Implements%,%(%c_implements%)%)%)%,%
%C_IMPLEMENTS,%(%else-then(%C_IMPLEMENTS%,%(%toupper(%c_Implements%)%)%)%)%,%
%c_implements,%(%else-then(%_c_Implements%,%(%tolower(%c_Implements%)%)%)%)%,%
%c_extends,%(%else-then(%c_extends%,%(Extends)%)%)%,%
%c_Extends,%(%else-then(%c_Extends%,%(%c_extends%)%)%)%,%
%C_EXTENDS,%(%else-then(%C_EXTENDS%,%(%toupper(%c_Extends%)%)%)%)%,%
%c_extends,%(%else-then(%_c_Extends%,%(%tolower(%c_Extends%)%)%)%)%,%
%cextends,%(%else-then(%cextends%,%(cExtends)%)%)%,%
%cExtends,%(%else-then(%cExtends%,%(%cextends%)%)%)%,%
%CEXTENDS,%(%else-then(%CEXTENDS%,%(%toupper(%cExtends%)%)%)%)%,%
%cextends,%(%else-then(%_cExtends%,%(%tolower(%cExtends%)%)%)%)%,%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%%(%
%%include(%include_path%/file-hxx-cxx.t)%%
%#ifndef %IFNDEF_DIRECTORY%_%BASE%_%EXTENSION%
#define %IFNDEF_DIRECTORY%_%BASE%_%EXTENSION%

%if-then(%parse(%Include%,%(,)%,,,,%(#include "%Include%"
)%,Include)%%parse(%Sys_include%,%(,)%,,,,%(#include <%Include%>
)%,Include)%,
)%%
%%CNamespace_begin%%
%%if-no(%is_name%,,%(%if(%Extends%,%(%if(%Name_implements%,%(typedef implement_base %Implementst%%c_Implements%;
/**
 **********************************************************************
 *  Class: %Implementst%
 *
 * Author: %Author%
 *   Date: %date()%
 **********************************************************************
 */
%if-no(%is_template%,,%(template <class TImplements = %Implementst%%c_Implements%>
)%)%class c_EXPORT_CLASS %Implementst%: virtual public %if-no(%is_template%,%Implementst%%c_Implements%,TImplements)% {
public:
    typedef %if-no(%is_template%,%Implementst%%c_Implements%,TImplements)% implements;
}; /* class c_EXPORT_CLASS %Implementst% */
%if-no(%is_template%,,%(typedef %Implementst%<> %Implements%;
)%)%
)%)%%if(%Implements%,%(typedef %Implements% %NameT%%c_Implements%;
)%)%typedef %Extends% %NameT%%c_Extends%;
/**
 **********************************************************************
 *  Class: %NameT%
 *
 * Author: %Author%
 *   Date: %date()%
 **********************************************************************
 */
%if-no(%is_template%,,%(template <%if(%Implements%,%(class TImplements = %NameT%%c_Implements%, )%)%class TExtends = %NameT%%c_Extends%>
)%)%class c_EXPORT_CLASS %NameT%: %if(%Implements%,%(virtual public %if-no(%is_template%,%NameT%%c_Implements%,TImplements)%, )%)%public %if-no(%is_template%,%NameT%%c_Extends%,TExtends)% {
public:
    %if(%Implements%,%(typedef %if-no(%is_template%,%NameT%%c_Implements%,TImplements)% implements;
    )%)%typedef %if-no(%is_template%,%NameT%%c_Extends%,TExtends)% %cExtends%;

    %NameT%(const %NameT% &copy) {
    }
    %NameT%() {
    }
    virtual ~%NameT%() {
    }
}; /* class c_EXPORT_CLASS %NameT% */
%if-no(%is_template%,,%(typedef %NameT%<> %Name%;
)%)%)%,%(%if(%Implements%,%(typedef %Implements% %NameT%%c_Implements%;
/**
 **********************************************************************
 *  Class: %NameT%
 *
 * Author: %Author%
 *   Date: %date()%
 **********************************************************************
 */
%if-no(%is_template%,,template <class TImplements = %NameT%%c_Implements%>
)%class c_EXPORT_CLASS %NameT%: virtual public %if-no(%is_template%,%NameT%%c_Implements%,TImplements)% {
public:
    typedef %if-no(%is_template%,%NameT%%c_Implements%,TImplements)% implements;

    %NameT%(const %NameT% &copy) {
    }
    %NameT%() {
    }
    virtual ~%NameT%() {
    }
}; /* class c_EXPORT_CLASS %NameT% */
%if-no(%is_template%,,typedef %NameT%<> %Name%;
)%)%,%(/**
 **********************************************************************
 *  Class: %Name%
 *
 * Author: %Author%
 *   Date: %date()%
 **********************************************************************
 */
class c_EXPORT_CLASS %Name% {
public:
    %Name%(const %Name% &copy) {
    }
    %Name%() {
    }
    virtual ~%Name%() {
    }
}; /* class c_EXPORT_CLASS %Name% */
)%)%)%)%)%)%%
%%CNamespace_end%%
%
#endif /* %IFNDEF_DIRECTORY%_%BASE%_%EXTENSION% */
%
%)%)%