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
%#   File: cxx-apply-t.t
%#
%# Author: $author$
%#   Date: 10/29/2005
%#
%#    $Id$
%#
%#############################################################################
%(%apply-x(%
%author,%(%else-then(%author%,$author$)%)%,%
%date,%(%date()%)%,%
%year,%(%year()%)%,%
%copyright,%(%if(%equal(no,%copyright%)%,,%(Copyright (c) 1988-%year% %author%)%)%)%,%
%open_source,%(%if(%equal(no,%open_source%)%,,yes)%)%,%
%file,%(%else-then(%file%,%output%)%)%,%
%filename,%(%filename(%file%)%)%,%
%filebase,%(%filebase(%filename%)%)%,%
%fileextension,%(%fileextension(%filename%)%)%,%
%filepath,%filepath(%input%)%,%
%hxx,%(%equal(hxx,%tolower(%fileextension%)%)%)%,%
%ifndef,%(%toupper(_%filebase%_%hxx%)%)%,%
%constructor_type,%(%else(%equal(no,%constructor%)%,%else(%equal(yes,%constructor%)%,%constructor% )%)%)%,%
%constructor,%(%else(%equal(no,%constructor%)%,%constructor%)%)%,%
%destructor_type,%(%else(%equal(no,%destructor%)%,%else(%equal(yes,%destructor%)%,%destructor% )%)%)%,%
%destructor,%(%else(%equal(no,%destructor%)%,%destructor%)%)%,%
%%(%if(%file%,%(%include(%filepath%/file-cxx.t)%%
%%if(%hxx%,%(
#ifndef %ifndef%
#define %ifndef%
)%)%
)%)%%if(%include%,%(%parse(%include%,;,
#include ",")%"
)%)%
%if(%hxx%,%(
#endif /* %ifndef% */)%)%)%)%)%
