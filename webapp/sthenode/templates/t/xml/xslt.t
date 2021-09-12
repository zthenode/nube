%########################################################################
%# Copyright (c) 1988-2019 $organization$
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
%#   File: xslt.t
%#
%# Author: $author$
%#   Date: 10/14/2019
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%is_Organization,%(%else-then(%is_Organization%,%()%)%)%,%
%Organization,%(%else-then(%Organization%,%(Organization)%)%)%,%
%ORGANIZATION,%(%else-then(%ORGANIZATION%,%(%toupper(%Organization%)%)%)%)%,%
%organization,%(%else-then(%_Organization%,%(%tolower(%Organization%)%)%)%)%,%
%is_Author,%(%else-then(%is_Author%,%()%)%)%,%
%Author,%(%else-then(%Author%,%(Author)%)%)%,%
%AUTHOR,%(%else-then(%AUTHOR%,%(%toupper(%Author%)%)%)%)%,%
%author,%(%else-then(%_Author%,%(%tolower(%Author%)%)%)%)%,%
%is_File,%(%else-then(%is_File%,%()%)%)%,%
%File,%(%else-then(%File%,%(File)%)%)%,%
%FILE,%(%else-then(%FILE%,%(%toupper(%File%)%)%)%)%,%
%file,%(%else-then(%_File%,%(%tolower(%File%)%)%)%)%,%
%is_Name,%(%else-then(%is_Name%,%()%)%)%,%
%Name,%(%else-then(%Name%,%(Name)%)%)%,%
%NAME,%(%else-then(%NAME%,%(%toupper(%Name%)%)%)%)%,%
%name,%(%else-then(%_Name%,%(%tolower(%Name%)%)%)%)%,%
%is_Extension,%(%else-then(%is_Extension%,%()%)%)%,%
%Extension,%(%else-then(%Extension%,%(Extension)%)%)%,%
%EXTENSION,%(%else-then(%EXTENSION%,%(%toupper(%Extension%)%)%)%)%,%
%extension,%(%else-then(%_Extension%,%(%tolower(%Extension%)%)%)%)%,%
%%(%
%%include(%include_path%)%%
%)%)%