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
%#   File: Application-css.t
%#
%# Author: $author$
%#   Date: 12/28/2020
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
%is_font,%(%else-then(%is_font%,%(%is_Font%)%)%)%,%
%font,%(%else-then(%if-no(%is_font%,,%(%font%)%)%,%(%if-no(%is_font%,,%(Arial)%)%)%)%)%,%
%Font,%(%else-then(%if-no(%is_font%,,%(%Font%)%)%,%(%if-no(%is_font%,,%(%font%)%)%)%)%)%,%
%FONT,%(%else-then(%FONT%,%(%toupper(%Font%)%)%)%)%,%
%font,%(%else-then(%_font%,%(%tolower(%Font%)%)%)%)%,%
%is_bgcolor,%(%else-then(%is_bgcolor%,%(%is_BGColor%)%)%)%,%
%bgcolor,%(%else-then(%if-no(%is_bgcolor%,,%(%bgcolor%)%)%,%(%if-no(%is_bgcolor%,,%(white)%)%)%)%)%,%
%BGColor,%(%else-then(%if-no(%is_bgcolor%,,%(%BGColor%)%)%,%(%if-no(%is_bgcolor%,,%(%bgcolor%)%)%)%)%)%,%
%BGCOLOR,%(%else-then(%BGCOLOR%,%(%toupper(%BGColor%)%)%)%)%,%
%bgcolor,%(%else-then(%_bgcolor%,%(%tolower(%BGColor%)%)%)%)%,%
%is_formbgcolor,%(%else-then(%is_formbgcolor%,%(%is_FormBGColor%)%)%)%,%
%formbgcolor,%(%else-then(%if-no(%is_formbgcolor%,,%(%formbgcolor%)%)%,%(%if-no(%is_formbgcolor%,,%(lightgray)%)%)%)%)%,%
%FormBGColor,%(%else-then(%if-no(%is_formbgcolor%,,%(%FormBGColor%)%)%,%(%if-no(%is_formbgcolor%,,%(%formbgcolor%)%)%)%)%)%,%
%FORMBGCOLOR,%(%else-then(%FORMBGCOLOR%,%(%toupper(%FormBGColor%)%)%)%)%,%
%formbgcolor,%(%else-then(%_formbgcolor%,%(%tolower(%FormBGColor%)%)%)%)%,%
%is_formbdcolor,%(%else-then(%is_formbdcolor%,%(%is_FormBDColor%)%)%)%,%
%formbdcolor,%(%else-then(%if-no(%is_formbdcolor%,,%(%formbdcolor%)%)%,%(%if-no(%is_formbdcolor%,,%(black)%)%)%)%)%,%
%FormBDColor,%(%else-then(%if-no(%is_formbdcolor%,,%(%FormBDColor%)%)%,%(%if-no(%is_formbdcolor%,,%(%formbdcolor%)%)%)%)%)%,%
%FORMBDCOLOR,%(%else-then(%FORMBDCOLOR%,%(%toupper(%FormBDColor%)%)%)%)%,%
%formbdcolor,%(%else-then(%_formbdcolor%,%(%tolower(%FormBDColor%)%)%)%)%,%
%is_fgcolor,%(%else-then(%is_fgcolor%,%(%is_FGColor%)%)%)%,%
%fgcolor,%(%else-then(%if-no(%is_fgcolor%,,%(%fgcolor%)%)%,%(%if-no(%is_fgcolor%,,%(black)%)%)%)%)%,%
%FGColor,%(%else-then(%if-no(%is_fgcolor%,,%(%FGColor%)%)%,%(%if-no(%is_fgcolor%,,%(%fgcolor%)%)%)%)%)%,%
%FGCOLOR,%(%else-then(%FGCOLOR%,%(%toupper(%FGColor%)%)%)%)%,%
%fgcolor,%(%else-then(%_fgcolor%,%(%tolower(%FGColor%)%)%)%)%,%
%is_hoverfgcolor,%(%else-then(%is_hoverfgcolor%,%(%is_HoverFGColor%)%)%)%,%
%hoverfgcolor,%(%else-then(%if-no(%is_hoverfgcolor%,,%(%hoverfgcolor%)%)%,%(%if-no(%is_hoverfgcolor%,,%(red)%)%)%)%)%,%
%HoverFGColor,%(%else-then(%if-no(%is_hoverfgcolor%,,%(%HoverFGColor%)%)%,%(%if-no(%is_hoverfgcolor%,,%(%hoverfgcolor%)%)%)%)%)%,%
%HOVERFGCOLOR,%(%else-then(%HOVERFGCOLOR%,%(%toupper(%HoverFGColor%)%)%)%)%,%
%hoverfgcolor,%(%else-then(%_hoverfgcolor%,%(%tolower(%HoverFGColor%)%)%)%)%,%
%%(%
%%include(%Include_path%/file-css.t)%%
%
.body {
    width: 100%;
    height: 100%;
    margin: 0px;
    font-family: %Font%;
    background-color: %BGColor%;
    background-image: url('../images/%Application%.jpg');
    background-attachment: fixed;
    background-repeat: no-repeat;
    background-position: center;
    background-size: 100% 100%;
}
body { 
    font-family: %Font%; 
}

.form { 
    background-color: %FormBGColor%; 
}
form {
    border-style: solid;
    border-color: %FormBDColor%;
    border-width: 0px 0px 0px 0px;
    position: relative;
    z-index: 1;
}
form table td { 
    white-space: nowrap; 
    padding: 0px 10px 0px 0px; 
}

.table { 
    white-space: nowrap; 
}

a { 
    color: %FGColor%; 
    font-weight: bolder; 
    text-decoration: none; 
}
a:hover { 
    color: %HoverFGColor%; 
    font-weight: bolder; 
    text-decoration: underline; 
}
%
%)%)%