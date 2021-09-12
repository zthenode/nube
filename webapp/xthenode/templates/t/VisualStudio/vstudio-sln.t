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
%#   File: vstudio-sln.t
%#
%# Author: $author$
%#   Date: 2/15/2020
%########################################################################
%with(%
%is_framework,%(%else-then(%is_framework%,%(%is_Framework%)%)%)%,%
%framework,%(%else-then(%if-no(%is_framework%,,%(%framework%)%)%,%(%if-no(%is_framework%,,%(framework)%)%)%)%)%,%
%Framework,%(%else-then(%if-no(%is_framework%,,%(%Framework%)%)%,%(%if-no(%is_framework%,,%(%framework%)%)%)%)%)%,%
%FRAMEWORK,%(%else-then(%FRAMEWORK%,%(%toupper(%Framework%)%)%)%)%,%
%framework,%(%else-then(%_framework%,%(%tolower(%Framework%)%)%)%)%,%
%is_vsversion,%(%else-then(%is_vsversion%,%(%is_VSVersion%)%)%)%,%
%vsversion,%(%else-then(%if-no(%is_vsversion%,,%(%vsversion%)%)%,%(%if-no(%is_vsversion%,,%(%if(%equal(%VCVersion%,vc8)%,%(2005)%,%(2008)%)%)%)%)%)%)%,%
%VSVersion,%(%else-then(%if-no(%is_vsversion%,,%(%VSVersion%)%)%,%(%if-no(%is_vsversion%,,%(%vsversion%)%)%)%)%)%,%
%VSVERSION,%(%else-then(%VSVERSION%,%(%toupper(%VSVersion%)%)%)%)%,%
%vsversion,%(%else-then(%_vsversion%,%(%tolower(%VSVersion%)%)%)%)%,%
%is_vsformatversion,%(%else-then(%is_vsformatversion%,%(%is_VSFormatVersion%)%)%)%,%
%vsformatversion,%(%else-then(%if-no(%is_vsformatversion%,,%(%vsformatversion%)%)%,%(%if-no(%is_vsformatversion%,,%(%if(%equal(%VCVersion%,vc8)%,%(9,00)%,%(10.00)%)%)%)%)%)%)%,%
%VSFormatVersion,%(%else-then(%if-no(%is_vsformatversion%,,%(%VSFormatVersion%)%)%,%(%if-no(%is_vsformatversion%,,%(%vsformatversion%)%)%)%)%)%,%
%VSFORMATVERSION,%(%else-then(%VSFORMATVERSION%,%(%toupper(%VSFormatVersion%)%)%)%)%,%
%vsformatversion,%(%else-then(%_vsformatversion%,%(%tolower(%VSFormatVersion%)%)%)%)%,%
%is_projecttypeuuid,%(%else-then(%is_projecttypeuuid%,%(%is_ProjectTypeUUID%)%)%)%,%
%projecttypeuuid,%(%else-then(%if-no(%is_projecttypeuuid%,,%(%projecttypeuuid%)%)%,%(%if-no(%is_projecttypeuuid%,,%(2150E333-8FDC-42A3-9474-1A3956D46DE8)%)%)%)%)%,%
%ProjectTypeUUID,%(%else-then(%if-no(%is_projecttypeuuid%,,%(%ProjectTypeUUID%)%)%,%(%if-no(%is_projecttypeuuid%,,%(%projecttypeuuid%)%)%)%)%)%,%
%PROJECTTYPEUUID,%(%else-then(%PROJECTTYPEUUID%,%(%toupper(%ProjectTypeUUID%)%)%)%)%,%
%projecttypeuuid,%(%else-then(%_projecttypeuuid%,%(%tolower(%ProjectTypeUUID%)%)%)%)%,%
%is_rootuuid,%(%else-then(%is_rootuuid%,%(%is_RootUUID%)%)%)%,%
%rootuuid,%(%else-then(%if-no(%is_rootuuid%,,%(%rootuuid%)%)%,%(%if-no(%is_rootuuid%,,%(%ProjectTypeUUID%)%)%)%)%)%,%
%RootUUID,%(%else-then(%if-no(%is_rootuuid%,,%(%RootUUID%)%)%,%(%if-no(%is_rootuuid%,,%(%rootuuid%)%)%)%)%)%,%
%ROOTUUID,%(%else-then(%ROOTUUID%,%(%toupper(%RootUUID%)%)%)%)%,%
%rootuuid,%(%else-then(%_rootuuid%,%(%tolower(%RootUUID%)%)%)%)%,%
%is_folders,%(%else-then(%is_folders%,%(%is_Folders%)%)%)%,%
%folders,%(%else-then(%if-no(%is_folders%,,%(%folders%)%)%,%(%if-no(%is_folders%,,%
%%(app;lib;properties=..\%Framework%.vsprops,..\vcproj.vsprops,vcversion.vsprops)%)%)%)%)%,%
%Folders,%(%else-then(%if-no(%is_folders%,,%(%Folders%)%)%,%(%if-no(%is_folders%,,%(%folders%)%)%)%)%)%,%
%FOLDERS,%(%else-then(%FOLDERS%,%(%toupper(%Folders%)%)%)%)%,%
%folders,%(%else-then(%_folders%,%(%tolower(%Folders%)%)%)%)%,%
%%(Microsoft Visual Studio Solution File, Format Version %VSFormatVersion%
# Visual Studio %VSVersion%%
%%parse(%Folders%,%(;)%,,,,%(%with(%
%Folder,%(%else-then(%left(%Folders%,=)%,%Folders%)%)%,%
%Folders,%(%else-then(%right-of-left(%Folders%,=)%,)%)%,%
%%(
Project("{%RootUUID%}") = "%Folder%", "%Folder%", "{%uuid()%}"%if(%Folders%,%(
	ProjectSection(SolutionItems) = preProject%parse(%Folders%,%(,)%,,,,%(
		%Folder% = %Folder%)%,Folder)%
	EndProjectSection)%)%
EndProject)%)%)%,Folders)%
Global
	GlobalSection(SolutionProperties) = preSolution
		HideSolutionNode = FALSE
	EndGlobalSection
EndGlobal
%
%)%)%