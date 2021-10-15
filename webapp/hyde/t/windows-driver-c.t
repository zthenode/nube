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
%#   File: windows-driver-c.t
%#
%# Author: $author$
%#   Date: 7/29/2005
%#
%#    $Id$
%#
%# Template for creating a Windows WDM driver.
%#
%#############################################################################
%apply-x(%
%author,%(%else-then(%author%,$author$)%)%,%
%date,%(%date()%)%,%
%year,%(%year()%)%,%
%file,%(%else-then(%file%,%else-then(%output%,driver.c)%)%)%,%
%filename,%(%filename(%file%)%)%,%
%filebase,%(%filebase(%filename%)%)%,%
%fileextension,%(%fileextension(%filename%)%)%,%
%copyright,%(%if(%equal(no,%copyright%)%,,%(Copyright (c) 1988-%year% %author%)%)%)%,%
%open_source,%(%if(%equal(no,%open_source%)%,,yes)%)%,%
%name,%(%else-then(%name%,%filebase%)%)%,%
%NAME,%(%if-then(%toupper(%name%)%,_)%)%,%
%magic,%(%else-then(%magic%,X)%)%,%
%%(/**
 **********************************************************************
%if(%copyright%,%( * %copyright%
 *
)%)%%if(%open_source%,%( * This software is provided by the author and contributors ``as is'' and
 * any express or implied warranties, including, but not limited to, the
 * implied warranties of merchantability and fitness for a particular purpose
 * are disclaimed.  In no event shall the author or contributors be liable
 * for any direct, indirect, incidental, special, exemplary, or consequential
 * damages (including, but not limited to, procurement of substitute goods
 * or services; loss of use, data, or profits; or business interruption)
 * however caused and on any theory of liability, whether in contract, strict
 * liability, or tort (including negligence or otherwise) arising in any way
 * out of the use of this software, even if advised of the possibility of
 * such damage.
 *
)%)% *   File: %filename%
 *
 * Author: %author%
 *   Date: %date%
 *
 *    $Id$
 **********************************************************************
 */

#include "%filebase%.h"

/**
 **********************************************************************
 * Function: DriverEntry
 *
 *   Author: %author%
 *     Date: %date%
 **********************************************************************
 */
NTSTATUS DriverEntry
(IN PDRIVER_OBJECT pDriverObject, IN PUNICODE_STRING pRegistryPath)
{
    NTSTATUS status=STATUS_SUCCESS;
    WCHAR deviceName[]=%NAME%DEVICE_FULL_NAME;
    WCHAR deviceLink[]=%NAME%DEVICE_LINK_NAME;
    ULONG deviceExtensionSize=sizeof(%NAME%DEVICE_EXTENSION);
    DEVICE_TYPE deviceType=FILE_DEVICE_UNKNOWN;
    ULONG deviceCharacteristics=0;
    BOOLEAN isExclusive=FALSE;
    PDEVICE_OBJECT pDeviceObject;
    P%NAME%DEVICE_EXTENSION pDeviceExtension;
    UNICODE_STRING deviceNameString;
    UNICODE_STRING deviceLinkString;
    ULONG i;

    PAGED_CODE();

    RtlInitUnicodeString(&deviceNameString, deviceName);

    if (STATUS_SUCCESS != (status = IoCreateDevice
        (pDriverObject, deviceExtensionSize, 
         &deviceNameString, deviceType,
         deviceCharacteristics, isExclusive, &pDeviceObject)))
        return status;

    if (NULL != (pDeviceExtension = 
        (P%NAME%DEVICE_EXTENSION)(pDeviceObject->DeviceExtension)))
    {
        pDeviceExtension->pDriverObject = pDriverObject;
        pDeviceExtension->pDeviceObject = pDeviceObject;
        pDeviceExtension->pLowerDeviceObject = NULL;
    }

    RtlInitUnicodeString(&deviceLinkString, deviceLink);

    if (STATUS_SUCCESS != (status = IoCreateSymbolicLink
        (&deviceLinkString, &deviceNameString)))
    {
        IoDeleteDevice(pDeviceObject);
        return status;
    }

    /*
     *  Route all IRPs on device objects created by this driver
     *  to our IRP passthrough routine.
     */
    for (i = 0; i <= IRP_MJ_MAXIMUM_FUNCTION; i++)
        pDriverObject->MajorFunction[i] = %name%Passthrough; 

    pDriverObject->MajorFunction[IRP_MJ_DEVICE_CONTROL] = %name%IoCtl;

    pDriverObject->DriverUnload = %name%Unload;

    return status;
}

/**
 **********************************************************************
 * Function: %name%Unload
 *
 *   Author: %author%
 *     Date: %date%
 **********************************************************************
 */
VOID %name%Unload(IN PDRIVER_OBJECT pDriverObject)
{
}

/**
 **********************************************************************
 * Function: %name%Passthrough
 *
 *   Author: %author%
 *     Date: %date%
 **********************************************************************
 */
NTSTATUS %name%Passthrough
(IN PDEVICE_OBJECT pDeviceObject, IN PIRP pIrp)
{
    NTSTATUS status=STATUS_SUCCESS;
    P%NAME%DEVICE_EXTENSION pDeviceExtension;

    /*
     * If we have alower device on the stack, pass the request
     * down to the next device.
     */
    if (NULL != (pDeviceExtension = 
        (P%NAME%DEVICE_EXTENSION)
        (pDeviceObject->DeviceExtension)))
    {
        if (NULL != (pDeviceObject = 
            pDeviceExtension->pLowerDeviceObject))
        {
            IoSkipCurrentIrpStackLocation(pIrp);
            return IoCallDriver(pDeviceObject, pIrp);
        }
    }

    status = pIrp->IoStatus.Status = STATUS_NO_SUCH_DEVICE;
    IoCompleteRequest(pIrp, IO_NO_INCREMENT);
    return status;
}

/**
 **********************************************************************
 * Function: %name%IoCtl
 *
 *   Author: %author%
 *     Date: %date%
 **********************************************************************
 */
NTSTATUS %name%IoCtl
(IN PDEVICE_OBJECT pDeviceObject, IN PIRP pIrp)
{
    NTSTATUS status=STATUS_SUCCESS;

    status = pIrp->IoStatus.Status = STATUS_INVALID_DEVICE_REQUEST;
    IoCompleteRequest(pIrp, IO_NO_INCREMENT);
    return status;
}
)%)%