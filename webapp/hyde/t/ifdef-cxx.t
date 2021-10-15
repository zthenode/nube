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
%#   File: ifdef-cxx.t
%#
%# Author: $author$
%#   Date: 8/12/2005
%#
%#    $Id$
%#
%#############################################################################
%apply-x(%
%ifcomment,%(%if(%equal(%ifcomment%,yes)%,yes)%)%,%
%elif,%(%right-of-left(%ifdef%,;)%)%,%
%ifdef,%(%else-then(%left(%ifdef%,;)%,%ifdef%)%)%,%
%ifname,%(%right(%ifdef%,:)%)%,%
%elsename,%(%else-then(%right(%ifname%,/)%,%if(%ifname%,Otherwise)%)%)%,%
%ifname,%(%else-then(%left(%ifname%,/)%,%ifname%)%)%,%
%ifdef,%(%else-then(%left(%ifdef%,:)%,%ifdef%)%)%,%
%%(
#if defined(%ifdef%) %if(%ifcomment%,%(
/*
 * %ifname%
 */)%)%%parse(%elif%,;,,,%(%apply-x(%
%ifname,%(%right(%ifdef%,:)%)%,%
%ifdef,%(%else-then(%left(%ifdef%,:)%,%ifdef%)%)%,%
%%(
#elif defined(%ifdef%) %if(%ifcomment%,%(
/*
 * %ifname%
 */)%)%)%)%)%,ifdef)%
#else /* defined(%ifdef%) */%if(%ifcomment%,%(
/*
 * %elsename%
 */)%)%
#endif /* defined(%ifdef%) */)%)%
