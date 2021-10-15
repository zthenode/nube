%#############################################################################
%# Copyright (c) 1988-2005 $author$.
%#
%# This software is provided by the author and contributors ``as is'' and
%# any express or implied warranties, including, but not limited to, the
%# implied warranties of merchantability and fitness for a particular purpose
%# are disclaimed.  In no event shall the author or contributors be liable
%# for any direct, indirect, incidental, special, exemplary, or consequential
%# damages (including, but not limited to, procurement of substitute goods
%# or services; loss of use, data, or profits; or business interruption)
%# however caused and on any theory of liability, whether in contract, strict
%# liability, or tort (including negligence or otherwise) arising in any way
%# out of the use of this software, even if advised of the possibility of
%# such damage.
%#
%#   File: html.t
%#
%# Author: $author$
%#   Date: 10/11/2005
%#
%#    $Id$
%#
%#############################################################################
%apply(padlen,%
%%strlen(=================================================)%,%(
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
<html%if(%namespace%,%(
 htmlns:%namespace%="%if(%namespaceuri%,%namespaceuri%,%namespace%)%")%)%>
    <!--==========================================================-->
    <!--                                                          -->
    <!-- head                                                     -->
    <!--                                                          -->
    <!--==========================================================-->
    <head>
    </head>
    <!--==========================================================-->
    <!--                                                          -->
    <!-- body                                                     -->
    <!--                                                          -->
    <!--==========================================================-->
    <body>
    </body>
</html>)%)%
