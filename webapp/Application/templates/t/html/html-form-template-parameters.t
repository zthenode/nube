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
%#   File: html-form-template-parameters.t
%#
%# Author: $author$
%#   Date: 1/2/2021
%########################################################################
%with(%
%is_application,%(%else-then(%is_application%,%(%is_Application%)%)%)%,%
%application,%(%else-then(%if-no(%is_application%,,%(%application%)%)%,%(%if-no(%is_application%,,%(Application)%)%)%)%)%,%
%Application,%(%else-then(%if-no(%is_application%,,%(%Application%)%)%,%(%if-no(%is_application%,,%(%application%)%)%)%)%)%,%
%APPLICATION,%(%else-then(%APPLICATION%,%(%toupper(%Application%)%)%)%)%,%
%application,%(%else-then(%_application%,%(%tolower(%Application%)%)%)%)%,%
%is_what,%(%else-then(%is_what%,%(%is_What%)%)%)%,%
%what,%(%else-then(%if-no(%is_what%,,%(%what%)%)%,%(%if-no(%is_what%,,%(html)%)%)%)%)%,%
%What,%(%else-then(%if-no(%is_what%,,%(%What%)%)%,%(%if-no(%is_what%,,%(%what%)%)%)%)%)%,%
%WHAT,%(%else-then(%WHAT%,%(%toupper(%What%)%)%)%)%,%
%what,%(%else-then(%_what%,%(%tolower(%What%)%)%)%)%,%
%is_templates,%(%else-then(%is_templates%,%(%is_Templates%)%)%)%,%
%templates,%(%else-then(%if-no(%is_templates%,,%(%templates%)%)%,%(%if-no(%is_templates%,,%(../templates/t/%What%)%)%)%)%)%,%
%Templates,%(%else-then(%if-no(%is_templates%,,%(%Templates%)%)%,%(%if-no(%is_templates%,,%(%templates%)%)%)%)%)%,%
%TEMPLATES,%(%else-then(%TEMPLATES%,%(%toupper(%Templates%)%)%)%)%,%
%templates,%(%else-then(%_templates%,%(%tolower(%Templates%)%)%)%)%,%
%is_template,%(%else-then(%is_template%,%(%is_Template%)%)%)%,%
%template,%(%else-then(%if-no(%is_template%,,%(%template%)%)%,%(%if-no(%is_template%,,%(%What%.t)%)%)%)%)%,%
%Template,%(%else-then(%if-no(%is_template%,,%(%Template%)%)%,%(%if-no(%is_template%,,%(%template%)%)%)%)%)%,%
%TEMPLATE,%(%else-then(%TEMPLATE%,%(%toupper(%Template%)%)%)%)%,%
%template,%(%else-then(%_template%,%(%tolower(%Template%)%)%)%)%,%
%is_templatevalue,%(%else-then(%is_templatevalue%,%(%is_TemplateValue%)%)%)%,%
%templatevalue,%(%else-then(%if-no(%is_templatevalue%,,%(%templatevalue%)%)%,%(%if-no(%is_templatevalue%,,%(%Templates%/%Template%)%)%)%)%)%,%
%TemplateValue,%(%else-then(%if-no(%is_templatevalue%,,%(%TemplateValue%)%)%,%(%if-no(%is_templatevalue%,,%(%templatevalue%)%)%)%)%)%,%
%TEMPLATEVALUE,%(%else-then(%TEMPLATEVALUE%,%(%toupper(%TemplateValue%)%)%)%)%,%
%templatevalue,%(%else-then(%_templatevalue%,%(%tolower(%TemplateValue%)%)%)%)%,%
%%(
                Template: <select name="FormTemplate">
                <option value="%TemplateValue%">Create .%What% file (%TemplateValue%)</option>
                <option value="../templates/t/html/html-form-file-parameters.t">.html file form parameters (../templates/t/html/html-form-file-parameters.t)</option>
                <option value="../templates/t/html/html-html-file-parameters.t">.html file file parameters (../templates/t/html/html-file-file-parameters.t)</option>
                <option value=""></option>
                <option value="../templates/t/t/parameters.t">t parameters &nbsp;&nbsp; (../templates/t/t/parameters.t)</option>
                <option value="../templates/t/t/functions.t">t functions &nbsp;&nbsp; (../templates/t/t/functions.t)</option>
                <option value=""></option>
                <option value="/%application%-cgi/cgi">cgi parameters &nbsp;&nbsp; (/%application%-cgi/cgi)</option>
                <option value="/%application%-cgi/cgicatch">catch cgi parameters &nbsp;&nbsp; (/%application%-cgi/cgicatch)</option>
                <option value=""/>
                <option value="http://localhost:8080/%application%-http/http">http parameters &nbsp;&nbsp; (...:8080/%application%-http/http)</option>
                <option value="http://localhost:8080/%application%-http/httpcatch">catch http parameters &nbsp;&nbsp; (...:8080/%application%-http/httpcatch)</option>
                </select>
                <br/>
)%)%