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
%#   File: Xthenode-create-action-options-html.t
%#
%# Author: $author$
%#   Date: 12/29/2020
%########################################################################
%with(%
%is_include_path,%(%else-then(%is_include_path%,%(%is_Include_path%)%)%)%,%
%include_path,%(%else-then(%if-no(%is_include_path%,,%(%include_path%)%)%,%(%if-no(%is_include_path%,,%(%filepath(%input%)%)%)%)%)%)%,%
%Include_path,%(%else-then(%if-no(%is_include_path%,,%(%Include_path%)%)%,%(%if-no(%is_include_path%,,%(%include_path%)%)%)%)%)%,%
%INCLUDE_PATH,%(%else-then(%INCLUDE_PATH%,%(%toupper(%Include_path%)%)%)%)%,%
%include_path,%(%else-then(%_include_path%,%(%tolower(%Include_path%)%)%)%)%,%
%%(<option value="%Form_action_action%">%Form_action_text% (%Form_action_action%)</option>
            <option value=""></option>
            <option value="../templates/t/t/parameters.t">t parameters &nbsp;&nbsp; (../templates/t/t/parameters.t)</option>
            <option value="../templates/t/t/functions.t">t functions &nbsp;&nbsp; (../templates/t/t/functions.t)</option>
            <option value=""></option>
            <option value="/%application%-cgi/cgi">cgi parameters &nbsp;&nbsp; (/%application%-cgi/cgi)</option>
            <option value="/%application%-cgi/cgicatch">catch cgi parameters &nbsp;&nbsp; (/%application%-cgi/cgicatch)</option>
            <option value=""/>
            <option value="http://localhost:8080/%application%-http/http">http parameters &nbsp;&nbsp; (...:8080/%application%-http/http)</option>
            <option value="http://localhost:8080/%application%-http/httpcatch">catch http parameters &nbsp;&nbsp; (...:8080/%application%-http/httpcatch)</option>
)%)%