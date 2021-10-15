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
%#   File: windows-driver-ioctl-h.t
%#
%# Author: $author$
%#   Date: 7/29/2005
%#
%#    $Id$
%#
%# Template for creating a Windows WDM driver ioctl header.
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
%copyright,%(%if(%equal(no,%copyright%)%,,%(Copyright (c) 1988-%year% %author%)%)%)%,%
%open_source,%(%if(%equal(no,%open_source%)%,,yes)%)%,%
%hxx,%(%equal(hxx,%tolower(%fileextension%)%)%)%,%
%ifndef,%(%toupper(_%filebase%_%fileextension%)%)%,%
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
#ifndef %ifndef%
#define %ifndef%

#define %NAME%DEVICE_NAME L"%name%"
%if(%ioctls%,%(
%parse(%ioctls%,;,,,%(%
%%apply(%
%ioctl_name,%left(%ioctl%,:)%,%
%ioctl_code,%right(%ioctl%,:)%,%
%%(#define %NAME%IOCTL_%ioctl_name% (ULONG)CTL_CODE(FILE_DEVICE_UNKNOWN, %ioctl_code%, METHOD_BUFFERED, FILE_ANY_ACCESS)
)%)%)%,ioctl)%)%)%
#endif /* %ifndef% */
)%)%