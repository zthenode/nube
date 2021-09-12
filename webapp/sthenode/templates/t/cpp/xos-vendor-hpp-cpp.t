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
%#   File: xos-vendor-hpp-cpp.t
%#
%# Author: $author$
%#   Date: 7/27/2018
%########################################################################
%with(%
%CCComment,%(%else-then(%CCComment%,%(//)%)%)%,%
%NSComment,%(%else-then(%NSComment%,%(%CCComment%)%)%)%,%
%EXPORT_CLASS,%(%else-then(%EXPORT_CLASS%,%(%if-no(%is_export_class%,,_EXPORT_CLASS )%)%)%)%,%
%implements_base,%(%else-then(%implements_base%,%(implement_base)%)%)%,%
%Implements_base,%(%else-then(%Implements_base%,%(%implements_base%)%)%)%,%
%IMPLEMENTS_BASE,%(%else-then(%IMPLEMENTS_BASE%,%(%toupper(%Implements_base%)%)%)%)%,%
%implements_base,%(%else-then(%_Implements_base%,%(%tolower(%Implements_base%)%)%)%)%,%
%extends_base,%(%else-then(%extends_base%,%(base)%)%)%,%
%Extends_base,%(%else-then(%Extends_base%,%(%extends_base%)%)%)%,%
%EXTENDS_BASE,%(%else-then(%EXTENDS_BASE%,%(%toupper(%Extends_base%)%)%)%)%,%
%extends_base,%(%else-then(%_Extends_base%,%(%tolower(%Extends_base%)%)%)%)%,%
%%(%
%%include(%filepath(%input%)%/vendor-hpp-cpp.t)%%
%)%)%