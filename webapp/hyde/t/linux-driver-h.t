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
%#   File: linux-driver-h.t
%#
%# Author: $author$
%#   Date: 8/1/2005
%#
%#    $Id$
%#
%#############################################################################
%apply-x(%
%author,%(%else-then(%author%,$author$)%)%,%
%date,%(%date()%)%,%
%year,%(%year()%)%,%
%file,%(%else-then(%file%,%else-then(%output%,%if(%equal(h,%part%)%,driver.h)%)%)%)%,%
%filename,%(%filename(%file%)%)%,%
%filebase,%(%filebase(%filename%)%)%,%
%fileextension,%(%else-then(%fileextension(%filename%)%,%(%if(%equal(h,%part%)%,h)%)%)%)%,%
%filename,%(%filebase%%if(%fileextension%,.)%%fileextension%)%,%
%filepath,%filepath(%input%)%,%
%h,%(%equal(H,%toupper(%fileextension%)%)%)%,%
%copyright,%(%if(%equal(no,%copyright%)%,,%(Copyright (c) 1988-%year% %author%)%)%)%,%
%open_source,%(%if(%equal(no,%open_source%)%,,yes)%)%,%
%ndef,%(%toupper(%filebase%_%fileextension%)%)%,%
%name,%(%else-then(%name%,%filebase%)%)%,%
%module,%(%else-then(%equal(yes,%module%)%,)%)%,%
%ioctl,%(%else-then(%equal(yes,%ioctl%)%,)%)%,%
%magic,%(%else-then(%magic%,X)%)%,%
%for,%(Header for Linux driver "%name%".)%,%
%%(%
%%if(%file%,%(%include(%filepath%/file-cxx.t)%%
%#ifndef %ndef%
#define %ndef%
)%)%
#if defined(__KERNEL__)
#include <linux/types.h>
#include <linux/ioctl.h>
#else
#if defined(WIN32)
#else
#include <sys/ioctl.h>
#endif /* defined(WIN32) */
#endif
%if(%ioctl%,%(
/*
 * IOCTL definitions
 */
#if defined(WIN32)
%if(%reset%,%(#define %toupper(%name%_ioctl_resetmod)% %reset%
)%)%#else
#define %toupper(%name%)%_IOCTL_MAGIC '%magic%'
%if(1,%(#define %toupper(%name%)%_IOCTL_SEND_REQUEST _IO(%toupper(%name%)%_IOCTL_MAGIC, 1)
#define %toupper(%name%)%_IOCTL_RECEIVE_REQUEST _IO(%toupper(%name%)%_IOCTL_MAGIC, 2)
#define %toupper(%name%)%_IOCTL_SERVICE_REQUEST _IO(%toupper(%name%)%_IOCTL_MAGIC, 3)
)%)%%if(%reset%,%(#define %toupper(%name%)%_IOCTL_RESETMOD _IO(%toupper(%name%)%_IOCTL_MAGIC, %reset%)
)%)%#endif /* defined(WIN32) */
)%)%%if(1,%(
/**
 **********************************************************************
 * Enum: 
 *
 * Author: %author%
 *   Date: %date%
 **********************************************************************
 */
enum
{
    e_%toupper(%name%)%_REQUEST_FIRST,

    e_%toupper(%name%)%_BLOCK_REQUEST = e_%toupper(%name%)%_REQUEST_FIRST,

    e_%toupper(%name%)%_REQUEST_NEXT,
    e_%toupper(%name%)%_REQUEST_LAST = e_%toupper(%name%)%_REQUEST_NEXT-1
};

/**
 **********************************************************************
 * Enum: 
 *
 * Author: %author%
 *   Date: %date%
 **********************************************************************
 */
enum
{
    e_%toupper(%name%)%_BLOCK_REQUEST_FIRST,

    e_%toupper(%name%)%_READ_BLOCK_REQUEST = e_%toupper(%name%)%_BLOCK_REQUEST_FIRST,
    e_%toupper(%name%)%_WRITE_BLOCK_REQUEST,

    e_%toupper(%name%)%_BLOCK_REQUEST_NEXT,
    e_%toupper(%name%)%_BLOCK_REQUEST_LAST = e_%toupper(%name%)%_BLOCK_REQUEST_NEXT-1
};

/**
 **********************************************************************
 * Struct: %name%_block_request
 *
 * Author: %author%
 *   Date: %date%
 **********************************************************************
 */
typedef struct %name%_block_request
{
    unsigned int type;
    unsigned long lun;
    unsigned long lba;
    unsigned long length;
} %name%_block_request_t;

/**
 **********************************************************************
 * Struct: %name%_request
 *
 * Author: %author%
 *   Date: %date%
 **********************************************************************
 */
typedef struct %name%_request
{
    unsigned int id;
    unsigned int type;
    union
    {
        %name%_block_request_t block;
    };
} %name%_request_t;
)%)%
#if defined(__KERNEL__)
#endif /* defined(__KERNEL__) */

%if(%h%,%(
#if defined(__cplusplus)
extern "C" {
#endif
)%)%%
%%if(%h%,%(
#if defined(__cplusplus)
}
#endif
)%)%%
%%if(%file%,
#endif /* %ndef% */)%%
%)%)%
