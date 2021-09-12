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
%#   File: logo-css.t
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
%is_bcolor,%(%else-then(%is_bcolor%,%()%)%)%,%
%bcolor,%(%else-then(%bcolor%,%(gray)%)%)%,%
%BColor,%(%else-then(%BColor%,%(%bcolor%)%)%)%,%
%BCOLOR,%(%else-then(%BCOLOR%,%(%toupper(%BColor%)%)%)%)%,%
%bcolor,%(%else-then(%_BColor%,%(%tolower(%BColor%)%)%)%)%,%
%is_bhover,%(%else-then(%is_bhover%,%()%)%)%,%
%bhover,%(%else-then(%bhover%,%(blue)%)%)%,%
%BHover,%(%else-then(%BHover%,%(%bhover%)%)%)%,%
%BHOVER,%(%else-then(%BHOVER%,%(%toupper(%BHover%)%)%)%)%,%
%bhover,%(%else-then(%_BHover%,%(%tolower(%BHover%)%)%)%)%,%
%is_bdcolor,%(%else-then(%is_bdcolor%,%()%)%)%,%
%bdcolor,%(%else-then(%bdcolor%,%(%BColor%)%)%)%,%
%BDColor,%(%else-then(%BDColor%,%(%bdcolor%)%)%)%,%
%BDCOLOR,%(%else-then(%BDCOLOR%,%(%toupper(%BDColor%)%)%)%)%,%
%bdcolor,%(%else-then(%_BDColor%,%(%tolower(%BDColor%)%)%)%)%,%
%is_bdhover,%(%else-then(%is_bdhover%,%()%)%)%,%
%bdhover,%(%else-then(%bdhover%,%(%BHover%)%)%)%,%
%BDHover,%(%else-then(%BDHover%,%(%bdhover%)%)%)%,%
%BDHOVER,%(%else-then(%BDHOVER%,%(%toupper(%BDHover%)%)%)%)%,%
%bdhover,%(%else-then(%_BDHover%,%(%tolower(%BDHover%)%)%)%)%,%
%is_bgcolor,%(%else-then(%is_bgcolor%,%()%)%)%,%
%bgcolor,%(%else-then(%bgcolor%,%(black)%)%)%,%
%BGColor,%(%else-then(%BGColor%,%(%bgcolor%)%)%)%,%
%BGCOLOR,%(%else-then(%BGCOLOR%,%(%toupper(%BGColor%)%)%)%)%,%
%bgcolor,%(%else-then(%_BGColor%,%(%tolower(%BGColor%)%)%)%)%,%
%is_image,%(%else-then(%is_image%,%()%)%)%,%
%image,%(%else-then(%image%,%(../images/png/aegirde.png)%)%)%,%
%Image,%(%else-then(%Image%,%(%image%)%)%)%,%
%IMAGE,%(%else-then(%IMAGE%,%(%toupper(%Image%)%)%)%)%,%
%image,%(%else-then(%_Image%,%(%tolower(%Image%)%)%)%)%,%
%%(%
%%include(%include_path%/css-file.t)%%
%
/*
** logo
** ...
*/
.logo {
    width: 360px;
    height: 360px;
    position: absolute;
    margin: auto;
    top: 50%%;
    left: 50%%;
    transform: translate(-50%%%(,)% -50%%);
    padding: 0px;
    border-spacing: 0px 0px;
    z-index: 0;
}
.logo-ring { 
    width: 100%%;
    height: 100%%;
    margin: auto;
    padding: 0px;
    border-spacing: 0px 0px;
    background-color: %BDColor%;
    border-radius: 50%%;
    cursor: pointer;
}
.logo-ring:hover {
    background-color: %BDHover%;
}

.logo-circle { 
    width: 330px;
    height: 330px;
    padding: 0px;
    margin: auto;
    border-spacing: 0px 0px;
    background-color: %BGColor%;
    border-radius: 50%%;
}
.logo-background { 
    vertical-align: center;
}
.logo-background-background { 
    width: 90%%;
    height: 90%%;
    padding: 0px;
    margin: auto;
    border-spacing: 0px 0px;
    background-color: %BGColor%;
    border-radius: 50%%;
}
.logo-icon {
    height: 90%%;
    vertical-align: bottom;
}
.logo-icon-icon { 
    width: 80%%;
    height: 100%%;
    margin: auto;
    padding: 0px;
    border-spacing: 0px 0px;
    background-color: %BGColor%;
    border-radius: 50%%;
}
.logo-icon-image {
    background-image: url('%Image%');
    background-repeat: no-repeat;
    background-position: bottom;
    background-size: 100%%;
    border-radius: 50%% 50%% 40px 60px;
}
.logo-label {
    vertical-align: top;
}
.logo-label-label { 
    width: 100%%;
    height: 100%%;
    padding: 0px;
    margin: auto;
    border-spacing: 0px 0px;
}
.logo-label-text {
    font-size: 30px;
    font-weight: bold;
    text-align: center;
    color: %BDColor%;
    opacity: 0;
    transition: .5s ease;                
}
.logo-ring:hover .logo-label-text {
    opacity: 1;
}
/*
** ...
** logo
*/
%
%)%)%