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
%#   File: class-hpp-cpp.t
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
%is_prefix,%(%else-then(%is_prefix%,%(%is_Prefix%)%)%)%,%
%prefix,%(%else-then(%if-no(%is_prefix%,,%(%prefix%)%)%,%(%if-no(%is_prefix%,,%(class-)%)%)%)%)%,%
%Prefix,%(%else-then(%if-no(%is_prefix%,,%(%Prefix%)%)%,%(%if-no(%is_prefix%,,%(%prefix%)%)%)%)%)%,%
%PREFIX,%(%else-then(%PREFIX%,%(%toupper(%Prefix%)%)%)%)%,%
%prefix,%(%else-then(%_prefix%,%(%tolower(%Prefix%)%)%)%)%,%
%is_class,%(%else-then(%is_class%,%(%is_Class%)%)%)%,%
%class,%(%else-then(%if-no(%is_class%,,%(%class%)%)%,%(%if-no(%is_class%,,%(derived)%)%)%)%)%,%
%Class,%(%else-then(%if-no(%is_class%,,%(%Class%)%)%,%(%if-no(%is_class%,,%(%class%)%)%)%)%)%,%
%CLASS,%(%else-then(%CLASS%,%(%toupper(%Class%)%)%)%)%,%
%class,%(%else-then(%_class%,%(%tolower(%Class%)%)%)%)%,%
%is_implements,%(%else-then(%is_implements%,%(%is_Implements%)%)%)%,%
%implements,%(%else-then(%if-no(%is_implements%,,%(%implements%)%)%,%(%if-no(%is_implements%,,%(implement)%)%)%)%)%,%
%Implements,%(%else-then(%if-no(%is_implements%,,%(%Implements%)%)%,%(%if-no(%is_implements%,,%(%implements%)%)%)%)%)%,%
%IMPLEMENTS,%(%else-then(%IMPLEMENTS%,%(%toupper(%Implements%)%)%)%)%,%
%implements,%(%else-then(%_implements%,%(%tolower(%Implements%)%)%)%)%,%
%is_extends,%(%else-then(%is_extends%,%(%is_Extends%)%)%)%,%
%extends,%(%else-then(%if-no(%is_extends%,,%(%extends%)%)%,%(%if-no(%is_extends%,,%(extend)%)%)%)%)%,%
%Extends,%(%else-then(%if-no(%is_extends%,,%(%Extends%)%)%,%(%if-no(%is_extends%,,%(%extends%)%)%)%)%)%,%
%EXTENDS,%(%else-then(%EXTENDS%,%(%toupper(%Extends%)%)%)%)%,%
%extends,%(%else-then(%_extends%,%(%tolower(%Extends%)%)%)%)%,%
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
%is_classt,%(%else-then(%is_classt%,%(%is_ClassT%)%)%)%,%
%classt,%(%else-then(%if-no(%is_classt%,,%(%classt%)%)%,%(%if-no(%is_classt%,,%(%Class%%if(%is_template%,%TemplateT%)%)%)%)%)%)%,%
%ClassT,%(%else-then(%if-no(%is_classt%,,%(%ClassT%)%)%,%(%if-no(%is_classt%,,%(%classt%)%)%)%)%)%,%
%CLASST,%(%else-then(%CLASST%,%(%toupper(%ClassT%)%)%)%)%,%
%classt,%(%else-then(%_classt%,%(%tolower(%ClassT%)%)%)%)%,%
%is_base,%(%else-then(%is_base%,%(%is_Base%)%)%)%,%
%is_textends,%(%else-then(%is_textends%,%(%is_TExtends%)%)%)%,%
%textends,%(%else-then(%if-no(%is_textends%,,%(%textends%)%)%,%(%if-no(%is_textends%,,%(%if(%is_template%,TExtends,%Extends%)%)%)%)%)%)%,%
%TExtends,%(%else-then(%if-no(%is_textends%,,%(%TExtends%)%)%,%(%if-no(%is_textends%,,%(%textends%)%)%)%)%)%,%
%TEXTENDS,%(%else-then(%TEXTENDS%,%(%toupper(%TExtends%)%)%)%)%,%
%textends,%(%else-then(%_textends%,%(%tolower(%TExtends%)%)%)%)%,%
%is_timplements,%(%else-then(%is_timplements%,%(%is_TImplements%)%)%)%,%
%timplements,%(%else-then(%if-no(%is_timplements%,,%(%timplements%)%)%,%(%if-no(%is_timplements%,,%(%if(%is_template%,TImplements,%Implements%)%)%)%)%)%)%,%
%TImplements,%(%else-then(%if-no(%is_timplements%,,%(%TImplements%)%)%,%(%if-no(%is_timplements%,,%(%timplements%)%)%)%)%)%,%
%TIMPLEMENTS,%(%else-then(%TIMPLEMENTS%,%(%toupper(%TImplements%)%)%)%)%,%
%timplements,%(%else-then(%_timplements%,%(%tolower(%TImplements%)%)%)%)%,%
%is_typedef_implements,%(%else-then(%is_typedef_implements%,%(%is_typedef_Implements%)%)%)%,%
%typedef_implements,%(%else-then(%if-no(%is_typedef_implements%,,%(%typedef_implements%)%)%,%(%if-no(%is_typedef_implements%,,%(implements)%)%)%)%)%,%
%typedef_Implements,%(%else-then(%if-no(%is_typedef_implements%,,%(%typedef_Implements%)%)%,%(%if-no(%is_typedef_implements%,,%(%typedef_implements%)%)%)%)%)%,%
%TYPEDEF_IMPLEMENTS,%(%else-then(%TYPEDEF_IMPLEMENTS%,%(%toupper(%typedef_Implements%)%)%)%)%,%
%typedef_implements,%(%else-then(%_typedef_implements%,%(%tolower(%typedef_Implements%)%)%)%)%,%
%is_typedef_extends,%(%else-then(%is_typedef_extends%,%(%is_typedef_Extends%)%)%)%,%
%typedef_extends,%(%else-then(%if-no(%is_typedef_extends%,,%(%typedef_extends%)%)%,%(%if-no(%is_typedef_extends%,,%(extends)%)%)%)%)%,%
%typedef_Extends,%(%else-then(%if-no(%is_typedef_extends%,,%(%typedef_Extends%)%)%,%(%if-no(%is_typedef_extends%,,%(%typedef_extends%)%)%)%)%)%,%
%TYPEDEF_EXTENDS,%(%else-then(%TYPEDEF_EXTENDS%,%(%toupper(%typedef_Extends%)%)%)%)%,%
%typedef_extends,%(%else-then(%_typedef_extends%,%(%tolower(%typedef_Extends%)%)%)%)%,%
%is_typedef_derives,%(%else-then(%is_typedef_derives%,%(%is_typedef_Derives%)%)%)%,%
%typedef_derives,%(%else-then(%if-no(%is_typedef_derives%,,%(%typedef_derives%)%)%,%(%if-no(%is_typedef_derives%,,%(derives)%)%)%)%)%,%
%typedef_Derives,%(%else-then(%if-no(%is_typedef_derives%,,%(%typedef_Derives%)%)%,%(%if-no(%is_typedef_derives%,,%(%typedef_derives%)%)%)%)%)%,%
%TYPEDEF_DERIVES,%(%else-then(%TYPEDEF_DERIVES%,%(%toupper(%typedef_Derives%)%)%)%)%,%
%typedef_derives,%(%else-then(%_typedef_derives%,%(%tolower(%typedef_Derives%)%)%)%)%,%
%base,%(%else-then(%if-no(%is_base%,,%(%base%)%)%,%(%if-no(%is_base%,,%(%else-then(%filebase(%File%)%,%else-then(%Class%,$file$)%)%)%)%)%)%)%,%
%Base,%(%else-then(%if-no(%is_base%,,%(%Base%)%)%,%(%if-no(%is_base%,,%(%base%)%)%)%)%)%,%
%BASE,%(%else-then(%BASE%,%(%toupper(%Base%)%)%)%)%,%
%base,%(%else-then(%_base%,%(%tolower(%Base%)%)%)%)%,%
%is_include_path,%(%else-then(%is_include_path%,%(%is_Include_path%)%)%)%,%
%include_path,%(%else-then(%if-no(%is_include_path%,,%(%include_path%)%)%,%(%if-no(%is_include_path%,,%(%filepath(%input%)%)%)%)%)%)%,%
%Include_path,%(%else-then(%if-no(%is_include_path%,,%(%Include_path%)%)%,%(%if-no(%is_include_path%,,%(%include_path%)%)%)%)%)%,%
%INCLUDE_PATH,%(%else-then(%INCLUDE_PATH%,%(%toupper(%Include_path%)%)%)%)%,%
%include_path,%(%else-then(%_include_path%,%(%tolower(%Include_path%)%)%)%)%,%
%is_exported,%(%else-then(%is_exported%,%(%is_Exported%)%)%)%,%
%exported,%(%else-then(%if-no(%is_exported%,,%(%exported%)%)%,%(%if-no(%is_exported%,,%(exported)%)%)%)%)%,%
%Exported,%(%else-then(%if-no(%is_exported%,,%(%Exported%)%)%,%(%if-no(%is_exported%,,%(%exported%)%)%)%)%)%,%
%EXPORTED,%(%else-then(%EXPORTED%,%(%toupper(%Exported%)%)%)%)%,%
%exported,%(%else-then(%_exported%,%(%tolower(%Exported%)%)%)%)%,%
%%(%
%%include(%Include_path%/hpp-cpp.t)%%
%)%)%