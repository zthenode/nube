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
%#   File: redirect-html.t
%#
%# Author: $author$
%#   Date: 1/24/2021
%########################################################################
%with(%
%is_include_path,%(%else-then(%is_include_path%,%(%is_Include_path%)%)%)%,%
%include_path,%(%else-then(%if-no(%is_include_path%,,%(%include_path%)%)%,%(%if-no(%is_include_path%,,%(%filepath(%input%)%)%)%)%)%)%,%
%Include_path,%(%else-then(%if-no(%is_include_path%,,%(%Include_path%)%)%,%(%if-no(%is_include_path%,,%(%include_path%)%)%)%)%)%,%
%INCLUDE_PATH,%(%else-then(%INCLUDE_PATH%,%(%toupper(%Include_path%)%)%)%)%,%
%include_path,%(%else-then(%_include_path%,%(%tolower(%Include_path%)%)%)%)%,%
%is_timeout,%(%else-then(%is_timeout%,%(%is_Timeout%)%)%)%,%
%timeout,%(%else-then(%if-no(%is_timeout%,,%(%timeout%)%)%,%(%if-no(%is_timeout%,,%(0)%)%)%)%)%,%
%Timeout,%(%else-then(%if-no(%is_timeout%,,%(%Timeout%)%)%,%(%if-no(%is_timeout%,,%(%timeout%)%)%)%)%)%,%
%TIMEOUT,%(%else-then(%TIMEOUT%,%(%toupper(%Timeout%)%)%)%)%,%
%timeout,%(%else-then(%_timeout%,%(%tolower(%Timeout%)%)%)%)%,%
%is_location,%(%else-then(%is_location%,%(%is_Location%)%)%)%,%
%location,%(%else-then(%if-no(%is_location%,,%(%location%)%)%,%(%if-no(%is_location%,,%(/localhost/)%)%)%)%)%,%
%Location,%(%else-then(%if-no(%is_location%,,%(%Location%)%)%,%(%if-no(%is_location%,,%(%location%)%)%)%)%)%,%
%LOCATION,%(%else-then(%LOCATION%,%(%toupper(%Location%)%)%)%)%,%
%location,%(%else-then(%_location%,%(%tolower(%Location%)%)%)%)%,%
%%(%
%%include(%Include_path%/file-html.t)%%
%<html>
    <!--
    =====================================================================
    === head
    =====================================================================
    -->
    <head>
        <!--
        =====================================================================
        === meta
        =====================================================================
        -->
        <meta http-equiv="refresh" content="%Timeout%;url=%Location%"/>
    </head>

    <!--
    =====================================================================
    === body
    =====================================================================
    -->
    <body>
        <b>...redirecting to "</b><a href="%Location%">%Location%</a><b>"...</b>
    </body>
</html>
%
%)%)%