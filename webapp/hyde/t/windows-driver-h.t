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
%#   File: windows-driver-h.t
%#
%# Author: $author$
%#   Date: 7/29/2005
%#
%#    $Id$
%#
%# Template for creating a Windows WDM driver header.
%#
%#############################################################################
%apply-x(%
%author,%(%else-then(%author%,$author$)%)%,%
%date,%(%date()%)%,%
%year,%(%year()%)%,%
%file,%(%else-then(%file%,%else-then(%output%,driver.h)%)%)%,%
%filename,%(%filename(%file%)%)%,%
%filebase,%(%filebase(%filename%)%)%,%
%fileextension,%(%fileextension(%filename%)%)%,%
%filepath,%(%filepath(%input%)%)%,%
%copyright,%(%if(%equal(no,%copyright%)%,,%(Copyright (c) 1988-%year% %author%)%)%)%,%
%open_source,%(%if(%equal(no,%open_source%)%,,yes)%)%,%
%hxx,%(%equal(hxx,%tolower(%fileextension%)%)%)%,%
%ifndef,%(%toupper(_%filebase%_%fileextension%)%)%,%
%name,%(%else-then(%name%,%filebase%)%)%,%
%NAME,%(%if-then(%toupper(%name%)%,_)%)%,%
%magic,%(%else-then(%magic%,X)%)%,%
%for,%(Windows WDM driver)%,%
%%(%include(%filepath%/file-cxx.t)%#ifndef %ifndef%
#define %ifndef%

#include <ntddk.h>

#include "%filebase(%file%)%_ioctl.h"

#define %NAME%DEVICE_PATH L"%if(%device_path%,%device_path%,\\Device\\)%"
#define %NAME%DEVICE_LINK L"%if(%device_link%,%device_link%,\\DosDevices\\)%"
#define %NAME%DEVICE_FULL_NAME %NAME%DEVICE_PATH %NAME%DEVICE_NAME
#define %NAME%DEVICE_LINK_NAME %NAME%DEVICE_LINK %NAME%DEVICE_NAME

/**
 **********************************************************************
 * Struct: _DEVICE_EXTENSION
 *
 *   Author: %author%
 *     Date: %date%
 **********************************************************************
 */
typedef struct _%NAME%DEVICE_EXTENSION
{
    PDRIVER_OBJECT pDriverObject;
	PDEVICE_OBJECT pDeviceObject;
	PDEVICE_OBJECT pLowerDeviceObject;
} %NAME%DEVICE_EXTENSION, *P%NAME%DEVICE_EXTENSION;
%else(%hxx%,%(
#if defined(__cplusplus)
extern "C" {
#endif
)%)%
/**
 **********************************************************************
 * Function: DriverEntry
 *
 *   Author: %author%
 *     Date: %date%
 **********************************************************************
 */
NTSTATUS DriverEntry
(IN PDRIVER_OBJECT pDriverObject, IN PUNICODE_STRING pRegistryPath);

/**
 **********************************************************************
 * Function: %name%Unload
 *
 *   Author: %author%
 *     Date: %date%
 **********************************************************************
 */
VOID %name%Unload(IN PDRIVER_OBJECT pDriverObject);

/**
 **********************************************************************
 * Function: %name%Passthrough
 *
 *   Author: %author%
 *     Date: %date%
 **********************************************************************
 */
NTSTATUS %name%Passthrough
(IN PDEVICE_OBJECT pDeviceObject, IN PIRP pIrp);

/**
 **********************************************************************
 * Function: %name%IoCtl
 *
 *   Author: %author%
 *     Date: %date%
 **********************************************************************
 */
NTSTATUS %name%IoCtl
(IN PDEVICE_OBJECT pDeviceObject, IN PIRP pIrp);
%else(%hxx%,%(
#if defined(__cplusplus)
}
#endif
)%)%
#ifdef ALLOC_PRAGMA
#pragma alloc_text(INIT, DriverEntry)
#pragma alloc_text(PAGE, %name%Unload)
#pragma alloc_text(PAGE, %name%Passthrough)
#pragma alloc_text(PAGE, %name%IoCtl)
#endif

#endif /* %ifndef% */
)%)%