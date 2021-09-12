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
%#   File: httpd-conf.t
%#
%# Author: $author$
%#   Date: 10/26/2019
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%is_organization,%(%else-then(%is_organization%,%()%)%)%,%
%organization,%(%else-then(%organization%,%($organization$)%)%)%,%
%Organization,%(%else-then(%Organization%,%(%organization%)%)%)%,%
%ORGANIZATION,%(%else-then(%ORGANIZATION%,%(%toupper(%Organization%)%)%)%)%,%
%organization,%(%else-then(%_Organization%,%(%tolower(%Organization%)%)%)%)%,%
%is_author,%(%else-then(%is_author%,%()%)%)%,%
%author,%(%else-then(%author%,%($author$)%)%)%,%
%Author,%(%else-then(%Author%,%(%author%)%)%)%,%
%AUTHOR,%(%else-then(%AUTHOR%,%(%toupper(%Author%)%)%)%)%,%
%author,%(%else-then(%_Author%,%(%tolower(%Author%)%)%)%)%,%
%is_name,%(%else-then(%is_name%,%()%)%)%,%
%name,%(%else-then(%name%,%(httpd-local)%)%)%,%
%Name,%(%else-then(%Name%,%(%name%)%)%)%,%
%NAME,%(%else-then(%NAME%,%(%toupper(%Name%)%)%)%)%,%
%name,%(%else-then(%_Name%,%(%tolower(%Name%)%)%)%)%,%
%is_extension,%(%else-then(%is_extension%,%()%)%)%,%
%extension,%(%else-then(%extension%,%(conf)%)%)%,%
%Extension,%(%else-then(%Extension%,%(%extension%)%)%)%,%
%EXTENSION,%(%else-then(%EXTENSION%,%(%toupper(%Extension%)%)%)%)%,%
%extension,%(%else-then(%_Extension%,%(%tolower(%Extension%)%)%)%)%,%
%is_home,%(%else-then(%is_home%,%()%)%)%,%
%home,%(%else-then(%home%,%(/home/jboyd)%)%)%,%
%Home,%(%else-then(%Home%,%(%home%)%)%)%,%
%HOME,%(%else-then(%HOME%,%(%toupper(%Home%)%)%)%)%,%
%home,%(%else-then(%_Home%,%(%tolower(%Home%)%)%)%)%,%
%%(%
%#########################################################################
# Copyright (c) 1988-%year()% %Organization%                                 
#                                                                        
# This software is provided by the author and contributors ``as is''     
# and any express or implied warranties, including, but not limited to,  
# the implied warranties of merchantability and fitness for a particular 
# purpose are disclaimed. In no event shall the author or contributors   
# be liable for any direct, indirect, incidental, special, exemplary,    
# or consequential damages (including, but not limited to, procurement   
# of substitute goods or services; loss of use, data, or profits; or     
# business interruption) however caused and on any theory of liability,  
# whether in contract, strict liability, or tort (including negligence   
# or otherwise) arising in any way out of the use of this software,      
# even if advised of the possibility of such damage.                     
#                                                                        
#   File: %Name%.%Extension%                                               
#                                                                        
# Author: %Author%                                                       
#   Date: %date()%                        
#########################################################################

#########################################################################
# Aliases 
# ... 
#########################################################################
<IfModule mod_alias.c>

#########################################################################
# Alias /home/ 
#########################################################################
Alias /home/ "%Home%/"
<Directory "%Home%/">
    Options Indexes MultiViews FollowSymLinks
    AllowOverride AuthConfig
    Order allow,deny
    Allow from all
</Directory>

#########################################################################
# Alias /source/ 
#########################################################################
Alias /source/ "%Home%/source/"
<Directory "%Home%/source/">
    Options Indexes MultiViews FollowSymLinks
    AllowOverride AuthConfig
    Order allow,deny
    Allow from all
</Directory>

#########################################################################
# ScriptAlias /build/
#########################################################################
ScriptAlias /build/ "%Home%/build/"
<Directory "%Home%/build/">
#    PassEnv LD_LIBRARY_PATH
#    PassEnv DYLD_LIBRARY_PATH
    SetEnv HOME /Users/jboyd
    Options  FollowSymLinks
    AllowOverride AuthConfig
    Order allow,deny
    Allow from all
</Directory>

#########################################################################
# ScriptAlias /xde-cgi/
#########################################################################
ScriptAlias /xde-cgi/ "%Home%/build/xde/bin/"
<Directory "%Home%/build/xde/bin/">
#    PassEnv LD_LIBRARY_PATH
#    PassEnv DYLD_LIBRARY_PATH
    SetEnv HOME /Users/jboyd
    Options  FollowSymLinks
    AllowOverride AuthConfig
    Order allow,deny
    Allow from all
</Directory>

#########################################################################
# AddType
#########################################################################
AddType application/x-httpd-cxx .h
AddType application/x-httpd-cxx .c
AddType application/x-httpd-cxx .m
AddType application/x-httpd-cxx .H
AddType application/x-httpd-cxx .C
AddType application/x-httpd-cxx .M
AddType application/x-httpd-cxx .hh
AddType application/x-httpd-cxx .cc
AddType application/x-httpd-cxx .mm
AddType application/x-httpd-cxx .hpp
AddType application/x-httpd-cxx .cpp
AddType application/x-httpd-cxx .hxx
AddType application/x-httpd-cxx .cxx

AddType application/x-httpd-xsl .xsl
AddType application/x-httpd-xsl .xslt

AddType application/x-httpd-t .t
AddType application/x-httpd-t .texta

AddType text/plain .vcproj
AddType text/plain .vsprops
AddType text/plain .vcxproj
AddType text/plain .props

AddType text/plain .patch
AddType text/plain .sh

#########################################################################
# Action
#########################################################################
Action application/x-httpd-cxx /xde-cgi/cxxlcgi
#Action application/x-httpd-cxx /xde-cgi/cgicatch

Action application/x-httpd-xsl /xde-cgi/xslcgi
#Action application/x-httpd-xsl /xde-cgi/cgicatch

Action application/x-httpd-t /xde-cgi/tcgi
#Action application/x-httpd-t /xde-cgi/cgicatch

</IfModule>
#########################################################################
# ... 
# Aliases 
#########################################################################

#########################################################################
# Autoindex 
# ... 
#########################################################################
<IfModule mod_autoindex.c>
    IndexOptions FancyIndexing FoldersFirst NameWidth=*
</IfModule>
#########################################################################
# ... 
# Autoindex 
#########################################################################

#########################################################################
# SSL
# ...
#########################################################################
<IfModule mod_ssl.c>
Listen 443
<VirtualHost *:443>
    ServerName ssl-server
    SSLEngine on
    SSLProtocol TLSv1
    SSLCertificateFile %Home%/ssl/localhost.resigned.cert
    SSLCertificateKeyFile %Home%/ssl/localhost.key.unsecure
    SSLCACertificateFile %Home%/ssl/localhost.resigned.cert
#    SSLVerifyClient require
#    SSLVerifyDepth 1
#    ErrorLog logs/ssl_engine.log
#    LogLevel debug
</VirtualHost>
</IfModule>
#########################################################################
# ...
# SSL
#########################################################################
%
%)%)%