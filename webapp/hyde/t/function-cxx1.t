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
%#   File: function-cxx.t
%#
%# Author: $author$
%#   Date: 7/30/2005
%#
%#    $Id$
%#
%# Template for creating a C/C++ function.
%#
%#############################################################################
/**
 **********************************************************************
 * Function: %f_class%%f%
 *
 *   Author: %author%
 *     Date: %date%
 **********************************************************************
 */
%f_type%%return_t%%f_class%%f%(%parse(%parameters%,;,%()%,%(, )%,%(%apply(%
%p_t,%if-then(%else-then(%left-of-right(%p%, )%,void)%, )%,%
%p_n,%right(%else-then(%left(%p%,=)%,%p%)%, )%,%
%p_v,%then-if(%right(%p%,=)%, = )%,%
%%(%p_t%%p_n%%p_v%)%)%)%,p)%) %if(%f_prototype%,%(;
)%,%(
{%if(%return_n%,%(
    %return_t%%return_n%%return_v%;
    return %return_n%;)%)%
}
)%)%