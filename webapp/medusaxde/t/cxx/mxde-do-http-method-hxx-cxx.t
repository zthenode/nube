%########################################################################
%# Copyright (c) 1988-2014 $organization$
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
%#   File: mxde-do-http-method-hxx-cxx.t
%#
%# Author: $author$
%#   Date: 2/23/2014
%########################################################################
%with(%
%filepath,%(%else-then(%filepath%,%(%filepath(%input%)%)%)%)%,%
%hxx_cxx_includefile,%(%else(%hxx_cxx_fileinclude%,%(%filepath%/mxde-do-http-method-hxx-cxx.t)%)%)%,%
%%(%
%%if(%hxx_cxx_includefile%,%(%
%%include(%filepath%/mxde-hxx-cxx.t)%%
%)%,%(%
%%include(%filepath%/mxde-do-http-method-%file_type%-%file_type%.t)%%
%)%)%%
%)%)%