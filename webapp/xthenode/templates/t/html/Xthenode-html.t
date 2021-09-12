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
%#   File: Xthenode-html.t
%#
%# Author: $author$
%#   Date: 7/9/2019
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%is_File,%(%else-then(%is_File%,%()%)%)%,%
%File,%(%else-then(%File%,%(Xthenode)%)%)%,%
%is_CssName,%(%else-then(%is_CssName%,%()%)%)%,%
%CssName,%(%else-then(%CssName%,%(%else-then(%Name%,%(Xthenode)%)%)%)%)%,%
%is_JsName,%(%else-then(%is_JsName%,%()%)%)%,%
%JsName,%(%else-then(%JsName%,%(%else-then(%Name%,%(Xthenode)%)%)%)%)%,%
%is_Application,%(%else-then(%is_Application%,%()%)%)%,%
%Application,%(%else-then(%Application%,%(Xthenode)%)%)%,%
%is_Head,%(%else-then(%is_Head%,%()%)%)%,%
%Head,%(%else-then(%Head%,%(Xthenode-head-html.t)%)%)%,%
%is_Body,%(%else-then(%is_Body%,%()%)%)%,%
%Body,%(%else-then(%Body%,%(Xthenode-body-html.t)%)%)%,%
%%(%
%%include(%include_path%/html.t)%%
%)%)%%
