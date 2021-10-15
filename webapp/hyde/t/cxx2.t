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
%#   File: cxx.t
%#
%# Author: $author$
%#   Date: 1/8/2005
%#
%#    $Id$
%#
%#############################################################################
%apply-x(%
%author,%(%else-then(%author%,$author$)%)%,%
%date,%(%date()%)%,%
%year,%(%year()%)%,%
%file,%(%else-then(%file%,%output%)%)%,%
%filename,%(%filename(%file%)%)%,%
%filebase,%(%filebase(%filename%)%)%,%
%fileextension,%(%fileextension(%filename%)%)%,%
%ifndef,%(%toupper(_%filebase%_%hxx%)%)%,%
%struct,%(%if(%equal(no,%struct%)%,class,%struct%)%)%,%
%Class,%(%if(%equal(struct,%struct%)%,Struct,%if(%equal(union,%struct%)%, Union, Class)%)%)%,%
%functions,%(%else(%equal(no,%functions%)%,%functions%)%)%,%
%functions_p,%(%equal(yes,%function_prototype%)%)%,%
%functions_t,%(%if-then(%else(%equal(no,%functions%)%,%else(%equal(yes,%functions%)%,%if(%functions_a%,virtual,%functions%)%)%)%, )%)%,%
%functions_c,%(%if(%equal(yes,%function_const%)%,const )%)%,%
%parameter,%(%else-then(%left(%function_parameters%,;)%,%function_parameters%)%)%,%
%parameter_t,%(%if-then(%left-of-right(%parameter%, )%, )%)%,%
%parameter_n,%(%right(%else-then(%left(%parameter%,=)%,%parameter%)%, )%)%,%
%parameter_v,%(%then-if(%right(%parameter%,=)%, = )%)%,%
%_return,%(%else-then(%right(%function_return%,/)%,%function_return%)%)%,%
%return,%(%else-then(%left(%function_return%,/)%,%function_return%)%)%,%
%return_t,%(%if-then(%left-of-right(%return%, )%, )%)%,%
%_return_t,%(%if-then(%left-of-right(%_return%, )%, )%)%,%
%return_is,%(%else(%equal(void ,%return_t%)%,%return_t%)%)%,%
%_return_is,%(%else(%equal(void ,%_return_t%)%,%_return_t%)%)%,%
%return_n,%(%right(%else-then(%left(%return%,=)%,%return%)%, )%)%,%
%_return_n,%(%right(%else-then(%left(%_return%,=)%,%_return%)%, )%)%,%
%return_v,%(%then-if(%right(%return%,=)%, = )%)%,%
%_return_v,%(%then-if(%right(%_return%,=)%, = )%)%,%
%doundo,%(%else(%equal(no,%doundo%)%,%doundo%)%)%,%
%do,%(%else-then(%left(%setget_name%,/)%,%else-then(%setget_name%,Do)%)%)%,%
%undo,%(%else-then(%right(%setget_name%,/)%,%else-then(%setget_name%,Undo)%)%)%,%
%doundo_a,%(%equal(abstract,%doundo%)%)%,%
%doundo_t,%(%if-then(%else(%equal(no,%doundo%)%,%else(%equal(yes,%doundo%)%,%if(%doundo_a%,virtual,%doundo%)%)%)%, )%)%,%
%%(%if(%file%,%(/**
 **********************************************************************
 * Copyright (c) 1988-%year% %author%.
 *
 * This software is provided by the author and contributors ``as is'' and
 * any express or implied warranties, including, but not limited to, the
 * implied warranties of merchantability and fitness for a particular purpose
 * are disclaimed.  In no event shall the author or contributors be liable
 * for any direct, indirect, incidental, special, exemplary, or consequential
 * damages (including, but not limited to, procurement of substitute goods
 * or services; loss of use, data, or profits; or business interruption)
 * however caused and on any theory of liability, whether in contract, strict
 * liability, or tort (including negligence or otherwise) arising in any way
 * out of the use of this software, even if advised of the possibility of
 * such damage.
 *
 *   File: %filename%
 *
 * Author: %author%
 *   Date: %date%
 *
 *    $Id$
 **********************************************************************
 */)%)%%if(%class%,%(
#include "%tolower(%class%)%.hxx"
/**
 **********************************************************************
 * %Class%: %class%
 *
 * Author: %author%
 *   Date: %date%
 **********************************************************************
 */%if(%functions%,%(%parse(%function_name%,;,,,%(
/**
 **********************************************************************
 * Function: %class%::%f%
 *
 *   Author: %author%
 *     Date: %date%
 **********************************************************************
 */
%return_t%%class%::%f%%if(%function_parameters%,%(
)%)%(%parse(%function_parameters%,;,,%(,
)%,%(%apply-x(%
%v,%(%right(%p%,=)%)%,%
%n,%(%right(%else-then(%left(%p%,=)%,%p%)%, )%%if(%v%,=)%)%,%
%t,%(%left-of-right(%p%, )%%if(%n%, )%)%,%
%%(%t%%n%%v%)%)%)%,p)%) %functions_c%%if(%functions_p%%functions_a%,%if(%functions_a%,= 0)%;,%(
{%if(%return_is%,%(
    %return_t%%return_n%%return_v%;
    return %return_n%;)%)%
})%)%)%,f)%)%)%%if(%doundo%,%(%parse(%function_name%,;,,,%(
/**
 **********************************************************************
 * Function: %class%::%do%%f%
 *
 *   Author: %author%
 *     Date: %date%
 **********************************************************************
 */
%return_t%%class%::%do%%f%%if(%function_parameters%,%(
)%)%(%parse(%function_parameters%,;,,%(,
 )%,%(%apply-x(%
%v,%(%right(%p%,=)%)%,%
%n,%(%right(%else-then(%left(%p%,=)%,%p%)%, )%%if(%v%,=)%)%,%
%t,%(%left-of-right(%p%, )%%if(%n%, )%)%,%
%%(%t%%n%%v%)%)%)%,p)%) %if(%functions_p%%doundo_a%,%if(%doundo_a%,= 0)%;,%(
{%if(%return_is%,%(
    %return_t%%return_n%%return_v%;
    return %return_n%;)%)%
})%)%
/**
 **********************************************************************
 * Function: %class%::%undo%%f%
 *
 *   Author: %author%
 *     Date: %date%
 **********************************************************************
 */
%_return_t%%class%::%undo%%f%%if(%function_parameters%,%(
)%)%(%parse(%function_parameters%,;,,%(,
 )%,%(%apply-x(%
%v,%(%right(%p%,=)%)%,%
%n,%(%right(%else-then(%left(%p%,=)%,%p%)%, )%%if(%v%,=)%)%,%
%t,%(%left-of-right(%p%, )%%if(%n%, )%)%,%
%%(%t%%n%%v%)%)%)%,p)%) %functions_c%%if(%functions_p%%doundo_a%,%if(%doundo_a%,= 0)%;,%(
{%if(%_return_is%,%(
    %_return_t%%_return_n%%_return_v%;
    return %_return_n%;)%)%
})%)%)%,f)%)%)%%**()%)%)%
)%)%