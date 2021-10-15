%#############################################################################
%# Copyright (c) 1988-2005 $author$.
%#
%# This software is provided by the author and contributors ``as is'' and
%# any express or implied warranties, including, but not limited to, the
%# implied warranties of merchantability and fitness for a particular purpose
%# are disclaimed.  In no event shall the author or contributors be liable
%# for any direct, indirect, incidental, special, exemplary, or consequential
%# damages (including, but not limited to, procurement of substitute goods
%# or services; loss of use, data, or profits; or business interruption)
%# however caused and on any theory of liability, whether in contract, strict
%# liability, or tort (including negligence or otherwise) arising in any way
%# out of the use of this software, even if advised of the possibility of
%# such damage.
%#
%#   File: ccchar-hxx.t
%#
%# Author: $author$
%#   Date: 10/28/2005
%#
%#    $Id$
%#
%#############################################################################
%apply-x(%
%author,%(%else-then(%author%,$author$)%)%,%
%date,%(%date()%)%,%
%year,%(%year()%)%,%
%copyright,%(%if(%equal(no,%copyright%)%,,%(Copyright (c) 1988-%year% %author%)%)%)%,%
%open_source,%(%if(%equal(no,%open_source%)%,,yes)%)%,%
%file,%(%else-then(%file%,%output%)%)%,%
%filename,%(%filename(%file%)%)%,%
%filebase,%(%filebase(%filename%)%)%,%
%fileextension,%(%fileextension(%filename%)%)%,%
%filepath,%filepath(%input%)%,%
%hxx,%(%equal(hxx,%tolower(%fileextension%)%)%)%,%
%ifndef,%(%toupper(_%filebase%_%hxx%)%)%,%
%struct,%(%if(%equal(no,%struct%)%,class,%struct%)%)%,%
%interface,%(%else(%equal(no,%interface%)%,c_%toupper(%interface%)%_CLASS )%)%,%
%Class,%(%if(%equal(struct,%struct%)%,Struct,%if(%equal(union,%struct%)%, Union, Class)%)%)%,%
%access,%(%else(%equal(no,%access%)%,%access%)%)%,%
%is_access,%(%else(%equal(no,%is_access%)%,%is_access%)%)%,%
%implements_access,%(%else(%equal(no,%implements_access%)%,%implements_access%)%)%,%
%parameters,%(%else-then(%left(%function_parameters%,/)%,%function_parameters%)%)%,%
%_parameters,%(%else-then(%right(%function_parameters%,/)%,%function_parameters%)%)%,%
%parameter,%(%else-then(%left(%parameters%,;)%,%parameters%)%)%,%
%_parameter,%(%else-then(%left(%_parameters%,;)%,%_parameters%)%)%,%
%parameter_t,%(%if-then(%left-of-right(%parameter%, )%, )%)%,%
%_parameter_t,%(%if-then(%left-of-right(%_parameter%, )%, )%)%,%
%parameter_n,%(%right(%else-then(%left(%parameter%,=)%,%parameter%)%, )%)%,%
%_parameter_n,%(%right(%else-then(%left(%_parameter%,=)%,%_parameter%)%, )%)%,%
%parameter_v,%(%then-if(%right(%parameter%,=)%, = )%)%,%
%_parameter_v,%(%then-if(%right(%_parameter%,=)%, = )%)%,%
%_return,%(%else-then(%right(%function_return%,/)%,%function_return%)%)%,%
%return,%(%else-then(%left(%function_return%,/)%,%function_return%)%)%,%
%return_t,%(%if-then(%left-of-right(%return%, )%, )%)%,%
%_return_t,%(%if-then(%left-of-right(%_return%, )%, )%)%,%
%return_n,%(%right(%else-then(%left(%return%,=)%,%return%)%, )%)%,%
%_return_n,%(%right(%else-then(%left(%_return%,=)%,%_return%)%, )%)%,%
%return_v,%(%then-if(%right(%return%,=)%, = )%)%,%
%_return_v,%(%then-if(%right(%_return%,=)%, = )%)%,%
%setget,%(%else(%equal(no,%setget%)%,%setget%)%)%,%
%set,%(%else-then(%left(%setget_name%,/)%,%else-then(%setget_name%,Set)%)%)%,%
%get,%(%else-then(%right(%setget_name%,/)%,%else-then(%setget_name%,Get)%)%)%,%
%get_return_t,%(%if(%_return%,%_return_t%,%parameter_t%)%)%,%
%get_return_n,%(%if(%_return%,%_return_n%,%parameter_n%)%)%,%
%get_return_v,%(%if(%_return%,%_return_v%,%parameter_v%)%)%,%
%setget_a,%(%equal(abstract,%setget%)%)%,%
%setget_t,%(%if-then(%else(%equal(no,%setget%)%,%else(%equal(yes,%setget%)%,%if(%setget_a%,virtual,%setget%)%)%)%, )%)%,%
%doundo,%(%else(%equal(no,%doundo%)%,%doundo%)%)%,%
%do,%(%else-then(%left(%setget_name%,/)%,%else-then(%setget_name%,Do)%)%)%,%
%undo,%(%else-then(%right(%setget_name%,/)%,%else-then(%setget_name%,Undo)%)%)%,%
%doundo_a,%(%equal(abstract,%doundo%)%)%,%
%doundo_t,%(%if-then(%else(%equal(no,%doundo%)%,%else(%equal(yes,%doundo%)%,%if(%doundo_a%,virtual,%doundo%)%)%)%, )%)%,%
%functions,%(%else(%equal(no,%functions%)%,%functions%)%)%,%
%functions_p,%(%equal(yes,%function_prototype%)%)%,%
%functions_a,%(%equal(abstract,%functions%)%)%,%
%functions_t,%(%if-then(%else(%equal(no,%functions%)%,%else(%equal(yes,%functions%)%,%if(%functions_a%,virtual,%functions%)%)%)%, )%)%,%
%functions_c,%(%if(%equal(yes,%function_const%)%,const )%)%,%
%createdestroy,%(%else(%equal(no,%createdestroy%)%,%createdestroy%)%)%,%
%create,%(%else-then(%left(%setget_name%,/)%,%else-then(%setget_name%,Create)%)%)%,%
%destroy,%(%else-then(%right(%setget_name%,/)%,%else-then(%setget_name%,Destroy)%)%)%,%
%createdestroy_a,%(%equal(abstract,%createdestroy%)%)%,%
%createdestroy_t,%(%if-then(%else(%equal(no,%createdestroy%)%,%else(%equal(yes,%createdestroy%)%,%if(%createdestroy_a%,virtual,%createdestroy%)%)%)%, )%)%,%
%%(%if(%file%,%(%include(%filepath%/file-cxx.t)%%
%%if(%hxx%,%(
#ifndef %ifndef%
#define %ifndef%
)%)%
)%)%%if(%include%,%(%parse(%include%,;,
#include ",")%"
)%)%
%if(%class%,%(/**
 **********************************************************************
 * %Class%: %class%
 *
 * Author: %author%
 *   Date: %date%
 **********************************************************************
 */%if(%template%,%(
template
<%parse(%template%,;,,%(,
 )%)%>)%)%
%struct% %interface%%class%%if(%is%%implements%,%(
: %parse(%implements%,;,%(virtual %if-then(%implements_access%, )%)%,%(,
  )%)%%if(%is%,%(%if(%implements%,%(,
  )%)%%parse(%is%,;,%(%if-then(%is_access%, )%)%,%(,
  )%)%)%)%)%)%
{%if(%access%,%(
%access%:)%)%%if(%is%,%(
    typedef %if-then(%else-then(%right(%is%,;)%,%is%)%, )%cIs;)%)%%
%%else(%equal(no,%constructor%)%,%(
%apply-x(indent,    ,%
%f_type,%else(%equal(yes,%constructor%)%,%constructor% )%,%
%f,%class%,parameters,const cChar* chars=0;int length=-1;,%
%body,%(        eError error;

        if (chars)
        if (0 > (length = SetCChars(chars, length)))
            throw(error = -length);
)%,%
%%(%include(%filepath%/constructor-cxx.t)%)%)%%
%%apply-x(indent,    ,%
%f_type,%else(%equal(yes,%constructor%)%,%constructor% )%,%
%f,%class%,parameters,const char* chars=0;int length=-1;,%
%body,%(        eError error;

        if (chars)
        if (0 > (length = SetChars(chars, length)))
            throw(error = -length);
)%,%
%%(%include(%filepath%/constructor-cxx.t)%)%)%)%)%%
%%apply-x(indent,    ,%
%f_type,virtual ,return_t,int ,f,SetChars,%
%parameters,const char* chars;int length=-1,%
%body,%(        length = m_namespace_prefix.Copyc(chars, length);
        return length;
)%,%
%%(%include(%filepath%/function-cxx.t)%)%)%
})%)%
%if(%hxx%,%(
#endif /* %ifndef% */)%)%%if(%equal(yes,%main%)%,%(
%apply(f,main,return_t,int ,return_n,result,return_v, = 0,%
%parameters,int argc;const char** argv,%
%%(%include(%filepath%/function-cxx.t)%)%)%)%)%