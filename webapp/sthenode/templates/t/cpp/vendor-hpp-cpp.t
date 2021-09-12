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
%#   File: vendor-hpp-cpp.t
%#
%# Author: $author$
%#   Date: 7/27/2018
%########################################################################
%with(%
%CCComment,%(%else-then(%CCComment%,%(///)%)%)%,%
%NSComment,%(%else-then(%NSComment%,%(%CCComment%)%)%)%,%
%is_exported,%(%else-then(%is_exported%,%(%is_Exported%)%)%)%,%
%exported,%(%else-then(%if-no(%is_exported%,,%(%exported%)%)%,%(%if-no(%is_exported%,,%(_EXPORT_CLASS)%)%)%)%)%,%
%Exported,%(%else-then(%if-no(%is_exported%,,%(%Exported%)%)%,%(%if-no(%is_exported%,,%(%exported%)%)%)%)%)%,%
%EXPORTED,%(%else-then(%EXPORTED%,%(%toupper(%Exported%)%)%)%)%,%
%exported,%(%else-then(%_exported%,%(%tolower(%Exported%)%)%)%)%,%
%is_templatet,%(%else-then(%is_templatet%,%(%is_TemplateT%)%)%)%,%
%templatet,%(%else-then(%if-no(%is_templatet%,,%(%templatet%)%)%,%(%if-no(%is_templatet%,,%(t)%)%)%)%)%,%
%TemplateT,%(%else-then(%if-no(%is_templatet%,,%(%TemplateT%)%)%,%(%if-no(%is_templatet%,,%(%templatet%)%)%)%)%)%,%
%TEMPLATET,%(%else-then(%TEMPLATET%,%(%toupper(%TemplateT%)%)%)%)%,%
%templatet,%(%else-then(%_templatet%,%(%tolower(%TemplateT%)%)%)%)%,%
%is_template,%(%else-then(%is_template%,%(%is_Template%)%)%)%,%
%template,%(%else-then(%if-no(%is_template%,,%(%template%)%)%,%(%if-no(%is_template%,,%(yes)%)%)%)%)%,%
%Template,%(%else-then(%if-no(%is_template%,,%(%Template%)%)%,%(%if-no(%is_template%,,%(%template%)%)%)%)%)%,%
%TEMPLATE,%(%else-then(%TEMPLATE%,%(%toupper(%Template%)%)%)%)%,%
%template,%(%else-then(%_template%,%(%tolower(%Template%)%)%)%)%,%
%name,%(%else-then(%do(%if-no(%is_name%,,%name%)%)%,%(%else-then(%do(%if-no(%is_name%,,%name%)%)%,%(%if-no(%is_name%,,name)%)%)%)%)%)%,%
%Name,%(%else-then(%Name%,%(%name%)%)%)%,%
%NAME,%(%else-then(%NAME%,%(%toupper(%Name%)%)%)%)%,%
%name,%(%else-then(%_Name%,%(%tolower(%Name%)%)%)%)%,%
%is_namet,%(%else-then(%is_namet%,%(%is_Namet%)%)%)%,%
%namet,%(%else-then(%if-no(%is_namet%,,%(%namet%)%)%,%(%if-no(%is_namet%,,%(%if-no(%is_template%,%Name%,%Name%%TemplateT%)%)%)%)%)%)%,%
%Namet,%(%else-then(%if-no(%is_namet%,,%(%Namet%)%)%,%(%if-no(%is_namet%,,%(%namet%)%)%)%)%)%,%
%NAMET,%(%else-then(%NAMET%,%(%toupper(%Namet%)%)%)%)%,%
%namet,%(%else-then(%_namet%,%(%tolower(%Namet%)%)%)%)%,%
%name_implements,%(%else(%implements%,%(%if-no(%is_implements%,,yes)%)%)%)%,%
%Name_implements,%(%else-then(%Name_implements%,%(%name_implements%)%)%)%,%
%NAME_IMPLEMENTS,%(%else-then(%NAME_IMPLEMENTS%,%(%toupper(%Name_implements%)%)%)%)%,%
%name_implements,%(%else-then(%_Name_implements%,%(%tolower(%Name_implements%)%)%)%)%,%
%implements_implements,%(%else-then(%implements_implements%,%(implement_base)%)%)%,%
%Implements_implements,%(%else-then(%Implements_implements%,%(%implements_implements%)%)%)%,%
%IMPLEMENTS_IMPLEMENTS,%(%else-then(%IMPLEMENTS_IMPLEMENTS%,%(%toupper(%Implements_implements%)%)%)%)%,%
%implements_implements,%(%else-then(%_Implements_implements%,%(%tolower(%Implements_implements%)%)%)%)%,%
%implements,%(%else-then(%if-no(%is_implements%,,%implements%)%,%(%if-no(%is_implements%,,%Name%_implement)%)%)%)%,%
%Implements,%(%else-then(%Implements%,%(%implements%)%)%)%,%
%IMPLEMENTS,%(%else-then(%IMPLEMENTS%,%(%toupper(%Implements%)%)%)%)%,%
%implements,%(%else-then(%_Implements%,%(%tolower(%Implements%)%)%)%)%,%
%ImplementsT,%(%else-then(%ImplementsT%,%(%if-no(%is_template%,%Implements%,%Implements%T)%)%)%)%,%
%implementst,%(%else-then(%implementst%,%(%if-no(%is_template%,%Implements%,%Implements%t)%)%)%)%,%
%Implementst,%(%else-then(%Implementst%,%(%implementst%)%)%)%,%
%IMPLEMENTST,%(%else-then(%IMPLEMENTST%,%(%toupper(%Implementst%)%)%)%)%,%
%implementst,%(%else-then(%_Implementst%,%(%tolower(%Implementst%)%)%)%)%,%
%extends,%(%else-then(%if-no(%is_extends%,,%extends%)%,%(%if-no(%is_extends%,,base)%)%)%)%,%
%Extends,%(%else-then(%Extends%,%(%extends%)%)%)%,%
%EXTENDS,%(%else-then(%EXTENDS%,%(%toupper(%Extends%)%)%)%)%,%
%extends,%(%else-then(%_Extends%,%(%tolower(%Extends%)%)%)%)%,%
%is_typedef_derives,%(%else-then(%is_typedef_derives%,%(%is_Typedef_derives%)%)%)%,%
%typedef_derives,%(%else-then(%if-no(%is_typedef_derives%,,%(%typedef_derives%)%)%,%(%if-no(%is_typedef_derives%,,%(derives)%)%)%)%)%,%
%Typedef_derives,%(%else-then(%if-no(%is_typedef_derives%,,%(%Typedef_derives%)%)%,%(%typedef_derives%)%)%)%,%
%TYPEDEF_DERIVES,%(%else-then(%TYPEDEF_DERIVES%,%(%toupper(%Typedef_derives%)%)%)%)%,%
%typedef_derives,%(%else-then(%_typedef_derives%,%(%tolower(%Typedef_derives%)%)%)%)%,%
%is_typedef_implements,%(%else-then(%is_typedef_implements%,%(%is_Typedef_implements%)%)%)%,%
%typedef_implements,%(%else-then(%if-no(%is_typedef_implements%,,%(%typedef_implements%)%)%,%(%if-no(%is_typedef_implements%,,%(implements)%)%)%)%)%,%
%Typedef_implements,%(%else-then(%if-no(%is_typedef_implements%,,%(%Typedef_implements%)%)%,%(%typedef_implements%)%)%)%,%
%TYPEDEF_IMPLEMENTS,%(%else-then(%TYPEDEF_IMPLEMENTS%,%(%toupper(%Typedef_implements%)%)%)%)%,%
%typedef_implements,%(%else-then(%_typedef_implements%,%(%tolower(%Typedef_implements%)%)%)%)%,%
%is_typedef_extends,%(%else-then(%is_typedef_extends%,%(%is_Typedef_extends%)%)%)%,%
%typedef_extends,%(%else-then(%if-no(%is_typedef_extends%,,%(%typedef_extends%)%)%,%(%if-no(%is_typedef_extends%,,%(extends)%)%)%)%)%,%
%Typedef_extends,%(%else-then(%if-no(%is_typedef_extends%,,%(%Typedef_extends%)%)%,%(%typedef_extends%)%)%)%,%
%TYPEDEF_EXTENDS,%(%else-then(%TYPEDEF_EXTENDS%,%(%toupper(%Typedef_extends%)%)%)%)%,%
%typedef_extends,%(%else-then(%_typedef_extends%,%(%tolower(%Typedef_extends%)%)%)%)%,%
%is_copy_constructor_access,%(%else-then(%is_copy_constructor_access%,%(%is_Copy_constructor_access%)%)%)%,%
%copy_constructor_access,%(%else-then(%if-no(%is_copy_constructor_access%,,%(%copy_constructor_access%)%)%,%(%if-no(%is_copy_constructor_access%,,%(public)%)%)%)%)%,%
%Copy_constructor_access,%(%else-then(%if-no(%is_copy_constructor_access%,,%(%Copy_constructor_access%)%)%,%(%if-no(%is_copy_constructor_access%,,%(%copy_constructor_access%)%)%)%)%)%,%
%COPY_CONSTRUCTOR_ACCESS,%(%else-then(%COPY_CONSTRUCTOR_ACCESS%,%(%toupper(%Copy_constructor_access%)%)%)%)%,%
%copy_constructor_access,%(%else-then(%_copy_constructor_access%,%(%tolower(%Copy_constructor_access%)%)%)%)%,%
%is_copy_constructor,%(%else-then(%is_copy_constructor%,%()%)%)%,%
%copy_constructor,%(%else-then(%copy_constructor%,%(%if-no(%is_copy_constructor%,,yes)%)%)%)%,%
%Copy_constructor,%(%else-then(%Copy_constructor%,%(%copy_constructor%)%)%)%,%
%COPY_CONSTRUCTOR,%(%else-then(%COPY_CONSTRUCTOR%,%(%toupper(%Copy_constructor%)%)%)%)%,%
%copy_constructor,%(%else-then(%_Copy_constructor%,%(%tolower(%Copy_constructor%)%)%)%)%,%
%is_constructor_access,%(%else-then(%is_constructor_access%,%(%is_Constructor_access%)%)%)%,%
%constructor_access,%(%else-then(%if-no(%is_constructor_access%,,%(%constructor_access%)%)%,%(%if-no(%is_constructor_access%,,%(public)%)%)%)%)%,%
%Constructor_access,%(%else-then(%if-no(%is_constructor_access%,,%(%Constructor_access%)%)%,%(%if-no(%is_constructor_access%,,%(%constructor_access%)%)%)%)%)%,%
%CONSTRUCTOR_ACCESS,%(%else-then(%CONSTRUCTOR_ACCESS%,%(%toupper(%Constructor_access%)%)%)%)%,%
%constructor_access,%(%else-then(%_constructor_access%,%(%tolower(%Constructor_access%)%)%)%)%,%
%is_constructor,%(%else-then(%is_constructor%,%()%)%)%,%
%constructor,%(%else-then(%constructor%,%(%if-no(%is_constructor%,,yes)%)%)%)%,%
%Constructor,%(%else-then(%Constructor%,%(%constructor%)%)%)%,%
%CONSTRUCTOR,%(%else-then(%CONSTRUCTOR%,%(%toupper(%Constructor%)%)%)%)%,%
%constructor,%(%else-then(%_Constructor%,%(%tolower(%Constructor%)%)%)%)%,%
%is_destructor_access,%(%else-then(%is_destructor_access%,%(%is_Destructor_access%)%)%)%,%
%destructor_access,%(%else-then(%if-no(%is_destructor_access%,,%(%destructor_access%)%)%,%(%if-no(%is_destructor_access%,,%(public)%)%)%)%)%,%
%Destructor_access,%(%else-then(%if-no(%is_destructor_access%,,%(%Destructor_access%)%)%,%(%if-no(%is_destructor_access%,,%(%destructor_access%)%)%)%)%)%,%
%DESTRUCTOR_ACCESS,%(%else-then(%DESTRUCTOR_ACCESS%,%(%toupper(%Destructor_access%)%)%)%)%,%
%destructor_access,%(%else-then(%_destructor_access%,%(%tolower(%Destructor_access%)%)%)%)%,%
%is_destructor,%(%else-then(%is_destructor%,%(%is_Destructor%)%)%)%,%
%destructor,%(%else-then(%if-no(%is_destructor%,,%(%destructor%)%)%,%(%if-no(%is_destructor%,,%()%)%)%)%)%,%
%Destructor,%(%else-then(%if-no(%is_destructor%,,%(%Destructor%)%)%,%(%if-no(%is_destructor%,,%(%destructor%)%)%)%)%)%,%
%DESTRUCTOR,%(%else-then(%DESTRUCTOR%,%(%toupper(%Destructor%)%)%)%)%,%
%destructor,%(%else-then(%_destructor%,%(%tolower(%Destructor%)%)%)%)%,%
%is_if_destructor,%(%else-then(%is_if_destructor%,%(%is_if_Destructor%)%)%)%,%
%if_destructor,%(%else-then(%if-no(%is_if_destructor%,,%(%if_destructor%)%)%,%(%if-no(%is_if_destructor%,,%(%if-no(%is_Destructor%,,%(yes)%)%)%)%)%)%)%,%
%if_Destructor,%(%else-then(%if-no(%is_if_destructor%,,%(%if_Destructor%)%)%,%(%if-no(%is_if_destructor%,,%(%if_destructor%)%)%)%)%)%,%
%IF_DESTRUCTOR,%(%else-then(%IF_DESTRUCTOR%,%(%toupper(%if_Destructor%)%)%)%)%,%
%if_destructor,%(%else-then(%_if_destructor%,%(%tolower(%if_Destructor%)%)%)%)%,%
%File_name,%(%else-then(%File_name%,%(%if(%is_lowercase_file%,%name%,%Name%)%)%)%)%,%
%File_namet,%(%else-then(%File_namet%,%(%File_name%%if-no(%is_template%,,%if(%is_lowercase_file%,t,T)%)%)%)%)%,%
%file,%(%else-then(%do(%file%)%,%(%else-then(%if(%is_t_file%,%File_namet%,%File_name%)%,%(name)%)%)%)%)%,%
%File,%(%else-then(%File%,%(%file%)%)%)%,%
%FILE,%(%else-then(%FILE%,%(%toupper(%File%)%)%)%)%,%
%file,%(%else-then(%_File%,%(%tolower(%File%)%)%)%)%,%
%base,%(%else-then(%base%,%(%filebase(%File%)%)%)%)%,%
%Base,%(%else-then(%Base%,%(%base%)%)%)%,%
%BASE,%(%else-then(%BASE%,%(%toupper(%Base%)%)%)%)%,%
%base,%(%else-then(%_Base%,%(%tolower(%Base%)%)%)%)%,%
%header,%(%else-then(%header%,%(hpp)%)%)%,%
%Header,%(%else-then(%Header%,%(%header%)%)%)%,%
%HEADER,%(%else-then(%HEADER%,%(%toupper(%Header%)%)%)%)%,%
%header,%(%else-then(%_Header%,%(%tolower(%Header%)%)%)%)%,%
%cheader,%(%else-then(%cheader%,%(CHeader)%)%)%,%
%CHeader,%(%else-then(%CHeader%,%(hxx)%)%)%,%
%CHEADER,%(%else-then(%CHEADER%,%(%toupper(%CHeader%)%)%)%)%,%
%cheader,%(%else-then(%_CHeader%,%(%tolower(%CHeader%)%)%)%)%,%
%extension,%(%else-then(%extension%,%(hpp)%)%)%,%
%Extension,%(%else-then(%Extension%,%(%extension%)%)%)%,%
%EXTENSION,%(%else-then(%EXTENSION%,%(%toupper(%Extension%)%)%)%)%,%
%extension,%(%else-then(%_Extension%,%(%tolower(%Extension%)%)%)%)%,%
%directory,%(%else-then(%if-no(%is_directory%,,%directory%)%,%(%else-then(%if-no(%is_ifndef%,,%else-then(%ifndef_directory%,%namespace%)%)%,%(%if-no(%is_ifndef%,,xos)%)%)%)%)%)%,%
%Directory,%(%else-then(%Directory%,%(%directory%)%)%)%,%
%DIRECTORY,%(%else-then(%DIRECTORY%,%(%toupper(%Directory%)%)%)%)%,%
%directory,%(%else-then(%_Directory%,%(%tolower(%Directory%)%)%)%)%,%
%ifndef_directory,%(%else-then(%if-no(%is_ifndef%,,%ifndef_directory%)%,%(%if-no(%is_ifndef%,,%Directory%)%)%)%)%,%
%Ifndef_directory,%(%else-then(%Ifndef_directory%,%(%ifndef_directory%)%)%)%,%
%Ifndef_directory,%(%
%%then-if(%parse(%Ifndef_directory%,/,,_)%,_)%%
%)%,%
%IFNDEF_DIRECTORY,%(%else-then(%IFNDEF_DIRECTORY%,%(%toupper(%Ifndef_directory%)%)%)%)%,%
%ifndef_directory,%(%else-then(%_Ifndef_directory%,%(%tolower(%Ifndef_directory%)%)%)%)%,%
%include_directory,%(%else-then(%include_directory%,%(%Directory%)%)%)%,%
%Include_directory,%(%else-then(%Include_directory%,%(%include_directory%)%)%)%,%
%include,%(%else-then(%do(%if-no(%is_include%,,%include%)%)%,%(%if-no(%is_include%,,xos/base/Base.hpp)%)%)%)%,%
%Include,%(%else-then(%Include%,%(%include%)%)%)%,%
%sys_include,%(%else-then(%sys_include%,%()%)%)%,%
%Sys_include,%(%else-then(%Sys_include%,%(%sys_include%)%)%)%,%
%namespace,%(%else-then(%if-no(%is_namespace%,,%namespace%)%,%(%if-no(%is_namespace%,,%Include_directory%)%)%)%)%,%
%Namespace,%(%else-then(%Namespace%,%(%namespace%)%)%)%,%
%Namespace_begin,%(%else-then(%Namespace_begin%,%(%
%%if(%Namespace%,%(%parse(%Namespace%,/,,,,%(namespace %ns% {
)%,ns)%
)%)%)%)%)%,%
%Namespace_end,%(%else-then(%Namespace_end%,%(%
%%if(%Namespace%,%(
%reverse-parse(%Namespace%,/,,,,%(} %NSComment% namespace %ns%
)%,ns)%)%)%)%)%)%,%
%cNamespace_begin,%(%if(%Namespace%,%(#if defined(__cplusplus)
%parse(%Namespace%,/,,,,%(namespace %ns% {
)%,ns)%#endif /*/ defined(__cplusplus) /*/
)%)%)%,%
%cNamespace_end,%(%if(%Namespace%,%(
#if defined(__cplusplus)
%reverse-parse(%Namespace%,/,,,,%(} /*/ namespace %ns% /*/
)%,ns)%#endif /*/ defined(__cplusplus) /*/
)%)%)%,%
%c_namespace,%(%else-then(%c_namespace%,%(c_NAMESPACE)%)%)%,%
%c_NAMESPACE,%(%else-then(%c_NAMESPACE%,%(%c_namespace%)%)%)%,%
%cnamespace_begin,%(%else-then(%cnamespace_begin%,%if-no(%is_namespace%,,%(#if defined(%c_NAMESPACE%)
namespace %c_NAMESPACE% {
#endif /* defined(%c_NAMESPACE%) */

)%)%)%)%,%
%CNamespace_begin,%(%else-then(%CNamespace_begin%,%(%cnamespace_begin%)%)%)%,%
%cnamespace_end,%(%else-then(%cnamespace_end%,%if-no(%is_namespace%,,%(
#if defined(%c_NAMESPACE%)
} /* namespace %c_NAMESPACE% */
#endif /* defined(%c_NAMESPACE%) */
)%)%)%)%,%
%CNamespace_end,%(%else-then(%CNamespace_end%,%(%cnamespace_end%)%)%)%,%
%enum_do,%(%else-then(%enum_do%,%(%else-then(%left(%enum_name%,/)%,%(%else-then(%enum_name%,%(%Name%)%)%)%)%)%)%)%,%
%Enum_do,%(%else-then(%Enum_do%,%(%enum_do%)%)%)%,%
%enum_undo,%(%else-then(%enum_undo%,%(%right(%enum_name%,/)%)%)%)%,%
%Enum_undo,%(%else-then(%Enum_undo%,%(%enum_undo%)%)%)%,%
%enum_name,%(%else-then(%Enum_do%,%(%else-then(%enum_name%,%(%Name%)%)%)%)%)%,%
%Enum_name,%(%else-then(%Enum_name%,%(%enum_name%)%)%)%,%
%enum_value,%(%else-then(%enum_value%,%(%if-then(%Enum_undo%,Success;)%%Enum_do%Success;%Enum_do%Failed;%if-then(%Enum_undo%,Failed;)%%Enum_do%Busy;%Enum_do%Interrupted;%Enum_do%Invalid;%if-then(%Enum_undo%,Busy;%Enum_undo%Interrupted;%Enum_undo%Invalid;)%)%)%)%,%
%Enum_value,%(%else-then(%Enum_value%,%(%enum_value%)%)%)%,%
%%(%
%%include(%filepath(%input%)%/%Vendor%%Prefix%%Extension%.t)%%
%)%)%