%########################################################################
%# Copyright (c) 1988-2021 $organization$
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
%#   Date: 1/15/2021
%########################################################################
%with(%
%%(%
%%if(%Class%,%(
/**
 **********************************************************************
 * class %Namet%%if(%Class_author%%Class_date%,%(
 * %if(%Class_author%,%(
 * Author: %Author%)%)%%if(%Class_date%,%(
 *   Date: %Date%)%)%)%)%
 **********************************************************************
 */%
%%if-no(%is_template%,,%(
template <%Template%%then-if(%Extends%,%(%if(%Template%,%(, )%)%class TExtends = )%)%%then-if(%Implements%,%(%if(%Template%%Extends%,%(, )%)%class TImplements = )%)%>)%)%
class %Exported% %Namet%%if(%Implements%%Extends%,%(: %
%%then-if(%TImplements%,%(virtual %Implements_access% )%)%%
%%then-if(%TExtends%,%(%if(%Implements%,%(, )%)%%Extends_access% )%)%%
%)%)% {
%Access%:%
%%if(%Implements%,%(
    typedef %TImplements% %Typedef_implements%;)%)%%
%%if(%Extends%,%(
    typedef %TExtends% %Typedef_extends%;)%)%
    typedef %Namet% %Typedef_derives%;
%if(%Coopy_constructor%%Constructor%%Destructor%,%(
    /**
     **********************************************************************
     * constructor / destructor
     **********************************************************************
     */%
%%if(%Copy_constructor%,%(%if(%Private_copy_constructor%,,%(
    %if(%Explicit_copy_constructor%,explicit )%%Namet%%(()%const %Namet%& %Copy_construct_parameters%%())%%if(%Extends%,%(%then-if(%Copy_construct%,: )%)%)% {
    })%)%)%)%%
%%if(%Constructor%,%(%if(%Private_constructor%,,%(
    %if(%Explicit_constructor%,explicit )%%Namet%%(()%%Construct_parameters%%())%%then-if(%Construct%,: )% {
    })%)%)%)%%
%%if(%Destructor%,%(%if(%Private_destructor%,,%(
    %if(%Virtual_destructor%,virtual )%~%Namet%%(()%%())% {
    })%)%)%)%%
%%if(%Private_copy_constructor%%Private_constructor%%Private_destructor%,%(
%Copy_constructor_access%:%
%%if(%Copy_constructor%,%(%if(%Private_copy_constructor%,%(
    %if(%Explicit_copy_constructor%,explicit )%%Namet%%(()%const %Namet%& %Copy_construct_parameters%%())%%if(%Extends%,%(%then-if(%Copy_construct%,: )%)%)% {
    })%)%)%)%%
%%if(%Constructor%,%(%if(%Private_constructor%,%(
    %if(%Explicit_constructor%,explicit )%%Namet%%(()%%Construct_parameters%%())%%then-if(%Construct%,: )% {
    })%)%)%)%%
%%if(%Destructor%,%(%if(%Private_destructor%,%(
    %if(%Virtual_destructor%,virtual )%~%Namet%%(()%%())% {
    })%)%)%)%%
%
%Access%:%
%)%)%%
%)%)%%
%
    /**
     **********************************************************************
     **********************************************************************
     */
%Member_access%:
}; /* class %Namet% */
%if-no(%is_template%,,%(typedef %Namet%<> %Name%;
%)%)%