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
%#   File: version-cpp.t
%#
%# Author: $author$
%#   Date: 10/23/2019
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%%(%
%#include "%Include_directory%/%Base%.%Header%"

#if !defined(%DEFINED_DIRECTORY%_%NAME%_NAME)
#define %DEFINED_DIRECTORY%_%NAME%_NAME "lib%Framework%"
#endif /// !defined(%DEFINED_DIRECTORY%_%NAME%_NAME)

#if !defined(%DEFINED_DIRECTORY%_%NAME%_MAJOR)
#define %DEFINED_DIRECTORY%_%NAME%_MAJOR 0
#endif /// !defined(%DEFINED_DIRECTORY%_%NAME%_MAJOR)

#if !defined(%DEFINED_DIRECTORY%_%NAME%_MINOR)
#define %DEFINED_DIRECTORY%_%NAME%_MINOR 0
#endif /// !defined(%DEFINED_DIRECTORY%_%NAME%_MINOR)

#if !defined(%DEFINED_DIRECTORY%_%NAME%_RELEASE)
#define %DEFINED_DIRECTORY%_%NAME%_RELEASE 0
#endif /// !defined(%DEFINED_DIRECTORY%_%NAME%_RELEASE)

%Namespace_begin%%
%namespace which {
typedef lib::version %Name%_implements;
///////////////////////////////////////////////////////////////////////
///  Class: %Name%
///////////////////////////////////////////////////////////////////////
class _EXPORT_CLASS %Name%: virtual public %Name%_implements {
public:
    typedef %Name%_implements implements;
    %Name%() {}
    virtual const char_t* name() const {
        return %DEFINED_DIRECTORY%_%NAME%_NAME;
    }
    virtual unsigned major() const {
        return %DEFINED_DIRECTORY%_%NAME%_MAJOR;
    }
    virtual unsigned minor() const {
        return %DEFINED_DIRECTORY%_%NAME%_MINOR;
    }
    virtual unsigned release() const {
        return %DEFINED_DIRECTORY%_%NAME%_RELEASE;
    }
}; /// class _EXPORT_CLASS %Name%
} /// namespace which

///////////////////////////////////////////////////////////////////////
///  Class: %Name%
///////////////////////////////////////////////////////////////////////
const lib::version& %Name%::which() {
    static const which::%Name% %Name%;
    return %Name%;
}
%
%%Namespace_end%%
%
%)%)%