%#################################################################
%#
%#   File: cxx.t
%#
%# Author: $author$
%#   Date: 6/29/2003
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
 *   File: %filename(%file%)%
 *
 * Author: %if(%author%,%(%author%)%,%($author$)%)%
 *   Date: %date(month,day,year,%(%month%/%day%/%year%)%)%
 *
 *    $Id$
 **********************************************************************
 */
%if(%include%,%(%parse(%include%,;,
#include ",")%"
)%)%)%)%%if(%class%,%(%if(%file%,%(
#include "%filebase(%file%)%.hxx"
)%)%
/*
 **********************************************************************
 * %if(%equal(struct,%struct%)%,Struct,%if(%equal(union,%struct%)%, Union, Class)%)%: %class%
 *
 * Author: %if(%author%,%(%author%)%,%($author$)%)%
 *   Date: %date(month,day,year,%(%month%/%day%/%year%)%)%
 **********************************************************************
 */
/**
 **********************************************************************
 * %if(%equal(constructor,%function%)%,Constructor,%
%%if(%equal(destructor,%function%)%, Destructor,   Function)%)%: %
%%class%::%if(%equal(constructor,%function%)%,%class%,%
%%if(%equal(destructor,%function%)%,~%class%,%function%)%)%
 *
 *      Author: %if(%author%,%(%author%)%,%($author$)%)%
 *        Date: %date(month,day,year,%(%month%/%day%/%year%)%)%
 **********************************************************************
 */
)%)%%if(%equal(yes,%main%)%,%(
#if defined(%toupper(%filebase(%file%)%)%_MAIN)
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
#endif /* defined(%toupper(%filebase(%file%)%)%_MAIN) */
)%)%