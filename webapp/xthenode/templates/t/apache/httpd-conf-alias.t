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
%#   File: httpd-conf-alias.t
%#
%# Author: $author$
%#   Date: 8/9/2020
%########################################################################
%with(%
%is_include_path,%(%else-then(%is_include_path%,%(%is_Include_path%)%)%)%,%
%include_path,%(%else-then(%if-no(%is_include_path%,,%(%include_path%)%)%,%(%if-no(%is_include_path%,,%(%filepath(%input%)%)%)%)%)%)%,%
%Include_path,%(%else-then(%if-no(%is_include_path%,,%(%Include_path%)%)%,%(%if-no(%is_include_path%,,%(%include_path%)%)%)%)%)%,%
%INCLUDE_PATH,%(%else-then(%INCLUDE_PATH%,%(%toupper(%Include_path%)%)%)%)%,%
%include_path,%(%else-then(%_include_path%,%(%tolower(%Include_path%)%)%)%)%,%
%is_file,%(%else-then(%is_file%,%(%is_File%)%)%)%,%
%file,%(%else-then(%if-no(%is_file%,,%(%file%)%)%,%(%if-no(%is_file%,,%(httpd-local.conf)%)%)%)%)%,%
%File,%(%else-then(%if-no(%is_file%,,%(%File%)%)%,%(%if-no(%is_file%,,%(%file%)%)%)%)%)%,%
%FILE,%(%else-then(%FILE%,%(%toupper(%File%)%)%)%)%,%
%file,%(%else-then(%_file%,%(%tolower(%File%)%)%)%)%,%
%is_framework,%(%else-then(%is_framework%,%(%is_Framework%)%)%)%,%
%framework,%(%else-then(%if-no(%is_framework%,,%(%framework%)%)%,%(%if-no(%is_framework%,,%(framework)%)%)%)%)%,%
%Framework,%(%else-then(%if-no(%is_framework%,,%(%Framework%)%)%,%(%if-no(%is_framework%,,%(%framework%)%)%)%)%)%,%
%FRAMEWORK,%(%else-then(%FRAMEWORK%,%(%toupper(%Framework%)%)%)%)%,%
%framework,%(%else-then(%_framework%,%(%tolower(%Framework%)%)%)%)%,%
%is_alias,%(%else-then(%is_alias%,%(%is_Alias%)%)%)%,%
%alias,%(%else-then(%if-no(%is_alias%,,%(%alias%)%)%,%(%if-no(%is_alias%,,%(%Framework%)%)%)%)%)%,%
%Alias,%(%else-then(%if-no(%is_alias%,,%(%Alias%)%)%,%(%if-no(%is_alias%,,%(%alias%)%)%)%)%)%,%
%ALIAS,%(%else-then(%ALIAS%,%(%toupper(%Alias%)%)%)%)%,%
%alias,%(%else-then(%_alias%,%(%tolower(%Alias%)%)%)%)%,%
%is_alias_path,%(%else-then(%is_alias_path%,%(%is_Alias_path%)%)%)%,%
%alias_path,%(%else-then(%if-no(%is_alias_path%,,%(%alias_path%)%)%,%(%if-no(%is_alias_path%,,%(/home/source/%Alias%/)%)%)%)%)%,%
%Alias_path,%(%else-then(%if-no(%is_alias_path%,,%(%Alias_path%)%)%,%(%if-no(%is_alias_path%,,%(%alias_path%)%)%)%)%)%,%
%ALIAS_PATH,%(%else-then(%ALIAS_PATH%,%(%toupper(%Alias_path%)%)%)%)%,%
%alias_path,%(%else-then(%_alias_path%,%(%tolower(%Alias_path%)%)%)%)%,%
%is_directory,%(%else-then(%is_directory%,%(%is_Directory%)%)%)%,%
%directory,%(%else-then(%if-no(%is_directory%,,%(%directory%)%)%,%(%if-no(%is_directory%,,%(%Alias_path%)%)%)%)%)%,%
%Directory,%(%else-then(%if-no(%is_directory%,,%(%Directory%)%)%,%(%if-no(%is_directory%,,%(%directory%)%)%)%)%)%,%
%DIRECTORY,%(%else-then(%DIRECTORY%,%(%toupper(%Directory%)%)%)%)%,%
%directory,%(%else-then(%_directory%,%(%tolower(%Directory%)%)%)%)%,%
%is_scriptalias,%(%else-then(%is_scriptalias%,%(%is_ScriptAlias%)%)%)%,%
%scriptalias,%(%else-then(%if-no(%is_scriptalias%,,%(%scriptalias%)%)%,%(%if-no(%is_scriptalias%,,%(%Framework%-cgi)%)%)%)%)%,%
%ScriptAlias,%(%else-then(%if-no(%is_scriptalias%,,%(%ScriptAlias%)%)%,%(%if-no(%is_scriptalias%,,%(%scriptalias%)%)%)%)%)%,%
%SCRIPTALIAS,%(%else-then(%SCRIPTALIAS%,%(%toupper(%ScriptAlias%)%)%)%)%,%
%scriptalias,%(%else-then(%_scriptalias%,%(%tolower(%ScriptAlias%)%)%)%)%,%
%is_scriptalias_path,%(%else-then(%is_scriptalias_path%,%(%is_ScriptAlias_path%)%)%)%,%
%scriptalias_path,%(%else-then(%if-no(%is_scriptalias_path%,,%(%scriptalias_path%)%)%,%(%if-no(%is_scriptalias_path%,,%(%Alias_path%build/)%)%)%)%)%,%
%ScriptAlias_path,%(%else-then(%if-no(%is_scriptalias_path%,,%(%ScriptAlias_path%)%)%,%(%if-no(%is_scriptalias_path%,,%(%scriptalias_path%)%)%)%)%)%,%
%SCRIPTALIAS_PATH,%(%else-then(%SCRIPTALIAS_PATH%,%(%toupper(%ScriptAlias_path%)%)%)%)%,%
%scriptalias_path,%(%else-then(%_scriptalias_path%,%(%tolower(%ScriptAlias_path%)%)%)%)%,%
%is_scriptdirectory,%(%else-then(%is_scriptdirectory%,%(%is_ScriptDirectory%)%)%)%,%
%scriptdirectory,%(%else-then(%if-no(%is_scriptdirectory%,,%(%scriptdirectory%)%)%,%(%if-no(%is_scriptdirectory%,,%(%ScriptAlias_path%)%)%)%)%)%,%
%ScriptDirectory,%(%else-then(%if-no(%is_scriptdirectory%,,%(%ScriptDirectory%)%)%,%(%if-no(%is_scriptdirectory%,,%(%scriptdirectory%)%)%)%)%)%,%
%SCRIPTDIRECTORY,%(%else-then(%SCRIPTDIRECTORY%,%(%toupper(%ScriptDirectory%)%)%)%)%,%
%scriptdirectory,%(%else-then(%_scriptdirectory%,%(%tolower(%ScriptDirectory%)%)%)%)%,%
%is_passenv_httpd_host,%(%else-then(%is_passenv_httpd_host%,%(%is_PassEnv_HTTPD_HOST%)%)%)%,%
%passenv_httpd_host,%(%else-then(%if-no(%is_passenv_httpd_host%,,%(%passenv_httpd_host%)%)%,%(%if-no(%is_passenv_httpd_host%,,%(HTTPD_HOST)%)%)%)%)%,%
%PassEnv_HTTPD_HOST,%(%else-then(%if-no(%is_passenv_httpd_host%,,%(%PassEnv_HTTPD_HOST%)%)%,%(%if-no(%is_passenv_httpd_host%,,%(%passenv_httpd_host%)%)%)%)%)%,%
%PASSENV_HTTPD_HOST,%(%else-then(%PASSENV_HTTPD_HOST%,%(%toupper(%PassEnv_HTTPD_HOST%)%)%)%)%,%
%passenv_httpd_host,%(%else-then(%_passenv_httpd_host%,%(%tolower(%PassEnv_HTTPD_HOST%)%)%)%)%,%
%is_passenv_httpd_user,%(%else-then(%is_passenv_httpd_user%,%(%is_PassEnv_HTTPD_USER%)%)%)%,%
%passenv_httpd_user,%(%else-then(%if-no(%is_passenv_httpd_user%,,%(%passenv_httpd_user%)%)%,%(%if-no(%is_passenv_httpd_user%,,%(HTTPD_USER)%)%)%)%)%,%
%PassEnv_HTTPD_USER,%(%else-then(%if-no(%is_passenv_httpd_user%,,%(%PassEnv_HTTPD_USER%)%)%,%(%if-no(%is_passenv_httpd_user%,,%(%passenv_httpd_user%)%)%)%)%)%,%
%PASSENV_HTTPD_USER,%(%else-then(%PASSENV_HTTPD_USER%,%(%toupper(%PassEnv_HTTPD_USER%)%)%)%)%,%
%passenv_httpd_user,%(%else-then(%_passenv_httpd_user%,%(%tolower(%PassEnv_HTTPD_USER%)%)%)%)%,%
%is_passenv_httpd_user_home,%(%else-then(%is_passenv_httpd_user_home%,%(%is_PassEnv_HTTPD_USER_HOME%)%)%)%,%
%passenv_httpd_user_home,%(%else-then(%if-no(%is_passenv_httpd_user_home%,,%(%passenv_httpd_user_home%)%)%,%(%if-no(%is_passenv_httpd_user_home%,,%(HTTPD_USER_HOME)%)%)%)%)%,%
%PassEnv_HTTPD_USER_HOME,%(%else-then(%if-no(%is_passenv_httpd_user_home%,,%(%PassEnv_HTTPD_USER_HOME%)%)%,%(%if-no(%is_passenv_httpd_user_home%,,%(%passenv_httpd_user_home%)%)%)%)%)%,%
%PASSENV_HTTPD_USER_HOME,%(%else-then(%PASSENV_HTTPD_USER_HOME%,%(%toupper(%PassEnv_HTTPD_USER_HOME%)%)%)%)%,%
%passenv_httpd_user_home,%(%else-then(%_passenv_httpd_user_home%,%(%tolower(%PassEnv_HTTPD_USER_HOME%)%)%)%)%,%
%%(%
%%if(%File%,%(%include(%Include_path%/file-conf.t)%
#########################################################################
# Aliases 
# ... 
#########################################################################
<IfModule mod_alias.c>

)%)%%
%%if(%Framework%,%(#########################################################################
# %Framework%
# ...
)%)%%
%%if(%Alias%,%(Alias /%Alias%/ "%Alias_path%"
)%)%%
%%if(%Directory%,%(<Directory "%Directory%">
    Options Indexes MultiViews FollowSymLinks
    AllowOverride AuthConfig
    Order allow,deny
    Allow from all
</Directory>)%)%

%if(%ScriptAlias%,%(ScriptAlias /%ScriptAlias%/ "%ScriptAlias_path%"
)%)%%
%%if(%ScriptDirectory%,%(<Directory "%ScriptDirectory%">
#    PassEnv LD_LIBRARY_PATH
#    PassEnv DYLD_LIBRARY_PATH
%if(%PassEnv_HTTPD_HOST%,%(    PassEnv %PassEnv_HTTPD_HOST%
)%,%(#    PassEnv HTTPD_HOST
)%)%%
%%if(%PassEnv_HTTPD_USER%,%(    PassEnv %PassEnv_HTTPD_USER%
)%,%(#    PassEnv HTTPD_USER
)%)%%
%%if(%PassEnv_HTTPD_USER_HOME%,%(    PassEnv %PassEnv_HTTPD_USER_HOME%
)%,%(#    PassEnv HTTPD_USER_HOME
)%)%    Options  FollowSymLinks
    AllowOverride AuthConfig
    Order allow,deny
    Allow from all
</Directory>
)%)%%
%%if(%Framework%,%(# ...
# %Framework%
#########################################################################
)%)%%
%%if(%File%,
</IfModule>
#########################################################################
# ... 
# Aliases 
#########################################################################
)%%
%)%)%