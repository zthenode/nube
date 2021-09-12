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
%#   File: Xthenode-create-html.t
%#
%# Author: $author$
%#   Date: 2/16/2020, 12/29/2020
%########################################################################
%with(%
%is_include_path,%(%else-then(%is_include_path%,%(%is_Include_path%)%)%)%,%
%include_path,%(%else-then(%if-no(%is_include_path%,,%(%include_path%)%)%,%(%if-no(%is_include_path%,,%(%filepath(%input%)%)%)%)%)%)%,%
%Include_path,%(%else-then(%if-no(%is_include_path%,,%(%Include_path%)%)%,%(%if-no(%is_include_path%,,%(%include_path%)%)%)%)%)%,%
%INCLUDE_PATH,%(%else-then(%INCLUDE_PATH%,%(%toupper(%Include_path%)%)%)%)%,%
%include_path,%(%else-then(%_include_path%,%(%tolower(%Include_path%)%)%)%)%,%
%is_xmlversion,%(%else-then(%is_xmlversion%,%(%is_XmlVersion%)%)%)%,%
%xmlversion,%(%else-then(%if-no(%is_xmlversion%,,%(%xmlversion%)%)%,%(%if-no(%is_xmlversion%,,%(1.0)%)%)%)%)%,%
%XmlVersion,%(%else-then(%if-no(%is_xmlversion%,,%(%XmlVersion%)%)%,%(%if-no(%is_xmlversion%,,%(%xmlversion%)%)%)%)%)%,%
%XMLVERSION,%(%else-then(%XMLVERSION%,%(%toupper(%XmlVersion%)%)%)%)%,%
%xmlversion,%(%else-then(%_xmlversion%,%(%tolower(%XmlVersion%)%)%)%)%,%
%is_xmlencoding,%(%else-then(%is_xmlencoding%,%(%is_XmlEncoding%)%)%)%,%
%xmlencoding,%(%else-then(%if-no(%is_xmlencoding%,,%(%xmlencoding%)%)%,%(%if-no(%is_xmlencoding%,,%(utf-8)%)%)%)%)%,%
%XmlEncoding,%(%else-then(%if-no(%is_xmlencoding%,,%(%XmlEncoding%)%)%,%(%if-no(%is_xmlencoding%,,%(%xmlencoding%)%)%)%)%)%,%
%XMLENCODING,%(%else-then(%XMLENCODING%,%(%toupper(%XmlEncoding%)%)%)%)%,%
%xmlencoding,%(%else-then(%_xmlencoding%,%(%tolower(%XmlEncoding%)%)%)%)%,%
%is_organization,%(%else-then(%is_organization%,%(%is_Organization%)%)%)%,%
%organization,%(%else-then(%if-no(%is_organization%,,%(%organization%)%)%,%(%if-no(%is_organization%,,%($organization$)%)%)%)%)%,%
%Organization,%(%else-then(%if-no(%is_organization%,,%(%Organization%)%)%,%(%if-no(%is_organization%,,%(%organization%)%)%)%)%)%,%
%ORGANIZATION,%(%else-then(%ORGANIZATION%,%(%toupper(%Organization%)%)%)%)%,%
%organization,%(%else-then(%_organization%,%(%tolower(%Organization%)%)%)%)%,%
%is_author,%(%else-then(%is_author%,%(%is_Author%)%)%)%,%
%author,%(%else-then(%if-no(%is_author%,,%(%author%)%)%,%(%if-no(%is_author%,,%($author$)%)%)%)%)%,%
%Author,%(%else-then(%if-no(%is_author%,,%(%Author%)%)%,%(%if-no(%is_author%,,%(%author%)%)%)%)%)%,%
%AUTHOR,%(%else-then(%AUTHOR%,%(%toupper(%Author%)%)%)%)%,%
%author,%(%else-then(%_author%,%(%tolower(%Author%)%)%)%)%,%
%is_what,%(%else-then(%is_what%,%(%is_What%)%)%)%,%
%what,%(%else-then(%if-no(%is_what%,,%(%what%)%)%,%(%if-no(%is_what%,,%(What)%)%)%)%)%,%
%What,%(%else-then(%if-no(%is_what%,,%(%What%)%)%,%(%if-no(%is_what%,,%(%what%)%)%)%)%)%,%
%WHAT,%(%else-then(%WHAT%,%(%toupper(%What%)%)%)%)%,%
%what,%(%else-then(%_what%,%(%tolower(%What%)%)%)%)%,%
%is_create_what,%(%else-then(%is_create_what%,%(%is_Create_what%)%)%)%,%
%create_what,%(%else-then(%if-no(%is_create_what%,,%(%create_what%)%)%,%(%if-no(%is_create_what%,,%(Create%then-if(%What%, )%)%)%)%)%)%,%
%Create_what,%(%else-then(%if-no(%is_create_what%,,%(%Create_what%)%)%,%(%if-no(%is_create_what%,,%(%create_what%)%)%)%)%)%,%
%CREATE_WHAT,%(%else-then(%CREATE_WHAT%,%(%toupper(%Create_what%)%)%)%)%,%
%create_what,%(%else-then(%_create_what%,%(%tolower(%Create_what%)%)%)%)%,%
%is_name,%(%else-then(%is_name%,%(%is_Name%)%)%)%,%
%name,%(%else-then(%if-no(%is_name%,,%(%name%)%)%,%(%if-no(%is_name%,,%(html)%)%)%)%)%,%
%Name,%(%else-then(%if-no(%is_name%,,%(%Name%)%)%,%(%if-no(%is_name%,,%(%name%)%)%)%)%)%,%
%NAME,%(%else-then(%NAME%,%(%toupper(%Name%)%)%)%)%,%
%name,%(%else-then(%_name%,%(%tolower(%Name%)%)%)%)%,%
%is_file,%(%else-then(%is_file%,%(%is_File%)%)%)%,%
%file,%(%else-then(%if-no(%is_file%,,%(%file%)%)%,%(%if-no(%is_file%,,%(%Name%)%)%)%)%)%,%
%File,%(%else-then(%if-no(%is_file%,,%(%File%)%)%,%(%if-no(%is_file%,,%(%file%)%)%)%)%)%,%
%FILE,%(%else-then(%FILE%,%(%toupper(%File%)%)%)%)%,%
%file,%(%else-then(%_file%,%(%tolower(%File%)%)%)%)%,%
%is_base,%(%else-then(%is_base%,%(%is_Base%)%)%)%,%
%base,%(%else-then(%if-no(%is_base%,,%(%base%)%)%,%(%if-no(%is_base%,,%(%filebase(%File%)%)%)%)%)%)%,%
%Base,%(%else-then(%if-no(%is_base%,,%(%Base%)%)%,%(%if-no(%is_base%,,%(%base%)%)%)%)%)%,%
%BASE,%(%else-then(%BASE%,%(%toupper(%Base%)%)%)%)%,%
%base,%(%else-then(%_base%,%(%tolower(%Base%)%)%)%)%,%
%is_extension,%(%else-then(%is_extension%,%(%is_Extension%)%)%)%,%
%extension,%(%else-then(%if-no(%is_extension%,,%(%extension%)%)%,%(%if-no(%is_extension%,,%(%else-then(%fileextension(%File%)%,%(html)%)%)%)%)%)%)%,%
%Extension,%(%else-then(%if-no(%is_extension%,,%(%Extension%)%)%,%(%if-no(%is_extension%,,%(%extension%)%)%)%)%)%,%
%EXTENSION,%(%else-then(%EXTENSION%,%(%toupper(%Extension%)%)%)%)%,%
%extension,%(%else-then(%_extension%,%(%tolower(%Extension%)%)%)%)%,%
%is_form_name,%(%else-then(%is_form_name%,%(%is_Form_name%)%)%)%,%
%form_name,%(%else-then(%if-no(%is_form_name%,,%(%form_name%)%)%,%(%if-no(%is_form_name%,,%(Form)%)%)%)%)%,%
%Form_name,%(%else-then(%if-no(%is_form_name%,,%(%Form_name%)%)%,%(%if-no(%is_form_name%,,%(%form_name%)%)%)%)%)%,%
%FORM_NAME,%(%else-then(%FORM_NAME%,%(%toupper(%Form_name%)%)%)%)%,%
%form_name,%(%else-then(%_form_name%,%(%tolower(%Form_name%)%)%)%)%,%
%is_form_method,%(%else-then(%is_form_method%,%(%is_Form_method%)%)%)%,%
%form_method,%(%else-then(%if-no(%is_form_method%,,%(%form_method%)%)%,%(%if-no(%is_form_method%,,%(POST)%)%)%)%)%,%
%Form_method,%(%else-then(%if-no(%is_form_method%,,%(%Form_method%)%)%,%(%if-no(%is_form_method%,,%(%form_method%)%)%)%)%)%,%
%FORM_METHOD,%(%else-then(%FORM_METHOD%,%(%toupper(%Form_method%)%)%)%)%,%
%form_method,%(%else-then(%_form_method%,%(%tolower(%Form_method%)%)%)%)%,%
%is_form_action,%(%else-then(%is_form_action%,%(%is_Form_action%)%)%)%,%
%form_action,%(%else-then(%if-no(%is_form_action%,,%(%form_action%)%)%,%(%if-no(%is_form_action%,,%(../templates/t%then-if(%Extension%,/)%/%Base%%then-if(%Extension%,-)%.t=%Create_what%)%)%)%)%)%,%
%Form_action,%(%else-then(%if-no(%is_form_action%,,%(%Form_action%)%)%,%(%if-no(%is_form_action%,,%(%form_action%)%)%)%)%)%,%
%FORM_ACTION,%(%else-then(%FORM_ACTION%,%(%toupper(%Form_action%)%)%)%)%,%
%form_action,%(%else-then(%_form_action%,%(%tolower(%Form_action%)%)%)%)%,%
%Form_action_action,%(%else-then(%left(%Form_action%,=)%,%(%Form_action%)%)%)%,%
%Form_action_text,%(%else-then(%right(%Form_action%,=)%,%(%Create_what%)%)%)%,%
%is_xthenode,%(%else-then(%is_xthenode%,%(%is_Xthenode%)%)%)%,%
%xthenode,%(%else-then(%if-no(%is_xthenode%,,%(%xthenode%)%)%,%(%if-no(%is_xthenode%,,%(Xthenode)%)%)%)%)%,%
%Xthenode,%(%else-then(%if-no(%is_xthenode%,,%(%Xthenode%)%)%,%(%if-no(%is_xthenode%,,%(%xthenode%)%)%)%)%)%,%
%XTHENODE,%(%else-then(%XTHENODE%,%(%toupper(%Xthenode%)%)%)%)%,%
%xthenode,%(%else-then(%_xthenode%,%(%tolower(%Xthenode%)%)%)%)%,%
%is_application,%(%else-then(%is_application%,%(%is_Application%)%)%)%,%
%application,%(%else-then(%if-no(%is_application%,,%(%application%)%)%,%(%if-no(%is_application%,,%(%Xthenode%)%)%)%)%)%,%
%Application,%(%else-then(%if-no(%is_application%,,%(%Application%)%)%,%(%if-no(%is_application%,,%(%application%)%)%)%)%)%,%
%APPLICATION,%(%else-then(%APPLICATION%,%(%toupper(%Application%)%)%)%)%,%
%application,%(%else-then(%_application%,%(%tolower(%Application%)%)%)%)%,%
%is_action_options,%(%else-then(%is_action_options%,%(%is_Action_options%)%)%)%,%
%action_options,%(%else-then(%if-no(%is_action_options%,,%(%action_options%)%)%,%(%if-no(%is_action_options%,,%(%
%)%)%)%)%)%,%
%Action_options,%(%else-then(%if-no(%is_action_options%,,%(%Action_options%)%)%,%(%if-no(%is_action_options%,,%(%action_options%)%)%)%)%)%,%
%ACTION_OPTIONS,%(%else-then(%ACTION_OPTIONS%,%(%toupper(%Action_options%)%)%)%)%,%
%action_options,%(%else-then(%_action_options%,%(%tolower(%Action_options%)%)%)%)%,%
%is_xthenode_logo_css,%(%else-then(%is_xthenode_logo_css%,%(%is_Xthenode_logo_css%)%)%)%,%
%xthenode_logo_css,%(%else-then(%if-no(%is_xthenode_logo_css%,,%(%xthenode_logo_css%)%)%,%(%if-no(%is_xthenode_logo_css%,,%(../css/%Application%-logo.css)%)%)%)%)%,%
%Xthenode_logo_css,%(%else-then(%if-no(%is_xthenode_logo_css%,,%(%Xthenode_logo_css%)%)%,%(%if-no(%is_xthenode_logo_css%,,%(%xthenode_logo_css%)%)%)%)%)%,%
%XTHENODE_LOGO_CSS,%(%else-then(%XTHENODE_LOGO_CSS%,%(%toupper(%Xthenode_logo_css%)%)%)%)%,%
%xthenode_logo_css,%(%else-then(%_xthenode_logo_css%,%(%tolower(%Xthenode_logo_css%)%)%)%)%,%
%is_xthenode_logo_html,%(%else-then(%is_xthenode_logo_html%,%(%is_Xthenode_logo_html%)%)%)%,%
%xthenode_logo_html,%(%else-then(%if-no(%is_xthenode_logo_html%,,%(%xthenode_logo_html%)%)%,%(%if-no(%is_xthenode_logo_html%,,%(%Application%-logo.html)%)%)%)%)%,%
%Xthenode_logo_html,%(%else-then(%if-no(%is_xthenode_logo_html%,,%(%Xthenode_logo_html%)%)%,%(%if-no(%is_xthenode_logo_html%,,%(%xthenode_logo_html%)%)%)%)%)%,%
%XTHENODE_LOGO_HTML,%(%else-then(%XTHENODE_LOGO_HTML%,%(%toupper(%Xthenode_logo_html%)%)%)%)%,%
%xthenode_logo_html,%(%else-then(%_xthenode_logo_html%,%(%tolower(%Xthenode_logo_html%)%)%)%)%,%
%%(%
%%include(%Include_path%/file-html.t)%%
%<html>
    <!--
    =====================================================================
    === head
    =====================================================================
    -->
    <head>
        <title>%Application% - %Create_what%</title>

        <!--
        =====================================================================
        === style
        =====================================================================
        -->
        <link rel="stylesheet" type="text/css" href="../css/%Application%.css"></link>
        <link rel="stylesheet" type="text/css" href="../css/%Application%-header.css"></link>
        <link rel="stylesheet" type="text/css" href="../css/%Application%-dropdown.css"></link>
        <link rel="stylesheet" type="text/css" href="../css/%Application%-popdown.css"></link>
        <link rel="stylesheet" type="text/css" href="../css/%Application%-menubar.css"></link>
        <link rel="stylesheet" type="text/css" href="%do(%Xthenode_logo_css%)%"></link>
        <style type="text/css">
        </style>
    
        <!--
        =====================================================================
        === script
        =====================================================================
        -->
        <script type="text/javascript" src="../js/%Application%.js"></script>
        <script type="text/javascript">
            onLocationInit('%Application%.html', '%Base%%then-if(%Extension%,.)%');
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
        <div id="includeLogo" include="%do(%Xthenode_logo_html%)%">
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
            <li><a href="%Base%%then-if(%Extension%,.)%">Create%then-if(%What%, )%</a></li>
            <li class="home"><div><a href="%Application%.html">Home</a></div></li>
        </ul>

        <!--
        =====================================================================
        === form
        =====================================================================
        -->
        <form name="%Form_name%" method="%Form_method%" action="%Form_action_action%"
         onSubmit="return setFormSubmit(getFormValue2('FormTemplate','FormAction','Form'),getFormValue('FormMethod','Form'),'Form')">
            <div class="form">

            File: <input name="File" value=""></input>[%Name%][%then-if(%Extension%,.)%]
            <input type="checkbox" name="is_File" value="no" unchecked="checked">no</input>
            <br/>
            Template: <select name="FormTemplate">
            %include(%Include_path%/Xthenode-create-action-options-html.t)%</select>
            <br/>%then-if(%include(%Include_path%/%Application%-form-fields-html.t)%,%(
            
            <br/>)%)%

            <br/>
            Content-Type: <select name="content_type">
            <option value="text/plain">text</option>
            <option value="text/html">html</option>
            <option value="text/xml">xml</option>
            <option value="application/json">json</option>
            <option value="application/javascript">javascript</option>
            <option value=""></option>
            </select><br/>
            Action: <select name="FormAction">
            %include(%Include_path%/Xthenode-create-action-options-html.t)%</select><br/>
            Method: <select name="FormMethod">
            <option value="POST">POST</option>
            <option value="GET">GET</option>
            <option value=""></option>
            </select><br/><br/>

            <input type="submit" name="submit" value="submit"/><br/>
            </div>
        </form>
    </body>
</html>
%
%)%)%