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
%#   File: ctfunction-cxx.t
%#
%# Author: $author$
%#   Date: 8/2/2005
%#
%#    $Id$
%#
%#############################################################################
%apply-x(%
%author,%(%else-then(%author%,$author$)%)%,%
%date,%(%date()%)%,%
%year,%(%year()%)%,%
%file,%(%else-then(%file%,%else-then(%output%,)%)%)%,%
%filename,%(%filename(%file%)%)%,%
%filebase,%(%filebase(%filename%)%)%,%
%fileextension,%(%else-then(%fileextension(%filename%)%,%(%if(%equal(c,%part%)%,c)%)%)%)%,%
%filename,%(%filebase%%if(%fileextension%,.)%%fileextension%)%,%
%filepath,%filepath(%input%)%,%
%copyright,%(%if(%equal(no,%copyright%)%,,%(Copyright (c) 1988-%year% %author%)%)%)%,%
%open_source,%(%if(%equal(no,%open_source%)%,,yes)%)%,%
%name,%(%else-then(%name%,%filebase%)%)%,%
%class_name,%(%else-then(%class_name%,%name%)%)%,%
%class,%(%else-then(%class%,cTFunction%class_name%)%)%,%
%is,%(%else-then(%is%,cTImplement::cFunction)%)%,%
%for,%(cTFunction "%name%".)%,%
%%(%if(%file%,%(%include(%filepath%/file-cxx.t)%)%)%
/**
 **********************************************************************
 *  Class: %class%
 *
 * Author: %author%
 *   Date: %date%
 **********************************************************************
 */
class %class%
: public %is%
{
public:
    typedef %is% cIs;

    /**
     **********************************************************************
     * Constructor: %class%
     *
     *      Author: %author%
     *        Date: %date%
     **********************************************************************
     */
    %class%(const char *name, const char *description)
    : cIs(name, description)
    {
        static cParameter parameter[1] = {{0,0}};

        m_parameter = parameter;
    }
    /**
     **********************************************************************
     * Function: Expand
     *
     *   Author: %author%
     *     Date: %date%
     **********************************************************************
     */
    virtual eError Expand
    (cCharStream &result, 
     cArgumentList &arglist, cTInterface &t) const
    {
        return e_ERROR_NONE;
    }
} ct_function_%tolower(%class_name%)%("%tolower(%name%)%","%tolower(%name%)%()");
)%)%