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
%#   File: create-html-form-begin.t
%#
%# Author: $author$
%#   Date: 10/16/2019
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%is_file,%(%else-then(%is_file%,%(%is_File%)%)%)%,%
%file,%(%else-then(%file%,%()%)%)%,%
%File,%(%else-then(%File%,%(%file%)%)%)%,%
%FILE,%(%else-then(%FILE%,%(%toupper(%File%)%)%)%)%,%
%file,%(%else-then(%_File%,%(%tolower(%File%)%)%)%)%,%
%is_name,%(%else-then(%is_name%,%(%is_Name%)%)%)%,%
%name,%(%else-then(%name%,%(%else-then(%filebase(%File%)%,%(html)%)%)%)%)%,%
%Name,%(%else-then(%Name%,%(%name%)%)%)%,%
%NAME,%(%else-then(%NAME%,%(%toupper(%Name%)%)%)%)%,%
%name,%(%else-then(%_Name%,%(%tolower(%Name%)%)%)%)%,%
%is_extension,%(%else-then(%is_extension%,%(%is_Extension%)%)%)%,%
%extension,%(%else-then(%extension%,%(%else-then(%fileextension(%File%)%,%(html)%)%)%)%)%,%
%Extension,%(%else-then(%Extension%,%(%extension%)%)%)%,%
%EXTENSION,%(%else-then(%EXTENSION%,%(%toupper(%Extension%)%)%)%)%,%
%extension,%(%else-then(%_Extension%,%(%tolower(%Extension%)%)%)%)%,%
%parent,%(%else-then(%parent%,%(Create.html)%)%)%,%
%Parent,%(%else-then(%Parent%,%(%parent%)%)%)%,%
%PARENT,%(%else-then(%PARENT%,%(%toupper(%Parent%)%)%)%)%,%
%parent,%(%else-then(%_Parent%,%(%tolower(%Parent%)%)%)%)%,%
%is_self,%(%else-then(%is_self%,%()%)%)%,%
%self,%(%else-then(%self%,%(%Name%.%Extension%)%)%)%,%
%Self,%(%else-then(%Self%,%(%self%)%)%)%,%
%SELF,%(%else-then(%SELF%,%(%toupper(%Self%)%)%)%)%,%
%self,%(%else-then(%_Self%,%(%tolower(%Self%)%)%)%)%,%
%is_dropdown,%(%else-then(%is_dropdown%,%()%)%)%,%
%dropdown,%(%else-then(%dropdown%,%(myDropdown)%)%)%,%
%Dropdown,%(%else-then(%Dropdown%,%(%dropdown%)%)%)%,%
%DROPDOWN,%(%else-then(%DROPDOWN%,%(%toupper(%Dropdown%)%)%)%)%,%
%dropdown,%(%else-then(%_Dropdown%,%(%tolower(%Dropdown%)%)%)%)%,%
%%(
        <!--
        =====================================================================
        === header
        =====================================================================
        -->
        <div id="includeHeader" include="%Framework%-header.html">
            <script>includeHTML('includeHeader');</script>
        </div>
        <!--
        =====================================================================
        === dropdown
        =====================================================================
        -->
        <div id="includeDropdown" include="%Framework%-dropdown.html">
            <script>includeHTML('includeDropdown');</script>
        </div>
        <!--
        =====================================================================
        === menubar
        =====================================================================
        -->
        <ul class="menubar">
            <li><a location="%Name%.%Extension%" onclick="onItemClick(event,'%Dropdown%')">%Title%</a></li>
        </ul>
        <!--
        =====================================================================
        === logo
        =====================================================================
        -->
        <div id="includeLogo" include="%Framework%-logo.html">
            <script>includeHTML('includeLogo');</script>
        </div>
)%)%