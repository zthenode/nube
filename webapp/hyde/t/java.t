%#################################################################
%#
%#   File: java.t
%#
%# Author: $author$
%#   Date: 1/17/2004
%#
%#    $Id$
%#
%#################################################################
%apply(file,%else-then(%file%,%class%.java)%,%
%%(%
%%if(%file%,%(/*
 **********************************************************************
%else(%equal(no,%copyright%)%,%
%%( * Copyright (c) 1988-%year()% %if(%author%,%(%author%)%,%($author$)%)%.
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

)%)%%if(%import_java%,%(%parse(%import_java%,;,import java.,;
)%;

)%)%%if(%import_javax%,%(%parse(%import_javax%,;,import javax.,;
)%;

)%)%%if(%import%,%(%parse(%import%,;,import ,;
)%;

)%)%%if(%package%,%(package %package%;

)%)%/**
 **********************************************************************
 * Class %if(%class%,%class%,Class)%
 *
 * @author %if(%author%,%(%author%)%,%($author$)%)%
 **********************************************************************
 *%if(%package%,%( @pkg %package%
 *)%)%/
%if(%access%,%access%,public)% %if(%equal(yes,%interface%)%,interface,class)% %if(%class%,%class%,Class)%%if(%implements%,%(
 implements %parse(%implements%,%(,)%,,%(,)%)%)%)%%if(%extends%,%(
 extends %extends%)%)%
{%if(%equal(yes,%interface%)%,%(
    /**
     **********************************************************************
     * Function
     *
     * @author %if(%author%,%(%author%)%,%($author$)%)%
     **********************************************************************
     */
)%,%(%if(%equal(no,%constructor%)%,,%(
    /**
     **********************************************************************
     * Function %if(%class%,%class%,Class)%
     *
     * @author %if(%author%,%(%author%)%,%($author$)%)%
     **********************************************************************
     */
    %if(%constructor%,%constructor%,public)% %if(%class%,%class%,Class)%() %if(%extends%,%(
     super() )%)%
    {
    })%)%%if(%equal(no,%destructor%)%,,%(
    /**
     **********************************************************************
     * Function finalize
     *
     * @author %if(%author%,%(%author%)%,%($author$)%)%
     **********************************************************************
     */
    %if(%destructor%,%destructor%,public)% void finalize()
    {
    })%)%%if(%equal(no,%main%)%,,%(
    /**
     **********************************************************************
     * Function main
     *
     * @author %if(%author%,%(%author%)%,%($author$)%)%
     **********************************************************************
     */
    %if(%main%,%main%,public)% static void main(String args[])
    {
    })%)%%if(%equal(no,%functions%)%,,%(
    /**
     **********************************************************************
     * Function
     *
     * @author %if(%author%,%(%author%)%,%($author$)%)%
     **********************************************************************
     */)%)%)%)%
}
)%)%