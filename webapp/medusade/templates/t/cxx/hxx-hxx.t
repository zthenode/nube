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
%#   File: hxx-hxx.t
%#
%# Author: $author$
%#   Date: 1/15/2021
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%%(%
%%Ifndef_begin%%
%%then-if(%Includes%%Sys_includes%,
)%%
%%then-if(%Namespace_begin%,
)%%
%%include(%include_path%/%Prefix%hxx.t)%%
%%then-if(%Namespace_end%,
)%%
%%then-if(%Ifndef_end%,
)%%
%)%)%