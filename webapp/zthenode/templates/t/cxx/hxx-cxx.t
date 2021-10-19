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
%#   File: hxx-cxx.t
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
%is_hxx,%(%else-then(%is_hxx%,%(%is_Hxx%)%)%)%,%
%hxx,%(%else-then(%if-no(%is_hxx%,,%(%hxx%)%)%,%(%if-no(%is_hxx%,,%(hpp)%)%)%)%)%,%
%Hxx,%(%else-then(%if-no(%is_hxx%,,%(%Hxx%)%)%,%(%if-no(%is_hxx%,,%(%hxx%)%)%)%)%)%,%
%HXX,%(%else-then(%HXX%,%(%toupper(%Hxx%)%)%)%)%,%
%hxx,%(%else-then(%_hxx%,%(%tolower(%Hxx%)%)%)%)%,%
%is_cxx,%(%else-then(%is_cxx%,%(%is_Cxx%)%)%)%,%
%cxx,%(%else-then(%if-no(%is_cxx%,,%(%cxx%)%)%,%(%if-no(%is_cxx%,,%(cpp)%)%)%)%)%,%
%Cxx,%(%else-then(%if-no(%is_cxx%,,%(%Cxx%)%)%,%(%if-no(%is_cxx%,,%(%cxx%)%)%)%)%)%,%
%CXX,%(%else-then(%CXX%,%(%toupper(%Cxx%)%)%)%)%,%
%cxx,%(%else-then(%_cxx%,%(%tolower(%Cxx%)%)%)%)%,%
%is_file_t,%(%else-then(%is_file_t%,%(%is_File_t%)%)%)%,%
%file_t,%(%else-then(%if-no(%is_file_t%,,%(%file_t%)%)%,%(%if-no(%is_file_t%,,%(file-%hxx%-%cxx%.t)%)%)%)%)%,%
%File_t,%(%else-then(%if-no(%is_file_t%,,%(%File_t%)%)%,%(%if-no(%is_file_t%,,%(%file_t%)%)%)%)%)%,%
%FILE_T,%(%else-then(%FILE_T%,%(%toupper(%File_t%)%)%)%)%,%
%file_t,%(%else-then(%_file_t%,%(%tolower(%File_t%)%)%)%)%,%
%%(%
%%include(%Include_path%/%File_t%)%%
%)%)%