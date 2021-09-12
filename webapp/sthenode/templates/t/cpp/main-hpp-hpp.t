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
%#   File: main-hpp-hpp.t
%#
%# Author: $author$
%#   Date: 9/20/2019
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%%(%Ifndef_begin%%
%%Include%%
%%Namespace_begin%%
%///////////////////////////////////////////////////////////////////////
///  Class: %NameT%
///////////////////////////////////////////////////////////////////////
template 
<class TVersion = %TVersion%, 
 class TExtends = %TExtends%, 
 class TImplements = %TImplements%>

class _EXPORT_CLASS %NameT%: virtual public %Implements%, public %Extends% {
public:
    typedef %Implements% implements;
    typedef %Extends% extends;
    typedef %NameT% derives;

    typedef typename implements::file_t file_t;
    typedef typename implements::string_t string_t;
    typedef typename implements::char_t char_t;

    ///////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////
    %NameT%() {
    }
    virtual ~%NameT%() {
    }
private:
    %NameT%(const %NameT% &copy) {
    }

protected:
    ///////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////

    ///////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////
protected:
}; /// class _EXPORT_CLASS %NameT%

typedef %NameT%<> %Name%;

%
%%Namespace_end%%
%%Ifndef_end%)%)%%