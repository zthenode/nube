%#################################################################
%#
%#   File: cavltree-cxx.t
%#
%# Author: $author$
%#   Date: 11/18/2004
%#
%#    $Id$
%#
%#################################################################
class %implements%;

/**
 **********************************************************************
 *  Class: %class%Branch
 *
 * Author: $author$
 *   Date: %date()%
 **********************************************************************
 */
class %class%Branch
: public cAVLTreeBranchT<%class%Branch>
{
public:
    typedef cAVLTreeBranchT<%class%Branch> cIs;

    cCharString m_name;
    %implements%* m_%tolower(%is%)%;

    /**
     **********************************************************************
     * Constructor: %class%Branch
     *
     *      Author: $author$
     *        Date: %date()%
     **********************************************************************
     */
    %class%Branch
    (%implements%* %tolower(%is%)%=0,
     const char *name=0, int length=-1)
    : m_%tolower(%is%)%(%tolower(%is%)%)
    {
        eError error;

        if (name)
        if (0 > (length = m_name.SetChars(name, length)))
            throw(error = -length);
    }

    /**
     **********************************************************************
     * Function: Compare
     *
     *   Author: $author$
     *     Date: %date()%
     **********************************************************************
     */
    int Compare(%class%Branch &branch) const
    {
        int length1, length2, unequal = -1;
        const char *name1,*name2;

        if ((name1 = branch.GetName(length1)))
        if ((name2 = GetName(length2)))
            unequal = strcmp(name1, name2);

        return unequal;
    }
    /**
     **********************************************************************
     * Function: Compare
     *
     *   Author: $author$
     *     Date: %date()%
     **********************************************************************
     */
    int Compare(const char *name) const
    {
        int length2, unequal = -1;
        const char *name2;

        if ((name2 = GetName(length2)))
            unequal = strcmp(name, name2);

        return unequal;
    }
    /**
     **********************************************************************
     * Function: GetName
     *
     *   Author: $author$
     *     Date: %date()%
     **********************************************************************
     */
    const char* GetName(int &length) const
    {
        const char* chars = m_name.GetChars(length);
        return chars;
    }

    /**
     **********************************************************************
     * Function: Set%is%
     *
     *   Author: $author$
     *     Date: %date()%
     **********************************************************************
     */
    %implements%* Set%is%
    (%implements%* %tolower(%is%)%) 
    {
        m_%tolower(%is%)% = %tolower(%is%)%;
        return m_%tolower(%is%)%;
    }
    /**
     **********************************************************************
     * Function: Get%is%
     *
     *   Author: $author$
     *     Date: %date()%
     **********************************************************************
     */
    %implements%* Get%is%() const
    {
        return m_%tolower(%is%)%;
    }
};

/**
 **********************************************************************
 *  Class: %class%Tree
 *
 * Author: $author$
 *   Date: %date()%
 **********************************************************************
 */
class %class%Tree
: public cAVLTreeT
  <const char*, %class%Branch, %class%Tree>
{
public:
    typedef cAVLTreeT
    <const char*, %class%Branch, %class%Tree> cIs;

    /**
     **********************************************************************
     * Constructor: %class%Tree
     *
     *      Author: $author$
     *        Date: %date()%
     **********************************************************************
     */
    %class%Tree() 
    {
    }
};

