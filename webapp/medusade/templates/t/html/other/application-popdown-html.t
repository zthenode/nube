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
%#   File: application-popdown-html.t
%#
%# Author: $author$
%#   Date: 3/25/2021
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
%is_file,%(%else-then(%is_file%,%(%is_File%)%)%)%,%
%file,%(%else-then(%if-no(%is_file%,,%(%file%)%)%,%(%if-no(%is_file%,,%(%else-then(%File%,%Application%-popdown)%)%)%)%)%)%,%
%File,%(%else-then(%if-no(%is_file%,,%(%File%)%)%,%(%if-no(%is_file%,,%(%file%)%)%)%)%)%,%
%FILE,%(%else-then(%FILE%,%(%toupper(%File%)%)%)%)%,%
%file,%(%else-then(%_file%,%(%tolower(%File%)%)%)%)%,%
%is_applications,%(%else-then(%is_applications%,%(%is_Applications%)%)%)%,%
%applications,%(%else-then(%if-no(%is_applications%,,%(%applications%)%)%,%(%if-no(%is_applications%,,%(%Application%;Xthenode;Aegirde)%)%)%)%)%,%
%Applications,%(%else-then(%if-no(%is_applications%,,%(%Applications%)%)%,%(%if-no(%is_applications%,,%(%applications%)%)%)%)%)%,%
%APPLICATIONS,%(%else-then(%APPLICATIONS%,%(%toupper(%Applications%)%)%)%)%,%
%applications,%(%else-then(%_applications%,%(%tolower(%Applications%)%)%)%)%,%
%is_popdown_items,%(%else-then(%is_popdown_items%,%(%is_Popdown_items%)%)%)%,%
%popdown_items,%(%else-then(%if-no(%is_popdown_items%,,%(%popdown_items%)%)%,%(%if-no(%is_popdown_items%,,%(%
%%parse(%Applications%,;,,%(;)%,,%(%
%%with(%
%APPLICATION,%(%else-then(%APPLICATION%,%(%toupper(%Application%)%)%)%)%,%
%application,%(%else-then(%_application%,%(%tolower(%Application%)%)%)%)%,%
%%(%
%%Application%:/%application%/html/%Application%.html%
%)%)%%
%)%,Application)%%
%)%)%)%)%)%,%
%Popdown_items,%(%else-then(%if-no(%is_popdown_items%,,%(%Popdown_items%)%)%,%(%if-no(%is_popdown_items%,,%(%popdown_items%)%)%)%)%)%,%
%POPDOWN_ITEMS,%(%else-then(%POPDOWN_ITEMS%,%(%toupper(%Popdown_items%)%)%)%)%,%
%popdown_items,%(%else-then(%_popdown_items%,%(%tolower(%Popdown_items%)%)%)%)%,%
%%(%
%%if(%Html%,,%(%
%%include(%include_path%/../html/html-file.t)%%
%%)%)%%
%<div id="myPopdown" class="popdown-content">
<table class="popover" border="0">%
%%parse(%Popdown_items%,;,,,,%(%
%%with(%
%is_itemlabel,%(%else-then(%is_itemlabel%,%(%is_ItemLabel%)%)%)%,%
%itemlabel,%(%else-then(%if-no(%is_itemlabel%,,%(%itemlabel%)%)%,%(%if-no(%is_itemlabel%,,%(%left(%Item%,:)%)%)%)%)%)%,%
%ItemLabel,%(%else-then(%if-no(%is_itemlabel%,,%(%ItemLabel%)%)%,%(%itemlabel%)%)%)%,%
%ITEMLABEL,%(%else-then(%ITEMLABEL%,%(%toupper(%ItemLabel%)%)%)%)%,%
%itemlabel,%(%else-then(%_ItemLabel%,%(%tolower(%ItemLabel%)%)%)%)%,%
%is_itemhref,%(%else-then(%is_itemhref%,%(%is_ItemHref%)%)%)%,%
%itemhref,%(%else-then(%if-no(%is_itemhref%,,%(%itemhref%)%)%,%(%if-no(%is_itemhref%,,%(%right-of-left(%Item%,:)%)%)%)%)%)%,%
%ItemHref,%(%else-then(%if-no(%is_itemhref%,,%(%ItemHref%)%)%,%(%itemhref%)%)%)%,%
%ITEMHREF,%(%else-then(%ITEMHREF%,%(%toupper(%ItemHref%)%)%)%)%,%
%itemhref,%(%else-then(%_ItemHref%,%(%tolower(%ItemHref%)%)%)%)%,%
%%(

    <!--
    =====================================================================
    === %ItemLabel%
    =====================================================================
    -->
    <tr><td name="myPopover" class="popover-buttons"><a href="%ItemHref%">
    <table class="footer-logo" border="0"><tr><td>
        <table class="footer-logo-ring" border="0"><tr><td>
            <table class="footer-logo-circle" border="0"><tr class="footer-logo-background"><td>
                <table class="footer-logo-background-background" border="0"><tr class="footer-logo-icon"><td>
                    <table class="footer-logo-icon-icon" border="0"><tr>
                    <td class="footer-logo-icon-image" style="background-image:url('../images/%ItemLabel%.png')">
                    </td></tr></table>
                </td></tr><tr><td class="footer-logo-label">
                    <table class="footer-logo-label-label" border="0"><tr>
                    <td class="footer-logo-label-text">%ITEMLABEL%</td></tr></table>
                </td></tr></table>
            </td></tr></table>
        </td></tr></table>
    </td></tr></table></a>)%)%%
%)%,Item)%

</td></tr></table>
</div>
%
%)%)%