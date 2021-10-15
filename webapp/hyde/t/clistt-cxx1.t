%#################################################################
%#
%#   File: clistt-cxx.t
%#
%# Author: $author$
%#   Date: 11/23/2004
%#
%#    $Id$
%#
%#################################################################
%apply(%
%file,%else-then(%file%,%input%)%,%
%author,%else-then(%author%,$author$)%,%
%is_hxx,%equal(HXX,%toupper(%fileextension(%file%)%)%)%,%
%ndef,%toupper(%filebase(_%filename(%file%)%)%)%_%toupper(%fileextension(%file%)%)%,%
%list_type,%else(%equal(no,%list_type%)%,%list_type%)%,%
%has_type,%else-then(%left-of-right(%has%, )%,%has%)%,%
%has_name,%else-then(%right(%has%, )%,m_%tolower(%has%)%)%,%
%constructor_type,%else(%equal(no,%constructor%)%,%else(%equal(yes,%constructor%)%,%constructor% )%)%,%
%constructor,%else(%equal(no,%constructor%)%,%constructor%)%,%
%destructor_type,%else(%equal(no,%destructor%)%,%else(%equal(yes,%destructor%)%,%destructor% )%)%,%
%destructor,%else(%equal(no,%destructor%)%,%destructor%)%,%
%%(%if(%file%,%(/**
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
%if(%is_hxx%,%(#ifndef %ndef%
#define %ndef%
)%)%)%)%%if(%include%,%(%parse(%include%,;,
#include ",")%"
)%)%
/**
 **********************************************************************
 *  Class: %class%Item
 *
 * Author: %author%
 *   Date: %date()%
 **********************************************************************
 */
class %class%Item
: public c%list_type%ListItemT<%class%Item>
{
public:
    typedef c%list_type%ListItemT<%class%Item> cIs;%if(%constructor%,%(

    /**
     **********************************************************************
     * Constructor: %class%Item
     *
     *      Author: %author%
     *        Date: %date()%
     **********************************************************************
     */
    %constructor_type%%class%Item() 
    {
    })%)%
};

/**
 **********************************************************************
 *  Class: %class%List
 *
 * Author: $author$
 *   Date: %date()%
 **********************************************************************
 */
class %class%List
: public c%list_type%ListT
  <%class%Item, %class%List>
{
public:
    typedef c%list_type%ListT
    <%class%Item, %class%List> cIs;
};
%if(%is_hxx%,%(
#endif /* ndef %ndef% */
)%)%)%)%
