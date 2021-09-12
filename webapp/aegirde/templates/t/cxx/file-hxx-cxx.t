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
%#   File: file-hxx-cxx.t
%#
%# Author: $author$
%#   Date: 10/16/2019
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%is_organization,%(%else-then(%is_organization%,%()%)%)%,%
%organization,%(%else-then(%organization%,%(Organization)%)%)%,%
%Organization,%(%else-then(%Organization%,%(%organization%)%)%)%,%
%ORGANIZATION,%(%else-then(%ORGANIZATION%,%(%toupper(%Organization%)%)%)%)%,%
%organization,%(%else-then(%_Organization%,%(%tolower(%Organization%)%)%)%)%,%
%is_=$organization$author=$author$,%(%else-then(%is_=$organization$author=$author$%,%()%)%)%,%
%=$organization$author=$author$,%(%else-then(%=$organization$author=$author$%,%($organization$Author=$author$)%)%)%,%
%=$organization$Author=$author$,%(%else-then(%=$organization$Author=$author$%,%(%=$organization$author=$author$%)%)%)%,%
%=$ORGANIZATION$AUTHOR=$AUTHOR$,%(%else-then(%=$ORGANIZATION$AUTHOR=$AUTHOR$%,%(%toupper(%=$organization$Author=$author$%)%)%)%)%,%
%=$organization$author=$author$,%(%else-then(%_=$organization$Author=$author$%,%(%tolower(%=$organization$Author=$author$%)%)%)%)%,%
%%(%
%///////////////////////////////////////////////////////////////////////
/// Copyright (c) 1988-%year()% $organization$
///
/// This software is provided by the author and contributors ``as is'' 
/// and any express or implied warranties, including, but not limited to, 
/// the implied warranties of merchantability and fitness for a particular 
/// purpose are disclaimed. In no event shall the author or contributors 
/// be liable for any direct, indirect, incidental, special, exemplary, 
/// or consequential damages (including, but not limited to, procurement 
/// of substitute goods or services; loss of use, data, or profits; or 
/// business interruption) however caused and on any theory of liability, 
/// whether in contract, strict liability, or tort (including negligence 
/// or otherwise) arising in any way out of the use of this software, 
/// even if advised of the possibility of such damage.
///
///   File: %File%
///
/// Author: $author$
///   Date: %date()%
///////////////////////////////////////////////////////////////////////
%
%)%)%