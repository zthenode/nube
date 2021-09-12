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
%#   File: file-js.t
%#
%# Author: $author$
%#   Date: 7/7/2019
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%is_Organization,%(%else-then(%is_Organization%,%()%)%)%,%
%Organization,%(%else-then(%Organization%,%($organization$)%)%)%,%
%is_Author,%(%else-then(%is_Author%,%()%)%)%,%
%Author,%(%else-then(%Author%,%($author$)%)%)%,%
%is_File,%(%else-then(%is_File%,%()%)%)%,%
%File,%(%else-then(%File%,%(js)%)%)%,%
%is_Name,%(%else-then(%is_Name%,%()%)%)%,%
%Name,%(%else-then(%Name%,%(%else-then(%filebase(%File%)%,%File%)%)%)%)%,%
%is_Extension,%(%else-then(%is_Extension%,%()%)%)%,%
%Extension,%(%else-then(%Extension%,%(%else-then(%fileextension(%File%)%,%(js)%)%)%)%)%,%
%%(%
%/*
**********************************************************************
** Copyright (c) 1988-%year()% %Organization%     
** 
** This software is provided by the author and contributors ``as is'' 
** and any express or implied warranties, including, but not limited to, 
** the implied warranties of merchantability and fitness for a particular 
** purpose are disclaimed. In no event shall the author or contributors 
** be liable for any direct, indirect, incidental, special, exemplary, 
** or consequential damages (including, but not limited to, procurement 
** of substitute goods or services; loss of use, data, or profits; or 
** business interruption) however caused and on any theory of liability, 
** whether in contract, strict liability, or tort (including negligence 
** or otherwise) arising in any way out of the use of this software, 
** even if advised of the possibility of such damage.
** 
**   File: %Name%.%Extension%
** 
** Author: %Author%           
**   Date: %date()%
**********************************************************************
*/
%
%)%)%%
