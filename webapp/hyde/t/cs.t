%#################################################################
%#
%#   File: cs.t
%#
%# Author: $author$
%#   Date: 9/5/2004
%#
%#    $Id$
%#
%#################################################################
%apply-x(%
%author,%(%else-then(%author%,$author$)%)%,%
%date,%(%date()%)%,%
%year,%(%year()%)%,%
%file,%(%else-then(%file%,%else-then(%output%,%class%.cs)%)%)%,%
%filename,%(%filename(%file%)%)%,%
%filebase,%(%filebase(%filename%)%)%,%
%fileextension,%(%fileextension(%filename%)%)%,%
%%(%if(%file%,%(/*
 **********************************************************************
%else(%equal(no,%copyright%)%,%
%%( * Copyright (c) 1988-%year% %author%.
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
)%)% *   File: %filename%
 *
 * Author: %author%
 *   Date: %date%
 *
 *    $Id$
 **********************************************************************
 */

)%)%%if(%using%,%(%parse(%using%,;,using ,;
)%;
)%)%%if(%class%,%(
/**
 **********************************************************************
 *  Class: %class%
 *
 * Author: %author%
 *   Date: %date%
 **********************************************************************
 */
%if-then(%access%, )%class %class%%if(%else-then(%extends%,%implements%)%,%(
: %if-then(%extends%,%if(%implements%,%(,
  )%)%)%%if(%implements%,%(%parse(%implements%,;,,%(,
  )%)%)%)%)%)%
{%if(%constructor%,%(
    /**
     **********************************************************************
     * Constructor: %class%
     *
     *      Author: %author%
     *        Date: %date%
     **********************************************************************
     */
    %constructor% %class%()
    {
    })%)%%if(%finalize%,%(
    /**
     **********************************************************************
     * Function: finalize
     *
     *   Author: %author%
     *     Date: %date%
     **********************************************************************
     */
    %finalize% %finalize_type% void finalize()
    {
    })%)%%if(%function%,%(
    /**
     **********************************************************************
     * Function: %function%
     *
     *   Author: %author%
     *     Date: %date%
     **********************************************************************
     */
    %function_access% %function_qualifier% %function_type% %function_extern% %function_return% %function%(%function_parameters%) %
%%else(%else-then(%equal(abstract,%function_type%)%,%(%function_extern%)%)%,%(
    {
    })%,;)%)%)%%if(%main_access%,%(
    /**
     **********************************************************************
     * Function: Main
     *
     *   Author: %author%
     *     Date: %date%
     **********************************************************************
     */
    %main_access% static void Main()
    {
    })%)%
}
)%)%
)%)%
