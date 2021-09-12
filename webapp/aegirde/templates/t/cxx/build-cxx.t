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
%#   File: build-cxx.t
%#
%# Author: $author$
%#   Date: 10/17/2019
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%is_platform,%(%else-then(%is_platform%,%()%)%)%,%
%platform,%(%else-then(%platform%,%(Win32)%)%)%,%
%Platform,%(%else-then(%Platform%,%(%platform%)%)%)%,%
%PLATFORM,%(%else-then(%PLATFORM%,%(%toupper(%Platform%)%)%)%)%,%
%platform,%(%else-then(%_Platform%,%(%tolower(%Platform%)%)%)%)%,%
%%(%
%
///
/// Define %PLATFORM% if any of the %Platform% variants are defined
///
#if defined(%PLATFORM%) || defined(_%PLATFORM%) || defined(__%PLATFORM%__) || defined(__%Platform%__) || defined(__%platform%__)
#if !defined(%PLATFORM%)
#define %PLATFORM%
#endif /// !defined(%PLATFORM%)
#endif /// defined(%PLATFORM%) || defined(_%PLATFORM%) || defined(__%PLATFORM%__) || defined(__%Platform%__) || defined(__%platform%__)
%
%)%)%