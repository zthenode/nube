%########################################################################
%# Copyright (c) 1988-2018 $organization$
%#
%# This software is provided by the author and contributors ``as is'' 
%# and any express or implied warranties, including, but not limited to, 
%# the implied warranties of merchantability and fitness for a particular 
%# purpose are disclaimed. In no event shall the author or contributors 
%# be liable for any direct, indirect, incidental, special, exemplary, 
%# or consequential damages (including, but not limited to, procurement 
%# of substitute goods or services; loss of use, data, or profits; or 
%# business interruption) however caused and on any theory of liability, 
%# whether in contract, strict liability, or tort (including negligence 
%# or otherwise) arising in any way out of the use of this software, 
%# even if advised of the possibility of such damage.
%#
%#   File: hpp-cpp.t
%#
%# Author: $author$
%#   Date: 4/13/2018
%########################################################################
%with(%
%vendor,%(%else-then(%if-no(%is_vendor%,,%vendor%)%,%(%if-no(%is_vendor%,,xos)%)%)%)%,%
%Vendor,%(%else-then(%Vendor%,%(%vendor%)%)%)%,%
%Vendor,%(%if-then(%Vendor%,%(-)%)%)%,%
%VENDOR,%(%else-then(%VENDOR%,%(%toupper(%Vendor%)%)%)%)%,%
%vendor,%(%else-then(%_Vendor%,%(%tolower(%Vendor%)%)%)%)%,%
%organization,%(%else-then(%organization%,%($organization$)%)%)%,%
%Organization,%(%else-then(%Organization%,%(%organization%)%)%)%,%
%ORGANIZATION,%(%else-then(%ORGANIZATION%,%(%toupper(%Organization%)%)%)%)%,%
%organization,%(%else-then(%_Organization%,%(%tolower(%Organization%)%)%)%)%,%
%author,%(%else-then(%author%,%($author$)%)%)%,%
%Author,%(%else-then(%Author%,%(%author%)%)%)%,%
%AUTHOR,%(%else-then(%AUTHOR%,%(%toupper(%Author%)%)%)%)%,%
%author,%(%else-then(%_Author%,%(%tolower(%Author%)%)%)%)%,%
%%(%
%%include(%filepath(%input%)%/%Vendor%vendor-hpp-cpp.t)%%
%)%)%