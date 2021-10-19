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
%#   File: file-parameters-t.t
%#
%# Author: $author$
%#   Date: 8/19/2021
%########################################################################
%with(%
%is_include_path,%(%else-then(%is_include_path%,%(%is_Include_path%)%)%)%,%
%include_path,%(%else-then(%if-no(%is_include_path%,,%(%include_path%)%)%,%(%if-no(%is_include_path%,,%(%filepath(%input%)%)%)%)%)%)%,%
%Include_path,%(%else-then(%if-no(%is_include_path%,,%(%Include_path%)%)%,%(%if-no(%is_include_path%,,%(%include_path%)%)%)%)%)%,%
%INCLUDE_PATH,%(%else-then(%INCLUDE_PATH%,%(%toupper(%Include_path%)%)%)%)%,%
%include_path,%(%else-then(%_include_path%,%(%tolower(%Include_path%)%)%)%)%,%
%is_file_t,%(%else-then(%is_file_t%,%(%is_File_t%)%)%)%,%
%file_t,%(%else-then(%if-no(%is_file_t%,,%(%file_t%)%)%,%(%if-no(%is_file_t%,,%(file-t.t)%)%)%)%)%,%
%File_t,%(%else-then(%if-no(%is_file_t%,,%(%File_t%)%)%,%(%if-no(%is_file_t%,,%(%file_t%)%)%)%)%)%,%
%FILE_T,%(%else-then(%FILE_T%,%(%toupper(%File_t%)%)%)%)%,%
%file_t,%(%else-then(%_file_t%,%(%tolower(%File_t%)%)%)%)%,%
%is_parameters_t,%(%else-then(%is_parameters_t%,%(%is_Parameters_t%)%)%)%,%
%parameters_t,%(%else-then(%if-no(%is_parameters_t%,,%(%parameters_t%)%)%,%(%if-no(%is_parameters_t%,,%(parameters-t.t)%)%)%)%)%,%
%Parameters_t,%(%else-then(%if-no(%is_parameters_t%,,%(%Parameters_t%)%)%,%(%if-no(%is_parameters_t%,,%(%parameters_t%)%)%)%)%)%,%
%PARAMETERS_T,%(%else-then(%PARAMETERS_T%,%(%toupper(%Parameters_t%)%)%)%)%,%
%parameters_t,%(%else-then(%_parameters_t%,%(%tolower(%Parameters_t%)%)%)%)%,%
%is_Parameters,%(%else-then(%is_Parameters%,%(%is_parameters%)%)%)%,%
%Parameters,%(%else-then(%if-no(%is_Parameters%,,%(%Parameters%)%)%,%(%if-no(%is_Parameters%,,%
%%(Date=%%date%(()%%())%%%;Year=%%else-then%(()%%%else-then%(()%%%right%(()%%%Date%%%(,)%/%())%%%%(,)%%%Date%%%())%%%%(,)%%%year%(()%%())%%%%())%%%;Organization=$organization$;Author=$author$;Name=Name;FileTypeExtension=%%Name%%%
%;File=%%else-then%(()%%%File%%%(,)%%%Name%%%())%%%%
%;Base=%%else-then%(()%%%filebase%(()%%%File%%%())%%%%(,)%%%%(()%%%File%%%())%%%%())%%%%
%;Extension=%%else-then%(()%%%fileextension%(()%%%File%%%())%%%%(,)%%%%(()%%%FileTypeExtension%%%())%%%%())%%%%
%;BaseExtension=%%Base%%%%then-if%(()%%%Extension%%%(,)%%%%(()%.%())%%%%())%%%%
%)%%
%)%)%)%)%,%
%%(%
%%include(%Include_path%/%File_t%)%%
%%%with%(()%%%
%
%%if(%if-no(%is_Include%,,%(yes)%)%,%(%
%%with(Parameters,%(Include_path=%%filepath%(()%%%input%%%())%%%)%,%
%%(%include(%include_path%/%Parameters_t%)%)%)%%
%)%)%%
%%include(%Include_path%/%Parameters_t%)%%
%%%%%%(()%%%
%
%%if(%if-no(%is_Include%,,%(%Include%)%)%,%(%%%%include%(()%%%Include_path%%%then-if(%Include%,/)%%())%%%%%
)%)%%
%%%%())%%%%())%%%%
%)%)%