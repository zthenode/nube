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
%#   File: enum-cxx.t
%#
%# Author: $author$
%#   Date: 3/17/2005
%#
%#    $Id$
%#
%#############################################################################
%apply-x(%
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
%h,%(%equal(h,%tolower(%fileextension%)%)%)%,%
%hxx,%(%h%%equal(hxx,%tolower(%fileextension%)%)%)%,%
%ifndef,%(%toupper(_%filebase%_%hxx%)%)%,%
%is_author,%(%unequal(no,%enum_author%)%)%,%
%is_date,%(%unequal(no,%enum_date%)%)%,%
%enum_enum,%(%else(%equal(no,%enum_enum%)%,yes)%)%,%
%enum_bm,%(%if(%unequal(no,%enum_bm%)%,BM)%)%,%
%enum_bs,%(%if(%unequal(no,%enum_bs%)%,BS)%)%,%
%enum_bv,%(%if(%unequal(no,%enum_bv%)%,BV)%)%,%
%enum_b,%(%if-then(%enum_bm%,;)%%if-then(%enum_bs%,;)%%enum_bv%)%,%
%enum_f,%(%enum_fields1%)%,%
%%(%if(%file%,%(%include(%filepath%/file-cxx.t)%%
%%if(%hxx%,%(
#ifndef %ifndef%
#define %ifndef%
)%)%
)%)%%parse(%enum_name%,;,,
,%(%apply-x(%
%enum_name,%(%enum_prefix%%enum_name%)%,%
%%(%if(%enum_enum%,%(
/**
 **********************************************************************
 * enum %enum_name%%if(%is_author%%is_date%,%(
 *%if(%is_author%,%(
 * Author: %author%)%)%%if(%is_date%,%(
 *   Date: %date%)%)%)%)%
 **********************************************************************
 */
enum %enum_name%
{%parse(%enum_f%,;,
    %enum_name%_,%(, )%,%(%f%)%,f)%
};)%)%%
%%if(%enum_b%,%(
/**
 ** enum %enum_name%
 **/
%parse(%enum_b%,;,,,%(
/**
 **********************************************************************
 * enum %enum_name%_%b%%if(%is_author%%is_date%,%(
 *%if(%is_author%,%(
 * Author: %author%)%)%%if(%is_date%,%(
 *   Date: %date%)%)%)%)%
 **********************************************************************
 */
enum %enum_name%_%b%
{%parse(%enum_f%,;,
    %enum_name%_,%(, )%,%(%b%_%f%)%,f)%
};)%,b)%)%)%)%)%)%,enum_name)%%
%%if(%h%,%(
#if defined(__cplusplus)
extern "C" {
#endif
)%)%%if(%h%,%(
#if defined(__cplusplus)
}
#endif
)%)%%if(%hxx%,%(
#endif /* %ifndef% */)%)%)%)%