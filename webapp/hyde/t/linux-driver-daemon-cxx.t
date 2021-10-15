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
%#   File: linux-driver-daemon-cxx.t
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
%fileextension,%(%else-then(%fileextension(%filename%)%,cxx)%)%,%
%filepath,%filepath(%input%)%,%
%name,%(%else-then(%name%,%else-then(%filebase%,driver)%)%)%,%
%Name,%(%toupper(%left-char(%name%)%)%%tolower(%right-chars(%name%)%)%)%,%
%filebase,%(%then-if(%if-then(%filebase%,d)%,c)%)%,%
%filename,%(%filebase%%then-if(%fileextension%,.)%)%,%
%device,%(%else-then(%device%,c%Name%)%)%,%
%class,%(%else-then(%class%,c%Name%Daemon)%)%,%
%is,%(%else-then(%is%,cMain)%)%,%
%%(%if(%file%,%(%include(%filepath%/file-cxx.t)%)%)%
#include <stdio.h>
#include <string.h>
#include "%name%.h"
#include "%tolower(%device%)%.hxx"
#include "cmain.hxx"

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

    const char *m_device_name;
    %device% m_device;
    
    /**
     **********************************************************************
     * Constructor: %class%
     *
     *      Author: %author%
     *        Date: %date%
     **********************************************************************
     */
    %class%(const char *device_name="/dev/%name%")
    : m_device_name(device_name) 
    {
    }
    /**
     **********************************************************************
     * Function: OnUsage
     *
     *   Author: %author%
     *     Date: %date%
     **********************************************************************
     */
    virtual int OnUsage(int argc, char **argv) 
    {
        int result = 0;
        const char *filename=__FILE__;
        const char *exename=(argc>0)?argv[0]:filename;
        const char *extension;
        const char *substr;
        
        if ((substr = strrchr(exename, '/')))
            exename = substr+1;
        
        extension = exename+strlen(exename);
        
        if (exename == filename)
        if ((substr = strrchr(exename, '.')))
            extension = substr;
            
        printf("usage: %%.*s\n", extension-exename, exename);
        return result;
    }
    %if(%reset%,%(/**
     **********************************************************************
     * Function: OnResetModule
     *
     *   Author: %author%
     *     Date: %date%
     **********************************************************************
     */
    virtual int OnResetModule(int argc, char **argv) 
    {
        int result = 0;
        int err, err2;

        if (!(err = OpenDevice()))
        {
            err = m_device.ResetModule();

            if ((err2 = CloseDevice()))
                err = err?err:err2;
        }
        return result;
    }
    )%)%/**
     **********************************************************************
     * Function: OnMain
     *
     *   Author: %author%
     *     Date: %date%
     **********************************************************************
     */
    virtual int OnMain(int argc, char **argv) 
    {
        int result = 0;

        if (argc<2)
            return OnUsage(argc, argv);
            
        switch(argv[1][0])
        {
        case '-':
            switch(argv[1][1])
            {
            %if(%reset%,%(case 'x':
                return OnResetModule(argc, argv);
                
            )%)%default:
                return OnUsage(argc, argv);
            }
            break;
            
        default:
            return OnUsage(argc, argv);
        }
        return result;
    }
    /**
     **********************************************************************
     * Function: OpenDevice
     *
     *   Author: %author%
     *     Date: %date%
     **********************************************************************
     */
    int OpenDevice()
    {
        int err;

        if ((err = m_device.Open(m_device_name)))
            printf("Unable to open device \"%%s\"\n", m_device_name);

        return err;
    }
    /**
     **********************************************************************
     * Function: CloseDevice
     *
     *   Author: %author%
     *     Date: %date%
     **********************************************************************
     */
    int CloseDevice()
    {
        int err;

        if ((err = m_device.Close()))
            printf("Unable to close device \"%%s\"\n", m_device_name);

        return err;
    }
} g_%tolower(%name%)%_daemon;
)%)%