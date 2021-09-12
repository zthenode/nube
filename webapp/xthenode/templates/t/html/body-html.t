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
%#   File: body-html.t
%#
%# Author: $author$
%#   Date: 7/9/2019
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%%(%
%    <!--
    =====================================================================
    === body
    =====================================================================
    -->
    <body>
        <a href="%Name%.%Extension%"><h3>%Title%</h3></a>

        <!--
        =====================================================================
        === form
        =====================================================================
        -->
        <form
         Name="Form" Action="t.t" Method="POST" 
         onSubmit="return setFormSubmit(getFormValue2('FormTemplate','FormAction','Form'),getFormValue('FormMethod','Form'),'Form')">
             <div class="form"><hr/>
    
             <br/>
             Content-Type: <select name="content_type">
             <option value="text/plain">text</option>
             <option value="text/html">html</option>
             <option value="text/xml">xml</option>
             <option value="application/json">json</option>
             <option value="application/javascript">javascript</option>
             <option value=""></option>
             </select><br/>
             Action: <select name="FormAction">
             <option value="t.t">html.t</option>
             <option value="/sthenode-cgi/cgi">cgi parameters</option>
             <option value=""></option>
             </select><br/>
             Method: <select name="FormMethod">
             <option value="POST">POST</option>
             <option value="GET">GET</option>
             <option value=""></option>
             </select><br/>
             <br/>
    
             <input type="submit" name="submit" value="submit"/><br/>
             <hr/></div>

            <table><tr>
                <td><a href="../../../../../.."><b>/xthenode/</b></a></td>
            </tr></table>
         </form>
    </body>
%
%)%)%%