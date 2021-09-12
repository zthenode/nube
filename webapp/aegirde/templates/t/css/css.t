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
%#   File: css.t
%#
%# Author: $author$
%#   Date: 10/16/2019
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%is_html,%(%else-then(%is_html%,%()%)%)%,%
%html,%(%else-then(%html%,%(%equal(%content_type%,text/html)%)%)%)%,%
%Html,%(%else-then(%Html%,%(%html%)%)%)%,%
%HTML,%(%else-then(%HTML%,%(%toupper(%Html%)%)%)%)%,%
%html,%(%else-then(%_Html%,%(%tolower(%Html%)%)%)%)%,%
%is_imagepath,%(%else-then(%is_imagepath%,%()%)%)%,%
%imagepath,%(%else-then(%imagepath%,%(%if(%html%,%(../../)%)%)%)%)%,%
%ImagePath,%(%else-then(%ImagePath%,%(%imagepath%)%)%)%,%
%IMAGEPATH,%(%else-then(%IMAGEPATH%,%(%toupper(%ImagePath%)%)%)%)%,%
%imagepath,%(%else-then(%_ImagePath%,%(%tolower(%ImagePath%)%)%)%)%,%
%is_bodyfont,%(%else-then(%is_bodyfont%,%()%)%)%,%
%bodyfont,%(%else-then(%bodyfont%,%(Arial)%)%)%,%
%BodyFont,%(%else-then(%BodyFont%,%(%bodyfont%)%)%)%,%
%BODYFONT,%(%else-then(%BODYFONT%,%(%toupper(%BodyFont%)%)%)%)%,%
%bodyfont,%(%else-then(%_BodyFont%,%(%tolower(%BodyFont%)%)%)%)%,%
%is_bodyfg,%(%else-then(%is_bodyfg%,%()%)%)%,%
%bodyfg,%(%else-then(%bodyfg%,%(black)%)%)%,%
%BodyFG,%(%else-then(%BodyFG%,%(%bodyfg%)%)%)%,%
%BODYFG,%(%else-then(%BODYFG%,%(%toupper(%BodyFG%)%)%)%)%,%
%bodyfg,%(%else-then(%_BodyFG%,%(%tolower(%BodyFG%)%)%)%)%,%
%is_bodybg,%(%else-then(%is_bodybg%,%()%)%)%,%
%bodybg,%(%else-then(%bodybg%,%(white)%)%)%,%
%BodyBG,%(%else-then(%BodyBG%,%(%bodybg%)%)%)%,%
%BODYBG,%(%else-then(%BODYBG%,%(%toupper(%BodyBG%)%)%)%)%,%
%bodybg,%(%else-then(%_BodyBG%,%(%tolower(%BodyBG%)%)%)%)%,%
%is_bodyimage,%(%else-then(%is_bodyimage%,%()%)%)%,%
%bodyimage,%(%else-then(%bodyimage%,%(../images/jpeg/sea.jpg)%)%)%,%
%BodyImage,%(%else-then(%BodyImage%,%(%bodyimage%)%)%)%,%
%BODYIMAGE,%(%else-then(%BODYIMAGE%,%(%toupper(%BodyImage%)%)%)%)%,%
%bodyimage,%(%else-then(%_BodyImage%,%(%tolower(%BodyImage%)%)%)%)%,%
%is_formfg,%(%else-then(%is_formfg%,%()%)%)%,%
%formfg,%(%else-then(%formfg%,%(black)%)%)%,%
%FormFG,%(%else-then(%FormFG%,%(%formfg%)%)%)%,%
%FORMFG,%(%else-then(%FORMFG%,%(%toupper(%FormFG%)%)%)%)%,%
%formfg,%(%else-then(%_FormFG%,%(%tolower(%FormFG%)%)%)%)%,%
%is_formbg,%(%else-then(%is_formbg%,%()%)%)%,%
%formbg,%(%else-then(%formbg%,%(lightgray)%)%)%,%
%FormBG,%(%else-then(%FormBG%,%(%formbg%)%)%)%,%
%FORMBG,%(%else-then(%FORMBG%,%(%toupper(%FormBG%)%)%)%)%,%
%formbg,%(%else-then(%_FormBG%,%(%tolower(%FormBG%)%)%)%)%,%
%is_formbd,%(%else-then(%is_formbd%,%()%)%)%,%
%formbd,%(%else-then(%formbd%,%(black)%)%)%,%
%FormBD,%(%else-then(%FormBD%,%(%formbd%)%)%)%,%
%FORMBD,%(%else-then(%FORMBD%,%(%toupper(%FormBD%)%)%)%)%,%
%formbd,%(%else-then(%_FormBD%,%(%tolower(%FormBD%)%)%)%)%,%
%is_formhover,%(%else-then(%is_formhover%,%()%)%)%,%
%formhover,%(%else-then(%formhover%,%(blue)%)%)%,%
%FormHover,%(%else-then(%FormHover%,%(%formhover%)%)%)%,%
%FORMHOVER,%(%else-then(%FORMHOVER%,%(%toupper(%FormHover%)%)%)%)%,%
%formhover,%(%else-then(%_FormHover%,%(%tolower(%FormHover%)%)%)%)%,%
%%(%
%%if(%html%,%(<html><head><style>)%)%%
%%include(%include_path%/css-file.t)%%
%
/*
** body
** ...
*/
body { 
    font-family: %BodyFont%; 
}
.body {
    width: 100%%;
    height: 100%%;
    margin: 0px;
    font-family: %BodyFont%;
    color: %BodyFG%;
    background-color: %BodyBG%;
    background-image: url('%ImagePath%%BodyImage%');
    background-repeat: no-repeat;
    background-position: center;
    background-size: 100%% 100%%;
}
/*
** ...
** body
*/

/*
** form 
** ...
*/
form {
    border-style: solid;
    border-color: %FormBD%;
    border-width: 1px 0px 1px 0px;
    position: relative;
    z-index: 1;
}
form pre {
    margin: 0;
}
form table td { 
    white-space: nowrap; 
    padding: 0px 10px 0px 0px; 
}
.form { 
    color: %FormFG%;
    background-color: %FormBG%; 
}
/*
** ...
** form
*/

/*
** global
** ...
*/
a { 
    color: black; 
    font-weight: bolder; 
    text-decoration: none; 
}
a:hover { 
    color: %FormHover%; 
    font-weight: bolder; 
    text-decoration: underline; 
}
.table { 
    white-space: nowrap; 
}
/*
** ...
** global
*/
%if(%html%,%(</style></head><body class="body">
<form class="form">
<table><tr><td>
<a href="here">here</a></td></tr>
</table></form>
</body></html>)%)%%
%)%)%