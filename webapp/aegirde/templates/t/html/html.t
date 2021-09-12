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
%#   File: html.t
%#
%# Author: $author$
%#   Date: 10/16/2019
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%is_framework,%(%else-then(%is_framework%,%(%is_Framework%)%)%)%,%
%framework,%(%else-then(%framework%,%()%)%)%,%
%Framework,%(%else-then(%Framework%,%(%framework%)%)%)%,%
%FRAMEWORK,%(%else-then(%FRAMEWORK%,%(%toupper(%Framework%)%)%)%)%,%
%framework,%(%else-then(%_Framework%,%(%tolower(%Framework%)%)%)%)%,%
%is_styletype,%(%else-then(%is_styletype%,%()%)%)%,%
%styletype,%(%else-then(%styletype%,%(text/css)%)%)%,%
%StyleType,%(%else-then(%StyleType%,%(%styletype%)%)%)%,%
%STYLETYPE,%(%else-then(%STYLETYPE%,%(%toupper(%StyleType%)%)%)%)%,%
%styletype,%(%else-then(%_StyleType%,%(%tolower(%StyleType%)%)%)%)%,%
%is_stylehref,%(%else-then(%is_stylehref%,%(%is_StyleHref%)%)%)%,%
%stylehref,%(%else-then(%if-no(%is_stylehref%,%()%,%(%stylehref%)%)%,%(../css/%if-no(%is_stylehref%,%(%Framework%)%,%(html)%)%.css)%)%)%,%
%StyleHref,%(%else-then(%if-no(%is_stylehref%,%()%,%(%StyleHref%)%)%,%(%stylehref%)%)%)%,%
%STYLEHREF,%(%else-then(%STYLEHREF%,%(%toupper(%StyleHref%)%)%)%)%,%
%stylehref,%(%else-then(%_StyleHref%,%(%tolower(%StyleHref%)%)%)%)%,%
%is_scripttype,%(%else-then(%is_scripttype%,%()%)%)%,%
%scripttype,%(%else-then(%scripttype%,%(text/javascript)%)%)%,%
%ScriptType,%(%else-then(%ScriptType%,%(%scripttype%)%)%)%,%
%SCRIPTTYPE,%(%else-then(%SCRIPTTYPE%,%(%toupper(%ScriptType%)%)%)%)%,%
%scripttype,%(%else-then(%_ScriptType%,%(%tolower(%ScriptType%)%)%)%)%,%
%is_scriptsrc,%(%else-then(%is_scriptsrc%,%(%is_ScriptSrc%)%)%)%,%
%scriptsrc,%(%else-then(%if-no(%is_scriptsrc%,%()%,%(%scriptsrc%)%)%,%(../js/%if-no(%is_scriptsrc%,%(%Framework%)%,%(html)%)%.js)%)%)%,%
%ScriptSrc,%(%else-then(%if-no(%is_scriptsrc%,%()%,%(%ScriptSrc%)%)%,%(%scriptsrc%)%)%)%,%
%SCRIPTSRC,%(%else-then(%SCRIPTSRC%,%(%toupper(%ScriptSrc%)%)%)%)%,%
%scriptsrc,%(%else-then(%_ScriptSrc%,%(%tolower(%ScriptSrc%)%)%)%)%,%
%is_form,%(%else-then(%is_form%,%(%is_Form%)%)%)%,%
%form,%(%else-then(%form%,%(Form)%)%)%,%
%Form,%(%else-then(%Form%,%(%form%)%)%)%,%
%FORM,%(%else-then(%FORM%,%(%toupper(%Form%)%)%)%)%,%
%form,%(%else-then(%_Form%,%(%tolower(%Form%)%)%)%)%,%
%is_method,%(%else-then(%is_method%,%()%)%)%,%
%method,%(%else-then(%method%,%(POST)%)%)%,%
%Method,%(%else-then(%Method%,%(%method%)%)%)%,%
%METHOD,%(%else-then(%METHOD%,%(%toupper(%Method%)%)%)%)%,%
%method,%(%else-then(%_Method%,%(%tolower(%Method%)%)%)%)%,%
%is_action,%(%else-then(%is_action%,%()%)%)%,%
%action,%(%else-then(%action%,%(..)%)%)%,%
%Action,%(%else-then(%Action%,%(%action%)%)%)%,%
%ACTION,%(%else-then(%ACTION%,%(%toupper(%Action%)%)%)%)%,%
%action,%(%else-then(%_Action%,%(%tolower(%Action%)%)%)%)%,%
%%(%
%%include(%include_path%/html-file.t)%%
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
        <title>%if-then(%Framework%, - )%%Title%</title>
    
        <!--
        =====================================================================
        === style
        =====================================================================
        -->
        <link rel="stylesheet" type="%StyleType%" href="%StyleHref%"></link>
        %include(%include_path%/%StyleBefore%)%<style type="%StyleType%">%include(%include_path%/%StyleBegin%)%
        </style>
    
        <!--
        =====================================================================
        === script
        =====================================================================
        -->
        <script type="%ScriptType%" src="%ScriptSrc%"></script>
        <script type="%ScriptType%">%include(%include_path%/%ScriptBegin%)%
        </script>
    </head>
    <!--
    =====================================================================
    === body
    =====================================================================
    -->
    <body class="body">%include(%include_path%/%BodyBegin%)%
        <!--
        =====================================================================
        === form
        =====================================================================
        -->
        <form name="%Form%" method="%Method%" action="%Action%"
         onSubmit="return setFormSubmit(getFormValue2('FormTemplate','FormAction','%Form%'),getFormValue('FormMethod','%Form%'),'%Form%')">
            <div class="form">%include(%include_path%/%FormBegin%)%

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
                <option value="%Action%">%Title%</option>
                <option value=""></option>
                <option value="/%framework%-cgi/cgi">cgi parameters</option>
                <option value="/%framework%-cgi/cgicatch">catch cgi parameters</option>
                <option value=""></option>
                <option value="/%framework%-http/http">http parameters</option>
                <option value="/%framework%-http/httpcatch">catch http parameters</option>
                </select><br/>
                Method: <select name="FormMethod">
                <option value="POST">POST</option>
                <option value="GET">GET</option>
                <option value=""></option>
                </select><br/>

                <br/>
                <input type="submit" name="submit" value="submit"/><br/>
            </div>
        </form>
    </body>
</html>
%
%)%)%