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
%#   File: body-logo-css.t
%#
%# Author: $author$
%#   Date: 11/24/2019
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%is_color,%(%else-then(%is_color%,%()%)%)%,%
%color,%(%else-then(%color%,%(black)%)%)%,%
%Color,%(%else-then(%Color%,%(%color%)%)%)%,%
%COLOR,%(%else-then(%COLOR%,%(%toupper(%Color%)%)%)%)%,%
%color,%(%else-then(%_Color%,%(%tolower(%Color%)%)%)%)%,%
%is_bgcolor,%(%else-then(%is_bgcolor%,%()%)%)%,%
%bgcolor,%(%else-then(%bgcolor%,%(white)%)%)%,%
%BGColor,%(%else-then(%BGColor%,%(%bgcolor%)%)%)%,%
%BGCOLOR,%(%else-then(%BGCOLOR%,%(%toupper(%BGColor%)%)%)%)%,%
%bgcolor,%(%else-then(%_BGColor%,%(%tolower(%BGColor%)%)%)%)%,%
%is_width,%(%else-then(%is_width%,%()%)%)%,%
%width,%(%else-then(%width%,%(100%%)%)%)%,%
%Width,%(%else-then(%Width%,%(%width%)%)%)%,%
%WIDTH,%(%else-then(%WIDTH%,%(%toupper(%Width%)%)%)%)%,%
%width,%(%else-then(%_Width%,%(%tolower(%Width%)%)%)%)%,%
%is_height,%(%else-then(%is_height%,%()%)%)%,%
%height,%(%else-then(%height%,%(%Width%)%)%)%,%
%Height,%(%else-then(%Height%,%(%height%)%)%)%,%
%HEIGHT,%(%else-then(%HEIGHT%,%(%toupper(%Height%)%)%)%)%,%
%height,%(%else-then(%_Height%,%(%tolower(%Height%)%)%)%)%,%
%is_bgwidth,%(%else-then(%is_bgwidth%,%()%)%)%,%
%bgwidth,%(%else-then(%bgwidth%,%(400px)%)%)%,%
%BGWidth,%(%else-then(%BGWidth%,%(%bgwidth%)%)%)%,%
%BGWIDTH,%(%else-then(%BGWIDTH%,%(%toupper(%BGWidth%)%)%)%)%,%
%bgwidth,%(%else-then(%_BGWidth%,%(%tolower(%BGWidth%)%)%)%)%,%
%is_bgheight,%(%else-then(%is_bgheight%,%()%)%)%,%
%bgheight,%(%else-then(%bgheight%,%(%BGWidth%)%)%)%,%
%BGHeight,%(%else-then(%BGHeight%,%(%bgheight%)%)%)%,%
%BGHEIGHT,%(%else-then(%BGHEIGHT%,%(%toupper(%BGHeight%)%)%)%)%,%
%bgheight,%(%else-then(%_BGHeight%,%(%tolower(%BGHeight%)%)%)%)%,%
%is_bgimage,%(%else-then(%is_bgimage%,%()%)%)%,%
%bgimage,%(%else-then(%bgimage%,%(../images/jpeg/Logo.jpeg)%)%)%,%
%BGImage,%(%else-then(%BGImage%,%(%bgimage%)%)%)%,%
%BGIMAGE,%(%else-then(%BGIMAGE%,%(%toupper(%BGImage%)%)%)%)%,%
%bgimage,%(%else-then(%_BGImage%,%(%tolower(%BGImage%)%)%)%)%,%
%%(%
%%include(%include_path%/css-file.t)%%
%
/*
** .body-logo
** ...
*/
.body-logo {
    width: %Width%;
    height: %Height%;
    padding: 0px 0px 0px 0px;
    border-spacing: 0px 0px 0px 0px;
    background-color: %BGColor%;
}
.body-logo-icon {
    width: %BGWidth%;
    height: %BGHeight%;
    margin: auto;
    padding: 0px 0px 0px 0px;
    border-spacing: 0px 0px 0px 0px;
}
.body-logo-icon-image { 
    background-image: url('%BGImage%');
    background-repeat: no-repeat;
    background-position: center;
    background-size: %BGWidth% %BGHeight%;
    vertical-align: bottom;
}
/*
** ...
** .body-logo
*/
%
%)%)%