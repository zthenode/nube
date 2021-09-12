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
%#   File: vscode-workspace.t
%#
%# Author: $author$
%#   Date: 3/4/2021
%########################################################################
%with(%
%is_include_path,%(%else-then(%is_include_path%,%(%is_Include_path%)%)%)%,%
%include_path,%(%else-then(%if-no(%is_include_path%,,%(%include_path%)%)%,%(%if-no(%is_include_path%,,%(%filepath(%input%)%)%)%)%)%)%,%
%Include_path,%(%else-then(%if-no(%is_include_path%,,%(%Include_path%)%)%,%(%if-no(%is_include_path%,,%(%include_path%)%)%)%)%)%,%
%INCLUDE_PATH,%(%else-then(%INCLUDE_PATH%,%(%toupper(%Include_path%)%)%)%)%,%
%include_path,%(%else-then(%_include_path%,%(%tolower(%Include_path%)%)%)%)%,%
%is_workspace,%(%else-then(%is_workspace%,%(%is_Workspace%)%)%)%,%
%workspace,%(%else-then(%if-no(%is_workspace%,,%(%workspace%)%)%,%(%if-no(%is_workspace%,,%(workspace)%)%)%)%)%,%
%Workspace,%(%else-then(%if-no(%is_workspace%,,%(%Workspace%)%)%,%(%if-no(%is_workspace%,,%(%workspace%)%)%)%)%)%,%
%WORKSPACE,%(%else-then(%WORKSPACE%,%(%toupper(%Workspace%)%)%)%)%,%
%workspace,%(%else-then(%_workspace%,%(%tolower(%Workspace%)%)%)%)%,%
%is_base,%(%else-then(%is_base%,%(%is_Base%)%)%)%,%
%base,%(%else-then(%if-no(%is_base%,,%(%base%)%)%,%(%if-no(%is_base%,,%(%Workspace%)%)%)%)%)%,%
%Base,%(%else-then(%if-no(%is_base%,,%(%Base%)%)%,%(%if-no(%is_base%,,%(%base%)%)%)%)%)%,%
%BASE,%(%else-then(%BASE%,%(%toupper(%Base%)%)%)%)%,%
%base,%(%else-then(%_base%,%(%tolower(%Base%)%)%)%)%,%
%is_filetypeextension,%(%else-then(%is_filetypeextension%,%(%is_FileTypeExtension%)%)%)%,%
%filetypeextension,%(%else-then(%if-no(%is_filetypeextension%,,%(%filetypeextension%)%)%,%(%if-no(%is_filetypeextension%,,%(code-workspace)%)%)%)%)%,%
%FileTypeExtension,%(%else-then(%if-no(%is_filetypeextension%,,%(%FileTypeExtension%)%)%,%(%if-no(%is_filetypeextension%,,%(%filetypeextension%)%)%)%)%)%,%
%FILETYPEEXTENSION,%(%else-then(%FILETYPEEXTENSION%,%(%toupper(%FileTypeExtension%)%)%)%)%,%
%filetypeextension,%(%else-then(%_filetypeextension%,%(%tolower(%FileTypeExtension%)%)%)%)%,%
%is_folders,%(%else-then(%is_folders%,%(%is_Folders%)%)%)%,%
%folders,%(%else-then(%if-no(%is_folders%,,%(%folders%)%)%,%(%if-no(%is_folders%,,%(../../../../../%Workspace%)%)%)%)%)%,%
%Folders,%(%else-then(%if-no(%is_folders%,,%(%Folders%)%)%,%(%if-no(%is_folders%,,%(%folders%)%)%)%)%)%,%
%FOLDERS,%(%else-then(%FOLDERS%,%(%toupper(%Folders%)%)%)%)%,%
%folders,%(%else-then(%_folders%,%(%tolower(%Folders%)%)%)%)%,%
%%(%
%%include(%Include_path%/../json/json-file.t)%%
%{
    "folders": [%parse(%Folders%,;,,%(,)%,,%(
        {
            "path": "%Folder%"
        })%,Folder)%
    ]
}
%
%)%)%