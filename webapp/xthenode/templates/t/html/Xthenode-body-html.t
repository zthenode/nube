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
%#   File: Xthenode-body-html.t
%#
%# Author: $author$
%#   Date: 7/9/2019
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%%(%
%    <!--
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
            </td><td class="header-button">
            <!--
            =====================================================================
            === dropdown
            =====================================================================
            -->
            <table class="dropdown" border="0"><tr><td>
                <button class="dropdown-button" onclick="myDropdownClick()">
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
            <a href="Xthenode-create-cxx.html" onclick="myItemClick()">Create C/C++ File</a>
            <a href="Xthenode-create-html.html" onclick="myItemClick()">Create HTML File</a>
            <a href="Xthenode-create-css.html" onclick="myItemClick()">Create CSS File</a>
            <a href="Xthenode-create-js.html" onclick="myItemClick()">Create JS File</a>
            <a href="Xthenode-create-t.html" onclick="myItemClick()">Create T File</a>
            <a href="Xthenode.html" onclick="myItemClick()">Home</a>
            <a href="../xthenode/templates/t/html/xthenode-html.html" onclick="myItemClick()">/xthenode/</a>
        </div>
        <!--
        =====================================================================
        === menubar
        =====================================================================
        -->
        <ul class="menubar">
            <li><a href="Sthenode-create-cxx.html">Create C/C++ File</a></li>
        </ul>
        <!--
        =====================================================================
        === form
        =====================================================================
        -->
        <form name="Form" method="POST" action="../templates/t/cxx/cxx.t"
         onSubmit="return setFormSubmit(getFormValue2('FormTemplate','FormAction','Form'),getFormValue('FormMethod','Form'),'Form')">
            <div class="form">

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
            <option value="../templates/t/cxx/cxx.t">cxx.t</option>
            <option value="/sthenode-cgi/cgi">cgi parameters</option>
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
%
%)%)%%