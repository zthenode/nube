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
%#   File: menubar-css.t
%#
%# Author: $author$
%#   Date: 11/21/2019
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%is_color,%(%else-then(%is_color%,%()%)%)%,%
%color,%(%else-then(%color%,%(black)%)%)%,%
%Color,%(%else-then(%Color%,%(%color%)%)%)%,%
%COLOR,%(%else-then(%COLOR%,%(%toupper(%Color%)%)%)%)%,%
%color,%(%else-then(%_Color%,%(%tolower(%Color%)%)%)%)%,%
%is_hover,%(%else-then(%is_hover%,%()%)%)%,%
%hover,%(%else-then(%hover%,%(blue)%)%)%,%
%Hover,%(%else-then(%Hover%,%(%hover%)%)%)%,%
%HOVER,%(%else-then(%HOVER%,%(%toupper(%Hover%)%)%)%)%,%
%hover,%(%else-then(%_Hover%,%(%tolower(%Hover%)%)%)%)%,%
%is_bcolor,%(%else-then(%is_bcolor%,%()%)%)%,%
%bcolor,%(%else-then(%bcolor%,%(black)%)%)%,%
%BColor,%(%else-then(%BColor%,%(%bcolor%)%)%)%,%
%BCOLOR,%(%else-then(%BCOLOR%,%(%toupper(%BColor%)%)%)%)%,%
%bcolor,%(%else-then(%_BColor%,%(%tolower(%BColor%)%)%)%)%,%
%is_bgcolor,%(%else-then(%is_bgcolor%,%()%)%)%,%
%bgcolor,%(%else-then(%bgcolor%,%(lightgray)%)%)%,%
%BGColor,%(%else-then(%BGColor%,%(%bgcolor%)%)%)%,%
%BGCOLOR,%(%else-then(%BGCOLOR%,%(%toupper(%BGColor%)%)%)%)%,%
%bgcolor,%(%else-then(%_BGColor%,%(%tolower(%BGColor%)%)%)%)%,%
%%(%
%%include(%include_path%/css-file.t)%%
%
/*
** menubar
** ...
*/
.menubar {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: %BGColor%;
  border-style: solid;
  border-color: %BColor%;
  border-width: 1px 0px 0px 0px;
  position: relative;
  z-index: 1;
}
.menubar li {
  float: left;
}
.menubar li a {
  display: block;
  color: %Color%;
  text-align: center;
  padding: 14px 16px;
  font-size: 18;  
  text-decoration: none;
}
.menubar li a:hover {
  color: %Hover%;
  text-decoration: underline;
}
/*
** ...
** menubar
*/
%
%)%)%