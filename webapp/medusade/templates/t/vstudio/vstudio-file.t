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
%#   File: vstudio-file.t
%#
%# Author: $author$
%#   Date: 11/27/2019
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%is_organization,%(%else-then(%is_organization%,%(%is_Organization%)%)%)%,%
%organization,%(%else-then(%if-no(%is_organization%,,%(%organization%)%)%,%(%if-no(%is_organization%,,%($organization$)%)%)%)%)%,%
%Organization,%(%else-then(%if-no(%is_organization%,,%(%Organization%)%)%,%(%organization%)%)%)%,%
%ORGANIZATION,%(%else-then(%ORGANIZATION%,%(%toupper(%Organization%)%)%)%)%,%
%organization,%(%else-then(%_Organization%,%(%tolower(%Organization%)%)%)%)%,%
%is_author,%(%else-then(%is_author%,%(%is_Author%)%)%)%,%
%author,%(%else-then(%if-no(%is_author%,,%(%author%)%)%,%(%if-no(%is_author%,,%($author$)%)%)%)%)%,%
%Author,%(%else-then(%if-no(%is_author%,,%(%Author%)%)%,%(%author%)%)%)%,%
%AUTHOR,%(%else-then(%AUTHOR%,%(%toupper(%Author%)%)%)%)%,%
%author,%(%else-then(%_Author%,%(%tolower(%Author%)%)%)%)%,%
%is_name,%(%else-then(%is_name%,%(%is_Name%)%)%)%,%
%name,%(%else-then(%if-no(%is_name%,,%(%name%)%)%,%(%if-no(%is_name%,,%(VisualStudio)%)%)%)%)%,%
%Name,%(%else-then(%if-no(%is_name%,,%(%Name%)%)%,%(%name%)%)%)%,%
%NAME,%(%else-then(%NAME%,%(%toupper(%Name%)%)%)%)%,%
%name,%(%else-then(%_Name%,%(%tolower(%Name%)%)%)%)%,%
%is_file,%(%else-then(%is_file%,%(%is_File%)%)%)%,%
%file,%(%else-then(%if-no(%is_file%,,%(%file%)%)%,%(%if-no(%is_file%,,%(%else-then(%Name%,%else-then(%Project%,VisualStudio)%)%)%)%)%)%)%,%
%File,%(%else-then(%if-no(%is_file%,,%(%File%)%)%,%(%file%)%)%)%,%
%FILE,%(%else-then(%FILE%,%(%toupper(%File%)%)%)%)%,%
%file,%(%else-then(%_File%,%(%tolower(%File%)%)%)%)%,%
%is_base,%(%else-then(%is_base%,%(%is_Base%)%)%)%,%
%base,%(%else-then(%if-no(%is_base%,,%(%base%)%)%,%(%if-no(%is_base%,,%(%filebase(%File%)%)%)%)%)%)%,%
%Base,%(%else-then(%if-no(%is_base%,,%(%Base%)%)%,%(%base%)%)%)%,%
%BASE,%(%else-then(%BASE%,%(%toupper(%Base%)%)%)%)%,%
%base,%(%else-then(%_Base%,%(%tolower(%Base%)%)%)%)%,%
%is_extension,%(%else-then(%is_extension%,%(%is_Extension%)%)%)%,%
%extension,%(%else-then(%if-no(%is_extension%,,%(%extension%)%)%,%(%if-no(%is_extension%,,%(%else-then(%fileextension(%File%)%,vcproj)%)%)%)%)%)%,%
%Extension,%(%else-then(%if-no(%is_extension%,,%(%Extension%)%)%,%(%extension%)%)%)%,%
%EXTENSION,%(%else-then(%EXTENSION%,%(%toupper(%Extension%)%)%)%)%,%
%extension,%(%else-then(%_Extension%,%(%tolower(%Extension%)%)%)%)%,%
%is_xmlversion,%(%else-then(%is_xmlversion%,%(%is_XmlVersion%)%)%)%,%
%xmlversion,%(%else-then(%if-no(%is_xmlversion%,,%(%xmlversion%)%)%,%(%if-no(%is_xmlversion%,,%(1.0)%)%)%)%)%,%
%XmlVersion,%(%else-then(%if-no(%is_xmlversion%,,%(%XmlVersion%)%)%,%(%xmlversion%)%)%)%,%
%XMLVERSION,%(%else-then(%XMLVERSION%,%(%toupper(%XmlVersion%)%)%)%)%,%
%xmlversion,%(%else-then(%_XmlVersion%,%(%tolower(%XmlVersion%)%)%)%)%,%
%is_xmlencoding,%(%else-then(%is_xmlencoding%,%(%is_XmlEncoding%)%)%)%,%
%xmlencoding,%(%else-then(%if-no(%is_xmlencoding%,,%(%xmlencoding%)%)%,%(%if-no(%is_xmlencoding%,,%(Windows-1252)%)%)%)%)%,%
%XmlEncoding,%(%else-then(%if-no(%is_xmlencoding%,,%(%XmlEncoding%)%)%,%(%xmlencoding%)%)%)%,%
%XMLENCODING,%(%else-then(%XMLENCODING%,%(%toupper(%XmlEncoding%)%)%)%)%,%
%xmlencoding,%(%else-then(%_XmlEncoding%,%(%tolower(%XmlEncoding%)%)%)%)%,%
%%(%
%<?xml version="%XmlVersion%" encoding="%XmlEncoding%"?>
<!--
=====================================================================
=== Copyright (c) 1988-%year()% %Organization%
===
=== This software is provided by the author and contributors ``as is'' 
=== and any express or implied warranties, including, but not limited to, 
=== the implied warranties of merchantability and fitness for a particular 
=== purpose are disclaimed. In no event shall the author or contributors 
=== be liable for any direct, indirect, incidental, special, exemplary, 
=== or consequential damages (including, but not limited to, procurement 
=== of substitute goods or services; loss of use, data, or profits; or 
=== business interruption) however caused and on any theory of liability, 
=== whether in contract, strict liability, or tort (including negligence 
=== or otherwise) arising in any way out of the use of this software, 
=== even if advised of the possibility of such damage.
===
===   File: %Base%.%Extension%
===
=== Author: %Author%
===   Date: %date()%
=====================================================================
-->
%
%)%)%