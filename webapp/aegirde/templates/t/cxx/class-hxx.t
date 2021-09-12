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
%#   Date: 10/17/2019
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%is_copy_constructor,%(%else-then(%is_copy_constructor%,%(%is_Copy_constructor%)%)%)%,%
%is_constructor,%(%else-then(%is_constructor%,%(%is_Constructor%)%)%)%,%
%is_destructor,%(%else-then(%is_destructor%,%(%is_Destructor%)%)%)%,%
%copy_constructor,%(%else-then(%copy_constructor%,%(%if-no(%is_copy_constructor%,,yes)%)%)%)%,%
%constructor,%(%else-then(%constructor%,%(%if-no(%is_constructor%,,yes)%)%)%)%,%
%destructor,%(%else-then(%destructor%,%(%if-no(%is_destructor%,,yes)%)%)%)%,%
%%(%
%
/// class %NameT%
%if-no(%is_template%,,%(template <%if-then(%Template%,%(%if(%TExtends%%TImplements%,%(, )%)%)%)%%if(%TExtends%,%(%TExtend%)%)%%then-if(%if(%TImplements%,%(%TImplement%)%)%,%(%if(%TExtends%,%(, )%)%)%)%>
)%)%class exported %NameT%%then-if(%if(%TImplements%,%(virtual public %TImplements%)%)%%then-if(%if-no(%is_extends%,,public %TExtends%)%,%if(%TImplements%,%(%(, )%)%)%)%,: )% {
public:
    %if(%TImplements%,%(typedef %TImplements% implements;
    )%)%%if(%TExtends%,%(typedef %TExtends% extends;
    )%)%typedef %NameT% derives;
%if(%copy_constructor%%constructor%,%(
    /// constructors%if(%destructor%,%( / destructor)%)%)%)%%
%%if-no(%is_copy_constructor%,,%(
    %NameT%(const %NameT%& copy%())%%if(%TExtends%,%(: extends%(()%copy%())%)%)% {
    })%)%%if-no(%is_constructor%,,%(
    %NameT%() {
    })%)%%if-no(%is_destructor%,,%(
    virtual ~%NameT%() {
    })%)%

protected:
}; /// class %NameT%
%if-no(%is_template%,,%(typedef %NameT%<> %Name%;
%
%)%)%