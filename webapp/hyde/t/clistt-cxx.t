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
%#   File: clistt-cxx.t
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
%list_type,%(%else(%equal(no,%list_type%)%,%list_type%)%)%,%
%of_type,%(%else-then(%left-of-right(%of%, )%,%else-then(%of%,const char*)%)%)%,%
%of_name,%(%else-then(%right(%of%, )%,%else-then(%tolower(%of%)%,name)%)%)%,%
%has_type,%(%else-then(%left-of-right(%has%, )%,%has%)%)%,%
%has_name,%(%else-then(%right(%has%, )%,m_%tolower(%has%)%)%)%,%
%is_item,%(%else(%equal(no,%item%)%,%item%)%)%,%
%item,%(%else(%equal(no,%item%)%,%else-then(%item_name%,Item)%)%)%,%
%is_list,%else(%equal(no,%list%)%,%list%)%,%
%list,%else(%equal(no,%list%)%,%else-then(%list_name%,List)%)%,%
%%(%if(%file%,%(%include(%filepath%/file-cxx.t)%%
%%if(%hxx%,%(
#ifndef %ifndef%
#define %ifndef%
)%)%
)%)%%if(%include%,%(%parse(%include%,;,
#include ",")%"
)%)%%if(%is_item%,%(
/**
 **********************************************************************
 *  Class: %class%%item%
 *
 * Author: %author%
 *   Date: %date%
 **********************************************************************
 */
class %class%%item%
: public c%list_type%ListItemT<%class%%item%>
{
public:
    typedef c%list_type%ListItemT<%class%%item%> cIs;%if(%has_type%,%(

    %has_type% m_%has_name%;)%)%%if(%constructor%,%(

    /**
     **********************************************************************
     * Constructor: %class%%item%
     *
     *      Author: %author%
     *        Date: %date%
     **********************************************************************
     */
    %constructor_type%%class%%item%(%if-then(%of_type%,%( %of_name%)%)%) %if(%equal(%has_name%,%of_name%)%,%(
    : m_%has_name%(%of_name%) )%)%
    {
    })%)%%if(%destructor%,%(
    /**
     **********************************************************************
     * Destructor: ~%class%%item%
     *
     *     Author: %author%
     *       Date: %date%
     **********************************************************************
     */
    %destructor_type%~%class%%item%() 
    {
    })%)%
};)%)%%if(%is_list%,%(
/**
 **********************************************************************
 *  Class: %class%%list%
 *
 * Author: %author%
 *   Date: %date%
 **********************************************************************
 */
class %class%%list%
: public c%list_type%ListT
  <%class%%item%, %class%%list%>
{
public:
    typedef c%list_type%ListT
    <%class%%item%, %class%%list%> cIs;%if(%constructor%,%(

    /**
     **********************************************************************
     * Constructor: %class%%list%
     *
     *      Author: %author%
     *        Date: %date%
     **********************************************************************
     */
    %constructor_type%%class%%list%() 
    {
    })%)%%if(%destructor%,%(
    /**
     **********************************************************************
     * Destructor: ~%class%%list%
     *
     *     Author: %author%
     *       Date: %date%
     **********************************************************************
     */
    %destructor_type%~%class%%list%() 
    {
    })%)%
};)%)%
%if(%hxx%,%(
#endif /* %ifndef% */)%)%)%)%
