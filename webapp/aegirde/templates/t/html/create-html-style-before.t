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
%#   File: create-html-style-before.t
%#
%# Author: $author$
%#   Date: 11/25/2019
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%%(%
%<link rel="stylesheet" type="%StyleType%" href="../css/%Framework%-header.css"></link>
        <link rel="stylesheet" type="%StyleType%" href="../css/%Framework%-dropdown.css"></link>
        <link rel="stylesheet" type="%StyleType%" href="../css/%Framework%-menubar.css"></link>
        <link rel="stylesheet" type="%StyleType%" href="../css/%Framework%-logo.css"></link>
        %
%)%)%