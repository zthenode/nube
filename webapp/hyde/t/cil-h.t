%#################################################################
%#
%#   File: cil-h.t
%#
%# Author: $author$
%#   Date: 9/9/2004
%#
%#    $Id$
%#
%#################################################################
%apply(file,%else-then(%file%,%class%.h)%,%(%if(%file%,%(/**
 **********************************************************************
%if(%equal(yes,%copyright%)%,%( * Copyright (c) 1988-%year()% %if(%author%,%(%author%)%,%($author$)%)%.
 *
)%)%%if(%equal(yes,%open_source%)%,%( * This software is provided by the author and contributors ``as is'' and
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
)%)% *   File: %tolower(%filename(%file%)%)%
 *
 * Author: %if(%author%,%(%author%)%,%($author$)%)%
 *   Date: %date(month,day,year,%(%month%/%day%/%year%)%)%
 *
 *    $Id$
 **********************************************************************
 */
#ifndef %toupper(%filebase(_%filename(%file%)%)%)%_%toupper(%fileextension(%file%)%)%
#define %toupper(%filebase(_%filename(%file%)%)%)%_%toupper(%fileextension(%file%)%)%
)%)%
/**
 **********************************************************************
 * Struct: I%toupper(%class%)%
 *
 * Author: %if(%author%,%(%author%)%,%($author$)%)%
 *   Date: %date(month,day,year,%(%month%/%day%/%year%)%)%
 **********************************************************************
 */
typedef struct I%toupper(%class%)%
{%if(%extends%,%(
    I%toupper(%extends%)% i%extends%;)%)%%if(%function%,%(%parse(%function%,;,,,%(
    /**
     **********************************************************************
     * Function: I%toupper(%class%)%__%f%
     **********************************************************************
     */
    %else-then(%function_return%,void)% (METHOD *%f%)
    (const struct I%toupper(%class%)% **inst%if(%function_parameters%,%(%parse(%function_parameters%,;,%(, )%)%)%)%);)%,f)%)%)%
} I%toupper(%class%)%;
%if(%function%,%(%parse(%function%,;,,,%(
/**
 **********************************************************************
 * Macro: I%toupper(%class%)%_%f%
 **********************************************************************
 */
#define I%toupper(%class%)%_%f%(inst%if(%function_parameters%,%(%parse(%function_parameters%,;,,,%(, %right(%p%, )%)%,p)%)%)%) \
(*(*(I%toupper(%class%)%**)(inst))->%f%)((I%toupper(%class%)%**)(inst) %if(%function_parameters%,%(%parse(%function_parameters%,;,,,%(, %right(%p%, )%)%,p)%)%)%) )%,f)%)%)%
/**
 **********************************************************************
 * Struct: C%toupper(%class%)%
 *
 * Author: %if(%author%,%(%author%)%,%($author$)%)%
 *   Date: %date(month,day,year,%(%month%/%day%/%year%)%)%
 **********************************************************************
 */
typedef struct C%toupper(%class%)%
{%if(%extends%,%(
    C%toupper(%extends%)% c%extends%;)%)%
} C%toupper(%class%)%;

#if defined(__cplusplus)
extern "C" {
#endif%if(%function%,%(%parse(%function%,;,,,%(
/**
 **********************************************************************
 * Function: I%toupper(%class%)%__%f%
 **********************************************************************
 */
%else-then(%function_return%,void)% METHOD I%toupper(%class%)%__%f%
(const I%toupper(%class%)% **inst%if(%function_parameters%,%(%parse(%function_parameters%,;,%(, )%)%)%)%);)%,f)%)%)%

#if defined(__cplusplus)
}
#endif
%if(%file%,%(
#endif /* ndef %toupper(%filebase(_%filename(%file%)%)%)%_%toupper(%fileextension(%file%)%)% */
)%)%)%)%
