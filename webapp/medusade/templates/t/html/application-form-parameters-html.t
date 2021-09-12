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
%#   File: applicatgion-form-parameters-html.t
%#
%# Author: $author$
%#   Date: 1/17/2021
%########################################################################
%with(%
%is_include_path,%(%else-then(%is_include_path%,%(%is_Include_path%)%)%)%,%
%include_path,%(%else-then(%if-no(%is_include_path%,,%(%include_path%)%)%,%(%if-no(%is_include_path%,,%(%filepath(%input%)%)%)%)%)%)%,%
%Include_path,%(%else-then(%if-no(%is_include_path%,,%(%Include_path%)%)%,%(%if-no(%is_include_path%,,%(%include_path%)%)%)%)%)%,%
%INCLUDE_PATH,%(%else-then(%INCLUDE_PATH%,%(%toupper(%Include_path%)%)%)%)%,%
%include_path,%(%else-then(%_include_path%,%(%tolower(%Include_path%)%)%)%)%,%
%is_forminput,%(%else-then(%is_forminput%,%(%is_FormInput%)%)%)%,%
%forminput,%(%else-then(%if-no(%is_forminput%,,%(%forminput%)%)%,%(%if-no(%is_forminput%,,%()%)%)%)%)%,%
%FormInput,%(%else-then(%if-no(%is_forminput%,,%(%FormInput%)%)%,%(%if-no(%is_forminput%,,%(%forminput%)%)%)%)%)%,%
%FORMINPUT,%(%else-then(%FORMINPUT%,%(%toupper(%FormInput%)%)%)%)%,%
%forminput,%(%else-then(%_forminput%,%(%tolower(%FormInput%)%)%)%)%,%
%%(%
%%include(%Include_path%/html-file.t)%%
%%parse(%FormInput%,;,,,,%(%
%%parse(%FormInput%,%(,)%,,,,%(%
%%with(%
%is_inputlabel,%(%else-then(%is_inputlabel%,%(%is_InputLabel%)%)%)%,%
%inputlabel,%(%else-then(%if-no(%is_inputlabel%,,%(%inputlabel%)%)%,%(%if-no(%is_inputlabel%,,%(%else-then(%left(%FormInput%,:)%,%()%)%)%)%)%)%)%,%
%InputLabel,%(%else-then(%if-no(%is_inputlabel%,,%(%InputLabel%)%)%,%(%if-no(%is_inputlabel%,,%(%inputlabel%)%)%)%)%)%,%
%INPUTLABEL,%(%else-then(%INPUTLABEL%,%(%toupper(%InputLabel%)%)%)%)%,%
%inputlabel,%(%else-then(%_inputlabel%,%(%tolower(%InputLabel%)%)%)%)%,%
%is_inputname,%(%else-then(%is_inputname%,%(%is_InputName%)%)%)%,%
%inputname,%(%else-then(%if-no(%is_inputname%,,%(%inputname%)%)%,%(%if-no(%is_inputname%,,%(%else-then(%right(%left(%FormInput%,=)%,:)%,%(%else-then(%right(%FormInput%,:)%,%(%else-then(%left(%FormInput%,=)%,%(%FormInput%)%)%)%)%)%)%)%)%)%)%)%,%
%InputName,%(%else-then(%if-no(%is_inputname%,,%(%InputName%)%)%,%(%if-no(%is_inputname%,,%(%inputname%)%)%)%)%)%,%
%INPUTNAME,%(%else-then(%INPUTNAME%,%(%toupper(%InputName%)%)%)%)%,%
%inputname,%(%else-then(%_inputname%,%(%tolower(%InputName%)%)%)%)%,%
%is_inputvalue,%(%else-then(%is_inputvalue%,%(%is_InputValue%)%)%)%,%
%inputvalue,%(%else-then(%if-no(%is_inputvalue%,,%(%inputvalue%)%)%,%(%if-no(%is_inputvalue%,,%(%else-then(%right(%FormInput%,=)%,%()%)%)%)%)%)%)%,%
%InputValue,%(%else-then(%if-no(%is_inputvalue%,,%(%InputValue%)%)%,%(%if-no(%is_inputvalue%,,%(%inputvalue%)%)%)%)%)%,%
%INPUTVALUE,%(%else-then(%INPUTVALUE%,%(%toupper(%InputValue%)%)%)%)%,%
%inputvalue,%(%else-then(%_inputvalue%,%(%tolower(%InputValue%)%)%)%)%,%
%%(%
%<b></b>%if-then(%InputLabel%,: )%<input name="%InputName%" value="%InputValue%"%if-then(%then-if(%InputType%, type=")%," unchecked="checked")%></input><b></b>
<b></b><input name="is_%InputName%" value="no" type="checkbox" unchecked="checked">no</input><b></b><br/>
%
%)%)%%
%)%,FormInput)%%
%)%,FormInput)%%
%%parse(%FormSelect%,;,,,,%(%
%%parse(%FormSelect%,%(,)%,,,,%(%
%%with(%
%is_selectlabel,%(%else-then(%is_selectlabel%,%(%is_SelectLabel%)%)%)%,%
%selectlabel,%(%else-then(%if-no(%is_selectlabel%,,%(%selectlabel%)%)%,%(%if-no(%is_selectlabel%,,%(%else-then(%left(%FormSelect%,:)%,%()%)%)%)%)%)%)%,%
%SelectLabel,%(%else-then(%if-no(%is_selectlabel%,,%(%SelectLabel%)%)%,%(%if-no(%is_selectlabel%,,%(%selectlabel%)%)%)%)%)%,%
%SELECTLABEL,%(%else-then(%SELECTLABEL%,%(%toupper(%SelectLabel%)%)%)%)%,%
%selectlabel,%(%else-then(%_selectlabel%,%(%tolower(%SelectLabel%)%)%)%)%,%
%is_selectname,%(%else-then(%is_selectname%,%(%is_SelectName%)%)%)%,%
%selectname,%(%else-then(%if-no(%is_selectname%,,%(%selectname%)%)%,%(%if-no(%is_selectname%,,%(%else-then(%right(%left(%FormSelect%,=)%,:)%)%)%,%(%else-then(%left(%FormSelect%,=)%,%FormSelect%)%)%)%)%)%)%,%
%SelectName,%(%else-then(%if-no(%is_selectname%,,%(%SelectName%)%)%,%(%if-no(%is_selectname%,,%(%selectname%)%)%)%)%)%,%
%SELECTNAME,%(%else-then(%SELECTNAME%,%(%toupper(%SelectName%)%)%)%)%,%
%selectname,%(%else-then(%_selectname%,%(%tolower(%SelectName%)%)%)%)%,%
%is_selectvalue,%(%else-then(%is_selectvalue%,%(%is_SelectValue%)%)%)%,%
%selectvalue,%(%else-then(%if-no(%is_selectvalue%,,%(%selectvalue%)%)%,%(%if-no(%is_selectvalue%,,%(%else-then(%right(%FormSelect%,=)%,%()%)%)%)%)%)%)%,%
%SelectValue,%(%else-then(%if-no(%is_selectvalue%,,%(%SelectValue%)%)%,%(%if-no(%is_selectvalue%,,%(%selectvalue%)%)%)%)%)%,%
%SELECTVALUE,%(%else-then(%SELECTVALUE%,%(%toupper(%SelectValue%)%)%)%)%,%
%selectvalue,%(%else-then(%_selectvalue%,%(%tolower(%SelectValue%)%)%)%)%,%
%%(%
%<b></b>%if-then(%SelectLabel%,: )%<select name="%SelectName%">
%parse(%SelectValue%,|,,,,%(%
%%with(%
%is_optionvalue,%(%else-then(%is_optionvalue%,%(%is_OptionValue%)%)%)%,%
%optionvalue,%(%else-then(%if-no(%is_optionvalue%,,%(%optionvalue%)%)%,%(%if-no(%is_optionvalue%,,%(%else-then(%left(%SelectValue%,?)%,%SelectValue%)%)%)%)%)%)%,%
%OptionValue,%(%else-then(%if-no(%is_optionvalue%,,%(%OptionValue%)%)%,%(%if-no(%is_optionvalue%,,%(%optionvalue%)%)%)%)%)%,%
%OPTIONVALUE,%(%else-then(%OPTIONVALUE%,%(%toupper(%OptionValue%)%)%)%)%,%
%optionvalue,%(%else-then(%_optionvalue%,%(%tolower(%OptionValue%)%)%)%)%,%
%is_optiontext,%(%else-then(%is_optiontext%,%(%is_OptionText%)%)%)%,%
%optiontext,%(%else-then(%if-no(%is_optiontext%,,%(%optiontext%)%)%,%(%if-no(%is_optiontext%,,%(%else-then(%right(%SelectValue%,?)%,%SelectValue%)%)%)%)%)%)%,%
%OptionText,%(%else-then(%if-no(%is_optiontext%,,%(%OptionText%)%)%,%(%if-no(%is_optiontext%,,%(%optiontext%)%)%)%)%)%,%
%OPTIONTEXT,%(%else-then(%OPTIONTEXT%,%(%toupper(%OptionText%)%)%)%)%,%
%optiontext,%(%else-then(%_optiontext%,%(%tolower(%OptionText%)%)%)%)%,%
%%(<option value="%OptionValue%">%OptionText%</option>
)%)%%
%)%,SelectValue)%<option value=""></option></select><b></b>
<b></b><input name="is_%SelectName%" value="no" type="checkbox" unchecked="checked">no</input><b></b><br/>
%
%%)%)%%
%)%,FormSelect)%%
%)%,FormSelect)%%
%)%)%