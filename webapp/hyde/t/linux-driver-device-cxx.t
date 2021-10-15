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
%#   File: linux-driver-device-cxx.t
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
%copyright,%(%if(%equal(yes,%copyright%)%,%(Copyright (c) %author% 1988-%year%)%)%)%,%
%file,%(%else-then(%file%,%output%)%)%,%
%filename,%(%filename(%file%)%)%,%
%filebase,%(%filebase(%filename%)%)%,%
%fileextension,%(%else-then(%fileextension(%filename%)%,hxx)%)%,%
%name,%(%else-then(%name%,%else-then(%filebase%,driver)%)%)%,%
%Name,%(%toupper(%left-char(%name%)%)%%tolower(%right-chars(%name%)%)%)%,%
%filebase,%(c%filebase%)%,%
%filename,%(%filebase%.%fileextension%)%,%
%filepath,%filepath(%input%)%,%
%ifndef,%(%toupper(_%filebase%_%fileextension%)%)%,%
%class,%(%else-then(%class%,c%Name%)%)%,%
%is,%(%else-then(%is%,cDevice)%)%,%
%%(%if(%file%,%(%include(%filepath%/file-cxx.t)%%
%#ifndef %ifndef%
#define %ifndef%

#include "%name%.h"
#include "cdevice.hxx"
)%)%

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
    typedef %is% cIs;%if(%reset%,%(

    /**
     **********************************************************************
     * Function: ResetModule
     *
     *   Author: %author%
     *     Date: %date%
     **********************************************************************
     */
    int ResetModule(void) 
    {
        int err = Ioctl(%toupper(%name%)%_IOCTL_RESETMOD);
        return err;
    }
    /**
     **********************************************************************
     * Function: SendRequest
     *
     *   Author: %author%
     *     Date: %date%
     **********************************************************************
     */
    int SendRequest(%name%_request_t& request) 
    {
        int err = Ioctl(%toupper(%name%)%_IOCTL_SEND_REQUEST, &request);
        return err;
    }
    /**
     **********************************************************************
     * Function: ReceiveRequest
     *
     *   Author: %author%
     *     Date: %date%
     **********************************************************************
     */
    int ReceiveRequest(%name%_request_t& request) 
    {
        int err;
        
        if (!(err = Ioctl(%toupper(%name%)%_IOCTL_RECEIVE_REQUEST, &request)))
            err = Ioctl(%toupper(%name%)%_IOCTL_SERVICE_REQUEST, &request);
        return err;
    })%)%
};
%if(%file%,%(
#endif /* %ifndef% */)%)%
)%)%