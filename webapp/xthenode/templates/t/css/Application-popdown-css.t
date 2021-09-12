%########################################################################
%# Copyright (c) 1988-2020 $organization$
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
%#   File: Application-popdown-css.t
%#
%# Author: $author$
%#   Date: 2/18/2020
%########################################################################
%with(%
%is_include_path,%(%else-then(%is_include_path%,%(%is_Include_path%)%)%)%,%
%include_path,%(%else-then(%if-no(%is_include_path%,,%(%include_path%)%)%,%(%if-no(%is_include_path%,,%(%filepath(%input%)%)%)%)%)%)%,%
%Include_path,%(%else-then(%if-no(%is_include_path%,,%(%Include_path%)%)%,%(%if-no(%is_include_path%,,%(%include_path%)%)%)%)%)%,%
%INCLUDE_PATH,%(%else-then(%INCLUDE_PATH%,%(%toupper(%Include_path%)%)%)%)%,%
%include_path,%(%else-then(%_include_path%,%(%tolower(%Include_path%)%)%)%)%,%
%is_application,%(%else-then(%is_application%,%(%is_Application%)%)%)%,%
%application,%(%else-then(%if-no(%is_application%,,%(%application%)%)%,%(%if-no(%is_application%,,%(Application)%)%)%)%)%,%
%Application,%(%else-then(%if-no(%is_application%,,%(%Application%)%)%,%(%if-no(%is_application%,,%(%application%)%)%)%)%)%,%
%APPLICATION,%(%else-then(%APPLICATION%,%(%toupper(%Application%)%)%)%)%,%
%application,%(%else-then(%_application%,%(%tolower(%Application%)%)%)%)%,%
%is_boadercolor,%(%else-then(%is_boadercolor%,%(%is_BoaderColor%)%)%)%,%
%boadercolor,%(%else-then(%if-no(%is_boadercolor%,,%(%boadercolor%)%)%,%(%if-no(%is_boadercolor%,,%(black)%)%)%)%)%,%
%BoaderColor,%(%else-then(%if-no(%is_boadercolor%,,%(%BoaderColor%)%)%,%(%if-no(%is_boadercolor%,,%(%boadercolor%)%)%)%)%)%,%
%BOADERCOLOR,%(%else-then(%BOADERCOLOR%,%(%toupper(%BoaderColor%)%)%)%)%,%
%boadercolor,%(%else-then(%_boadercolor%,%(%tolower(%BoaderColor%)%)%)%)%,%
%is_color,%(%else-then(%is_color%,%(%is_Color%)%)%)%,%
%color,%(%else-then(%if-no(%is_color%,,%(%color%)%)%,%(%if-no(%is_color%,,%(black)%)%)%)%)%,%
%Color,%(%else-then(%if-no(%is_color%,,%(%Color%)%)%,%(%if-no(%is_color%,,%(%color%)%)%)%)%)%,%
%COLOR,%(%else-then(%COLOR%,%(%toupper(%Color%)%)%)%)%,%
%color,%(%else-then(%_color%,%(%tolower(%Color%)%)%)%)%,%
%is_hover,%(%else-then(%is_hover%,%(%is_Hover%)%)%)%,%
%hover,%(%else-then(%if-no(%is_hover%,,%(%hover%)%)%,%(%if-no(%is_hover%,,%(Teal)%)%)%)%)%,%
%Hover,%(%else-then(%if-no(%is_hover%,,%(%Hover%)%)%,%(%if-no(%is_hover%,,%(%hover%)%)%)%)%)%,%
%HOVER,%(%else-then(%HOVER%,%(%toupper(%Hover%)%)%)%)%,%
%hover,%(%else-then(%_hover%,%(%tolower(%Hover%)%)%)%)%,%
%is_bgcolor,%(%else-then(%is_bgcolor%,%(%is_BGColor%)%)%)%,%
%bgcolor,%(%else-then(%if-no(%is_bgcolor%,,%(%bgcolor%)%)%,%(%if-no(%is_bgcolor%,,%(lightgray)%)%)%)%)%,%
%BGColor,%(%else-then(%if-no(%is_bgcolor%,,%(%BGColor%)%)%,%(%if-no(%is_bgcolor%,,%(%bgcolor%)%)%)%)%)%,%
%BGCOLOR,%(%else-then(%BGCOLOR%,%(%toupper(%BGColor%)%)%)%)%,%
%bgcolor,%(%else-then(%_bgcolor%,%(%tolower(%BGColor%)%)%)%)%,%
%is_bghover,%(%else-then(%is_bghover%,%(%is_BGHover%)%)%)%,%
%bghover,%(%else-then(%if-no(%is_bghover%,,%(%bghover%)%)%,%(%if-no(%is_bghover%,,%(lightgray)%)%)%)%)%,%
%BGHover,%(%else-then(%if-no(%is_bghover%,,%(%BGHover%)%)%,%(%if-no(%is_bghover%,,%(%bghover%)%)%)%)%)%,%
%BGHOVER,%(%else-then(%BGHOVER%,%(%toupper(%BGHover%)%)%)%)%,%
%bghover,%(%else-then(%_bghover%,%(%tolower(%BGHover%)%)%)%)%,%
%is_bdcolor,%(%else-then(%is_bdcolor%,%(%is_BDColor%)%)%)%,%
%bdcolor,%(%else-then(%if-no(%is_bdcolor%,,%(%bdcolor%)%)%,%(%if-no(%is_bdcolor%,,%(gray)%)%)%)%)%,%
%BDColor,%(%else-then(%if-no(%is_bdcolor%,,%(%BDColor%)%)%,%(%if-no(%is_bdcolor%,,%(%bdcolor%)%)%)%)%)%,%
%BDCOLOR,%(%else-then(%BDCOLOR%,%(%toupper(%BDColor%)%)%)%)%,%
%bdcolor,%(%else-then(%_bdcolor%,%(%tolower(%BDColor%)%)%)%)%,%
%is_bdhover,%(%else-then(%is_bdhover%,%(%is_BDHover%)%)%)%,%
%bdhover,%(%else-then(%if-no(%is_bdhover%,,%(%bdhover%)%)%,%(%if-no(%is_bdhover%,,%(black)%)%)%)%)%,%
%BDHover,%(%else-then(%if-no(%is_bdhover%,,%(%BDHover%)%)%,%(%if-no(%is_bdhover%,,%(%bdhover%)%)%)%)%)%,%
%BDHOVER,%(%else-then(%BDHOVER%,%(%toupper(%BDHover%)%)%)%)%,%
%bdhover,%(%else-then(%_bdhover%,%(%tolower(%BDHover%)%)%)%)%,%
%is_name,%(%else-then(%is_name%,%(%is_Name%)%)%)%,%
%name,%(%else-then(%if-no(%is_name%,,%(%name%)%)%,%(%if-no(%is_name%,,%(%Application%-popdown)%)%)%)%)%,%
%Name,%(%else-then(%if-no(%is_name%,,%(%Name%)%)%,%(%if-no(%is_name%,,%(%name%)%)%)%)%)%,%
%NAME,%(%else-then(%NAME%,%(%toupper(%Name%)%)%)%)%,%
%name,%(%else-then(%_name%,%(%tolower(%Name%)%)%)%)%,%
%%(%
%%include(%Include_path%/file-css.t)%%
%
/*
** popdown
** ...
*/
.popdown {
     width: 64px;
     height: 100%%;
     margin: auto;
     border: 0px;
     border-style: solid;
     border-color: %BoaderColor%;
     border-spacing: 0px 0px;
     text-align: center;
     float: right;
}
.popdown-button {
     margin: auto;
     border: 0px;
     border-style: solid;
     border-color: %BoaderColor%;
     border-spacing: 0px 0px;
     background-color: transparent;
     cursor: pointer;
}
.popdown-button:hover, .popdown-button:focus {
     outline: none;
}
.popdown-button:hover .popdown-dot, .popdown-button:focus .popdown-dot {
     background-color: %Hover%;
}
.popdown-dots {
    width: 100%%;
    height: 100%%;
    margin: auto;
    border: 0px;
    border-style: solid;
    border-color: %BoaderColor%;
    border-spacing: 4px 4px;
}
.popdown-dot {
     width: 7px;
     height: 7px;
     padding: 0px;
     border-radius: 4px;
     background-color: %Color%;
}
.popdown-content {
     padding: 0px;
     border-spacing: 0px 0px;
     border-style: solid;
     border-color: %BDColor%;
     border-width: 1px 3px 3px 1px;
     border-radius: 5px 5px 5px 5px;
     background-color: %BGColor%;
     position: absolute;
     min-width: 160px;
     right: 0;
     z-index: 2;
     display: none;
 }
.popdown-content a {
     color: black;
     padding: 12px 16px;
     border-spacing: 0px 0px;
     text-decoration: none;
     font-size: 18;  
     display: block;
}
.popdown-content a:hover {
     color: %Color%;
     text-decoration: underline;
}
/*
** ...
** popdown
*/
%
%)%)%