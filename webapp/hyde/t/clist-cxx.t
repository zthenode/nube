%#################################################################
%#
%#   File: clist-cxx.t
%#
%# Author: $author$
%#   Date: 11/18/2004
%#
%#    $Id$
%#
%#################################################################
/**
 **********************************************************************
 *  Class: %class%Item
 *
 * Author: $author$
 *   Date: %date()%
 **********************************************************************
 */
class %class%Item
: public cDynamicListItemT<%class%Item>
{
public:
    typedef cDynamicListItemT<%class%Item> cIs;

    %class% &m_%tolower(%is%)%;

    /**
     **********************************************************************
     * Constructor: %class%Item
     *
     *      Author: $author$
     *        Date: %date()%
     **********************************************************************
     */
    %class%Item(%class% &%tolower(%is%)%) 
    : m_%tolower(%is%)%(%tolower(%is%)%)
    {
    }
    /**
     **********************************************************************
     * Function: Get%is%
     *
     *   Author: $author$
     *     Date: %date()%
     **********************************************************************
     */
    virtual %class%& Get%is%()
    {
        return m_%tolower(%is%)%;
    }
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
: public cDynamicListT
  <%class%Item, %class%List>
{
public:
    typedef cDynamicListT
    <%class%Item, %class%List> cIs;
};

