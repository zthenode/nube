%#################################################################
%#
%#   File: cavltreet-cxx.t
%#
%# Author: $author$
%#   Date: 11/22/2004
%#
%#    $Id$
%#
%#################################################################
%apply(%
%file,%else-then(%file%,%input%)%,%
%author,%else-then(%author%,$author$)%,%
%is_hxx,%equal(HXX,%toupper(%fileextension(%file%)%)%)%,%
%ndef,%toupper(%filebase(_%filename(%file%)%)%)%_%toupper(%fileextension(%file%)%)%,%
%of_type,%else-then(%left-of-right(%of%, )%,%else-then(%of%,const char*)%)%,%
%of_name,%else-then(%right(%of%, )%,%else-then(%tolower(%of%)%,name)%)%,%
%has_type,%else-then(%left-of-right(%has%, )%,%has%)%,%
%has_name,%else-then(%right(%has%, )%,m_%tolower(%has%)%)%,%
%branch,%else(%equal(no,%branch%)%,Branch)%,%
%tree,%else(%equal(no,%tree%)%,Tree)%,%
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
 *  Class: %class%%branch%
 *
 * Author: %author%
 *   Date: %date()%
 **********************************************************************
 */
class %class%%branch%
: public cAVLTreeBranchT<%class%%branch%>
{
public:
    typedef cAVLTreeBranchT<%class%%branch%> cIs;%if(%has_type%,%(

    %has_type% %has_name%;)%)%%if(%constructor%,%(

    /**
     **********************************************************************
     * Constructor: %class%%branch%
     *
     *      Author: %author%
     *        Date: %date()%
     **********************************************************************
     */
    %constructor_type%%class%%branch%(%of_type% %of_name%)
    {
    })%)%%if(%destructor%,%(
    /**
     **********************************************************************
     * Destructor: ~%class%%branch%
     *
     *     Author: %author%
     *       Date: %date()%
     **********************************************************************
     */
    %destructor_type%~%class%%branch%()
    {
    })%)%
    /**
     **********************************************************************
     * Function: Compare
     *
     *   Author: %author%
     *     Date: %date()%
     **********************************************************************
     */
    int Compare(%class%%branch% &branch) const
    {
        int unequal = -1;
        return unequal;
    }
    /**
     **********************************************************************
     * Function: Compare
     *
     *   Author: %author%
     *     Date: %date()%
     **********************************************************************
     */
    int Compare(%of_type% %of_name%) const
    {
        int unequal = -1;
        return unequal;
    }
};
/**
 **********************************************************************
 *  Class: %class%%tree%
 *
 * Author: %author%
 *   Date: %date()%
 **********************************************************************
 */
class %class%%tree%
: public cAVLTreeT
  <%of_type%, %class%%branch%, %class%%tree%>
{
public:
    typedef cAVLTreeT
    <%of_type%, %class%%branch%, %class%%tree%> cIs;%if(%constructor%,%(

    /**
     **********************************************************************
     * Constructor: %class%%tree%
     *
     *      Author: %author%
     *        Date: %date()%
     **********************************************************************
     */
    %constructor_type%%class%%tree%() 
    {
    })%)%
};
%if(%is_hxx%,%(
#endif /* ndef %ndef% */
)%)%)%)%
