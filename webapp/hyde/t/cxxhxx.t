%#############################################################################
%# Copyright (c) 1988-2006 $author$.
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
%#   File: cxxhxx.t
%#
%# Author: $author$
%#   Date: 1/18/2006
%#
%#    $Id$
%#
%#############################################################################
%apply-x(%
%filetypeextension,%(%else-then(%filetype%,hxx)%)%,%
%filetype,%(%else-then(%equal(cxx,%filetype%)%,hxx)%)%,%
%filepath,%(%filepath(%input%)%)%,%
%file,%(%else-then(%file%,%output%)%)%,%
%filename,%(%filename(%file%)%)%,%
%fileextension,%(%fileextension(%filename%)%)%,%
%file,%(%if-then(%file%,%(%else(%fileextension%,.%filetypeextension%)%)%)%)%,%
%filepath,%filepath(%input%)%,%
%%(%include(%filepath%/%filetype%.t)%)%)%
