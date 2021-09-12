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
%#   File: create-html-form-begin.t
%#
%# Author: $author$
%#   Date: 11/25/2019
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%%(%
%
                File: <input name="Name" value="Create"></input>
                <input type="checkbox" name="is_Name" value="no" unchecked="checked">no</input><br>
                Template: <select name="FormTemplate">
                    <option value="%Action%">%Title%</option>
                    <option value=""></option>
                    <option value="/%framework%-cgi/cgi">cgi parameters</option>
                    <option value="/%framework%-cgi/cgicatch">catch cgi parameters</option>
                    <option value=""></option>
                    <option value="/%framework%-http/http">http parameters</option>
                    <option value="/%framework%-http/httpcatch">catch http parameters</option>
                </select>
                <input type="checkbox" name="is_FoprmTemplate" value="no" unchecked="checked">no</input><br>%
%)%)%