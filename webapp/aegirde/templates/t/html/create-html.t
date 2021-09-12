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
%#   File: create-html.t
%#
%# Author: $author$
%#   Date: 10/16/2019
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%is_file,%(%else-then(%is_file%,%(%is_File%)%)%)%,%
%file,%(%else-then(%file%,%(%Framework%)%)%)%,%
%File,%(%else-then(%File%,%(%file%)%)%)%,%
%FILE,%(%else-then(%FILE%,%(%toupper(%File%)%)%)%)%,%
%file,%(%else-then(%_File%,%(%tolower(%File%)%)%)%)%,%
%is_stylebefore,%(%else-then(%is_stylebefore%,%()%)%)%,%
%stylebefore,%(%else-then(%stylebefore%,%(create-html-style-before.t)%)%)%,%
%StyleBefore,%(%else-then(%StyleBefore%,%(%stylebefore%)%)%)%,%
%STYLEBEFORE,%(%else-then(%STYLEBEFORE%,%(%toupper(%StyleBefore%)%)%)%)%,%
%stylebefore,%(%else-then(%_StyleBefore%,%(%tolower(%StyleBefore%)%)%)%)%,%
%is_scriptbegin,%(%else-then(%is_scriptbegin%,%(%is_ScriptBegin%)%)%)%,%
%scriptbegin,%(%else-then(%scriptbegin%,%(create-html-script-begin.t)%)%)%,%
%ScriptBegin,%(%else-then(%ScriptBegin%,%(%scriptbegin%)%)%)%,%
%SCRIPTBEGIN,%(%else-then(%SCRIPTBEGIN%,%(%toupper(%ScriptBegin%)%)%)%)%,%
%scriptbegin,%(%else-then(%_ScriptBegin%,%(%tolower(%ScriptBegin%)%)%)%)%,%
%is_bodybegin,%(%else-then(%is_bodybegin%,%()%)%)%,%
%bodybegin,%(%else-then(%bodybegin%,%(create-html-body-begin.t)%)%)%,%
%BodyBegin,%(%else-then(%BodyBegin%,%(%bodybegin%)%)%)%,%
%BODYBEGIN,%(%else-then(%BODYBEGIN%,%(%toupper(%BodyBegin%)%)%)%)%,%
%bodybegin,%(%else-then(%_BodyBegin%,%(%tolower(%BodyBegin%)%)%)%)%,%
%is_formbegin,%(%else-then(%is_formbegin%,%()%)%)%,%
%formbegin,%(%else-then(%formbegin%,%(create-html-form-begin.t)%)%)%,%
%FormBegin,%(%else-then(%FormBegin%,%(%formbegin%)%)%)%,%
%FORMBEGIN,%(%else-then(%FORMBEGIN%,%(%toupper(%FormBegin%)%)%)%)%,%
%formbegin,%(%else-then(%_FormBegin%,%(%tolower(%FormBegin%)%)%)%)%,%
%is_parent,%(%else-then(%is_parent%,%()%)%)%,%
%%(%
%%include(%include_path%/html.t)%%
%)%)%