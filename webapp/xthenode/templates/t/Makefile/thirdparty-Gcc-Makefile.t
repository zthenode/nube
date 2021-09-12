%########################################################################
%# Copyright (c) 1988-2018 $organization$
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
%#   File: thirdparty-Gcc-Makefile.t
%#
%# Author: $author$
%#   Date: 3/11/2018, 12/23/2020
%########################################################################
%with(%
%filepath,%(%else-then(%filepath%,%(%filepath(%input%)%)%)%)%,%
%Filepath,%(%else-then(%Filepath%,%(%filepath%)%)%)%,%
%FILEPATH,%(%else-then(%FILEPATH%,%(%toupper(%Filepath%)%)%)%)%,%
%filepath,%(%else-then(%_Filepath%,%(%tolower(%Filepath%)%)%)%)%,%
%is_package,%(%else-then(%is_package%,%(%is_Package%)%)%)%,%
%package,%(%else-then(%if-no(%is_package%,,%(%package%)%)%,%(%if-no(%is_package%,,%(Package)%)%)%)%)%,%
%Package,%(%else-then(%if-no(%is_package%,,%(%Package%)%)%,%(%if-no(%is_package%,,%(%package%)%)%)%)%)%,%
%PACKAGE,%(%else-then(%PACKAGE%,%(%toupper(%Package%)%)%)%)%,%
%package,%(%else-then(%_package%,%(%tolower(%Package%)%)%)%)%,%
%is_framework,%(%else-then(%is_framework%,%(%is_Framework%)%)%)%,%
%framework,%(%else-then(%if-no(%is_framework%,,%(%framework%)%)%,%(%if-no(%is_framework%,,%(%Package%)%)%)%)%)%,%
%Framework,%(%else-then(%if-no(%is_framework%,,%(%Framework%)%)%,%(%if-no(%is_framework%,,%(%framework%)%)%)%)%)%,%
%FRAMEWORK,%(%else-then(%FRAMEWORK%,%(%toupper(%Framework%)%)%)%)%,%
%framework,%(%else-then(%_framework%,%(%tolower(%Framework%)%)%)%)%,%
%is_what,%(%else-then(%is_what%,%(%is_What%)%)%)%,%
%what,%(%else-then(%if-no(%is_what%,,%(%what%)%)%,%(%if-no(%is_what%,,%(%Framework%)%)%)%)%)%,%
%What,%(%else-then(%if-no(%is_what%,,%(%What%)%)%,%(%if-no(%is_what%,,%(%what%)%)%)%)%)%,%
%WHAT,%(%else-then(%WHAT%,%(%toupper(%What%)%)%)%)%,%
%what,%(%else-then(%_what%,%(%tolower(%What%)%)%)%)%,%
%is_for,%(%else-then(%is_for%,%(%is_For%)%)%)%,%
%for,%(%else-then(%if-no(%is_for%,,%(%for%)%)%,%(%if-no(%is_for%,,%(Thirdpary Makefile for %What%)%)%)%)%)%,%
%For,%(%else-then(%if-no(%is_for%,,%(%For%)%)%,%(%if-no(%is_for%,,%(%for%)%)%)%)%)%,%
%FOR,%(%else-then(%FOR%,%(%toupper(%For%)%)%)%)%,%
%for,%(%else-then(%_for%,%(%tolower(%For%)%)%)%)%,%
%os,%(%else-then(%os%,%(Thirdparty)%)%)%,%
%Os,%(%else-then(%Os%,%(%os%)%)%)%,%
%OS,%(%else-then(%OS%,%(%toupper(%Os%)%)%)%)%,%
%os,%(%else-then(%_Os%,%(%tolower(%Os%)%)%)%)%,%
%file,%(%else-then(%file%,%(Makefile)%)%)%,%
%File,%(%else-then(%File%,%(%file%)%)%)%,%
%FILE,%(%else-then(%FILE%,%(%toupper(%File%)%)%)%)%,%
%file,%(%else-then(%_File%,%(%tolower(%File%)%)%)%)%,%
%extension,%(%else-then(%extension%,%(Extension)%)%)%,%
%Extension,%(%else-then(%Extension%,%(%extension%)%)%)%,%
%EXTENSION,%(%else-then(%EXTENSION%,%(%toupper(%Extension%)%)%)%)%,%
%extension,%(%else-then(%_Extension%,%(%tolower(%Extension%)%)%)%)%,%
%%(%
%%include(%filepath%/Makefile-file.t)%%
%%with(%
%is_name_separator,%(%else-then(%is_name_separator%,%(%is_Name_separator%)%)%)%,%
%name_separator,%(%else-then(%if-no(%is_name_separator%,,%(%name_separator%)%)%,%(%if-no(%is_name_separator%,,%(-)%)%)%)%)%,%
%Name_separator,%(%else-then(%if-no(%is_name_separator%,,%(%Name_separator%)%)%,%(%if-no(%is_name_separator%,,%(%name_separator%)%)%)%)%)%,%
%NAME_SEPARATOR,%(%else-then(%NAME_SEPARATOR%,%(%toupper(%Name_separator%)%)%)%)%,%
%name_separator,%(%else-then(%_name_separator%,%(%tolower(%Name_separator%)%)%)%)%,%
%is_version_major,%(%else-then(%is_version_major%,%(%is_Version_major%)%)%)%,%
%version_major,%(%else-then(%if-no(%is_version_major%,,%(%version_major%)%)%,%(%if-no(%is_version_major%,,%(1)%)%)%)%)%,%
%Version_major,%(%else-then(%if-no(%is_version_major%,,%(%Version_major%)%)%,%(%if-no(%is_version_major%,,%(%version_major%)%)%)%)%)%,%
%VERSION_MAJOR,%(%else-then(%VERSION_MAJOR%,%(%toupper(%Version_major%)%)%)%)%,%
%version_major,%(%else-then(%_version_major%,%(%tolower(%Version_major%)%)%)%)%,%
%is_version_minor,%(%else-then(%is_version_minor%,%(%is_Version_minor%)%)%)%,%
%version_minor,%(%else-then(%if-no(%is_version_minor%,,%(%version_minor%)%)%,%(%if-no(%is_version_minor%,,%(0)%)%)%)%)%,%
%Version_minor,%(%else-then(%if-no(%is_version_minor%,,%(%Version_minor%)%)%,%(%if-no(%is_version_minor%,,%(%version_minor%)%)%)%)%)%,%
%VERSION_MINOR,%(%else-then(%VERSION_MINOR%,%(%toupper(%Version_minor%)%)%)%)%,%
%version_minor,%(%else-then(%_version_minor%,%(%tolower(%Version_minor%)%)%)%)%,%
%is_version_release,%(%else-then(%is_version_release%,%(%is_Version_release%)%)%)%,%
%version_release,%(%else-then(%if-no(%is_version_release%,,%(%version_release%)%)%,%(%if-no(%is_version_release%,,%(0)%)%)%)%)%,%
%Version_release,%(%else-then(%if-no(%is_version_release%,,%(%Version_release%)%)%,%(%if-no(%is_version_release%,,%(%version_release%)%)%)%)%)%,%
%VERSION_RELEASE,%(%else-then(%VERSION_RELEASE%,%(%toupper(%Version_release%)%)%)%)%,%
%version_release,%(%else-then(%_version_release%,%(%tolower(%Version_release%)%)%)%)%,%
%is_version_separator,%(%else-then(%is_version_separator%,%(%is_Version_separator%)%)%)%,%
%version_separator,%(%else-then(%if-no(%is_version_separator%,,%(%version_separator%)%)%,%(%if-no(%is_version_separator%,,%(.)%)%)%)%)%,%
%Version_separator,%(%else-then(%if-no(%is_version_separator%,,%(%Version_separator%)%)%,%(%if-no(%is_version_separator%,,%(%version_separator%)%)%)%)%)%,%
%VERSION_SEPARATOR,%(%else-then(%VERSION_SEPARATOR%,%(%toupper(%Version_separator%)%)%)%)%,%
%version_separator,%(%else-then(%_version_separator%,%(%tolower(%Version_separator%)%)%)%)%,%
%is_archived,%(%else-then(%is_archived%,%(%is_Archived%)%)%)%,%
%archived,%(%else-then(%if-no(%is_archived%,,%(%archived%)%)%,%(%if-no(%is_archived%,,%(tar)%)%)%)%)%,%
%Archived,%(%else-then(%if-no(%is_archived%,,%(%Archived%)%)%,%(%if-no(%is_archived%,,%(%archived%)%)%)%)%)%,%
%ARCHIVED,%(%else-then(%ARCHIVED%,%(%toupper(%Archived%)%)%)%)%,%
%archived,%(%else-then(%_archived%,%(%tolower(%Archived%)%)%)%)%,%
%is_compressed,%(%else-then(%is_compressed%,%(%is_Compressed%)%)%)%,%
%compressed,%(%else-then(%if-no(%is_compressed%,,%(%compressed%)%)%,%(%if-no(%is_compressed%,,%(gz)%)%)%)%)%,%
%Compressed,%(%else-then(%if-no(%is_compressed%,,%(%Compressed%)%)%,%(%if-no(%is_compressed%,,%(%compressed%)%)%)%)%)%,%
%COMPRESSED,%(%else-then(%COMPRESSED%,%(%toupper(%Compressed%)%)%)%)%,%
%compressed,%(%else-then(%_compressed%,%(%tolower(%Compressed%)%)%)%)%,%
%is_archive_separator,%(%else-then(%is_archive_separator%,%(%is_Archive_separator%)%)%)%,%
%archive_separator,%(%else-then(%if-no(%is_archive_separator%,,%(%archive_separator%)%)%,%(%if-no(%is_archive_separator%,,%(.)%)%)%)%)%,%
%Archive_separator,%(%else-then(%if-no(%is_archive_separator%,,%(%Archive_separator%)%)%,%(%if-no(%is_archive_separator%,,%(%archive_separator%)%)%)%)%)%,%
%ARCHIVE_SEPARATOR,%(%else-then(%ARCHIVE_SEPARATOR%,%(%toupper(%Archive_separator%)%)%)%)%,%
%archive_separator,%(%else-then(%_archive_separator%,%(%tolower(%Archive_separator%)%)%)%)%,%
%%(%
%%include(%filepath%/thirdparty-Gcc-Makefile-rules.t)%%
%)%)%%
%)%)%