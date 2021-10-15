%#################################################################
%#
%#   File: get-cxx.t
%#
%# Author: $author$
%#   Date: 11/26/2004
%#
%#    $Id$
%#
%#################################################################

%parse(%function_name%,;,,,%(    /**
     **********************************************************************
     * Function: Get%f%Node
     *
     *   Author: $author$
     *     Date: %date()%
     **********************************************************************
     */
    virtual cDOM%f%Interface* Get%f%Node() const %if(%equal(abstract,%functions%)%,= 0;,%(
    {
        cDOM%f%Interface* %tolower(%f%)% = 0;
        return %tolower(%f%)%;
    })%)%
)%,f)%
