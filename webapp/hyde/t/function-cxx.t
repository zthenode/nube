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
%indent%/**
%indent% **********************************************************************
%indent% * Function: %f_class%%f%
%indent% *
%indent% *   Author: %author%
%indent% *     Date: %date%
%indent% **********************************************************************
%indent% */
%indent%%f_type%%return_t%%f_class%%f%%if(%parameters%,%(%if(%newline%,%(
%indent%)%)%)%)%(%parse(%parameters%,;,%()%,%(,%if(%newline%,%(
%indent%)%)% )%,%(%apply(%
%p_t,%if-then(%left-of-right(%else-then(%left(%p%,=)%,%p%)%, )%, )%,%
%p_n,%else-then(%right(%else-then(%left(%p%,=)%,%p%)%, )%,%p%)%,%
%p_v,%then-if(%right(%p%,=)%, = )%,%
%%(%p_t%%p_n%%p_v%)%)%)%,p)%) %f_const%%if(%f_prototype%%f_abstract%,%(%if(%f_abstract%,= 0)%;)%,%(
%indent%{%if(%return_n%,%(
%indent%    %return_t%%return_n%%return_v%;
%indent%    return %return_n%;)%)%
%body%%indent%})%)%
