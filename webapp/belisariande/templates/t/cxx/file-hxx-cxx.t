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
%#   File: cxx-file.t
%#
%# Author: $author$
%#   Date: 3/30/2021
%########################################################################
%with(%
%is_year,%(%else-then(%is_year%,%(%is_Year%)%)%)%,%
%year,%(%else-then(%if-no(%is_year%,,%(%year%)%)%,%(%if-no(%is_year%,,%(%year()%)%)%)%)%)%,%
%Year,%(%else-then(%if-no(%is_year%,,%(%Year%)%)%,%(%if-no(%is_year%,,%(%year%)%)%)%)%)%,%
%YEAR,%(%else-then(%YEAR%,%(%toupper(%Year%)%)%)%)%,%
%year,%(%else-then(%_year%,%(%tolower(%Year%)%)%)%)%,%
%is_date,%(%else-then(%is_date%,%(%is_Date%)%)%)%,%
%date,%(%else-then(%if-no(%is_date%,,%(%date%)%)%,%(%if-no(%is_date%,,%(%date()%)%)%)%)%)%,%
%Date,%(%else-then(%if-no(%is_date%,,%(%Date%)%)%,%(%if-no(%is_date%,,%(%date%)%)%)%)%)%,%
%DATE,%(%else-then(%DATE%,%(%toupper(%Date%)%)%)%)%,%
%date,%(%else-then(%_date%,%(%tolower(%Date%)%)%)%)%,%
%is_organization,%(%else-then(%is_organization%,%(%is_Organization%)%)%)%,%
%organization,%(%else-then(%if-no(%is_organization%,,%(%organization%)%)%,%(%if-no(%is_organization%,,%($organization$)%)%)%)%)%,%
%Organization,%(%else-then(%if-no(%is_organization%,,%(%Organization%)%)%,%(%if-no(%is_organization%,,%(%organization%)%)%)%)%)%,%
%ORGANIZATION,%(%else-then(%ORGANIZATION%,%(%toupper(%Organization%)%)%)%)%,%
%organization,%(%else-then(%_organization%,%(%tolower(%Organization%)%)%)%)%,%
%is_author,%(%else-then(%is_author%,%(%is_Author%)%)%)%,%
%author,%(%else-then(%if-no(%is_author%,,%(%author%)%)%,%(%if-no(%is_author%,,%($author$)%)%)%)%)%,%
%Author,%(%else-then(%if-no(%is_author%,,%(%Author%)%)%,%(%if-no(%is_author%,,%(%author%)%)%)%)%)%,%
%AUTHOR,%(%else-then(%AUTHOR%,%(%toupper(%Author%)%)%)%)%,%
%author,%(%else-then(%_author%,%(%tolower(%Author%)%)%)%)%,%
%is_cxx_extension,%(%else-then(%is_cxx_extension%,%(%is_Cxx_extension%)%)%)%,%
%cxx_extension,%(%else-then(%if-no(%is_cxx_extension%,,%(%cxx_extension%)%)%,%(%if-no(%is_cxx_extension%,,%(cpp)%)%)%)%)%,%
%Cxx_extension,%(%else-then(%if-no(%is_cxx_extension%,,%(%Cxx_extension%)%)%,%(%if-no(%is_cxx_extension%,,%(%cxx_extension%)%)%)%)%)%,%
%CXX_EXTENSION,%(%else-then(%CXX_EXTENSION%,%(%toupper(%Cxx_extension%)%)%)%)%,%
%cxx_extension,%(%else-then(%_cxx_extension%,%(%tolower(%Cxx_extension%)%)%)%)%,%
%is_hxx_cxx_extension,%(%else-then(%is_hxx_cxx_extension%,%(%is_Hxx_cxx_extension%)%)%)%,%
%hxx_cxx_extension,%(%else-then(%if-no(%is_hxx_cxx_extension%,,%(%hxx_cxx_extension%)%)%,%(%if-no(%is_hxx_cxx_extension%,,%(%else-then(%Hxx_extension%,%Cxx_extension%)%)%)%)%)%)%,%
%Hxx_cxx_extension,%(%else-then(%if-no(%is_hxx_cxx_extension%,,%(%Hxx_cxx_extension%)%)%,%(%if-no(%is_hxx_cxx_extension%,,%(%hxx_cxx_extension%)%)%)%)%)%,%
%HXX_CXX_EXTENSION,%(%else-then(%HXX_CXX_EXTENSION%,%(%toupper(%Hxx_cxx_extension%)%)%)%)%,%
%hxx_cxx_extension,%(%else-then(%_hxx_cxx_extension%,%(%tolower(%Hxx_cxx_extension%)%)%)%)%,%
%is_filetypeextension,%(%else-then(%is_filetypeextension%,%(%is_FileTypeExtension%)%)%)%,%
%filetypeextension,%(%else-then(%if-no(%is_filetypeextension%,,%(%filetypeextension%)%)%,%(%if-no(%is_filetypeextension%,,%(%else-then(%Extension%,%Hxx_cxx_extension%)%)%)%)%)%)%,%
%FileTypeExtension,%(%else-then(%if-no(%is_filetypeextension%,,%(%FileTypeExtension%)%)%,%(%if-no(%is_filetypeextension%,,%(%filetypeextension%)%)%)%)%)%,%
%FILETYPEEXTENSION,%(%else-then(%FILETYPEEXTENSION%,%(%toupper(%FileTypeExtension%)%)%)%)%,%
%filetypeextension,%(%else-then(%_filetypeextension%,%(%tolower(%FileTypeExtension%)%)%)%)%,%
%is_name,%(%else-then(%is_name%,%(%is_Name%)%)%)%,%
%name,%(%else-then(%if-no(%is_name%,,%(%name%)%)%,%(%if-no(%is_name%,,%(%FileTypeExtension%)%)%)%)%)%,%
%Name,%(%else-then(%if-no(%is_name%,,%(%Name%)%)%,%(%if-no(%is_name%,,%(%name%)%)%)%)%)%,%
%NAME,%(%else-then(%NAME%,%(%toupper(%Name%)%)%)%)%,%
%name,%(%else-then(%_name%,%(%tolower(%Name%)%)%)%)%,%
%is_file,%(%else-then(%is_file%,%(%is_File%)%)%)%,%
%file,%(%else-then(%if-no(%is_file%,,%(%file%)%)%,%(%if-no(%is_file%,,%(%else-then(%File%,%Name%)%)%)%)%)%)%,%
%File,%(%else-then(%if-no(%is_file%,,%(%File%)%)%,%(%if-no(%is_file%,,%(%file%)%)%)%)%)%,%
%FILE,%(%else-then(%FILE%,%(%toupper(%File%)%)%)%)%,%
%file,%(%else-then(%_file%,%(%tolower(%File%)%)%)%)%,%
%is_base,%(%else-then(%is_base%,%(%is_Base%)%)%)%,%
%base,%(%else-then(%if-no(%is_base%,,%(%base%)%)%,%(%if-no(%is_base%,,%(%else-then(%filebase(%File%)%,%(%File%)%)%)%)%)%)%)%,%
%Base,%(%else-then(%if-no(%is_base%,,%(%Base%)%)%,%(%if-no(%is_base%,,%(%base%)%)%)%)%)%,%
%BASE,%(%else-then(%BASE%,%(%toupper(%Base%)%)%)%)%,%
%base,%(%else-then(%_base%,%(%tolower(%Base%)%)%)%)%,%
%is_extension,%(%else-then(%is_extension%,%(%is_Extension%)%)%)%,%
%extension,%(%else-then(%if-no(%is_extension%,,%(%extension%)%)%,%(%if-no(%is_extension%,,%(%else-then(%fileextension(%File%)%,%(%FileTypeExtension%)%)%)%)%)%)%)%,%
%Extension,%(%else-then(%if-no(%is_extension%,,%(%Extension%)%)%,%(%if-no(%is_extension%,,%(%extension%)%)%)%)%)%,%
%EXTENSION,%(%else-then(%EXTENSION%,%(%toupper(%Extension%)%)%)%)%,%
%extension,%(%else-then(%_extension%,%(%tolower(%Extension%)%)%)%)%,%
%is_baseextension,%(%else-then(%is_baseextension%,%(%is_BaseExtension%)%)%)%,%
%baseextension,%(%else-then(%if-no(%is_baseextension%,,%(%baseextension%)%)%,%(%if-no(%is_baseextension%,,%(%Base%%then-if(%Extension%,%(.)%)%)%)%)%)%)%,%
%BaseExtension,%(%else-then(%if-no(%is_baseextension%,,%(%BaseExtension%)%)%,%(%if-no(%is_baseextension%,,%(%baseextension%)%)%)%)%)%,%
%BASEEXTENSION,%(%else-then(%BASEEXTENSION%,%(%toupper(%BaseExtension%)%)%)%)%,%
%baseextension,%(%else-then(%_baseextension%,%(%tolower(%BaseExtension%)%)%)%)%,%
%is_h_file,%(%else-then(%is_h_file%,%(%is_H_file%)%)%)%,%
%h_file,%(%else-then(%if-no(%is_h_file%,,%(%h_file%)%)%,%(%if-no(%is_h_file%,,%(%equal(h,%Extension%)%)%)%)%)%)%,%
%H_file,%(%else-then(%if-no(%is_h_file%,,%(%H_file%)%)%,%(%if-no(%is_h_file%,,%(%h_file%)%)%)%)%)%,%
%H_FILE,%(%else-then(%H_FILE%,%(%toupper(%H_file%)%)%)%)%,%
%h_file,%(%else-then(%_h_file%,%(%tolower(%H_file%)%)%)%)%,%
%is_c_file,%(%else-then(%is_c_file%,%(%is_C_file%)%)%)%,%
%c_file,%(%else-then(%if-no(%is_c_file%,,%(%c_file%)%)%,%(%if-no(%is_c_file%,,%(%equal(c,%Extension%)%)%)%)%)%)%,%
%C_file,%(%else-then(%if-no(%is_c_file%,,%(%C_file%)%)%,%(%if-no(%is_c_file%,,%(%c_file%)%)%)%)%)%,%
%C_FILE,%(%else-then(%C_FILE%,%(%toupper(%C_file%)%)%)%)%,%
%c_file,%(%else-then(%_c_file%,%(%tolower(%C_file%)%)%)%)%,%
%%(%
%%if(%H_file%%C_file%,%(/*/
)%)%///////////////////////////////////////////////////////////////////////
/// Copyright (c) 1988-%Year% %Organization%
///
/// This software is provided by the author and contributors ``as is'' 
/// and any express or implied warranties, including, but not limited to, 
/// the implied warranties of merchantability and fitness for a particular 
/// purpose are disclaimed. In no event shall the author or contributors 
/// be liable for any direct, indirect, incidental, special, exemplary, 
/// or consequential damages (including, but not limited to, procurement 
/// of substitute goods or services; loss of use, data, or profits; or 
/// business interruption) however caused and on any theory of liability, 
/// whether in contract, strict liability, or tort (including negligence 
/// or otherwise) arising in any way out of the use of this software, 
/// even if advised of the possibility of such damage.
///
///   File: %BaseExtension%
///
/// Author: %Author%
///   Date: %Date%
///////////////////////////////////////////////////////////////////////
%if(%H_file%%C_file%,%(/*/
)%)%%
%)%)%