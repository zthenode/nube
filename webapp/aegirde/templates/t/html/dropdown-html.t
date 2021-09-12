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
%#   File: dropdown-html.t
%#
%# Author: $author$
%#   Date: 11/21/2019
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%is_dropdown,%(%else-then(%is_dropdown%,%()%)%)%,%
%dropdown,%(%else-then(%dropdown%,%(myDropdown)%)%)%,%
%Dropdown,%(%else-then(%Dropdown%,%(%dropdown%)%)%)%,%
%DROPDOWN,%(%else-then(%DROPDOWN%,%(%toupper(%Dropdown%)%)%)%)%,%
%dropdown,%(%else-then(%_Dropdown%,%(%tolower(%Dropdown%)%)%)%)%,%
%%(%
%%include(%include_path%/html-file.t)%%
%<div id="%Dropdown%" class="dropdown-content">
    <a href="Create-qtcreator.html" onclick="onItemClick('%Dropdown%')">Create QtCreator project</a>
    <a href="Create-makefile.html" onclick="onItemClick('%Dropdown%')">Create Makefile project</a>
    <a href="Create-cxx.html" onclick="onItemClick('%Dropdown%')">Create C/C++ file</a>
    <a href="Create-html.html" onclick="onItemClick('%Dropdown%')">Create .html file</a>
    <a href="Create-css.html" onclick="onItemClick('%Dropdown%')">Create .css file</a>
    <a href="Create-js.html" onclick="onItemClick('%Dropdown%')">Create .js file</a>
    <a href="Create-t.html" onclick="onItemClick('%Dropdown%')">Create .t file</a>
    <a href="Create-xml.html" onclick="onItemClick('%Dropdown%')">Create .xml file</a>
    <a href="Create-xslt.html" onclick="onItemClick('%Dropdown%')">Create .xslt file</a>
    <a href="Create.html" onclick="onItemClick('%Dropdown%')">Home</a>
    <a href="/source/aegirde/" onclick="myItemClick('%Dropdown%')">/aegirde/</a>
</div>
%
%)%)%