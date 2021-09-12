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
%#   File: html-form-file-parameters.t
%#
%# Author: $author$
%#   Date: 1/2/2021
%########################################################################
%with(%
%%(
                <br/>
                Organization: <input name="Organization" value=""></input>[$organization$]
                      <input type="checkbox" name="is_Organization" value="no" unchecked="checked">no</input><br/>
                Author: <input name="Author" value=""></input>[$author$]
                      <input type="checkbox" name="is_Author" value="no" unchecked="checked">no</input><br/>
                Date:<input name="Date" value=""/>[%%date%(()%%())%%%]<b></b>
                      <input type="checkbox" name="is_Date" value="no" unchecked="checked">no</input>
                <br/>
)%)%