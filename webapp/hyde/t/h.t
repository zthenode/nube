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
%#   File: h.t
%#
%# Author: $author$
%#   Date: 7/30/2005
%#
%#    $Id$
%#
%# Template for creating a .H file.
%#
%#############################################################################
%apply-x(%
%author,%(%else-then(%author%,$author$)%)%,%
%date,%(%date()%)%,%
%year,%(%year()%)%,%
%file,%(%else-then(%file%,%else-then(%output%,%if(%equal(h,%part%)%,%(h.h)%,%(%else(%equal(c,%part%)%,%(h.h)%)%)%)%)%)%)%,%
%filename,%(%filename(%file%)%)%,%
%filebase,%(%filebase(%filename%)%)%,%
%fileextension,%(%fileextension(%filename%)%)%,%
%filepath,%filepath(%input%)%,%
%h,%(%equal(H,%toupper(%fileextension%)%)%)%,%
%copyright,%(%if(%equal(no,%copyright%)%,,%(Copyright (c) 1988-%year% %author%)%)%)%,%
%open_source,%(%if(%equal(no,%open_source%)%,,yes)%)%,%
%ndef,%(_%toupper(%filebase%_%fileextension%)%)%,%
%module,%(%else-then(%module%,%filebase%)%)%,%
%f_class,%(%if-then(%module%,_)%)%,%
%f_prototype,%(yes)%,%
%return_t,%(%if-then(%else-then(%left-of-right(%return%, )%,void)%, )%)%,%
%return_n,%(%right(%else-then(%left(%return%,=)%,%return%)%, )%)%,%
%return_v,%(%then-if(%right(%return%,=)%, = )%)%,%
%%(%
%%if(%file%,%(%include(%filepath%/file-cxx.t)%%
%#ifndef %ndef%
#define %ndef%
)%)%%
%%if(%include%,%(%include(%filepath%/include-cxx.t)%)%)%%
%%if(%ifdef%,%(%include(%filepath%/ifdef-cxx.t)%)%)%%
%%if(%enums%,%(%include(%filepath%/enums-c.t)%)%)%%
%%parse(%structs%,;,%()%,%()%,%(%include(%filepath%/struct-c.t)%)%,struct)%%
%%if(%h%,%(
#if defined(__cplusplus)
extern "C" {
#endif
)%)%%
%%parse(%functions%,;,%()%,%()%,%(%include(%filepath%/function-cxx.t)%)%,f)%%
%%if(%h%,%(
#if defined(__cplusplus)
}
#endif
)%)%%
%%if(%file%,
#endif /* %ndef% */)%%
%)%)%
