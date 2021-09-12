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
%#   File: Sthenode-create-html.t
%#
%# Author: $author$
%#   Date: 10/13/2019
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%is_Sthenode,%(%else-then(%is_Sthenode%,%()%)%)%,%
%Sthenode,%(%else-then(%Sthenode%,%()%)%)%,%
%STHENODE,%(%else-then(%STHENODE%,%(%toupper(%Sthenode%)%)%)%)%,%
%sthenode,%(%else-then(%_Sthenode%,%(%tolower(%Sthenode%)%)%)%)%,%
%is_Create,%(%else-then(%is_Create%,%()%)%)%,%
%Create,%(%else-then(%Create%,%()%)%)%,%
%CREATE,%(%else-then(%CREATE%,%(%toupper(%Create%)%)%)%)%,%
%create,%(%else-then(%_Create%,%(%tolower(%Create%)%)%)%)%,%
%is_Type,%(%else-then(%is_Type%,%()%)%)%,%
%Type,%(%else-then(%Type%,%(html)%)%)%,%
%TYPE,%(%else-then(%TYPE%,%(%toupper(%Type%)%)%)%)%,%
%type,%(%else-then(%_Type%,%(%tolower(%Type%)%)%)%)%,%
%is_What,%(%else-then(%is_What%,%()%)%)%,%
%What,%(%else-then(%What%,%(.%Type% file)%)%)%,%
%WHAT,%(%else-then(%WHAT%,%(%toupper(%What%)%)%)%)%,%
%what,%(%else-then(%_What%,%(%tolower(%What%)%)%)%)%,%
%is_Which,%(%else-then(%is_Which%,%()%)%)%,%
%Which,%(%else-then(%Which%,%(%Type%)%)%)%,%
%WHICH,%(%else-then(%WHICH%,%(%toupper(%Which%)%)%)%)%,%
%which,%(%else-then(%_Which%,%(%tolower(%Which%)%)%)%)%,%
%is_File,%(%else-then(%is_File%,%()%)%)%,%
%File,%(%else-then(%File%,%(%if-then(%Sthenode%,-)%%Which%.html)%)%)%,%
%FILE,%(%else-then(%FILE%,%(%toupper(%File%)%)%)%)%,%
%file,%(%else-then(%_File%,%(%tolower(%File%)%)%)%)%,%
%is_Name,%(%else-then(%is_Name%,%()%)%)%,%
%Name,%(%else-then(%Name%,%(%filebase(%File%)%)%)%)%,%
%NAME,%(%else-then(%NAME%,%(%toupper(%Name%)%)%)%)%,%
%name,%(%else-then(%_Name%,%(%tolower(%Name%)%)%)%)%,%
%is_Extension,%(%else-then(%is_Extension%,%()%)%)%,%
%Extension,%(%else-then(%Extension%,%(%fileextension(%File%)%)%)%)%,%
%EXTENSION,%(%else-then(%EXTENSION%,%(%toupper(%Extension%)%)%)%)%,%
%extension,%(%else-then(%_Extension%,%(%tolower(%Extension%)%)%)%)%,%
%is_StyleHref,%(%else-then(%is_StyleHref%,%()%)%)%,%
%StyleHref,%(%else-then(%StyleHref%,%(../css/%Sthenode%%else(%Sthenode%,html)%.css)%)%)%,%
%STYLEHREF,%(%else-then(%STYLEHREF%,%(%toupper(%StyleHref%)%)%)%)%,%
%stylehref,%(%else-then(%_StyleHref%,%(%tolower(%StyleHref%)%)%)%)%,%
%is_ScriptSrc,%(%else-then(%is_ScriptSrc%,%()%)%)%,%
%ScriptSrc,%(%else-then(%ScriptSrc%,%(../js/%Sthenode%%else(%Sthenode%,html)%.js)%)%)%,%
%SCRIPTSRC,%(%else-then(%SCRIPTSRC%,%(%toupper(%ScriptSrc%)%)%)%)%,%
%scriptsrc,%(%else-then(%_ScriptSrc%,%(%tolower(%ScriptSrc%)%)%)%)%,%
%%(<?xml version="1.0" encoding="utf-8"?>
<!--
=====================================================================
=== Copyright (c) 1988-%year()% $organization$
===
=== This software is provided by the author and contributors ``as is'' 
=== and any express or implied warranties, including, but not limited to, 
=== the implied warranties of merchantability and fitness for a particular 
=== purpose are disclaimed. In no event shall the author or contributors 
=== be liable for any direct, indirect, incidental, special, exemplary, 
=== or consequential damages (including, but not limited to, procurement 
=== of substitute goods or services; loss of use, data, or profits; or 
=== business interruption) however caused and on any theory of liability, 
=== whether in contract, strict liability, or tort (including negligence 
=== or otherwise) arising in any way out of the use of this software, 
=== even if advised of the possibility of such damage.
===
===   File: %Name%.%Extension%
===
=== Author: $author$
===   Date: %date()%
=====================================================================
-->
<html>
    <!--
    =====================================================================
    === head
    =====================================================================
    -->
    <head>
        <title>%if-then(%Sthenode%, - )%%if-then(%Create%, )%%What%</title>

        <!--
        =====================================================================
        === style
        =====================================================================
        -->
        <link rel="stylesheet" type="text/css" href="%StyleHref%"></link>
        <style type="text/css">
        </style>
    
        <!--
        =====================================================================
        === script
        =====================================================================
        -->
        <script type="text/javascript" src="%ScriptSrc%"></script>
        <script type="text/javascript">
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
        === header
        =====================================================================
        -->
        <table class="header" border="0"><tr><td class="header-button">
            <!--
            =====================================================================
            === parent
            =====================================================================
            -->
            <table class="parent" border="0"><tr><td>
                <button class="parent-button" onclick="onClickLocation(event,'.')">
                    <table class="parent-dots"><tr>
                        <td class="parent-dot"></td>
                        <td class="parent-dot"></td>
                    </tr></table>
                </button>
            </td></tr></table>
            <!--
            =====================================================================
            === self
            =====================================================================
            -->
            <table class="parent" border="0"><tr><td>
                <button class="parent-button" onclick="onClickLocation(event,'%Sthenode%.html')">
                    <table class="parent-dots"><tr>
                        <td class="parent-dot"></td>
                    </tr></table>
                </button>
            </td></tr></table>
            <!--
            =====================================================================
            === dropdown
            =====================================================================
            -->
            <table class="dropdown" border="0"><tr><td>
                <button class="dropdown-button" onclick="onDropdownClick('myDropdown')">
                    <table class="dropdown-bars"><tr>
                        <td class="dropdown-bar"></td></tr><tr>
                        <td class="dropdown-bar"></td></tr><tr>
                        <td class="dropdown-bar"></td>
                    </tr></table>
                </button>
            </td></tr></table>
        </td></tr></table>
        <!--
        =====================================================================
        === dropdown
        =====================================================================
        -->
        <div id="myDropdown" class="dropdown-content">
            <a href="%if-then(%Sthenode%,-)%qtcreator.html" onclick="onItemClick('myDropdown')">Create QtCreator project</a>
            <a href="%if-then(%Sthenode%,-)%makefile.html" onclick="onItemClick('myDropdown')">Create Makefile project</a>
            <a href="%if-then(%Sthenode%,-)%cxx.html" onclick="onItemClick('myDropdown')">Create C/C++ file</a>
            <a href="%if-then(%Sthenode%,-)%html.html" onclick="onItemClick('myDropdown')">Create .html file</a>
            <a href="%if-then(%Sthenode%,-)%css.html" onclick="onItemClick('myDropdown')">Create .css file</a>
            <a href="%if-then(%Sthenode%,-)%js.html" onclick="onItemClick('myDropdown')">Create .js file</a>
            <a href="%if-then(%Sthenode%,-)%t.html" onclick="onItemClick('myDropdown')">Create .t file</a>
            <a href="%if-then(%Sthenode%,-)%xml.html" onclick="onItemClick('myDropdown')">Create .xml file</a>
            <a href="%if-then(%Sthenode%,-)%xslt.html" onclick="onItemClick('myDropdown')">Create .xslt file</a>
            <a href="%Sthenode%.html" onclick="onItemClick('myDropdown')">Home</a>
            <a href="../templates/t/html/form-html.html" onclick="myItemClick('myDropdown')">/sthenode/</a>
        </div>
        <!--
        =====================================================================
        === menubar
        =====================================================================
        -->
        <ul class="menubar">
            <li><a href="%if-then(%Sthenode%,-)%%Which%.html">%if-then(%Create%, )%%What%</a></li>
        </ul>
        <!--
        =====================================================================
        === form
        =====================================================================
        -->
        <form name="Form" method="POST" action="../templates/t/%Type%/%Which%.t"
         onSubmit="return setFormSubmit(getFormValue2('FormTemplate','FormAction','Form'),getFormValue('FormMethod','Form'),'Form')">
            <div class="form">

                File: <input name="File" value="%Which%"></input>
                      <input type="checkbox" name="is_File" value="no" unchecked="checked">no</input><br/>

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
                <option value="../templates/t/%Type%/%Which%.t">%Which%.t</option>
                <option value="/sthenode-cgi/cgi">cgi parameters</option>
                <option value="/sthenode-cgi/cgicatch">catch cgi parameters</option>
                <option value=""></option>
                </select><br/>
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
)%)%%