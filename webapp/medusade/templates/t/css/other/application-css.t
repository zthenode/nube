%########################################################################
%# Copyright (c) 1988-2021 $organization$
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
%#   File: application-css.t
%#
%# Author: $author$
%#   Date: 3/25/2021
%########################################################################
%with(%
%is_include_path,%(%else-then(%is_include_path%,%(%is_Include_path%)%)%)%,%
%include_path,%(%else-then(%if-no(%is_include_path%,,%(%include_path%)%)%,%(%if-no(%is_include_path%,,%(%filepath(%input%)%/..)%)%)%)%)%,%
%Include_path,%(%else-then(%if-no(%is_include_path%,,%(%Include_path%)%)%,%(%if-no(%is_include_path%,,%(%include_path%)%)%)%)%)%,%
%INCLUDE_PATH,%(%else-then(%INCLUDE_PATH%,%(%toupper(%Include_path%)%)%)%)%,%
%include_path,%(%else-then(%_include_path%,%(%tolower(%Include_path%)%)%)%)%,%
%is_application,%(%else-then(%is_application%,%(%is_Application%)%)%)%,%
%application,%(%else-then(%if-no(%is_application%,,%(%application%)%)%,%(%if-no(%is_application%,,%(Application)%)%)%)%)%,%
%Application,%(%else-then(%if-no(%is_application%,,%(%Application%)%)%,%(%if-no(%is_application%,,%(%application%)%)%)%)%)%,%
%APPLICATION,%(%else-then(%APPLICATION%,%(%toupper(%Application%)%)%)%)%,%
%application,%(%else-then(%_application%,%(%tolower(%Application%)%)%)%)%,%
%is_file,%(%else-then(%is_file%,%(%is_File%)%)%)%,%
%file,%(%else-then(%if-no(%is_file%,,%(%file%)%)%,%(%if-no(%is_file%,,%(%else-then(%File%,%Application%)%)%)%)%)%)%,%
%File,%(%else-then(%if-no(%is_file%,,%(%File%)%)%,%(%if-no(%is_file%,,%(%file%)%)%)%)%)%,%
%FILE,%(%else-then(%FILE%,%(%toupper(%File%)%)%)%)%,%
%file,%(%else-then(%_file%,%(%tolower(%File%)%)%)%)%,%
%is_background_color,%(%else-then(%is_background_color%,%(%is_Background_color%)%)%)%,%
%background_color,%(%else-then(%if-no(%is_background_color%,,%(%background_color%)%)%,%(%if-no(%is_background_color%,,%(white)%)%)%)%)%,%
%Background_color,%(%else-then(%if-no(%is_background_color%,,%(%Background_color%)%)%,%(%if-no(%is_background_color%,,%(%background_color%)%)%)%)%)%,%
%BACKGROUND_COLOR,%(%else-then(%BACKGROUND_COLOR%,%(%toupper(%Background_color%)%)%)%)%,%
%background_color,%(%else-then(%_background_color%,%(%tolower(%Background_color%)%)%)%)%,%
%is_forground_color,%(%else-then(%is_forground_color%,%(%is_Forground_color%)%)%)%,%
%forground_color,%(%else-then(%if-no(%is_forground_color%,,%(%forground_color%)%)%,%(%if-no(%is_forground_color%,,%(black)%)%)%)%)%,%
%Forground_color,%(%else-then(%if-no(%is_forground_color%,,%(%Forground_color%)%)%,%(%if-no(%is_forground_color%,,%(%forground_color%)%)%)%)%)%,%
%FORGROUND_COLOR,%(%else-then(%FORGROUND_COLOR%,%(%toupper(%Forground_color%)%)%)%)%,%
%forground_color,%(%else-then(%_forground_color%,%(%tolower(%Forground_color%)%)%)%)%,%
%is_hover_color,%(%else-then(%is_hover_color%,%(%is_Hover_color%)%)%)%,%
%hover_color,%(%else-then(%if-no(%is_hover_color%,,%(%hover_color%)%)%,%(%if-no(%is_hover_color%,,%(teal)%)%)%)%)%,%
%Hover_color,%(%else-then(%if-no(%is_hover_color%,,%(%Hover_color%)%)%,%(%if-no(%is_hover_color%,,%(%hover_color%)%)%)%)%)%,%
%HOVER_COLOR,%(%else-then(%HOVER_COLOR%,%(%toupper(%Hover_color%)%)%)%)%,%
%hover_color,%(%else-then(%_hover_color%,%(%tolower(%Hover_color%)%)%)%)%,%
%is_border_color,%(%else-then(%is_border_color%,%(%is_Border_color%)%)%)%,%
%border_color,%(%else-then(%if-no(%is_border_color%,,%(%border_color%)%)%,%(%if-no(%is_border_color%,,%(black)%)%)%)%)%,%
%Border_color,%(%else-then(%if-no(%is_border_color%,,%(%Border_color%)%)%,%(%if-no(%is_border_color%,,%(%border_color%)%)%)%)%)%,%
%BORDER_COLOR,%(%else-then(%BORDER_COLOR%,%(%toupper(%Border_color%)%)%)%)%,%
%border_color,%(%else-then(%_border_color%,%(%tolower(%Border_color%)%)%)%)%,%
%is_form_color,%(%else-then(%is_form_color%,%(%is_Form_color%)%)%)%,%
%form_color,%(%else-then(%if-no(%is_form_color%,,%(%form_color%)%)%,%(%if-no(%is_form_color%,,%(lightgray)%)%)%)%)%,%
%Form_color,%(%else-then(%if-no(%is_form_color%,,%(%Form_color%)%)%,%(%if-no(%is_form_color%,,%(%form_color%)%)%)%)%)%,%
%FORM_COLOR,%(%else-then(%FORM_COLOR%,%(%toupper(%Form_color%)%)%)%)%,%
%form_color,%(%else-then(%_form_color%,%(%tolower(%Form_color%)%)%)%)%,%
%is_font,%(%else-then(%is_font%,%(%is_Font%)%)%)%,%
%font,%(%else-then(%if-no(%is_font%,,%(%font%)%)%,%(%if-no(%is_font%,,%(Arial)%)%)%)%)%,%
%Font,%(%else-then(%if-no(%is_font%,,%(%Font%)%)%,%(%if-no(%is_font%,,%(%font%)%)%)%)%)%,%
%FONT,%(%else-then(%FONT%,%(%toupper(%Font%)%)%)%)%,%
%font,%(%else-then(%_font%,%(%tolower(%Font%)%)%)%)%,%
%is_image_base,%(%else-then(%is_image_base%,%(%is_Image_base%)%)%)%,%
%image_base,%(%else-then(%if-no(%is_image_base%,,%(%image_base%)%)%,%(%if-no(%is_image_base%,,%(%Application%-background)%)%)%)%)%,%
%Image_base,%(%else-then(%if-no(%is_image_base%,,%(%Image_base%)%)%,%(%if-no(%is_image_base%,,%(%image_base%)%)%)%)%)%,%
%IMAGE_base,%(%else-then(%IMAGE_base%,%(%toupper(%Image_base%)%)%)%)%,%
%image_base,%(%else-then(%_image_base%,%(%tolower(%Image_base%)%)%)%)%,%
%is_image_extension,%(%else-then(%is_image_extension%,%(%is_Image_extension%)%)%)%,%
%image_extension,%(%else-then(%if-no(%is_image_extension%,,%(%image_extension%)%)%,%(%if-no(%is_image_extension%,,%(jpg)%)%)%)%)%,%
%Image_extension,%(%else-then(%if-no(%is_image_extension%,,%(%Image_extension%)%)%,%(%if-no(%is_image_extension%,,%(%image_extension%)%)%)%)%)%,%
%IMAGE_EXTENSION,%(%else-then(%IMAGE_EXTENSION%,%(%toupper(%Image_extension%)%)%)%)%,%
%image_extension,%(%else-then(%_image_extension%,%(%tolower(%Image_extension%)%)%)%)%,%
%is_image_path,%(%else-then(%is_image_path%,%(%is_Image_path%)%)%)%,%
%image_path,%(%else-then(%if-no(%is_image_path%,,%(%image_path%)%)%,%(%if-no(%is_image_path%,,%(../images)%)%)%)%)%,%
%Image_path,%(%else-then(%if-no(%is_image_path%,,%(%Image_path%)%)%,%(%if-no(%is_image_path%,,%(%image_path%)%)%)%)%)%,%
%IMAGE_PATH,%(%else-then(%IMAGE_PATH%,%(%toupper(%Image_path%)%)%)%)%,%
%image_path,%(%else-then(%_image_path%,%(%tolower(%Image_path%)%)%)%)%,%
%is_image_location,%(%else-then(%is_image_location%,%(%is_Image_location%)%)%)%,%
%image_location,%(%else-then(%if-no(%is_image_location%,,%(%image_location%)%)%,%(%if-no(%is_image_location%,,%(%Image_path%/%Image_base%.%Image_extension%)%)%)%)%)%,%
%Image_location,%(%else-then(%if-no(%is_image_location%,,%(%Image_location%)%)%,%(%if-no(%is_image_location%,,%(%image_location%)%)%)%)%)%,%
%IMAGE_LOCATION,%(%else-then(%IMAGE_LOCATION%,%(%toupper(%Image_location%)%)%)%)%,%
%image_location,%(%else-then(%_image_location%,%(%tolower(%Image_location%)%)%)%)%,%
%%(%
%%include(%Include_path%/file-css.t)%%
%
.body {
    width: 100%%;
    height: 100%%;
    margin: 0px;
    font-family: Arial;
    background-color: %Background_color%;
    background-image: url('%Image_location%');
    background-attachment: fixed;
    background-repeat: no-repeat;
    background-position: center;
    background-size: 100%% 100%%;
}
.form { 
    background-color: %Form_color%; 
}
.table { 
    white-space: nowrap; 
}

body { 
    font-family: %Font%; 
}
form {
    border-style: solid;
    border-color: %Boarder_color%;
    border-width: 0px 0px 1px 0px;
    position: relative;
    z-index: 1;
}
form table td { 
    white-space: nowrap; 
    padding: 0px 10px 0px 0px; 
}
a { 
    color: %Forground_color%; 
    font-weight: bolder; 
    text-decoration: none; 
}
a:hover { 
    color: %Hover_color%; 
    font-weight: bolder; 
    text-decoration: underline; 
}
%
%)%)%