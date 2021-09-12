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
%#   File: t-file-parameters.t
%#
%# Author: $author$
%#   Date: 2/23/2020
%########################################################################
%with(%
%is_include_path,%(%else-then(%is_include_path%,%(%is_Include_path%)%)%)%,%
%include_path,%(%else-then(%if-no(%is_include_path%,,%(%include_path%)%)%,%(%if-no(%is_include_path%,,%(%filepath(%input%)%)%)%)%)%)%,%
%Include_path,%(%else-then(%if-no(%is_include_path%,,%(%Include_path%)%)%,%(%if-no(%is_include_path%,,%(%include_path%)%)%)%)%)%,%
%INCLUDE_PATH,%(%else-then(%INCLUDE_PATH%,%(%toupper(%Include_path%)%)%)%)%,%
%include_path,%(%else-then(%_include_path%,%(%tolower(%Include_path%)%)%)%)%,%
%is_extension,%(%else-then(%is_extension%,%(%is_Extension%)%)%)%,%
%extension,%(%else-then(%if-no(%is_extension%,,%(%extension%)%)%,%(%if-no(%is_extension%,,%(t)%)%)%)%)%,%
%Extension,%(%else-then(%if-no(%is_extension%,,%(%Extension%)%)%,%(%if-no(%is_extension%,,%(%extension%)%)%)%)%)%,%
%EXTENSION,%(%else-then(%EXTENSION%,%(%toupper(%Extension%)%)%)%)%,%
%extension,%(%else-then(%_extension%,%(%tolower(%Extension%)%)%)%)%,%
%is_Parameters,%(%else-then(%is_Parameters%,%(%is_parameters%)%)%)%,%
%Parameters,%(%else-then(%if-no(%is_Parameters%,,%(%Parameters%)%)%,%(%if-no(%is_Parameters%,,%
%%(Organization=$organization$;Author=$author$;Name=Name%
%;File=%%else-then%(()%%%File%%%(,)%%%Name%%%())%%%%
%;Base=%%else-then%(()%%%filebase%(()%%%File%%%())%%%%(,)%%%%(()%%%File%%%())%%%%())%%%%
%;Extension=%%else-then%(()%%%fileextension%(()%%%File%%%())%%%%(,)%%%%(()%%Extension%%())%%%%())%%%%
%)%%
%)%)%)%)%,%
%%(%
%%include(%Include_path%/t-file.t)%%
%%%with%(()%%%
%
%%if(%if-no(%is_Include%,,%(yes)%)%,%(%
%%with(Parameters,%(Include_path=%%filepath%(()%%%input%%%())%%%)%,%
%%(%include(%include_path%/t-parameters.t)%)%)%%
%)%)%%
%%include(%Include_path%/t-parameters.t)%%
%%%%%%(()%%%
%
%%if(%if-no(%is_Include%,,%(%Include%)%)%,%(%%%%include%(()%%%Include_path%%%then-if(%Include%,/)%%())%%%%%
)%)%%
%%%%())%%%%())%%%%
%)%)%