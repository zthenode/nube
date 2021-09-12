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
%#   File: Application-popdown-content-html.t
%#
%# Author: $author$
%#   Date: 2/18/2020
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
%name,%(%else-then(%if-no(%is_name%,,%(%name%)%)%,%(%if-no(%is_name%,,%(%Application%-popdown-content)%)%)%)%)%,%
%Name,%(%else-then(%if-no(%is_name%,,%(%Name%)%)%,%(%if-no(%is_name%,,%(%name%)%)%)%)%)%,%
%NAME,%(%else-then(%NAME%,%(%toupper(%Name%)%)%)%)%,%
%name,%(%else-then(%_name%,%(%tolower(%Name%)%)%)%)%,%
%%(%
%%include(%Include_path%/file-html.t)%%
%<div id="myPopdown" class="popdown-content">
<table class="popover" border="0">%parse(%Applications%,;,,,,%(%
%%with(%
%APPLICATION,%(%toupper(%Application%)%)%,%
%application,%(%tolower(%Application%)%)%,%
%%(

    <!--
    =====================================================================
    === %application%
    =====================================================================
    -->
    <tr><td name="myPopover" class="popover-buttons"><a href="/%application%/html/%Application%.html">
    <table class="footer-logo" border="0"><tr><td>
        <table class="footer-logo-ring" border="0"><tr><td>
            <table class="footer-logo-circle" border="0"><tr class="footer-logo-background"><td>
                <table class="footer-logo-background-background" border="0"><tr class="footer-logo-icon"><td>
                    <table class="footer-logo-icon-icon" border="0"><tr>
                    <td class="footer-logo-icon-image" style="background-image:url('../images/%Application%.jpg')">
                    </td></tr></table>
                </td></tr><tr><td class="footer-logo-label">
                    <table class="footer-logo-label-label" border="0"><tr>
                    <td class="footer-logo-label-text">%APPLICATION%</td></tr></table>
                </td></tr></table>
            </td></tr></table>
        </td></tr></table>
    </td></tr></table></a>
    </td></tr>)%)%)%,Application)%</table>
</div>
%
%)%)%