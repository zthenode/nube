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
%#   File: class-hpp-hxx.t
%#
%# Author: $author$
%#   Date: 1/15/2021
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%is_exported,%(%else-then(%is_exported%,%(%is_Exported%)%)%)%,%
%exported,%(%else-then(%if-no(%is_exported%,,%(%exported%)%)%,%(%if-no(%is_exported%,,%(exported)%)%)%)%)%,%
%Exported,%(%else-then(%if-no(%is_exported%,,%(%Exported%)%)%,%(%if-no(%is_exported%,,%(%exported%)%)%)%)%)%,%
%EXPORTED,%(%else-then(%EXPORTED%,%(%toupper(%Exported%)%)%)%)%,%
%exported,%(%else-then(%_exported%,%(%tolower(%Exported%)%)%)%)%,%
%is_member_access,%(%else-then(%is_member_access%,%(%is_Member_access%)%)%)%,%
%member_access,%(%else-then(%if-no(%is_member_access%,,%(%member_access%)%)%,%(%if-no(%is_member_access%,,%(protected)%)%)%)%)%,%
%Member_access,%(%else-then(%if-no(%is_member_access%,,%(%Member_access%)%)%,%(%if-no(%is_member_access%,,%(%member_access%)%)%)%)%)%,%
%MEMBER_ACCESS,%(%else-then(%MEMBER_ACCESS%,%(%toupper(%Member_access%)%)%)%)%,%
%member_access,%(%else-then(%_member_access%,%(%tolower(%Member_access%)%)%)%)%,%
%is_access,%(%else-then(%is_access%,%(%is_Access%)%)%)%,%
%access,%(%else-then(%if-no(%is_access%,,%(%access%)%)%,%(%if-no(%is_access%,,%(public)%)%)%)%)%,%
%Access,%(%else-then(%if-no(%is_access%,,%(%Access%)%)%,%(%if-no(%is_access%,,%(%access%)%)%)%)%)%,%
%ACCESS,%(%else-then(%ACCESS%,%(%toupper(%Access%)%)%)%)%,%
%access,%(%else-then(%_access%,%(%tolower(%Access%)%)%)%)%,%
%is_implements_access,%(%else-then(%is_implements_access%,%(%is_Implements_access%)%)%)%,%
%implements_access,%(%else-then(%if-no(%is_implements_access%,,%(%implements_access%)%)%,%(%if-no(%is_implements_access%,,%(public)%)%)%)%)%,%
%Implements_access,%(%else-then(%if-no(%is_implements_access%,,%(%Implements_access%)%)%,%(%if-no(%is_implements_access%,,%(%implements_access%)%)%)%)%)%,%
%IMPLEMENTS_ACCESS,%(%else-then(%IMPLEMENTS_ACCESS%,%(%toupper(%Implements_access%)%)%)%)%,%
%implements_access,%(%else-then(%_implements_access%,%(%tolower(%Implements_access%)%)%)%)%,%
%is_extends_access,%(%else-then(%is_extends_access%,%(%is_Extends_access%)%)%)%,%
%extends_access,%(%else-then(%if-no(%is_extends_access%,,%(%extends_access%)%)%,%(%if-no(%is_extends_access%,,%(public)%)%)%)%)%,%
%Extends_access,%(%else-then(%if-no(%is_extends_access%,,%(%Extends_access%)%)%,%(%if-no(%is_extends_access%,,%(%extends_access%)%)%)%)%)%,%
%EXTENDS_ACCESS,%(%else-then(%EXTENDS_ACCESS%,%(%toupper(%Extends_access%)%)%)%)%,%
%extends_access,%(%else-then(%_extends_access%,%(%tolower(%Extends_access%)%)%)%)%,%
%is_typedef_implements,%(%else-then(%is_typedef_implements%,%(%is_Typedef_implements%)%)%)%,%
%typedef_implements,%(%else-then(%if-no(%is_typedef_implements%,,%(%typedef_implements%)%)%,%(%if-no(%is_typedef_implements%,,%(implements)%)%)%)%)%,%
%Typedef_implements,%(%else-then(%if-no(%is_typedef_implements%,,%(%Typedef_implements%)%)%,%(%if-no(%is_typedef_implements%,,%(%typedef_implements%)%)%)%)%)%,%
%TYPEDEF_IMPLEMENTS,%(%else-then(%TYPEDEF_IMPLEMENTS%,%(%toupper(%Typedef_implements%)%)%)%)%,%
%typedef_implements,%(%else-then(%_typedef_implements%,%(%tolower(%Typedef_implements%)%)%)%)%,%
%is_typedef_extends,%(%else-then(%is_typedef_extends%,%(%is_Typedef_extends%)%)%)%,%
%typedef_extends,%(%else-then(%if-no(%is_typedef_extends%,,%(%typedef_extends%)%)%,%(%if-no(%is_typedef_extends%,,%(extends)%)%)%)%)%,%
%Typedef_extends,%(%else-then(%if-no(%is_typedef_extends%,,%(%Typedef_extends%)%)%,%(%if-no(%is_typedef_extends%,,%(%typedef_extends%)%)%)%)%)%,%
%TYPEDEF_EXTENDS,%(%else-then(%TYPEDEF_EXTENDS%,%(%toupper(%Typedef_extends%)%)%)%)%,%
%typedef_extends,%(%else-then(%_typedef_extends%,%(%tolower(%Typedef_extends%)%)%)%)%,%
%is_typedef_derives,%(%else-then(%is_typedef_derives%,%(%is_Typedef_derives%)%)%)%,%
%typedef_derives,%(%else-then(%if-no(%is_typedef_derives%,,%(%typedef_derives%)%)%,%(%if-no(%is_typedef_derives%,,%(derives)%)%)%)%)%,%
%Typedef_derives,%(%else-then(%if-no(%is_typedef_derives%,,%(%Typedef_derives%)%)%,%(%if-no(%is_typedef_derives%,,%(%typedef_derives%)%)%)%)%)%,%
%TYPEDEF_DERIVES,%(%else-then(%TYPEDEF_DERIVES%,%(%toupper(%Typedef_derives%)%)%)%)%,%
%typedef_derives,%(%else-then(%_typedef_derives%,%(%tolower(%Typedef_derives%)%)%)%)%,%
%is_copy_constructor_access,%(%else-then(%is_copy_constructor_access%,%(%is_Copy_constructor_access%)%)%)%,%
%copy_constructor_access,%(%else-then(%if-no(%is_copy_constructor_access%,,%(%copy_constructor_access%)%)%,%(%if-no(%is_copy_constructor_access%,,%(public)%)%)%)%)%,%
%Copy_constructor_access,%(%else-then(%if-no(%is_copy_constructor_access%,,%(%Copy_constructor_access%)%)%,%(%if-no(%is_copy_constructor_access%,,%(%copy_constructor_access%)%)%)%)%)%,%
%COPY_CONSTRUCTOR_ACCESS,%(%else-then(%COPY_CONSTRUCTOR_ACCESS%,%(%toupper(%Copy_constructor_access%)%)%)%)%,%
%copy_constructor_access,%(%else-then(%_copy_constructor_access%,%(%tolower(%Copy_constructor_access%)%)%)%)%,%
%is_copy_construct_parameters,%(%else-then(%is_copy_construct_parameters%,%(%is_Copy_construct_parameters%)%)%)%,%
%copy_construct_parameters,%(%else-then(%if-no(%is_copy_construct_parameters%,,%(%copy_construct_parameters%)%)%,%(%if-no(%is_copy_construct_parameters%,,%(copy)%)%)%)%)%,%
%Copy_construct_parameters,%(%else-then(%if-no(%is_copy_construct_parameters%,,%(%Copy_construct_parameters%)%)%,%(%if-no(%is_copy_construct_parameters%,,%(%copy_construct_parameters%)%)%)%)%)%,%
%COPY_CONSTRUCT_PARAMETERS,%(%else-then(%COPY_CONSTRUCT_PARAMETERS%,%(%toupper(%Copy_construct_parameters%)%)%)%)%,%
%copy_construct_parameters,%(%else-then(%_copy_construct_parameters%,%(%tolower(%Copy_construct_parameters%)%)%)%)%,%
%is_copy_construct_extends,%(%else-then(%is_copy_construct_extends%,%(%is_Copy_construct_extends%)%)%)%,%
%copy_construct_extends,%(%else-then(%if-no(%is_copy_construct_extends%,,%(%copy_construct_extends%)%)%,%(%if-no(%is_copy_construct_extends%,,%(%Typedef_extends%)%)%)%)%)%,%
%Copy_construct_extends,%(%else-then(%if-no(%is_copy_construct_extends%,,%(%Copy_construct_extends%)%)%,%(%if-no(%is_copy_construct_extends%,,%(%copy_construct_extends%)%)%)%)%)%,%
%COPY_CONSTRUCT_EXTENDS,%(%else-then(%COPY_CONSTRUCT_EXTENDS%,%(%toupper(%Copy_construct_extends%)%)%)%)%,%
%copy_construct_extends,%(%else-then(%_copy_construct_extends%,%(%tolower(%Copy_construct_extends%)%)%)%)%,%
%is_copy_construct_arguments,%(%else-then(%is_copy_construct_arguments%,%(%is_Copy_construct_arguments%)%)%)%,%
%copy_construct_arguments,%(%else-then(%if-no(%is_copy_construct_arguments%,,%(%copy_construct_arguments%)%)%,%(%if-no(%is_copy_construct_arguments%,,%(%Copy_construct_parameters%)%)%)%)%)%,%
%Copy_construct_arguments,%(%else-then(%if-no(%is_copy_construct_arguments%,,%(%Copy_construct_arguments%)%)%,%(%if-no(%is_copy_construct_arguments%,,%(%copy_construct_arguments%)%)%)%)%)%,%
%COPY_CONSTRUCT_ARGUMENTS,%(%else-then(%COPY_CONSTRUCT_ARGUMENTS%,%(%toupper(%Copy_construct_arguments%)%)%)%)%,%
%copy_construct_arguments,%(%else-then(%_copy_construct_arguments%,%(%tolower(%Copy_construct_arguments%)%)%)%)%,%
%is_copy_construct,%(%else-then(%is_copy_construct%,%(%is_Copy_construct%)%)%)%,%
%copy_construct,%(%else-then(%if-no(%is_copy_construct%,,%(%copy_construct%)%)%,%(%if-no(%is_copy_construct%,,%(%Copy_construct_extends%%(()%%Copy_construct_arguments%%())%)%)%)%)%)%,%
%Copy_construct,%(%else-then(%if-no(%is_copy_construct%,,%(%Copy_construct%)%)%,%(%if-no(%is_copy_construct%,,%(%copy_construct%)%)%)%)%)%,%
%COPY_CONSTRUCT,%(%else-then(%COPY_CONSTRUCT%,%(%toupper(%Copy_construct%)%)%)%)%,%
%copy_construct,%(%else-then(%_copy_construct%,%(%tolower(%Copy_construct%)%)%)%)%,%
%is_constructor_access,%(%else-then(%is_constructor_access%,%(%is_Constructor_access%)%)%)%,%
%constructor_access,%(%else-then(%if-no(%is_constructor_access%,,%(%constructor_access%)%)%,%(%if-no(%is_constructor_access%,,%(public)%)%)%)%)%,%
%Constructor_access,%(%else-then(%if-no(%is_constructor_access%,,%(%Constructor_access%)%)%,%(%if-no(%is_constructor_access%,,%(%constructor_access%)%)%)%)%)%,%
%CONSTRUCTOR_ACCESS,%(%else-then(%CONSTRUCTOR_ACCESS%,%(%toupper(%Constructor_access%)%)%)%)%,%
%constructor_access,%(%else-then(%_constructor_access%,%(%tolower(%Constructor_access%)%)%)%)%,%
%is_destructor_access,%(%else-then(%is_destructor_access%,%(%is_Destructor_access%)%)%)%,%
%destructor_access,%(%else-then(%if-no(%is_destructor_access%,,%(%destructor_access%)%)%,%(%if-no(%is_destructor_access%,,%(public)%)%)%)%)%,%
%Destructor_access,%(%else-then(%if-no(%is_destructor_access%,,%(%Destructor_access%)%)%,%(%if-no(%is_destructor_access%,,%(%destructor_access%)%)%)%)%)%,%
%DESTRUCTOR_ACCESS,%(%else-then(%DESTRUCTOR_ACCESS%,%(%toupper(%Destructor_access%)%)%)%)%,%
%destructor_access,%(%else-then(%_destructor_access%,%(%tolower(%Destructor_access%)%)%)%)%,%
%is_private_copy_constructor,%(%else-then(%is_private_copy_constructor%,%(%is_Private_copy_constructor%)%)%)%,%
%private_copy_constructor,%(%else-then(%if-no(%is_private_copy_constructor%,,%(%private_copy_constructor%)%)%,%(%if-no(%is_private_copy_constructor%,,%(%if(%Copy_constructor_access%,%(%if(%equal(%Copy_constructor_access%,%Access%)%,,yes)%)%)%)%)%)%)%)%,%
%Private_copy_constructor,%(%else-then(%if-no(%is_private_copy_constructor%,,%(%Private_copy_constructor%)%)%,%(%if-no(%is_private_copy_constructor%,,%(%private_copy_constructor%)%)%)%)%)%,%
%PRIVATE_COPY_CONSTRUCTOR,%(%else-then(%PRIVATE_COPY_CONSTRUCTOR%,%(%toupper(%Private_copy_constructor%)%)%)%)%,%
%private_copy_constructor,%(%else-then(%_private_copy_constructor%,%(%tolower(%Private_copy_constructor%)%)%)%)%,%
%%(%
%%include(%include_path%/%Cxx%-%Cxx%.t)%%
%)%)%