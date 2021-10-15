%#################################################################
%#
%#   File: xml.t
%#
%# Author: $author$
%#   Date: 9/4/2003
%#   Date: 9/11/2004
%#
%#    $Id$
%#
%#################################################################
<?xml version="%if(%version%,%version%,1.0)%"?>%apply(padlen,%strlen(=================================================)%,%(
<!--==========================================================-->
<!--                                                          -->
<!--   File: %strpad(%filename(%if(%file%,%file%,%if(%output%,%output%,xml.xml)%)%)%, ,%padlen%)%-->
<!--                                                          -->
<!-- Author: %strpad(%if(%author%,%(%author%)%,%($author$)%)%, ,%padlen%)%-->
<!--   Date: %strpad(%date(month,day,year,%(%month%/%day%/%year%)%)%, ,%padlen%)%-->
<!--                                                          -->
<!--    $Id$                                                  -->
<!--                                                          -->
<!--==========================================================-->
<%if(%namespace%,%namespace%:)%%if(%document%,%document%,document)%%if(%namespace%,%(
 xmlns:%namespace%="%if(%namespace_uri%,%namespace_uri%,%namespace%)%")%)%>
</%if(%namespace%,%namespace%:)%%if(%document%,%document%,document)%>)%)%
