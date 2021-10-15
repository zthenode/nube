%#################################################################
%#
%#   File: xtl.t
%#
%# Author: $author$
%#   Date: 12/12/2004
%#
%#    $Id$
%#
%#################################################################
%apply-x(%
%author,%(%else-then(%author%,$author$)%)%,%
%date,%(%date()%)%,%
%year,%(%year()%)%,%
%file,%(%else-then(%file%,%output%)%)%,%
%filename,%(%filename(%file%)%)%,%
%filebase,%(%filebase(%filename%)%)%,%
%fileextension,%(%fileextension(%filename%)%)%,%
%version,%(%else-then(%version%,1.0)%)%,%
%namespace_prefix,%(%else-then(%namespace%,xtl)%)%,%
%namespace,%(%if-then(%namespace_prefix%,:)%)%,%
%namespace_uri,%(%else-then(%namespace_uri%,XML-Transform-Language)%)%,%
%document,%(%else-then(%document%,transform)%)%,%
%padlen,%(%strlen(=================================================)%)%,%
%%(<?xml version="%version%"?>
<!--==========================================================-->
<!--                                                          -->
<!--   File: %strpad(%filename%, ,%padlen%)%-->
<!--                                                          -->
<!-- Author: %strpad(%author%, ,%padlen%)%-->
<!--   Date: %strpad(%date%, ,%padlen%)%-->
<!--                                                          -->
<!--    $Id$                                                  -->
<!--                                                          -->
<!--==========================================================-->
<%namespace%%document%%if(%namespace%,%(
 xmlns:%namespace_prefix%="%namespace_uri%")%)%>
</%namespace%%document%>
)%)%