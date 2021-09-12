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
%#   File: header-html.t
%#
%# Author: $author$
%#   Date: 11/21/2019
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%is_parent,%(%else-then(%is_parent%,%()%)%)%,%
%parent,%(%else-then(%parent%,%(.)%)%)%,%
%Parent,%(%else-then(%Parent%,%(%parent%)%)%)%,%
%PARENT,%(%else-then(%PARENT%,%(%toupper(%Parent%)%)%)%)%,%
%parent,%(%else-then(%_Parent%,%(%tolower(%Parent%)%)%)%)%,%
%is_self,%(%else-then(%is_self%,%()%)%)%,%
%self,%(%else-then(%self%,%(Create.html)%)%)%,%
%Self,%(%else-then(%Self%,%(%self%)%)%)%,%
%SELF,%(%else-then(%SELF%,%(%toupper(%Self%)%)%)%)%,%
%self,%(%else-then(%_Self%,%(%tolower(%Self%)%)%)%)%,%
%is_dropdown,%(%else-then(%is_dropdown%,%()%)%)%,%
%dropdown,%(%else-then(%dropdown%,%(myDropdown)%)%)%,%
%Dropdown,%(%else-then(%Dropdown%,%(%dropdown%)%)%)%,%
%DROPDOWN,%(%else-then(%DROPDOWN%,%(%toupper(%Dropdown%)%)%)%)%,%
%dropdown,%(%else-then(%_Dropdown%,%(%tolower(%Dropdown%)%)%)%)%,%
%%(%
%%include(%include_path%/html-file.t)%%
%<table class="header" border="0"><tr><td class="header-button">
    <!--
    =====================================================================
    === parent
    =====================================================================
    -->
    <table class="parent" border="0"><tr><td>
        <button class="parent-button" onclick="onClickLocation(event,'%Parent%')">
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
        <button class="parent-button" onclick="onClickLocation(event,'%Self%')">
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
        <button class="dropdown-button" onclick="onDropdownClick('%Dropdown%')">
            <table class="dropdown-bars"><tr>
                <td class="dropdown-bar"></td></tr><tr>
                <td class="dropdown-bar"></td></tr><tr>
                <td class="dropdown-bar"></td>
            </tr></table>
        </button>
    </td></tr></table>
</td></tr></table>
%
%)%)%