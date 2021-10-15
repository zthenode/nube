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
%#   File: struct-c.t
%#
%# Author: $author$
%#   Date: 8/14/2005
%#
%#    $Id$
%#
%#############################################################################
%apply(%
%Union,%if(%equal(union,%union%)%, Union,Struct)%,%
%union,%if(%equal(union,%union%)%,union,struct)%,%
%packed,%if(%equal(unpacked,%packed%)%,,%packed%)%,%
%%(/**
 **********************************************************************
 * %Union%: %module%_%struct%
 *
 * Author: %author%
 *   Date: %date%
 **********************************************************************
 */%if(%packed%,%(
#if defined(WIN32)
#pragma pack(push,%packed%)
#endif /* defined(WIN32) */)%)%
typedef %union% %module%_%struct%
{
} %if(%packed%,%(
#if defined(WIN32)
#pragma pack(pop)
#else /* defined(WIN32) */
__attribute__ ((%if(%equal(1,%packed%)%,packed,aligned(%packed%))%))
#endif /* defined(WIN32) */
)%)%%module%_%struct%_t;
)%)%