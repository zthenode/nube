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
%#   File: Application-create-html.t
%#
%# Author: $author$
%#   Date: 1/7/2021
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
%is_do,%(%else-then(%is_do%,%(%is_Do%)%)%)%,%
%do,%(%else-then(%if-no(%is_do%,,%(%do%)%)%,%(%if-no(%is_do%,,%(Create)%)%)%)%)%,%
%Do,%(%else-then(%if-no(%is_do%,,%(%Do%)%)%,%(%if-no(%is_do%,,%(%do%)%)%)%)%)%,%
%DO,%(%else-then(%DO%,%(%toupper(%Do%)%)%)%)%,%
%do,%(%else-then(%_do%,%(%tolower(%Do%)%)%)%)%,%
%is_create,%(%else-then(%is_create%,%(%is_Create%)%)%)%,%
%create,%(%else-then(%if-no(%is_create%,,%(%create%)%)%,%(%if-no(%is_create%,,%(%Do%)%)%)%)%)%,%
%Create,%(%else-then(%if-no(%is_create%,,%(%Create%)%)%,%(%if-no(%is_create%,,%(%create%)%)%)%)%)%,%
%CREATE,%(%else-then(%CREATE%,%(%toupper(%Create%)%)%)%)%,%
%create,%(%else-then(%_create%,%(%tolower(%Create%)%)%)%)%,%
%is_type,%(%else-then(%is_type%,%(%is_Type%)%)%)%,%
%type,%(%else-then(%if-no(%is_type%,,%(%type%)%)%,%(%if-no(%is_type%,,%(html)%)%)%)%)%,%
%Type,%(%else-then(%if-no(%is_type%,,%(%Type%)%)%,%(%if-no(%is_type%,,%(%type%)%)%)%)%)%,%
%TYPE,%(%else-then(%TYPE%,%(%toupper(%Type%)%)%)%)%,%
%type,%(%else-then(%_type%,%(%tolower(%Type%)%)%)%)%,%
%is_what,%(%else-then(%is_what%,%(%is_What%)%)%)%,%
%what,%(%else-then(%if-no(%is_what%,,%(%what%)%)%,%(%if-no(%is_what%,,%(%Application% %Create% %Type%)%)%)%)%)%,%
%What,%(%else-then(%if-no(%is_what%,,%(%What%)%)%,%(%if-no(%is_what%,,%(%what%)%)%)%)%)%,%
%WHAT,%(%else-then(%WHAT%,%(%toupper(%What%)%)%)%)%,%
%what,%(%else-then(%_what%,%(%tolower(%What%)%)%)%)%,%
%is_createwhat,%(%else-then(%is_createwhat%,%(%is_CreateWhat%)%)%)%,%
%createwhat,%(%else-then(%if-no(%is_createwhat%,,%(%createwhat%)%)%,%(%if-no(%is_createwhat%,,%(%parse(%What%, ,,-)%)%)%)%)%)%,%
%CreateWhat,%(%else-then(%if-no(%is_createwhat%,,%(%CreateWhat%)%)%,%(%if-no(%is_createwhat%,,%(%createwhat%)%)%)%)%)%,%
%CREATEWHAT,%(%else-then(%CREATEWHAT%,%(%toupper(%CreateWhat%)%)%)%)%,%
%createwhat,%(%else-then(%_createwhat%,%(%tolower(%CreateWhat%)%)%)%)%,%
%is_title,%(%else-then(%is_title%,%(%is_Title%)%)%)%,%
%title,%(%else-then(%if-no(%is_title%,,%(%title%)%)%,%(%if-no(%is_title%,,%(%Application% - %Create% %What%)%)%)%)%)%,%
%Title,%(%else-then(%if-no(%is_title%,,%(%Title%)%)%,%(%if-no(%is_title%,,%(%title%)%)%)%)%)%,%
%TITLE,%(%else-then(%TITLE%,%(%toupper(%Title%)%)%)%)%,%
%title,%(%else-then(%_title%,%(%tolower(%Title%)%)%)%)%,%
%is_file,%(%else-then(%is_file%,%(%is_File%)%)%)%,%
%file,%(%else-then(%if-no(%is_file%,,%(%file%)%)%,%(%if-no(%is_file%,,%(%Application%-%create%-%CreateWhat%)%)%)%)%)%,%
%File,%(%else-then(%if-no(%is_file%,,%(%File%)%)%,%(%if-no(%is_file%,,%(%file%)%)%)%)%)%,%
%FILE,%(%else-then(%FILE%,%(%toupper(%File%)%)%)%)%,%
%file,%(%else-then(%_file%,%(%tolower(%File%)%)%)%)%,%
%is_templatevalue,%(%else-then(%is_templatevalue%,%(%is_TemplateValue%)%)%)%,%
%templatevalue,%(%else-then(%if-no(%is_templatevalue%,,%(%templatevalue%)%)%,%(%if-no(%is_templatevalue%,,%(../templates/t/%Type%/%CreateWhat%.t)%)%)%)%)%,%
%TemplateValue,%(%else-then(%if-no(%is_templatevalue%,,%(%TemplateValue%)%)%,%(%if-no(%is_templatevalue%,,%(%templatevalue%)%)%)%)%)%,%
%TEMPLATEVALUE,%(%else-then(%TEMPLATEVALUE%,%(%toupper(%TemplateValue%)%)%)%)%,%
%templatevalue,%(%else-then(%_templatevalue%,%(%tolower(%TemplateValue%)%)%)%)%,%
%is_templateoption,%(%else-then(%is_templateoption%,%(%is_TemplateOption%)%)%)%,%
%templateoption,%(%else-then(%if-no(%is_templateoption%,,%(%templateoption%)%)%,%(%if-no(%is_templateoption%,,%(%Create% %What% (%TemplateValue%))%)%)%)%)%,%
%TemplateOption,%(%else-then(%if-no(%is_templateoption%,,%(%TemplateOption%)%)%,%(%if-no(%is_templateoption%,,%(%templateoption%)%)%)%)%)%,%
%TEMPLATEOPTION,%(%else-then(%TEMPLATEOPTION%,%(%toupper(%TemplateOption%)%)%)%)%,%
%templateoption,%(%else-then(%_templateoption%,%(%tolower(%TemplateOption%)%)%)%)%,%
%%(%
%%include(%Include_path%/file-html.t)%%
%<html>
    <!--
    =====================================================================
    == head
    =====================================================================
    -->
    <head>
        <title>%Title%</title>

        <!--
        =====================================================================
        === style
        =====================================================================
        -->
        <link rel="stylesheet" type="text/css" href="../css/%Application%.css"></link>
        <link rel="stylesheet" type="text/css" href="../css/%Application%-header.css"></link>
        <link rel="stylesheet" type="text/css" href="../css/%Application%-footer.css"></link>
        <link rel="stylesheet" type="text/css" href="../css/%Application%-dropover.css"></link>
        <link rel="stylesheet" type="text/css" href="../css/%Application%-popover.css"></link>
        <link rel="stylesheet" type="text/css" href="../css/%Application%-dropdown.css"></link>
        <link rel="stylesheet" type="text/css" href="../css/%Application%-popdown.css"></link>
        <link rel="stylesheet" type="text/css" href="../css/%Application%-menubar.css"></link>
        <link rel="stylesheet" type="text/css" href="../css/%Application%-logo.css"></link>
        <style type="text/css">
        </style>
    
        <!--
        =====================================================================
        === script
        =====================================================================
        -->
        <script type="text/javascript" src="../js/%Application%.js"></script>
        <script type="text/javascript">
            onLocationInit('%Application%.html', '%Application%-%create%-%CreateWhat%.html');
        </script>
    </head>

    <!--
    =====================================================================
    == body
    =====================================================================
    -->
    <body class="body">

        <!--
        =====================================================================
        === logo
        =====================================================================
        -->
        <div id="includeLogo" include="%Application%-logo.html">
            <script>includeHTML('includeLogo');</script>
        </div>

        <!--
        =====================================================================
        === header
        =====================================================================
        -->
        <div id="includeHeader" include="%Application%-header.html">
            <script>includeHTML('includeHeader');</script>
        </div>

        <!--
        =====================================================================
        === dropdown
        =====================================================================
        -->
        <div id="includeDropdown" include="%Application%-dropdown.html">
            <script>includeHTML('includeDropdown');</script>
        </div>

        <!--
        =====================================================================
        === popdown
        =====================================================================
        -->
        <div id="includePopdown" include="%Application%-popdown.html">
            <script>includeHTML('includePopdown');</script>
        </div>

        <!--
        =====================================================================
        === menubar
        =====================================================================
        -->
        <ul class="menubar">
            <li><a href="/%Application%/html/%Application%-%create%-%CreateWhat%.html">%Create% %What%</a></li>
            <li class="home"><div><a href="/%Application%/html/%Application%.html">Home</a></div></li>
        </ul>

        <!--
        =====================================================================
        === form
        =====================================================================
        -->
        <form name="Form" method="POST" action="../templates/t/%Type%/%CreateWhat%.t"
         onSubmit="return setFormSubmit(getFormValue2('FormTemplate','FormAction','Form'),getFormValue('FormMethod','Form'),'Form')">
            <div class="form">

                Template: <select name="FormTemplate">
                    <option value="%TemplateValue%">%TemplateOption%</option>
                    <option value=""></option>
                    <option value="../templates/t/t/parameters.t">t parameters &nbsp;&nbsp; (../templates/t/t/parameters.t)</option>
                    <option value="../templates/t/t/functions.t">t functions &nbsp;&nbsp; (../templates/t/t/functions.t)</option>
                    <option value=""></option>
                    <option value="/%application%-cgi/cgi">cgi parameters &nbsp;&nbsp; (/%application%-cgi/cgi)</option>
                    <option value="/%application%-cgi/cgicatch">catch cgi parameters &nbsp;&nbsp; (/%application%-cgi/cgicatch)</option>
                    <option value=""/>
                    <option value="http://localhost:8080/%application%-http/http">http parameters &nbsp;&nbsp; (...:8080/%application%-http/http)</option>
                    <option value="http://localhost:8080/%application%-http/httpcatch">catch http parameters &nbsp;&nbsp; (...:8080/%application%-http/httpcatch)</option>
                    </select>
                <br/>

                <br/>
                Organization: <input name="Organization" value=""></input>[$organization$]
                    <input type="checkbox" name="is_Organization" value="no" unchecked="checked">no</input><br/>
                Author: <input name="Author" value=""></input>[$author$]
                    <input type="checkbox" name="is_Author" value="no" unchecked="checked">no</input><br/>
                Date:<input name="Date" value=""/>[%%date%(()%%())%%%]<b></b>
                    <input type="checkbox" name="is_Date" value="no" unchecked="checked">no</input>
                <br/>

                <br/>
                Content-Type: <select name="content_type">
                    <option value="text/plain">text</option>
                    <option value="text/html">html</option>
                    <option value="text/xml">xml</option>
                    <option value="application/json">json</option>
                    <option value="application/javascript">javascript</option>
                    <option value=""></option>
                    </select>
                <br/>
                Action: <select name="FormAction">
                    <option value="%TemplateValue%">%TemplateOption%</option>
                    <option value=""></option>
                    <option value="../templates/t/t/parameters.t">t parameters &nbsp;&nbsp; (../templates/t/t/parameters.t)</option>
                    <option value="../templates/t/t/functions.t">t functions &nbsp;&nbsp; (../templates/t/t/functions.t)</option>
                    <option value=""></option>
                    <option value="/%application%-cgi/cgi">cgi parameters &nbsp;&nbsp; (/%application%-cgi/cgi)</option>
                    <option value="/%application%-cgi/cgicatch">catch cgi parameters &nbsp;&nbsp; (/%application%-cgi/cgicatch)</option>
                    <option value=""/>
                    <option value="http://localhost:8080/%application%-http/http">http parameters &nbsp;&nbsp; (...:8080/%application%-http/http)</option>
                    <option value="http://localhost:8080/%application%-http/httpcatch">catch http parameters &nbsp;&nbsp; (...:8080/%application%-http/httpcatch)</option>
                    </select>
                <br/>
                Method: <select name="FormMethod">
                    <option value="POST">POST</option>
                    <option value="GET">GET</option>
                    <option value=""></option>
                    </select>
                <br/>
                <br/>

                <input type="submit" name="submit" value="submit"/><br/>
            </div>
        </form>
    </body>
</html>
)%)%