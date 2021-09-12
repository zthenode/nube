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
%#   File: header-css.t
%#
%# Author: $author$
%#   Date: 11/21/2019
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%is_color,%(%else-then(%is_color%,%()%)%)%,%
%color,%(%else-then(%color%,%(gray)%)%)%,%
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
%%(%
%%include(%include_path%/css-file.t)%%
%
/*
** header
** ...
*/
.header {
    width: 100%%;
    height: 42px;
    margin: auto;
    padding: 0px;
    border: 0px;
    border-style: solid;
    border-color: %BColor%;
    border-spacing: 0px 0px;
}
.header-button {
    padding: 0px;
}

/*
** parent
** ...
*/
.parent {
     width: 64px;
     height: 100%%;
     margin: auto;
     text-align: center;
     float: left;
     border: 0px;
     border-style: solid;
     border-color: %BColor%;
     border-spacing: 0px 0px;
}
.parent-button {
     cursor: pointer;
     border: 0px;
     border-style: solid;
     border-color: %BColor%;
     border-spacing: 0px 0px;
     background-color: transparent;
}
.parent-button:hover, .parent-button:focus {
     outline: none;
}
.parent-button:hover .parent-dot, .parent-button:focus .parent-dot {
     background-color: %Hover%;
}
.parent-dots {
    width: 100%%;
    height: 100%%;
    margin: auto;
    border: 0px;
    border-style: solid;
    border-color: %BColor%;
    border-spacing: 4px 20px;
}
.parent-dot {
     width: 8px;
     height: 8px;
     padding: 0px;
     border-radius: 50%%;
     background-color: %BColor%;
}
/*
** ...
** parent
*/

/*
** dropdown
** ...
*/
.dropdown {
     width: 64px;
     height: 100%%;
     margin: auto;
     text-align: center;
     float: right;
     border: 0px;
     border-style: solid;
     border-color: %BColor%;
     border-spacing: 0px 0px;
}
.dropdown-button {
     cursor: pointer;
     border: 0px;
     border-style: solid;
     border-color: %BColor%;
     border-spacing: 0px 0px;
     background-color: transparent;
}
.dropdown-button:hover, .dropdown-button:focus {
     outline: none;
}
.dropdown-button:hover .dropdown-bar, .dropdown-button:focus .dropdown-bar {
     background-color: %Hover%;
}
.dropdown-bars {
    width: 100%%;
    height: 100%%;
    margin: auto;
    border: 0px;
    border-style: solid;
    border-color: %BColor%;
    border-spacing: 4px 4px;
}
.dropdown-bar {
     width: 32px;
     height: 6px;
     padding: 0px;
     border-radius: 3px;
     background-color: black;
}
.dropdown-content {
     border-style: solid;
     border-color: gray;
     border-width: 1px 3px 3px 1px;
     border-radius: 5px 5px 5px 5px;
     background-color: lightgray;
     position: absolute;
     min-width: 160px;
     right: 0;
     z-index: 2;
     display: none;
 }
.dropdown-content a {
     color: black;
     padding: 12px 16px;
     text-decoration: none;
     font-size: 18;  
     display: block;
}
.dropdown-content a:hover {
     color: %Hover%;
     text-decoration: underline;
}
/*
** ...
** dropdown
*/

/*
** ...
** header
*/
%
%)%)%