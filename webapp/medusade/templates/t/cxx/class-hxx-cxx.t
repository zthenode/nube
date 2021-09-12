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
%#   File: class-hxx-cxx.t
%#
%# Author: $author$
%#   Date: 11/26/2019, 1/16/2021
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%is_prefix,%(%else-then(%is_prefix%,%(%is_Prefix%)%)%)%,%
%prefix,%(%else-then(%if-no(%is_prefix%,,%(%prefix%)%)%,%(%if-no(%is_prefix%,,%(class-)%)%)%)%)%,%
%Prefix,%(%else-then(%if-no(%is_prefix%,,%(%Prefix%)%)%,%(%prefix%)%)%)%,%
%PREFIX,%(%else-then(%PREFIX%,%(%toupper(%Prefix%)%)%)%)%,%
%prefix,%(%else-then(%_Prefix%,%(%tolower(%Prefix%)%)%)%)%,%
%is_class_author,%(%else-then(%is_class_author%,%(%is_Class_author%)%)%)%,%
%class_author,%(%else-then(%if-no(%is_class_author%,,%(%class_author%)%)%,%(%if-no(%is_class_author%,,%(yes)%)%)%)%)%,%
%Class_author,%(%else-then(%if-no(%is_class_author%,,%(%Class_author%)%)%,%(%if-no(%is_class_author%,,%(%class_author%)%)%)%)%)%,%
%CLASS_AUTHOR,%(%else-then(%CLASS_AUTHOR%,%(%toupper(%Class_author%)%)%)%)%,%
%class_author,%(%else-then(%_class_author%,%(%tolower(%Class_author%)%)%)%)%,%
%is_class_date,%(%else-then(%is_class_date%,%(%is_Class_date%)%)%)%,%
%class_date,%(%else-then(%if-no(%is_class_date%,,%(%class_date%)%)%,%(%if-no(%is_class_date%,,%(%Class_author%)%)%)%)%)%,%
%Class_date,%(%else-then(%if-no(%is_class_date%,,%(%Class_date%)%)%,%(%if-no(%is_class_date%,,%(%class_date%)%)%)%)%)%,%
%CLASS_DATE,%(%else-then(%CLASS_DATE%,%(%toupper(%Class_date%)%)%)%)%,%
%class_date,%(%else-then(%_class_date%,%(%tolower(%Class_date%)%)%)%)%,%
%is_class,%(%else-then(%is_class%,%(%is_Class%)%)%)%,%
%class,%(%else-then(%if-no(%is_class%,,%(%class%)%)%,%(%if-no(%is_class%,,%(derive)%)%)%)%)%,%
%Class,%(%else-then(%if-no(%is_class%,,%(%Class%)%)%,%(%if-no(%is_class%,,%(%class%)%)%)%)%)%,%
%CLASS,%(%else-then(%CLASS%,%(%toupper(%Class%)%)%)%)%,%
%class,%(%else-then(%_class%,%(%tolower(%Class%)%)%)%)%,%
%is_name,%(%else-then(%is_name%,%(%is_Name%)%)%)%,%
%name,%(%else-then(%if-no(%is_name%,,%(%name%)%)%,%(%if-no(%is_name%,,%(%Class%)%)%)%)%)%,%
%Name,%(%else-then(%if-no(%is_name%,,%(%Name%)%)%,%(%if-no(%is_name%,,%(%name%)%)%)%)%)%,%
%NAME,%(%else-then(%NAME%,%(%toupper(%Name%)%)%)%)%,%
%name,%(%else-then(%_name%,%(%tolower(%Name%)%)%)%)%,%
%is_implements,%(%else-then(%is_implements%,%(%is_Implements%)%)%)%,%
%implements,%(%else-then(%if-no(%is_implements%,,%(%implements%)%)%,%(%if-no(%is_implements%,,%(implement)%)%)%)%)%,%
%Implements,%(%else-then(%if-no(%is_implements%,,%(%Implements%)%)%,%(%implements%)%)%)%,%
%IMPLEMENTS,%(%else-then(%IMPLEMENTS%,%(%toupper(%Implements%)%)%)%)%,%
%implements,%(%else-then(%_Implements%,%(%tolower(%Implements%)%)%)%)%,%
%is_extends,%(%else-then(%is_extends%,%(%is_Extends%)%)%)%,%
%extends,%(%else-then(%if-no(%is_extends%,,%(%extends%)%)%,%(%if-no(%is_extends%,,%(extend)%)%)%)%)%,%
%Extends,%(%else-then(%if-no(%is_extends%,,%(%Extends%)%)%,%(%extends%)%)%)%,%
%EXTENDS,%(%else-then(%EXTENDS%,%(%toupper(%Extends%)%)%)%)%,%
%extends,%(%else-then(%_Extends%,%(%tolower(%Extends%)%)%)%)%,%
%is_template,%(%else-then(%is_template%,%(%is_Template%)%)%)%,%
%template,%(%else-then(%if-no(%is_template%,,%(%template%)%)%,%(%if-no(%is_template%,,%()%)%)%)%)%,%
%Template,%(%else-then(%if-no(%is_template%,,%(%Template%)%)%,%(%template%)%)%)%,%
%TEMPLATE,%(%else-then(%TEMPLATE%,%(%toupper(%Template%)%)%)%)%,%
%template,%(%else-then(%_Template%,%(%tolower(%Template%)%)%)%)%,%
%is_copy_constructor,%(%else-then(%is_copy_constructor%,%(%is_Copy_constructor%)%)%)%,%
%copy_constructor,%(%else-then(%if-no(%is_copy_constructor%,,%(%copy_constructor%)%)%,%(%if-no(%is_copy_constructor%,,%(yes)%)%)%)%)%,%
%Copy_constructor,%(%else-then(%if-no(%is_copy_constructor%,,%(%Copy_constructor%)%)%,%(%copy_constructor%)%)%)%,%
%COPY_CONSTRUCTOR,%(%else-then(%COPY_CONSTRUCTOR%,%(%toupper(%Copy_constructor%)%)%)%)%,%
%copy_constructor,%(%else-then(%_Copy_constructor%,%(%tolower(%Copy_constructor%)%)%)%)%,%
%is_explicit_copy_constructor,%(%else-then(%is_explicit_copy_constructor%,%(%is_Explicit_copy_constructor%)%)%)%,%
%explicit_copy_constructor,%(%else-then(%if-no(%is_explicit_copy_constructor%,,%(%explicit_copy_constructor%)%)%,%(%if-no(%is_explicit_copy_constructor%,,%()%)%)%)%)%,%
%Explicit_copy_constructor,%(%else-then(%if-no(%is_explicit_copy_constructor%,,%(%Explicit_copy_constructor%)%)%,%(%explicit_copy_constructor%)%)%)%,%
%EXPLICIT_COPY_CONSTRUCTOR,%(%else-then(%EXPLICIT_COPY_CONSTRUCTOR%,%(%toupper(%Explicit_copy_constructor%)%)%)%)%,%
%explicit_copy_constructor,%(%else-then(%_Explicit_copy_constructor%,%(%tolower(%Explicit_copy_constructor%)%)%)%)%,%
%is_constructor,%(%else-then(%is_constructor%,%(%is_Constructor%)%)%)%,%
%constructor,%(%else-then(%if-no(%is_constructor%,,%(%constructor%)%)%,%(%if-no(%is_constructor%,,%(yes)%)%)%)%)%,%
%Constructor,%(%else-then(%if-no(%is_constructor%,,%(%Constructor%)%)%,%(%constructor%)%)%)%,%
%CONSTRUCTOR,%(%else-then(%CONSTRUCTOR%,%(%toupper(%Constructor%)%)%)%)%,%
%constructor,%(%else-then(%_Constructor%,%(%tolower(%Constructor%)%)%)%)%,%
%is_explicit_constructor,%(%else-then(%is_explicit_constructor%,%(%is_Explicit_constructor%)%)%)%,%
%explicit_constructor,%(%else-then(%if-no(%is_explicit_constructor%,,%(%explicit_constructor%)%)%,%(%if-no(%is_explicit_constructor%,,%()%)%)%)%)%,%
%Explicit_constructor,%(%else-then(%if-no(%is_explicit_constructor%,,%(%Explicit_constructor%)%)%,%(%explicit_constructor%)%)%)%,%
%EXPLICIT_CONSTRUCTOR,%(%else-then(%EXPLICIT_CONSTRUCTOR%,%(%toupper(%Explicit_constructor%)%)%)%)%,%
%explicit_constructor,%(%else-then(%_Explicit_constructor%,%(%tolower(%Explicit_constructor%)%)%)%)%,%
%is_destructor,%(%else-then(%is_destructor%,%(%is_Destructor%)%)%)%,%
%destructor,%(%else-then(%if-no(%is_destructor%,,%(%destructor%)%)%,%(%if-no(%is_destructor%,,%(yes)%)%)%)%)%,%
%Destructor,%(%else-then(%if-no(%is_destructor%,,%(%Destructor%)%)%,%(%destructor%)%)%)%,%
%DESTRUCTOR,%(%else-then(%DESTRUCTOR%,%(%toupper(%Destructor%)%)%)%)%,%
%destructor,%(%else-then(%_Destructor%,%(%tolower(%Destructor%)%)%)%)%,%
%is_virtual_destructor,%(%else-then(%is_virtual_destructor%,%(%is_Virtual_destructor%)%)%)%,%
%virtual_destructor,%(%else-then(%if-no(%is_virtual_destructor%,,%(%virtual_destructor%)%)%,%(%if-no(%is_virtual_destructor%,,%()%)%)%)%)%,%
%Virtual_destructor,%(%else-then(%if-no(%is_virtual_destructor%,,%(%Virtual_destructor%)%)%,%(%virtual_destructor%)%)%)%,%
%VIRTUAL_DESTRUCTOR,%(%else-then(%VIRTUAL_DESTRUCTOR%,%(%toupper(%Virtual_destructor%)%)%)%)%,%
%virtual_destructor,%(%else-then(%_Virtual_destructor%,%(%tolower(%Virtual_destructor%)%)%)%)%,%
%is_templatet,%(%else-then(%is_templatet%,%(%is_TemplateT%)%)%)%,%
%templatet,%(%else-then(%if-no(%is_templatet%,,%(%templatet%)%)%,%(%if-no(%is_templatet%,,%(t)%)%)%)%)%,%
%TemplateT,%(%else-then(%if-no(%is_templatet%,,%(%TemplateT%)%)%,%(%if-no(%is_templatet%,,%(%templatet%)%)%)%)%)%,%
%TEMPLATET,%(%else-then(%TEMPLATET%,%(%toupper(%TemplateT%)%)%)%)%,%
%templatet,%(%else-then(%_templatet%,%(%tolower(%TemplateT%)%)%)%)%,%
%is_namet,%(%else-then(%is_namet%,%(%is_Namet%)%)%)%,%
%is_namet,%(%else-then(%is_namet%,%(%is_Namet%)%)%)%,%
%namet,%(%else-then(%if-no(%is_namet%,,%(%namet%)%)%,%(%if-no(%is_namet%,,%(%Name%%if-no(%is_template%,,%(%TemplateT%)%)%)%)%)%)%)%,%
%Namet,%(%else-then(%if-no(%is_namet%,,%(%Namet%)%)%,%(%if-no(%is_namet%,,%(%namet%)%)%)%)%)%,%
%NAMET,%(%else-then(%NAMET%,%(%toupper(%Namet%)%)%)%)%,%
%namet,%(%else-then(%_namet%,%(%tolower(%Namet%)%)%)%)%,%
%is_timplements,%(%else-then(%is_timplements%,%(%is_TImplements%)%)%)%,%
%timplements,%(%else-then(%if-no(%is_timplements%,,%(%timplements%)%)%,%(%if-no(%is_timplements%,,%(%
%%if-no(%is_template%,%Implements%,%if-no(%is_implements%,,%(TImplements)%)%)%%
%)%)%)%)%)%,%
%TImplements,%(%else-then(%if-no(%is_timplements%,,%(%TImplements%)%)%,%(%timplements%)%)%)%,%
%TIMPLEMENTS,%(%else-then(%TIMPLEMENTS%,%(%toupper(%TImplements%)%)%)%)%,%
%timplements,%(%else-then(%_TImplements%,%(%tolower(%TImplements%)%)%)%)%,%
%is_textends,%(%else-then(%is_textends%,%(%is_TExtends%)%)%)%,%
%textends,%(%else-then(%if-no(%is_textends%,,%(%textends%)%)%,%(%if-no(%is_textends%,,%(%
%%if-no(%is_template%,%Extends%,%if-no(%is_extends%,,%(TExtends)%)%)%%
%)%)%)%)%)%,%
%TExtends,%(%else-then(%if-no(%is_textends%,,%(%TExtends%)%)%,%(%textends%)%)%)%,%
%TEXTENDS,%(%else-then(%TEXTENDS%,%(%toupper(%TExtends%)%)%)%)%,%
%textends,%(%else-then(%_TExtends%,%(%tolower(%TExtends%)%)%)%)%,%
%%(%
%%include(%include_path%/hxx-cxx.t)%%
%)%)%