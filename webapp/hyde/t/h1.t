%#################################################################
%#
%#   File: h.t
%#
%# Author: $author$
%#   Date: 6/29/2003
%#
%#################################################################
%if(%file%,%(/**
 **********************************************************************
%else(%equal(no,%copyright%)%,%
%%( * Copyright (c) 1988-%year()% $author$.
 *
)%)%%else(%equal(no,%open_source%)%,%
%%( * This software is provided by the author and contributors ``as is'' and
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
)%)% *   File: %filename(%file%)%
 *
 * Author: %if(%author%,%(%author%)%,%($author$)%)%
 *   Date: %date(month,day,year,%(%month%/%day%/%year%)%)%
 *
 *    $Id$
 **********************************************************************
 */
#ifndef %toupper(%filebase(_%filename(%file%)%)%)%_%toupper(%fileextension(%file%)%)%
#define %toupper(%filebase(_%filename(%file%)%)%)%_%toupper(%fileextension(%file%)%)%
)%)%%if(%ifdef%,%(%apply(def,%else-then(%left(%ifdef%,;)%,%ifdef%)%,%(
#if%parse(%ifdef%,;,,%(
#elif)%,%( defined(%elif%) )%,elif)%
/*
 */
#else /* defined(%def%) */
/*
 */
#endif /* defined(%def%) */
        )%)%)%)%%if(%equal(H,%toupper(%fileextension(%file%)%)%)%,%(
#if defined(__cplusplus)
extern "C" {
#endif
)%)%%if(%equal(H,%toupper(%fileextension(%file%)%)%)%,%(
#if defined(__cplusplus)
}
#endif
)%)%%if(%file%,%(
#endif
)%)%
