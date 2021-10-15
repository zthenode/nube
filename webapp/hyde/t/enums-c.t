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
%#   File: enums-c.t
%#
%# Author: $author$
%#   Date: 8/23/2005
%#
%#    $Id$
%#
%#############################################################################
%parse(%enums%,;,,,%(%apply-x(%
%enum_values,%(%right(%enum%,:)%)%,%
%enum_name,%(%else-then(%left(%enum%,:)%,%enum%)%)%,%
%enum_name,%(%toupper(%if-then(%module%,_)%%enum_prefix%%enum_name%)%)%,%
%%(
/**
 **********************************************************************
 *   Enum: %enum_name%
 *
 * Author: %author%
 *   Date: %date%
 **********************************************************************
 */
enum %enum_name%
{%parse(%enum_values%,%(,)%,
    ,%(,)%,%(%apply(enum_value_name,%toupper(%enum_value%)%,%
%%(%enum_name%_%enum_value_name%)%)%)%,enum_value)%
};
)%)%)%,enum)%