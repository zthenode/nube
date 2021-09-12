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
%#   File: test.t
%#
%# Author: $author$
%#   Date: 2/15/2020
%########################################################################
%with(%
%is_Include_path,%(%else-then(%is_Include_path%,%(%is_include_path%)%)%)%,%
%Include_path,%(%else-then(%if-no(%is_Include_path%,,%(%Include_path%)%)%,%(%if-no(%is_Include_path%,,%(%filepath(%input%)%)%)%)%)%)%,%
%INCLUDE_PATH,%(%else-then(%INCLUDE_PATH%,%(%toupper(%Include_path%)%)%)%)%,%
%include_path,%(%else-then(%include_path%,%(%tolower(%Include_path%)%)%)%)%,%
%is_Parameter,%(%else-then(%is_Parameter%,%(%is_parameter%)%)%)%,%
%Parameter,%(%else-then(%if-no(%is_Parameter%,,%(%Parameter%)%)%,%(%if-no(%is_Parameter%,,%(Parameter)%)%)%)%)%,%
%PARAMETER,%(%else-then(%PARAMETER%,%(%toupper(%Parameter%)%)%)%)%,%
%parameter,%(%else-then(%parameter%,%(%tolower(%Parameter%)%)%)%)%,%
%%(%
%%include(%Include_path%/t-file.t)%%
%)%)%