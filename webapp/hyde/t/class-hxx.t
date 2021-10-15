%#############################################################################
%# Copyright (c) 1988-2006 $author$.
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
%#   File: class-hxx.t
%#
%# Author: $author$
%#   Date: 1/7/2006
%#
%#    $Id$
%#
%#############################################################################
%apply-x(%
%%(/**
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
    typedef %if-then(%else-then(%right(%is%,;)%,%is%)%, )%cIs;)%)%%if(%equal(yes,%enum%)%,%(
    /**
     **********************************************************************
     * Enum: 
     *
     * Author: %author%
     *   Date: %date%
     **********************************************************************
     */
    enum
    {
        e_FIRST,
        e_NEXT,
        e_LAST = e_NEXT-1
    };)%)%%else(%equal(no,%constructor%)%,%(
    /**
     **********************************************************************
     * Constructor: %class%
     *
     *      Author: %author%
     *        Date: %date%
     **********************************************************************
     */
    %else(%equal(yes,%constructor%)%,%constructor% )%%class%%if(%parameters%,%(
    )%)%(%parse(%parameters%,;,,%(,
     )%,%(%apply-x(%
%v,%(%right(%p%,=)%)%,%
%n,%(%right(%else-then(%left(%p%,=)%,%p%)%, )%%if(%v%,=)%)%,%
%t,%(%left-of-right(%p%, )%%if(%n%, )%)%,%
%%(%t%%n%%v%)%)%)%,p)%) 
    {
    })%)%%else(%equal(no,%destructor%)%,%(
    /**
     **********************************************************************
     *  Destructor: ~%class%
     *
     *      Author: %author%
     *        Date: %date%
     **********************************************************************
     */
    %else(%equal(yes,%destructor%)%,%destructor% )%~%class%()
    {
    })%)%%if(%functions%,%(%parse(%function_name%,;,,,%(
    /**
     **********************************************************************
     * Function: %prefix%%f%%suffix%
     *
     *   Author: %author%
     *     Date: %date%
     **********************************************************************
     */
    %functions_t%%return_t%%prefix%%f%%suffix%%if(%parameters%,%(
    )%)%(%parse(%parameters%,;,,%(,
     )%,%(%apply-x(%
%v,%(%right(%p%,=)%)%,%
%n,%(%right(%else-then(%left(%p%,=)%,%p%)%, )%%if(%v%,=)%)%,%
%t,%(%left-of-right(%p%, )%%if(%n%, )%)%,%
%%(%t%%n%%v%)%)%)%,p)%) %functions_c%%if(%functions_p%%functions_a%,%if(%functions_a%,= 0)%;,%(
    {%if(%return_t%,%(
        %return_t%%return_n%%return_v%;
        return %return_n%;)%)%
    })%)%)%,f)%)%)%%if(%doundo%,%(%parse(%function_name%,;,,,%(
    /**
     **********************************************************************
     * Function: %do%%prefix%%f%%suffix%
     *
     *   Author: %author%
     *     Date: %date%
     **********************************************************************
     */
    %doundo_t%%return_t%%do%%prefix%%f%%suffix%%if(%parameters%,%(
    )%)%(%parse(%parameters%,;,,%(,
     )%,%(%apply-x(%
%v,%(%right(%p%,=)%)%,%
%n,%(%right(%else-then(%left(%p%,=)%,%p%)%, )%%if(%v%,=)%)%,%
%t,%(%left-of-right(%p%, )%%if(%n%, )%)%,%
%%(%t%%n%%v%)%)%)%,p)%) %functions_c%%if(%functions_p%%doundo_a%,%if(%doundo_a%,= 0)%;,%(
    {%if(%return_t%,%(
        %return_t%%return_n%%return_v%;
        return %return_n%;)%)%
    })%)%
    /**
     **********************************************************************
     * Function: %undo%%prefix%%f%%suffix%
     *
     *   Author: %author%
     *     Date: %date%
     **********************************************************************
     */
    %doundo_t%%_return_t%%undo%%prefix%%f%%suffix%%if(%parameters%,%(
    )%)%(%parse(%parameters%,;,,%(,
     )%,%(%apply-x(%
%v,%(%right(%p%,=)%)%,%
%n,%(%right(%else-then(%left(%p%,=)%,%p%)%, )%%if(%v%,=)%)%,%
%t,%(%left-of-right(%p%, )%%if(%n%, )%)%,%
%%(%t%%n%%v%)%)%)%,p)%) %functions_c%%if(%functions_p%%doundo_a%,%if(%doundo_a%,= 0)%;,%(
    {%if(%_return_t%,%(
        %_return_t%%_return_n%%_return_v%;
        return %_return_n%;)%)%
    })%)%)%,f)%)%)%%if(%setget%,%(%parse(%function_name%,;,,,%(
    /**
     **********************************************************************
     * Function: %set%%prefix%%f%%suffix%
     *
     *   Author: %author%
     *     Date: %date%
     **********************************************************************
     */
    %setget_t%%return_t%%set%%prefix%%f%%suffix%%if(%parameters%,%(
    )%)%(%parse(%parameters%,;,,%(,
     )%,%(%apply-x(%
%v,%(%right(%p%,=)%)%,%
%n,%(%right(%else-then(%left(%p%,=)%,%p%)%, )%%if(%v%,=)%)%,%
%t,%(%left-of-right(%p%, )%%if(%n%, )%)%,%
%%(%t%%n%%v%)%)%)%,p)%) %if(%setget_a%,= 0;,%(
    {%if(%return_t%,%(
        %return_t%%return_n%%return_v%;
        return %return_n%;)%)%
    })%)%
    /**
     **********************************************************************
     * Function: %get%%prefix%%f%%suffix%
     *
     *   Author: %author%
     *     Date: %date%
     **********************************************************************
     */
    %setget_t%%get_return_t%%get%%prefix%%f%%suffix%%if(%__parameters%,%(
    )%)%(%parse(%__parameters%,;,,%(,
     )%,%(%apply-x(%
%v,%(%right(%p%,=)%)%,%
%n,%(%right(%else-then(%left(%p%,=)%,%p%)%, )%%if(%v%,=)%)%,%
%t,%(%left-of-right(%p%, )%%if(%n%, )%)%,%
%%(%t%%n%%v%)%)%)%,p)%) %functions_c%%if(%setget_a%,= 0;,%(
    {%if(%get_return_t%,%(
        %get_return_t%%get_return_n%%get_return_v%;
        return %get_return_n%;)%)%
    })%)%)%,f)%)%)%%if(%createdestroy%,%(%parse(%function_name%,;,,,%(
    /**
     **********************************************************************
     * Function: %create%%prefix%%f%%suffix%
     *
     *   Author: %author%
     *     Date: %date%
     **********************************************************************
     */
    %createdestroy_t%%return_t%%create%%prefix%%f%%suffix%%if(%parameters%,%(
    )%)%(%parse(%parameters%,;,,%(,
     )%,%(%apply-x(%
%v,%(%right(%p%,=)%)%,%
%n,%(%right(%else-then(%left(%p%,=)%,%p%)%, )%%if(%v%,=)%)%,%
%t,%(%left-of-right(%p%, )%%if(%n%, )%)%,%
%%(%t%%n%%v%)%)%)%,p)%) %if(%createdestroy_a%,= 0;,%(
    {%if(%return_t%,%(
        %return_t%%return_n%%return_v%;
        return %return_n%;)%)%
    })%)%
    /**
     **********************************************************************
     * Function: %destroy%%prefix%%f%%suffix%
     *
     *   Author: %author%
     *     Date: %date%
     **********************************************************************
     */
    %createdestroy_t%%_return_t%%destroy%%prefix%%f%%suffix%%if(%parameters%,%(
    )%)%(%return_t%%return_n%) %functions_c%%if(%createdestroy_a%,= 0;,%(
    {%if(%_return_t%,%(
        %_return_t%%_return_n%%_return_v%;
        return %_return_n%;)%)%
    })%)%)%,f)%)%)%
};%
%)%)%
