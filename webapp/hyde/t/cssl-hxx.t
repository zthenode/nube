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
%#   File: cssl-hxx.t
%#
%# Author: $author$
%#   Date: 1/12/2005
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
%hxx,%(%equal(hxx,%tolower(%fileextension%)%)%)%,%
%ifndef,%(%toupper(_%filebase%_%hxx%)%)%,%
%struct,%(%if(%equal(no,%struct%)%,class,%struct%)%)%,%
%interface,%(%else(%equal(no,%interface%)%,c_%toupper(%interface%)%_CLASS )%)%,%
%Class,%(%if(%equal(struct,%struct%)%,Struct,%if(%equal(union,%struct%)%, Union, Class)%)%)%,%
%access,%(%else(%equal(no,%access%)%,%access%)%)%,%
%is_access,%(%else(%equal(no,%is_access%)%,%is_access%)%)%,%
%implements_access,%(%else(%equal(no,%implements_access%)%,%implements_access%)%)%,%
%_return,%(%else-then(%right(%function_return%,/)%,%function_return%)%)%,%
%return,%(%else-then(%left(%function_return%,/)%,%function_return%)%)%,%
%return_t,%(%if-then(%left-of-right(%return%, )%, )%)%,%
%_return_t,%(%if-then(%left-of-right(%_return%, )%, )%)%,%
%return_n,%(%right(%else-then(%left(%return%,=)%,%return%)%, )%)%,%
%_return_n,%(%right(%else-then(%left(%_return%,=)%,%_return%)%, )%)%,%
%return_v,%(%then-if(%right(%return%,=)%, = )%)%,%
%_return_v,%(%then-if(%right(%_return%,=)%, = )%)%,%
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
 */%if(%hxx%,%(
#ifndef %ifndef%
#define %ifndef%

#include "platform.h"
#include "cbytestream.hxx"
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
        e_NONE  = -1,
        e_FIRST = 0,

        e_ALL,
        e_LAST = e_ALL-1
    };)%)%%else(%equal(no,%constructor%)%,%(
    /**
     **********************************************************************
     * Constructor: %class%
     *
     *      Author: %author%
     *        Date: %date%
     **********************************************************************
     */
    %else(%equal(yes,%constructor%)%,%constructor% )%%class%%if(%function_parameters%,%(
    )%)%(%parse(%function_parameters%,;,,%(,
     )%,%(%apply-x(%
%v,%(%right(%p%,=)%)%,%
%n,%(%right(%else-then(%left(%p%,=)%,%p%)%, )%%if(%v%,=)%)%,%
%t,%(%left-of-right(%p%, )%%if(%n%, )%)%,%
%%(%t%%n%%v%)%)%)%,p)%) 
    {
        eError error;
        int size;

        if (0 > (size = Set()))
            throw(error = -size);
    })%)%
    /**
     **********************************************************************
     * Function: Copy
     *
     *   Author: %author%
     *     Date: %date%
     **********************************************************************
     */
    int Copy(const %class% %return_n%)
    {
        int size = Sizeof();

        if (%return_n% == this)
            return size = Sizeof();

        return size;
    }
    /**
     **********************************************************************
     * Function: Set
     *
     *   Author: %author%
     *     Date: %date%
     **********************************************************************
     */
    int Set()
    {
        int size = Sizeof();
        return size;
    }
    /**
     **********************************************************************
     * Function: Read
     *
     *   Author: %author%
     *     Date: %date%
     **********************************************************************
     */
    int Read(cBYTEStream &stream) 
    {
        int size;
        return size;
    }
    /**
     **********************************************************************
     * Function: Write
     *
     *   Author: %author%
     *     Date: %date%
     **********************************************************************
     */
    int Write(cBYTEStream &stream) const
    {
        int size;
        return size;
    }
    /**
     **********************************************************************
     * Function: Sizeof
     *
     *   Author: %author%
     *     Date: %date%
     **********************************************************************
     */
    int Sizeof() const 
    {
        int size;
        return size;
    }
    /**
     **********************************************************************
     * Function: GetName
     *
     *   Author: %author%
     *     Date: %date%
     **********************************************************************
     */
    const char *GetName() const 
    {
        const char *name = 0;
        return name;
    }
    /**
     **********************************************************************
     * Operator: !=
     *
     *   Author: %author%
     *     Date: %date%
     **********************************************************************
     */
    int operator != (const %class% %return_n%) const
    {
        int unequal = 0;
        return unequal;
    }
};
)%)%%if(%hxx%,%(
#endif /* %ifndef% */)%)%%**%)%)%
