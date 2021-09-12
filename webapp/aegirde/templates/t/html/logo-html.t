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
%#   File: logo-html.t
%#
%# Author: $author$
%#   Date: 11/21/2019
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%is_label,%(%else-then(%is_label%,%()%)%)%,%
%label,%(%else-then(%label%,%(AEGIRDE)%)%)%,%
%Label,%(%else-then(%Label%,%(%label%)%)%)%,%
%LABEL,%(%else-then(%LABEL%,%(%toupper(%Label%)%)%)%)%,%
%label,%(%else-then(%_Label%,%(%tolower(%Label%)%)%)%)%,%
%is_location,%(%else-then(%is_location%,%()%)%)%,%
%location,%(%else-then(%location%,%(Create.html)%)%)%,%
%Location,%(%else-then(%Location%,%(%location%)%)%)%,%
%LOCATION,%(%else-then(%LOCATION%,%(%toupper(%Location%)%)%)%)%,%
%location,%(%else-then(%_Location%,%(%tolower(%Location%)%)%)%)%,%
%%(%
%%include(%include_path%/html-file.t)%%
%<table class="logo" onclick="onClickLocation(event,'%Location%')" border="0"><tr><td>
    <table class="logo-ring" border="0"><tr><td>
    <table class="logo-circle" border="0"><tr class="logo-background"><td>
        <table class="logo-background-background" border="0"><tr class="logo-icon"><td>
            <table class="logo-icon-icon" border="0"><tr><td class="logo-icon-image">
            </td></tr></table>
        </td></tr><tr><td class="logo-label">
        <table class="logo-label-label" border="0"><tr><td class="logo-label-text">%Label%</td></tr></table>
        </td></tr></table>
    </td></tr></table>
    </td></tr></table>
</td></tr></table>
%
%)%)%