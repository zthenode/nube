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
%#   File: application-html.t
%#
%# Author: $author$
%#   Date: 12/9/2019, 3/25/2021
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%is_application,%(%else-then(%is_application%,%(%is_Application%)%)%)%,%
%application,%(%else-then(%if-no(%is_application%,,%(%application%)%)%,%(%if-no(%is_application%,,%(Application)%)%)%)%)%,%
%Application,%(%else-then(%if-no(%is_application%,,%(%Application%)%)%,%(%if-no(%is_application%,,%(%application%)%)%)%)%)%,%
%APPLICATION,%(%else-then(%APPLICATION%,%(%toupper(%Application%)%)%)%)%,%
%application,%(%else-then(%_application%,%(%tolower(%Application%)%)%)%)%,%
%is_page,%(%else-then(%is_page%,%(%is_Page%)%)%)%,%
%page,%(%else-then(%if-no(%is_page%,,%(%page%)%)%,%(%if-no(%is_page%,,%(Home)%)%)%)%)%,%
%Page,%(%else-then(%if-no(%is_page%,,%(%Page%)%)%,%(%if-no(%is_page%,,%(%page%)%)%)%)%)%,%
%PAGE,%(%else-then(%PAGE%,%(%toupper(%Page%)%)%)%)%,%
%page,%(%else-then(%_page%,%(%tolower(%Page%)%)%)%)%,%
%is_home,%(%else-then(%is_home%,%(%is_Home%)%)%)%,%
%home,%(%else-then(%if-no(%is_home%,,%(%home%)%)%,%(%if-no(%is_home%,,%(%Page%)%)%)%)%)%,%
%Home,%(%else-then(%if-no(%is_home%,,%(%Home%)%)%,%(%if-no(%is_home%,,%(%home%)%)%)%)%)%,%
%HOME,%(%else-then(%HOME%,%(%toupper(%Home%)%)%)%)%,%
%home,%(%else-then(%_home%,%(%tolower(%Home%)%)%)%)%,%
%is_applicationhome,%(%else-then(%is_applicationhome%,%(%is_ApplicationHome%)%)%)%,%
%applicationhome,%(%else-then(%if-no(%is_applicationhome%,,%(%applicationhome%)%)%,%(%if-no(%is_applicationhome%,,%(%Application%%then-if(%Home%,%(-)%)%)%)%)%)%)%,%
%ApplicationHome,%(%else-then(%if-no(%is_applicationhome%,,%(%ApplicationHome%)%)%,%(%if-no(%is_applicationhome%,,%(%applicationhome%)%)%)%)%)%,%
%APPLICATIONHOME,%(%else-then(%APPLICATIONHOME%,%(%toupper(%ApplicationHome%)%)%)%)%,%
%applicationhome,%(%else-then(%_applicationhome%,%(%tolower(%ApplicationHome%)%)%)%)%,%
%is_file,%(%else-then(%is_file%,%(%is_File%)%)%)%,%
%file,%(%else-then(%if-no(%is_file%,,%(%file%)%)%,%(%if-no(%is_file%,,%(%else-then(%File%,%ApplicationHome%)%)%)%)%)%)%,%
%File,%(%else-then(%if-no(%is_file%,,%(%File%)%)%,%(%if-no(%is_file%,,%(%file%)%)%)%)%)%,%
%FILE,%(%else-then(%FILE%,%(%toupper(%File%)%)%)%)%,%
%file,%(%else-then(%_file%,%(%tolower(%File%)%)%)%)%,%
%is_title,%(%else-then(%is_title%,%(%is_Title%)%)%)%,%
%title,%(%else-then(%if-no(%is_title%,,%(%title%)%)%,%(%if-no(%is_title%,,%(%Application%%then-if(%Home%,%( - )%)%)%)%)%)%)%,%
%Title,%(%else-then(%if-no(%is_title%,,%(%Title%)%)%,%(%if-no(%is_title%,,%(%title%)%)%)%)%)%,%
%TITLE,%(%else-then(%TITLE%,%(%toupper(%Title%)%)%)%)%,%
%title,%(%else-then(%_title%,%(%tolower(%Title%)%)%)%)%,%
%%(%
%%include(%include_path%/../html/html-file.t)%%
%<html>
    <!--
    =====================================================================
    === head
    =====================================================================
    -->
    <head>
        <!--
        =====================================================================
        === title
        =====================================================================
        -->
        <title>%Title%</title>

        <!--
        =====================================================================
        === style
        =====================================================================
        -->
%if(%Html%,%(%with(Html,,%(    <style>
%include(%include_path%/../css/application-css.t)%
    </style>)%)%)%,%(        <link rel="stylesheet" type="text/css" href="../css/%Application%.css"></link>
        <link rel="stylesheet" type="text/css" href="../css/%Application%-header.css"></link>
        <link rel="stylesheet" type="text/css" href="../css/%Application%-footer.css"></link>
        <link rel="stylesheet" type="text/css" href="../css/%Application%-dropdown.css"></link>
        <link rel="stylesheet" type="text/css" href="../css/%Application%-popdown.css"></link>
        <link rel="stylesheet" type="text/css" href="../css/%Application%-menubar.css"></link>
        <link rel="stylesheet" type="text/css" href="../css/%Application%-logo.css"></link>)%)%
        <style type="text/css">
        </style>

        <!--
        =====================================================================
        === script
        =====================================================================
        -->
%if(%Html%,%(%with(Html,,%(    <script type="text/javascript">
%include(%include_path%/../js/application-js.t)%
        </script>)%)%)%,%(        <script type="text/javascript" src="../js/%Application%.js"></script>)%)%
        <script type="text/javascript">
            onLocationInit('%Application%.html','%Application%.html');
        </script>
    </head>
    <!--
    =====================================================================
    === body
    =====================================================================
    -->
    <body class="body">

        <!--
        =====================================================================
        === logo
        =====================================================================
        -->
        <div id="includeLogo" include="%Application%-logo.html">
%if(%Html%,%(%with(Html,,%(
%include(%include_path%/../html/application-logo-html.t)%)%)%%
%)%,%(            <script>includeHTML('includeLogo');</script>)%)%
        </div>
        <!--
        =====================================================================
        === header
        =====================================================================
        -->
        <div id="includeHeader" include="%Application%-header.html">
%if(%Html%,%(%with(Html,,%(
%include(%include_path%/../html/application-header-html.t)%)%)%%
%)%,%(            <script>includeHTML('includeHeader');</script>)%)%
        </div>
        <!--
        =====================================================================
        === popdown
        =====================================================================
        -->
        <div id="includePopdown" include="%Application%-popdown.html">
%if(%Html%,%(%with(Html,,%(
%include(%include_path%/../html/application-popdown-html.t)%)%)%%
%)%,%(            <script>includeHTML('includePopdown');</script>)%)%
        </div>
        <!--
        =====================================================================
        === dropdown
        =====================================================================
        -->
        <div id="includeDropdown" include="%Application%-dropdown.html">
%if(%Html%,%(%with(Html,,%(
%include(%include_path%/../html/application-dropdown-html.t)%)%)%%
%)%,%(            <script>includeHTML('includeDropdown');</script>)%)%
        </div>
        <!--
        =====================================================================
        === footer
        =====================================================================
        -->
        <div id="includeFooter" include="%Application%-footer.html">
%if(%Html%,%(%with(Html,,%(
%include(%include_path%/../html/application-footer-html.t)%)%)%%
%)%,%(            <script>includeHTML('includeFooter');</script>)%)%
        </div>

    </body>
</html>
%
%)%)%