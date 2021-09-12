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
%#   File: httpd-conf.t
%#
%# Author: $author$
%#   Date: 4/12/2020
%########################################################################
%with(%
%is_include_path,%(%else-then(%is_include_path%,%(%is_Include_path%)%)%)%,%
%include_path,%(%else-then(%if-no(%is_include_path%,,%(%include_path%)%)%,%(%if-no(%is_include_path%,,%(%filepath(%input%)%)%)%)%)%)%,%
%Include_path,%(%else-then(%if-no(%is_include_path%,,%(%Include_path%)%)%,%(%if-no(%is_include_path%,,%(%include_path%)%)%)%)%)%,%
%INCLUDE_PATH,%(%else-then(%INCLUDE_PATH%,%(%toupper(%Include_path%)%)%)%)%,%
%include_path,%(%else-then(%_include_path%,%(%tolower(%Include_path%)%)%)%)%,%
%is_host,%(%else-then(%is_host%,%(%is_Host%)%)%)%,%
%host,%(%else-then(%if-no(%is_host%,,%(%host%)%)%,%(%if-no(%is_host%,,%(%else-then(%getenv(HTTPD_HOST)%,%(%else-then(%getenv(HOST)%,%(localhost)%)%)%)%)%)%)%)%)%,%
%Host,%(%else-then(%if-no(%is_host%,,%(%Host%)%)%,%(%if-no(%is_host%,,%(%host%)%)%)%)%)%,%
%HOST,%(%else-then(%HOST%,%(%toupper(%Host%)%)%)%)%,%
%host,%(%else-then(%_host%,%(%tolower(%Host%)%)%)%)%,%
%is_user,%(%else-then(%is_user%,%(%is_User%)%)%)%,%
%user,%(%else-then(%if-no(%is_user%,,%(%user%)%)%,%(%if-no(%is_user%,,%(%else-then(%getenv(HTTPD_USER)%,%(%else-then(%getenv(USER)%,%(nobody)%)%)%)%)%)%)%)%)%,%
%User,%(%else-then(%if-no(%is_user%,,%(%User%)%)%,%(%if-no(%is_user%,,%(%user%)%)%)%)%)%,%
%USER,%(%else-then(%USER%,%(%toupper(%User%)%)%)%)%,%
%user,%(%else-then(%_user%,%(%tolower(%User%)%)%)%)%,%
%is_group,%(%else-then(%is_group%,%(%is_Group%)%)%)%,%
%group,%(%else-then(%if-no(%is_group%,,%(%group%)%)%,%(%if-no(%is_group%,,%(%User%)%)%)%)%)%,%
%Group,%(%else-then(%if-no(%is_group%,,%(%Group%)%)%,%(%if-no(%is_group%,,%(%group%)%)%)%)%)%,%
%GROUP,%(%else-then(%GROUP%,%(%toupper(%Group%)%)%)%)%,%
%group,%(%else-then(%_group%,%(%tolower(%Group%)%)%)%)%,%
%is_hostname,%(%else-then(%is_hostname%,%(%is_HostName%)%)%)%,%
%hostname,%(%else-then(%if-no(%is_hostname%,,%(%hostname%)%)%,%(%if-no(%is_hostname%,,%(%Host%)%)%)%)%)%,%
%HostName,%(%else-then(%if-no(%is_hostname%,,%(%HostName%)%)%,%(%if-no(%is_hostname%,,%(%hostname%)%)%)%)%)%,%
%HOSTNAME,%(%else-then(%HOSTNAME%,%(%toupper(%HostName%)%)%)%)%,%
%hostname,%(%else-then(%_hostname%,%(%tolower(%HostName%)%)%)%)%,%
%is_username,%(%else-then(%is_username%,%(%is_UserName%)%)%)%,%
%username,%(%else-then(%if-no(%is_username%,,%(%username%)%)%,%(%if-no(%is_username%,,%(%User%)%)%)%)%)%,%
%UserName,%(%else-then(%if-no(%is_username%,,%(%UserName%)%)%,%(%if-no(%is_username%,,%(%username%)%)%)%)%)%,%
%USERNAME,%(%else-then(%USERNAME%,%(%toupper(%UserName%)%)%)%)%,%
%username,%(%else-then(%_username%,%(%tolower(%UserName%)%)%)%)%,%
%is_groupname,%(%else-then(%is_groupname%,%(%is_GroupName%)%)%)%,%
%groupname,%(%else-then(%if-no(%is_groupname%,,%(%groupname%)%)%,%(%if-no(%is_groupname%,,%(%Group%)%)%)%)%)%,%
%GroupName,%(%else-then(%if-no(%is_groupname%,,%(%GroupName%)%)%,%(%if-no(%is_groupname%,,%(%groupname%)%)%)%)%)%,%
%GROUPNAME,%(%else-then(%GROUPNAME%,%(%toupper(%GroupName%)%)%)%)%,%
%groupname,%(%else-then(%_groupname%,%(%tolower(%GroupName%)%)%)%)%,%
%is_servername,%(%else-then(%is_servername%,%(%is_ServerName%)%)%)%,%
%servername,%(%else-then(%if-no(%is_servername%,,%(%servername%)%)%,%(%if-no(%is_servername%,,%(%HostName%)%)%)%)%)%,%
%ServerName,%(%else-then(%if-no(%is_servername%,,%(%ServerName%)%)%,%(%if-no(%is_servername%,,%(%servername%)%)%)%)%)%,%
%SERVERNAME,%(%else-then(%SERVERNAME%,%(%toupper(%ServerName%)%)%)%)%,%
%servername,%(%else-then(%_servername%,%(%tolower(%ServerName%)%)%)%)%,%
%is_serveradmin,%(%else-then(%is_serveradmin%,%(%is_ServerAdmin%)%)%)%,%
%serveradmin,%(%else-then(%if-no(%is_serveradmin%,,%(%serveradmin%)%)%,%(%if-no(%is_serveradmin%,,%(%if-then(%User%,%(@%ServerName%)%)%)%)%)%)%)%,%
%ServerAdmin,%(%else-then(%if-no(%is_serveradmin%,,%(%ServerAdmin%)%)%,%(%if-no(%is_serveradmin%,,%(%serveradmin%)%)%)%)%)%,%
%SERVERADMIN,%(%else-then(%SERVERADMIN%,%(%toupper(%ServerAdmin%)%)%)%)%,%
%serveradmin,%(%else-then(%_serveradmin%,%(%tolower(%ServerAdmin%)%)%)%)%,%
%is_home,%(%else-then(%is_home%,%(%is_Home%)%)%)%,%
%home,%(%else-then(%if-no(%is_home%,,%(%home%)%)%,%(%if-no(%is_home%,,%(%else-then(%getenv(HTTPD_USER_HOME)%,%(%else-then(%getenv(HOME)%,%(/home)%)%)%)%)%)%)%)%)%,%
%Home,%(%else-then(%if-no(%is_home%,,%(%Home%)%)%,%(%if-no(%is_home%,,%(%home%)%)%)%)%)%,%
%HOME,%(%else-then(%HOME%,%(%toupper(%Home%)%)%)%)%,%
%home,%(%else-then(%_home%,%(%tolower(%Home%)%)%)%)%,%
%is_homealias,%(%else-then(%is_homealias%,%(%is_HomeAlias%)%)%)%,%
%homealias,%(%else-then(%if-no(%is_homealias%,,%(%homealias%)%)%,%(%if-no(%is_homealias%,,%(home)%)%)%)%)%,%
%HomeAlias,%(%else-then(%if-no(%is_homealias%,,%(%HomeAlias%)%)%,%(%if-no(%is_homealias%,,%(%homealias%)%)%)%)%)%,%
%HOMEALIAS,%(%else-then(%HOMEALIAS%,%(%toupper(%HomeAlias%)%)%)%)%,%
%homealias,%(%else-then(%_homealias%,%(%tolower(%HomeAlias%)%)%)%)%,%
%is_source,%(%else-then(%is_source%,%(%is_Source%)%)%)%,%
%source,%(%else-then(%if-no(%is_source%,,%(%source%)%)%,%(%if-no(%is_source%,,%(%Home%/source)%)%)%)%)%,%
%Source,%(%else-then(%if-no(%is_source%,,%(%Source%)%)%,%(%if-no(%is_source%,,%(%source%)%)%)%)%)%,%
%SOURCE,%(%else-then(%SOURCE%,%(%toupper(%Source%)%)%)%)%,%
%source,%(%else-then(%_source%,%(%tolower(%Source%)%)%)%)%,%
%is_sourcealias,%(%else-then(%is_sourcealias%,%(%is_SourceAlias%)%)%)%,%
%sourcealias,%(%else-then(%if-no(%is_sourcealias%,,%(%sourcealias%)%)%,%(%if-no(%is_sourcealias%,,%(source)%)%)%)%)%,%
%SourceAlias,%(%else-then(%if-no(%is_sourcealias%,,%(%SourceAlias%)%)%,%(%if-no(%is_sourcealias%,,%(%sourcealias%)%)%)%)%)%,%
%SOURCEALIAS,%(%else-then(%SOURCEALIAS%,%(%toupper(%SourceAlias%)%)%)%)%,%
%sourcealias,%(%else-then(%_sourcealias%,%(%tolower(%SourceAlias%)%)%)%)%,%
%is_build,%(%else-then(%is_build%,%(%is_Build%)%)%)%,%
%build,%(%else-then(%if-no(%is_build%,,%(%build%)%)%,%(%if-no(%is_build%,,%(%Home%/build)%)%)%)%)%,%
%Build,%(%else-then(%if-no(%is_build%,,%(%Build%)%)%,%(%if-no(%is_build%,,%(%build%)%)%)%)%)%,%
%BUILD,%(%else-then(%BUILD%,%(%toupper(%Build%)%)%)%)%,%
%build,%(%else-then(%_build%,%(%tolower(%Build%)%)%)%)%,%
%is_buildalias,%(%else-then(%is_buildalias%,%(%is_BuildAlias%)%)%)%,%
%buildalias,%(%else-then(%if-no(%is_buildalias%,,%(%buildalias%)%)%,%(%if-no(%is_buildalias%,,%(build)%)%)%)%)%,%
%BuildAlias,%(%else-then(%if-no(%is_buildalias%,,%(%BuildAlias%)%)%,%(%if-no(%is_buildalias%,,%(%buildalias%)%)%)%)%)%,%
%BUILDALIAS,%(%else-then(%BUILDALIAS%,%(%toupper(%BuildAlias%)%)%)%)%,%
%buildalias,%(%else-then(%_buildalias%,%(%tolower(%BuildAlias%)%)%)%)%,%
%is_framework,%(%else-then(%is_framework%,%(%is_Framework%)%)%)%,%
%framework,%(%else-then(%if-no(%is_framework%,,%(%framework%)%)%,%(%if-no(%is_framework%,,%(framework)%)%)%)%)%,%
%Framework,%(%else-then(%if-no(%is_framework%,,%(%Framework%)%)%,%(%if-no(%is_framework%,,%(%framework%)%)%)%)%)%,%
%FRAMEWORK,%(%else-then(%FRAMEWORK%,%(%toupper(%Framework%)%)%)%)%,%
%framework,%(%else-then(%_framework%,%(%tolower(%Framework%)%)%)%)%,%
%%(%
%%include(%Include_path%/file-conf.t)%%
%%if(%UserName%%GroupName%,%(
)%)%%
%%if(%UserName%,%(User %UserName%
)%)%%
%%if(%GroupName%,%(Group %GroupName%
)%)%%
%%if(%ServerName%%ServerAdmin%,%(
)%)%%
%%if(%ServerName%,%(ServerName %ServerName%
)%)%%
%%if(%ServerAdmin%,%(ServerAdmin %ServerAdmin%
)%)%%
%
#########################################################################
# Aliases 
# ... 
#########################################################################
<IfModule mod_alias.c>
%if(%UserName%,%(%
%%if(%Home%,%(
#########################################################################
# /%HomeAlias%/
# ...
Alias /%HomeAlias%/ "%Home%/"
<Directory "%Home%/">
    Options Indexes MultiViews FollowSymLinks
    AllowOverride AuthConfig
    Order allow,deny
    Allow from all
</Directory>
# ...
# /%HomeAlias%/
#########################################################################
%)%)%%
%)%)%%
%%if(%UserName%,%(%
%%if(%Source%,%(
#########################################################################
# /%SourceAlias%/
# ...
Alias /%SourceAlias%/ "%Source%/"
<Directory "%Source%/">
    Options Indexes MultiViews FollowSymLinks
    AllowOverride AuthConfig
    Order allow,deny
    Allow from all
</Directory>
# ...
# /%SourceAlias%/
#########################################################################
)%)%%
%)%)%%
%%if(%UserName%,%(%
%%if(%Build%,%(
#########################################################################
# /%BuildAlias%/
# ...
ScriptAlias /%BuildAlias%/ "%Build%/"
<Directory "%Build%/">
#    PassEnv LD_LIBRARY_PATH
#    PassEnv DYLD_LIBRARY_PATH
    PassEnv HTTPD_HOST
    PassEnv HTTPD_USER
    PassEnv HTTPD_USER_HOME
    SetEnv HOST %Host%
    SetEnv USER %User%
    SetEnv HOME %Home%
    Options  FollowSymLinks
    AllowOverride AuthConfig
    Order allow,deny
    Allow from all
</Directory>
# ...
# /%BuildAlias%/
#########################################################################
)%)%%
%)%)%%
%%parse(%Framework%,;,,,,%(
#########################################################################
# /%Alias%/
# ...
Alias /%Alias%/ "%Source%/%Alias%/"
<Directory "%Source%/%Alias%/">
    Options Indexes MultiViews FollowSymLinks
    AllowOverride AuthConfig
    Order allow,deny
    Allow from all
</Directory>
ScriptAlias /%Alias%-cgi/ "%Source%/build/%Alias%/bin/"
<Directory "%Source%/build/%Alias%/bin/">
#    PassEnv LD_LIBRARY_PATH
#    PassEnv DYLD_LIBRARY_PATH
    PassEnv HTTPD_HOST
    PassEnv HTTPD_USER
    PassEnv HTTPD_USER_HOME
    SetEnv HOST %Host%
    SetEnv USER %User%
    SetEnv HOME %Home%
    Options  FollowSymLinks
    AllowOverride AuthConfig
    Order allow,deny
    Allow from all
</Directory>
# ...
# /%Alias%/
#########################################################################
)%,Alias)%%
%
</IfModule>
#########################################################################
# ... 
# Aliases 
#########################################################################
%
%)%)%