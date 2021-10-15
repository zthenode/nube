%#################################################################
%#
%#   File: hxx.t
%#
%# Author: $author$
%#   Date: 6/28/2003
%#
%#################################################################
%if(%file%,%(/**
 **********************************************************************
 * Copyright (c) 1988-%year()% %if(%author%,%(%author%)%,%($author$)%)%.
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
 *   File: %tolower(%filename(%file%)%)%
 *
 * Author: %if(%author%,%(%author%)%,%($author$)%)%
 *   Date: %date(month,day,year,%(%month%/%day%/%year%)%)%
 *
 *    $Id$
 **********************************************************************
 */
%if(%equal(yes,%main%)%,,%(#ifndef %toupper(%filebase(_%filename(%file%)%)%)%_%toupper(%fileextension(%file%)%)%
#define %toupper(%filebase(_%filename(%file%)%)%)%_%toupper(%fileextension(%file%)%)%
)%)%)%)%%if(%include%,%(%parse(%include%,;,
#include ",")%"
)%)%%if(%class%,%(
/**
 **********************************************************************
 * %if(%equal(struct,%struct%)%,Struct,%if(%equal(union,%struct%)%, Union, Class)%)%: %if(%class%,%class%,Class)%
 *
 * Author: %if(%author%,%(%author%)%,%($author$)%)%
 *   Date: %date(month,day,year,%(%month%/%day%/%year%)%)%
 **********************************************************************
 */%if(%template%,
template <%template%>)%
%if(%equal(no,%if(%struct%,%struct%,no)%)%,class,%struct%)% %if(%equal(yes,%interface%)%,c_INTERFACE_CLASS )%%if(%class%,%class%,Class)%%if(%implements%%is%,
: )%%if(%implements%,%(%parse(%implements%,%(;)%,virtual public ,%(,
  )%)%%if(%is%,%(,
  )%)%)%)%%if(%is%,%(%parse(%is%,%(;)%,%if(%is_access%,%is_access%,public)% ,%(,
  )%)%)%)%
{
%if(%equal(no,%if(%struct%,%struct%,no)%)%,%if(%equal(no,%access%)%,,%if(%access%,%access%,public)%:)%)%%if(%is%,%(%parse(%is%,%(;)%,
    typedef , cIs;)%)% cIs;
%if(%equal(yes,%errors%)%,%(
    /**
     **********************************************************************
     *   Enum: 
     *
     * Author: %if(%author%,%(%author%)%,%($author$)%)%
     *   Date: %date(month,day,year,%(%month%/%day%/%year%)%)%
     **********************************************************************
     */
    enum
    {
        e_FIRST_ERROR=cIs::e_NEXT_ERROR%(,)%
        e_NEXT_ERROR=e_FIRST_ERROR%(,)%
        e_LAST_ERROR=e_NEXT_ERROR-1
    };
)%)%)%%if(%equal(yes,%enum%)%,%(
    /**
     **********************************************************************
     *   Enum: 
     *
     * Author: %if(%author%,%(%author%)%,%($author$)%)%
     *   Date: %date(month,day,year,%(%month%/%day%/%year%)%)%
     **********************************************************************
     */
    enum
    {
        e_FIRST%(,)%
        e_NEXT%(,)%
        e_LAST=e_NEXT-1
    };
)%)%%if(%equal(yes,%interface%)%,,%(%if(%equal(union,%struct%)%,,%(%if(%equal(no,%constructor%)%,,%(
    /**
     **********************************************************************
     * Constructor: %if(%class%,%class%,Class)%
     *
     *      Author: %if(%author%,%(%author%)%,%($author$)%)%
     *        Date: %date(month,day,year,%(%month%/%day%/%year%)%)%
     **********************************************************************
     */
    %if(%class%,%class%,Class)%() %if(%is%,%(
    : %parse(%is%,;,,%((),
      )%)%() )%)%
    {
    })%)%%if(%equal(no,%destructor%)%,,%(
    /**
     **********************************************************************
     * Destructor: ~%if(%class%,%class%,Class)%
     *
     *     Author: %if(%author%,%(%author%)%,%($author$)%)%
     *       Date: %date(month,day,year,%(%month%/%day%/%year%)%)%
     **********************************************************************
     */
    %if(%equal(virtual,%destructor%)%,virtual )%~%if(%class%,%class%,Class)%()
    {
    })%)%)%)%)%)%%if(%equal(no,%functions%)%,,%(%if(%function_name%,%(%
%%apply(t,%else(%equal(yes,%functions%)%,%(%if(%equal(abstract,%functions%)%,virtual,%functions%)% )%)%,%
%r,%if-then(%else-then(%left(%function_return%, )%,%else-then(%left(%function_return%,=)%,%function_return%)%)%, )%,%
%n,%else-then(%right(%left(%function_return%,=)%, )%,%else-then(%right(%function_return%, )%,result)%)%,%
%v,%right(%function_return%,=)%,%
%%(%parse(%function_name%,;,,,%(
    /**
     **********************************************************************
     * Function: %f%
     *
     *   Author: %if(%author%,%(%author%)%,%($author$)%)%
     *     Date: %date(month,day,year,%(%month%/%day%/%year%)%)%
     **********************************************************************
     */
    %t%%r%%f%%if(%function_parameters%,%(
    )%)%(%parse(%function_parameters%,;,,%(, )%)%) %if(%equal(abstract,%functions%)%,%(= 0;)%,%(
    {%if(%r%,%(
        %r%%n%%if(%v%,%( = %v%)%)%;
        )%)%%if(%function_ifdef%,%(%apply(ifdef,%else-then(%left(%function_ifdef%,;)%,%function_ifdef%)%,%(
#if%parse(%function_ifdef%,;,,%(
#elif)%,%( defined(%ifdef%) )%,ifdef)%
#else /* defined(%ifdef%) */
#endif /* defined(%ifdef%) */

        )%)%)%)%%if(%r%,%(return %n%;)%)%
    })%)%)%,f)%)%)%)%,%(
    /**
     **********************************************************************
     * Function: 
     *
     *   Author: %if(%author%,%(%author%)%,%($author$)%)%
     *     Date: %date(month,day,year,%(%month%/%day%/%year%)%)%
     **********************************************************************
     */)%)%)%)%%if(%equal(no,%operators%)%,,%(
    /**
     **********************************************************************
     * Operator: 
     *
     *   Author: %if(%author%,%(%author%)%,%($author$)%)%
     *     Date: %date(month,day,year,%(%month%/%day%/%year%)%)%
     **********************************************************************
     */)%)%%if(%equal(no,%setget%)%,,%(%
%%apply(t,%else(%equal(yes,%setget%)%,%(%if(%equal(abstract,%setget%)%,virtual,%setget%)% )%)%,%
%set,%else-then(%left(%setget_name%,/)%,Set)%,%
%get,%else-then(%right(%setget_name%,/)%,Get)%,%
%r,%if-then(%else-then(%left(%function_return%, )%,%else-then(%left(%function_return%,=)%,%function_return%)%)%, )%,%
%n,%else-then(%right(%left(%function_return%,=)%, )%,%else-then(%right(%function_return%, )%,result)%)%,%
%v,%right(%function_return%,=)%,%
%%(%parse(%function_name%,;,,,%(
    /**
     **********************************************************************
     * Function: %set%%f%
     *
     *   Author: %if(%author%,%(%author%)%,%($author$)%)%
     *     Date: %date(month,day,year,%(%month%/%day%/%year%)%)%
     **********************************************************************
     */
    %t%%r%%set%%f%%if(%function_parameters%,%(
    )%)%(%parse(%function_parameters%,;,,%(, )%)%) %if(%equal(abstract,%setget%)%,%(= 0;)%,%(
    {%if(%r%,%(
        %r%%n%%if(%v%,%( = %v%)%)%;
        )%)%%if(%function_ifdef%,%(%apply(ifdef,%else-then(%left(%function_ifdef%,;)%,%function_ifdef%)%,%(
#if%parse(%function_ifdef%,;,,%(
#elif)%,%( defined(%ifdef%) )%,ifdef)%
#else /* defined(%ifdef%) */
#endif /* defined(%ifdef%) */

        )%)%)%)%%if(%r%,%(return %n%;)%)%
    })%)%
    /**
     **********************************************************************
     * Function: %get%%f%
     *
     *   Author: %if(%author%,%(%author%)%,%($author$)%)%
     *     Date: %date(month,day,year,%(%month%/%day%/%year%)%)%
     **********************************************************************
     */
    %t%%r%%get%%f%() %if(%equal(abstract,%setget%)%,%(= 0;)%,%(
    {%if(%r%,%(
        %r%%n%%if(%v%,%( = %v%)%)%;
        )%)%%if(%function_ifdef%,%(%apply(ifdef,%else-then(%left(%function_ifdef%,;)%,%function_ifdef%)%,%(
#if%parse(%function_ifdef%,;,,%(
#elif)%,%( defined(%ifdef%) )%,ifdef)%
#else /* defined(%ifdef%) */
#endif /* defined(%ifdef%) */

        )%)%)%)%%if(%r%,%(return %n%;)%)%
    })%)%)%,f)%)%)%)%)%
};
)%)%%if(%equal(yes,%main%)%,%(
/**
 **********************************************************************
 * Function: main
 *
 *   Author: %if(%author%,%(%author%)%,%($author$)%)%
 *     Date: %date(month,day,year,%(%month%/%day%/%year%)%)%
 **********************************************************************
 */
int main(int argc,const char **argv)
{
    return 0;
}
)%,%(%if(%file%,%(
#endif /* ndef %toupper(%filebase(_%filename(%file%)%)%)%_%toupper(%fileextension(%file%)%)% */
)%)%)%)%