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
%#   File: application-header-html.t
%#
%# Author: $author$
%#   Date: 12/10/2019
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%is_application,%(%else-then(%is_application%,%(%is_Application%)%)%)%,%
%application,%(%else-then(%if-no(%is_application%,,%(%application%)%)%,%(%if-no(%is_application%,,%(Application)%)%)%)%)%,%
%Application,%(%else-then(%if-no(%is_application%,,%(%Application%)%)%,%(%if-no(%is_application%,,%(%application%)%)%)%)%)%,%
%APPLICATION,%(%else-then(%APPLICATION%,%(%toupper(%Application%)%)%)%)%,%
%application,%(%else-then(%_application%,%(%tolower(%Application%)%)%)%)%,%
%is_file,%(%else-then(%is_file%,%(%is_File%)%)%)%,%
%file,%(%else-then(%if-no(%is_file%,,%(%file%)%)%,%(%if-no(%is_file%,,%(%else-then(%File%,%Application%-header)%)%)%)%)%)%,%
%File,%(%else-then(%if-no(%is_file%,,%(%File%)%)%,%(%if-no(%is_file%,,%(%file%)%)%)%)%)%,%
%FILE,%(%else-then(%FILE%,%(%toupper(%File%)%)%)%)%,%
%file,%(%else-then(%_file%,%(%tolower(%File%)%)%)%)%,%
%is_parent_location,%(%else-then(%is_parent_location%,%(%is_Parent_location%)%)%)%,%
%parent_location,%(%else-then(%if-no(%is_parent_location%,,%(%parent_location%)%)%,%(%if-no(%is_parent_location%,,%(.)%)%)%)%)%,%
%Parent_location,%(%else-then(%if-no(%is_parent_location%,,%(%Parent_location%)%)%,%(%if-no(%is_parent_location%,,%(%parent_location%)%)%)%)%)%,%
%PARENT_LOCATION,%(%else-then(%PARENT_LOCATION%,%(%toupper(%Parent_location%)%)%)%)%,%
%parent_location,%(%else-then(%_parent_location%,%(%tolower(%Parent_location%)%)%)%)%,%
%is_self_location,%(%else-then(%is_self_location%,%(%is_Self_location%)%)%)%,%
%self_location,%(%else-then(%if-no(%is_self_location%,,%(%self_location%)%)%,%(%if-no(%is_self_location%,,%(%Application%.html)%)%)%)%)%,%
%Self_location,%(%else-then(%if-no(%is_self_location%,,%(%Self_location%)%)%,%(%if-no(%is_self_location%,,%(%self_location%)%)%)%)%)%,%
%SELF_LOCATION,%(%else-then(%SELF_LOCATION%,%(%toupper(%Self_location%)%)%)%)%,%
%self_location,%(%else-then(%_self_location%,%(%tolower(%Self_location%)%)%)%)%,%
%%(%
%%if(%Html%,,%(%
%%include(%include_path%/../html/html-file.t)%%
%%)%)%%
%<table class="header" border="0"><tr>
    <!--
    =====================================================================
    === parent
    =====================================================================
    -->
    <td class="header-button">
    <table class="parent" border="0"><tr><td>
        <button class="parent-button" onclick="onClickParentLocation(event,'%Parent_location%')">
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
        <button class="parent-button" onclick="onClickSelfLocation(event,'%Self_location%')">
            <table class="parent-dots"><tr>
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
        <button class="dropdown-button" onclick="onDropdownClick('myDropdown')">
            <table class="dropdown-bars"><tr>
                <td class="dropdown-bar"></td></tr><tr>
                <td class="dropdown-bar"></td></tr><tr>
                <td class="dropdown-bar"></td>
            </tr></table>
        </button>
    </td></tr></table>
    <!--
    =====================================================================
    === popdown
    =====================================================================
    -->
    <table class="popdown" border="0"><tr><td>
        <button class="popdown-button" onclick="onPopdownClick('myPopdown')">
            <table class="popdown-dots"><tr>
                <td class="popdown-dot"></td><td class="popdown-dot"></td><td class="popdown-dot"></td></tr><tr>
                <td class="popdown-dot"></td><td class="popdown-dot"></td><td class="popdown-dot"></td></tr><tr>
                <td class="popdown-dot"></td><td class="popdown-dot"></td><td class="popdown-dot"></td>
            </tr></table>
        </button>
    </td></tr></table>
</td></tr></table>
%
%)%)%