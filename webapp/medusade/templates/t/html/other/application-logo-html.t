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
%#   File: application-logo-html.t
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
%file,%(%else-then(%if-no(%is_file%,,%(%file%)%)%,%(%if-no(%is_file%,,%(%else-then(%File%,%Application%-logo)%)%)%)%)%)%,%
%File,%(%else-then(%if-no(%is_file%,,%(%File%)%)%,%(%if-no(%is_file%,,%(%file%)%)%)%)%)%,%
%FILE,%(%else-then(%FILE%,%(%toupper(%File%)%)%)%)%,%
%file,%(%else-then(%_file%,%(%tolower(%File%)%)%)%)%,%
%%(%
%%if(%Html%,,%(%
%%include(%include_path%/../html/html-file.t)%%
%%)%)%%
%<table class="logo-body" border="0"><tr><td>
    <table class="body-logo" onclick="onClickLocation(event,'%Application%.html')" border="0"><tr><td>
        <table class="logo-ring" border="0"><tr><td>
        <table class="logo-circle" border="0"><tr class="logo-background"><td>
            <table class="logo-background-background" border="0"><tr class="logo-icon"><td>
                <table class="logo-icon-icon" border="0"><tr><td class="logo-icon-image">
                </td></tr></table>
            </td></tr><tr><td class="logo-label">
            <table class="logo-label-label" border="0"><tr><td class="logo-label-text">%APPLICATION%</td></tr></table>
            </td></tr></table>
        </td></tr></table>
        </td></tr></table>
    </td></tr></table>
</td></tr></table>
%
%)%)%