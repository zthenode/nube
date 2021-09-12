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
%#   File: application-footer-html.t
%#
%# Author: $author$
%#   Date: 12/12/2019
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%is_application,%(%else-then(%is_application%,%(%is_Application%)%)%)%,%
%application,%(%else-then(%if-no(%is_application%,,%(%application%)%)%,%(%if-no(%is_application%,,%(Application)%)%)%)%)%,%
%Application,%(%else-then(%if-no(%is_application%,,%(%Application%)%)%,%(%if-no(%is_application%,,%(%application%)%)%)%)%)%,%
%APPLICATION,%(%else-then(%APPLICATION%,%(%toupper(%Application%)%)%)%)%,%
%application,%(%else-then(%_application%,%(%tolower(%Application%)%)%)%)%,%
%is_file,%(%else-then(%is_file%,%(%is_File%)%)%)%,%
%file,%(%else-then(%if-no(%is_file%,,%(%file%)%)%,%(%if-no(%is_file%,,%(%else-then(%File%,%Application%-footer)%)%)%)%)%)%,%
%File,%(%else-then(%if-no(%is_file%,,%(%File%)%)%,%(%if-no(%is_file%,,%(%file%)%)%)%)%)%,%
%FILE,%(%else-then(%FILE%,%(%toupper(%File%)%)%)%)%,%
%file,%(%else-then(%_file%,%(%tolower(%File%)%)%)%)%,%
%is_applications,%(%else-then(%is_applications%,%(%is_Applications%)%)%)%,%
%applications,%(%else-then(%if-no(%is_applications%,,%(%applications%)%)%,%(%if-no(%is_applications%,,%(%Application%;Xthenode;Aegirde)%)%)%)%)%,%
%Applications,%(%else-then(%if-no(%is_applications%,,%(%Applications%)%)%,%(%if-no(%is_applications%,,%(%applications%)%)%)%)%)%,%
%APPLICATIONS,%(%else-then(%APPLICATIONS%,%(%toupper(%Applications%)%)%)%)%,%
%applications,%(%else-then(%_applications%,%(%tolower(%Applications%)%)%)%)%,%
%is_dropover_items,%(%else-then(%is_dropover_items%,%(%is_Dropover_items%)%)%)%,%
%dropover_items,%(%else-then(%if-no(%is_dropover_items%,,%(%dropover_items%)%)%,%(%if-no(%is_dropover_items%,,%(%
%%parse(%Applications%,;,,%(;)%,,%(%
%%with(%
%APPLICATION,%(%else-then(%APPLICATION%,%(%toupper(%Application%)%)%)%)%,%
%application,%(%else-then(%_application%,%(%tolower(%Application%)%)%)%)%,%
%%(%
%%Application%:/%application%/html/%Application%.html%
%)%)%%
%)%,Application)%%
%)%)%)%)%)%,%
%Dropover_items,%(%else-then(%if-no(%is_dropover_items%,,%(%Dropover_items%)%)%,%(%if-no(%is_dropover_items%,,%(%dropover_items%)%)%)%)%)%,%
%DROPOVER_ITEMS,%(%else-then(%DROPOVER_ITEMS%,%(%toupper(%Dropover_items%)%)%)%)%,%
%dropover_items,%(%else-then(%_dropover_items%,%(%tolower(%Dropover_items%)%)%)%)%,%
%%(%
%%if(%Html%,,%(%
%%include(%include_path%/../html/html-file.t)%%
%%)%)%%
%<table class="footer" border="0"><tr>
    <!--
    =====================================================================
    === dropover
    =====================================================================
    -->
    <td id="myDropover" class="footer-button">
    <table class="dropover" border="0"><tr><td>
        <button class="dropover-button" onclick="onDropoverClick('myDropover', event)">
            <table class="dropover-bars"><tr>
                <td class="dropover-bar"></td>
                <td class="dropover-bar"></td>
                <td class="dropover-bar"></td>
            </tr></table>
        </button>
    </td></tr></table>%
%%parse(%Dropover_items%,;,,,,%(%
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
    </td><td name="myDropover" class="footer-buttons"><a href="%ItemHref%">
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
%
%)%)%