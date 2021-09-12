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
%#   Date: 10/10/2019
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%is_template,%(%else-then(%is_template%,%(%is_Template%)%)%)%,%
%template,%(%else-then(%template%,%()%)%)%,%
%Template,%(%else-then(%Template%,%(%template%)%)%)%,%
%TEMPLATE,%(%else-then(%TEMPLATE%,%(%toupper(%Template%)%)%)%)%,%
%template,%(%else-then(%_Template%,%(%tolower(%Template%)%)%)%)%,%
%is_name,%(%else-then(%is_name%,%(%is_Name%)%)%)%,%
%name,%(%else-then(%name%,%(Name)%)%)%,%
%Name,%(%else-then(%Name%,%(%name%)%)%)%,%
%NAME,%(%else-then(%NAME%,%(%toupper(%Name%)%)%)%)%,%
%name,%(%else-then(%_Name%,%(%tolower(%Name%)%)%)%)%,%
%is_implements,%(%else-then(%is_implements%,%(%is_Implements%)%)%)%,%
%implements,%(%else-then(%if-no(%is_implements%,,%implements%)%,%(%if-no(%is_implements%,,implement)%)%)%)%,%
%Implements,%(%else-then(%Implements%,%(%implements%)%)%)%,%
%IMPLEMENTS,%(%else-then(%IMPLEMENTS%,%(%toupper(%Implements%)%)%)%)%,%
%implements,%(%else-then(%_Implements%,%(%tolower(%Implements%)%)%)%)%,%
%is_extends,%(%else-then(%is_extends%,%(%is_Extends%)%)%)%,%
%extends,%(%else-then(%extends%,%(Extends)%)%)%,%
%Extends,%(%else-then(%Extends%,%(%extends%)%)%)%,%
%EXTENDS,%(%else-then(%EXTENDS%,%(%toupper(%Extends%)%)%)%)%,%
%extends,%(%else-then(%_Extends%,%(%tolower(%Extends%)%)%)%)%,%
%is_timplement,%(%else-then(%is_timplement%,%(%is_TImplement%)%)%)%,%
%timplement,%(%else-then(%timplement%,%(class TImplements = %Implements%)%)%)%,%
%TImplement,%(%else-then(%TImplement%,%(%timplement%)%)%)%,%
%TIMPLEMENT,%(%else-then(%TIMPLEMENT%,%(%toupper(%TImplement%)%)%)%)%,%
%timplement,%(%else-then(%_TImplement%,%(%tolower(%TImplement%)%)%)%)%,%
%is_textend,%(%else-then(%is_textend%,%()%)%)%,%
%textend,%(%else-then(%textend%,%(class TExtends = %Extends%)%)%)%,%
%TExtend,%(%else-then(%TExtend%,%(%textend%)%)%)%,%
%TEXTEND,%(%else-then(%TEXTEND%,%(%toupper(%TExtend%)%)%)%)%,%
%textend,%(%else-then(%_TExtend%,%(%tolower(%TExtend%)%)%)%)%,%
%is_timplements,%(%else-then(%is_timplements%,%()%)%)%,%
%timplements,%(%else-then(%if-no(%is_implements%,,%timplements%)%,%(%if-no(%is_implements%,,%if-no(%is_template%,%(%Implements%)%,%(TImplements)%)%)%)%)%)%,%
%TImplements,%(%else-then(%TImplements%,%(%timplements%)%)%)%,%
%TIMPLEMENTS,%(%else-then(%TIMPLEMENTS%,%(%toupper(%TImplements%)%)%)%)%,%
%timplements,%(%else-then(%_TImplements%,%(%tolower(%TImplements%)%)%)%)%,%
%is_textends,%(%else-then(%is_textends%,%()%)%)%,%
%textends,%(%else-then(%if-no(%is_extends%,,%textends%)%,%(%if-no(%is_extends%,,%if-no(%is_template%,%(%Extends%)%,%(TExtends)%)%)%)%)%)%,%
%TExtends,%(%else-then(%TExtends%,%(%textends%)%)%)%,%
%TEXTENDS,%(%else-then(%TEXTENDS%,%(%toupper(%TExtends%)%)%)%)%,%
%textends,%(%else-then(%_TExtends%,%(%tolower(%TExtends%)%)%)%)%,%
%is_namet,%(%else-then(%is_namet%,%(%is_NameT%)%)%)%,%
%namet,%(%else-then(%namet%,%(%Name%%if-no(%is_template%,,%(t)%)%)%)%)%,%
%NameT,%(%else-then(%NameT%,%(%namet%)%)%)%,%
%NAMET,%(%else-then(%NAMET%,%(%toupper(%NameT%)%)%)%)%,%
%namet,%(%else-then(%_NameT%,%(%tolower(%NameT%)%)%)%)%,%
%is_prefix,%(%else-then(%is_prefix%,%()%)%)%,%
%prefix,%(%else-then(%prefix%,%(class-)%)%)%,%
%Prefix,%(%else-then(%Prefix%,%(%prefix%)%)%)%,%
%PREFIX,%(%else-then(%PREFIX%,%(%toupper(%Prefix%)%)%)%)%,%
%prefix,%(%else-then(%_Prefix%,%(%tolower(%Prefix%)%)%)%)%,%
%%(%
%%include(%include_path%/hxx-cxx.t)%%
%)%)%