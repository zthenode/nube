%#################################################################
%#
%#   File: cdomelementprocessor-cxx.t
%#
%# Author: $author$
%#   Date: 12/11/2004
%#
%#    $Id$
%#
%#################################################################
%apply-x(%
%author,%(%else-then(%author%,$author$)%)%,%
%date,%(%date()%)%,%
%year,%(%year()%)%,%
%file,%(%else-then(%file%,%output%)%)%,%
%filename,%(%filename(%file%)%)%,%
%filebase,%(%filebase(%filename%)%)%,%
%fileextension,%(%fileextension(%filename%)%)%,%
%hxx,%(%equal(hxx,%tolower(%fileextension%)%)%)%,%
%ifndef,%(%toupper(_%filebase%_%hxx%)%)%,%
%%(
/**
 **********************************************************************
 *  Class: c%name%DOMElementProcessor
 *
 * Author: %author%
 *   Date: %date%
 **********************************************************************
 */
class c%name%DOMElementProcessor
: public cDOMElementProcessor
{
public:
    typedef cDOMElementProcessor cIs;

    cString m_name_attr_name;

    /**
     **********************************************************************
     * Constructor: c%name%DOMElementProcessor
     *
     *      Author: %author%
     *        Date: %date%
     **********************************************************************
     */
    c%name%DOMElementProcessor
    (const cStringInterface &namespace_uri, const char *name) 
    : cIs(namespace_uri, name)
    {
    }
    /**
     **********************************************************************
     * Function: Process
     *
     *   Author: %author%
     *     Date: %date%
     **********************************************************************
     */
    virtual eError Process
    (cDOMProcessorInterface &processor,
     cDOMNodeList &result, 
     cDOMElementInterface &element,
     cDOMNodeListInterface &parameter) 
    {
        eError error = e_ERROR_NONE;
        return error;
    }
} g_%tolower(%name%)%_processor
  (g_namespace_%namespace_prefix%,"%tolower(%name%)%");
)%)%