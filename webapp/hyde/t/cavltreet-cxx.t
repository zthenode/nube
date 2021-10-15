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
%#   File: cavltreet-cxx.t
%#
%# Author: $author$
%#   Date: 10/29/2005
%#
%#    $Id$
%#
%#############################################################################
%apply-x(%
%author,%(%else-then(%author%,$author$)%)%,%
%date,%(%date()%)%,%
%year,%(%year()%)%,%
%copyright,%(%if(%equal(no,%copyright%)%,,%(Copyright (c) 1988-%year% %author%)%)%)%,%
%open_source,%(%if(%equal(no,%open_source%)%,,yes)%)%,%
%file,%(%else-then(%file%,%output%)%)%,%
%filename,%(%filename(%file%)%)%,%
%filebase,%(%filebase(%filename%)%)%,%
%fileextension,%(%fileextension(%filename%)%)%,%
%filepath,%filepath(%input%)%,%
%hxx,%(%equal(hxx,%tolower(%fileextension%)%)%)%,%
%ifndef,%(%toupper(_%filebase%_%hxx%)%)%,%
%constructor_type,%(%else(%equal(no,%constructor%)%,%else(%equal(yes,%constructor%)%,%constructor% )%)%)%,%
%constructor,%(%else(%equal(no,%constructor%)%,%constructor%)%)%,%
%destructor_type,%(%else(%equal(no,%destructor%)%,%else(%equal(yes,%destructor%)%,%destructor% )%)%)%,%
%destructor,%(%else(%equal(no,%destructor%)%,%destructor%)%)%,%
%of_type,%(%else-then(%left-of-right(%of%, )%,%else-then(%of%,const char*)%)%)%,%
%of_name,%(%else-then(%right(%of%, )%,%else-then(%tolower(%of%)%,name)%)%)%,%
%has_type,%(%else-then(%left-of-right(%has%, )%,%has%)%)%,%
%has_name,%(%else-then(%right(%has%, )%,m_%tolower(%has%)%)%)%,%
%is_branch,%(%else(%equal(no,%branch%)%,%branch%)%)%,%
%branch,%(%else(%equal(no,%branch_name%)%,%else-then(%branch_name%,Branch)%)%)%,%
%is_tree,%else(%equal(no,%tree%)%,%tree%)%,%
%tree,%else(%equal(no,%tree_name%)%,%else-then(%tree_name%,Tree)%)%,%
%%(%if(%file%,%(%include(%filepath%/file-cxx.t)%%
%%if(%hxx%,%(
#ifndef %ifndef%
#define %ifndef%
)%)%
)%)%%if(%include%,%(%parse(%include%,;,
#include ",")%"
)%)%%if(%is_branch%,%(
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

    %has_type% m_%has_name%;)%)%%if(%constructor%,%(

    /**
     **********************************************************************
     * Constructor: %class%%branch%
     *
     *      Author: %author%
     *        Date: %date%
     **********************************************************************
     */
    %constructor_type%%class%%branch%(%if(%has_type%,%(%has_type% %has_name%)%,%(%of_type% %of_name%)%)%) %if(%has_type%,%(
    : m_%has_name%(%has_name%) )%)%
    {
    })%)%%if(%destructor%,%(
    /**
     **********************************************************************
     * Destructor: ~%class%%branch%
     *
     *     Author: %author%
     *       Date: %date%
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
     *     Date: %date%
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
     *     Date: %date%
     **********************************************************************
     */
    int Compare(%of_type% %of_name%) const
    {
        int unequal = -1;
        return unequal;
    }
};)%)%%if(%is_tree%,%(
/**
 **********************************************************************
 *  Class: %class%%tree%
 *
 * Author: %author%
 *   Date: %date%
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
     *        Date: %date%
     **********************************************************************
     */
    %constructor_type%%class%%tree%() 
    {
    })%)%%if(%destructor%,%(
    /**
     **********************************************************************
     * Destructor: %class%%tree%
     *
     *     Author: %author%
     *       Date: %date%
     **********************************************************************
     */
    %destructor_type%~%class%%tree%() 
    {
    })%)%
};)%)%
%if(%hxx%,%(
#endif /* %ifndef% */)%)%)%)%
