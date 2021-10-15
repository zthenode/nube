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
%#   File: cdep-cxx.t
%#
%# Author: $author$
%#   Date: 12/8/2005
%#
%#    $Id$
%#
%#############################################################################
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
 *  Class: c%name%DocumentElementProcessor
 *
 * Author: %author%
 *   Date: %date%
 **********************************************************************
 */
class c%name%DocumentElementProcessor
: public c%isname%DocumentElementProcessor
{
public:
    typedef c%isname%DocumentElementProcessor cIs;

    /**
     **********************************************************************
     * Constructor: c%name%DocumentElementProcessor
     *
     *      Author: %author%
     *        Date: %date%
     **********************************************************************
     */
    c%name%DocumentElementProcessor
    (const char *name, int namelen=-1) 
    : cIs(name, namelen)
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
    (cDocumentProcessorInterface &processor,
     cDocumentNodeListInterface &result, 
     cDocumentElementInterface &function) 
    {
        eError error = e_ERROR_NONE;
        return error;
    }
} g_%tolower(%name%)%_processor("%tolower(%name%)%");
)%)%
