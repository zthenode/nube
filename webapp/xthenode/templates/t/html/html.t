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
%#   File: html.t
%#
%# Author: $author$
%#   Date: 7/7/2019
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%is_File,%(%else-then(%is_File%,%()%)%)%,%
%File,%(%else-then(%File%,%(html)%)%)%,%
%is_Name,%(%else-then(%is_Name%,%()%)%)%,%
%Name,%(%else-then(%Name%,%(%else-then(%filebase(%File%)%,%File%)%)%)%)%,%
%is_Extension,%(%else-then(%is_Extension%,%()%)%)%,%
%Extension,%(%else-then(%Extension%,%(%else-then(%fileextension(%File%)%,%(html)%)%)%)%)%,%
%is_CssName,%(%else-then(%is_CssName%,%()%)%)%,%
%CssName,%(%else-then(%CssName%,%(%else-then(%Name%,%(css)%)%)%)%)%,%
%is_CssExtension,%(%else-then(%is_CssExtension%,%()%)%)%,%
%CssExtension,%(%else-then(%CssExtension%,%(%if(%equal(%content_type%,html)%,t,css)%)%)%)%,%
%is_JsName,%(%else-then(%is_JsName%,%()%)%)%,%
%JsName,%(%else-then(%JsName%,%(%else-then(%Name%,%(js)%)%)%)%)%,%
%is_JsExtension,%(%else-then(%is_JsExtension%,%()%)%)%,%
%JsExtension,%(%else-then(%JsExtension%,%(%if(%equal(%content_type%,html)%,t,js)%)%)%)%,%
%is_HtmlExtension,%(%else-then(%is_HtmlExtension%,%()%)%)%,%
%HtmlExtension,%(%else-then(%HtmlExtension%,%(%if(%equal(%content_type%,html)%,%(t?content_type=html&HtmlExtension=html&CssExtension=css&JsExtension=js)%,%(html)%)%)%)%)%,%
%is_Style,%(%else-then(%is_Style%,%()%)%)%,%
%Style,%(%else-then(%Style%,%()%)%)%,%
%is_StyleType,%(%else-then(%is_StyleType%,%()%)%)%,%
%StyleType,%(%else-then(%StyleType%,%(text/css)%)%)%,%
%is_StyleHref,%(%else-then(%is_StyleHref%,%()%)%)%,%
%StyleHref,%(%else-then(%StyleHref%,%(../css/%CssName%.%CssExtension%)%)%)%,%
%is_Script,%(%else-then(%is_Script%,%()%)%)%,%
%Script,%(%else-then(%Script%,%(Script)%)%)%,%
%is_ScriptType,%(%else-then(%is_ScriptType%,%()%)%)%,%
%ScriptType,%(%else-then(%ScriptType%,%(text/javascript)%)%)%,%
%is_ScriptSrc,%(%else-then(%is_ScriptSrc%,%()%)%)%,%
%ScriptSrc,%(%else-then(%ScriptSrc%,%(../js/%JsName%.%JsExtension%)%)%)%,%
%is_Application,%(%else-then(%is_Application%,%()%)%)%,%
%Application,%(%else-then(%Application%,%(Application)%)%)%,%
%is_Page,%(%else-then(%is_Page%,%()%)%)%,%
%Page,%(%else-then(%Page%,%(Page)%)%)%,%
%is_Framework,%(%else-then(%is_Framework%,%()%)%)%,%
%Framework,%(%else-then(%Framework%,%(%else-then(%Application%,%()%)%)%)%)%,%
%is_Title,%(%else-then(%is_Title%,%()%)%)%,%
%Title,%(%else-then(%Title%,%(%else-then(%Page%,%(Title)%)%)%)%)%,%
%is_Head,%(%else-then(%is_Head%,%()%)%)%,%
%Head,%(%else-then(%Head%,%(head-html.t)%)%)%,%
%is_Body,%(%else-then(%is_Body%,%()%)%)%,%
%Body,%(%else-then(%Body%,%(body-html.t)%)%)%,%
%%(%
%%include(%include_path%/file-html.t)%%
%<html>
%include(%include_path%/%Head%)%%
%%include(%include_path%/%Body%)%%
%</html>
%
%)%)%%