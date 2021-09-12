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
%#   File: exception-hpp-cpp.t
%#
%# Author: $author$
%#   Date: 8/19/2019
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%is_File,%(%else-then(%is_File%,%()%)%)%,%
%File,%(%else-then(%File%,%(exception)%)%)%,%
%FILE,%(%else-then(%FILE%,%(%toupper(%File%)%)%)%)%,%
%file,%(%else-then(%_File%,%(%tolower(%File%)%)%)%)%,%
%is_Author,%(%else-then(%is_Author%,%()%)%)%,%
%Author,%(%else-then(%Author%,%($author$)%)%)%,%
%AUTHOR,%(%else-then(%AUTHOR%,%(%toupper(%Author%)%)%)%)%,%
%author,%(%else-then(%_Author%,%(%tolower(%Author%)%)%)%)%,%
%is_Organization,%(%else-then(%is_Organization%,%()%)%)%,%
%Organization,%(%else-then(%Organization%,%($organization$)%)%)%,%
%ORGANIZATION,%(%else-then(%ORGANIZATION%,%(%toupper(%Organization%)%)%)%)%,%
%organization,%(%else-then(%_Organization%,%(%tolower(%Organization%)%)%)%)%,%
%is_Name,%(%else-then(%is_Name%,%()%)%)%,%
%Name,%(%else-then(%Name%,%(filename(File))%)%)%,%
%NAME,%(%else-then(%NAME%,%(%toupper(%Name%)%)%)%)%,%
%name,%(%else-then(%_Name%,%(%tolower(%Name%)%)%)%)%,%
%is_Extension,%(%else-then(%is_Extension%,%()%)%)%,%
%Extension,%(%else-then(%Extension%,%(fileextension(File))%)%)%,%
%EXTENSION,%(%else-then(%EXTENSION%,%(%toupper(%Extension%)%)%)%)%,%
%extension,%(%else-then(%_Extension%,%(%tolower(%Extension%)%)%)%)%,%
%is_What,%(%else-then(%is_What%,%()%)%)%,%
%What,%(%else-then(%What%,%(What)%)%)%,%
%WHAT,%(%else-then(%WHAT%,%(%toupper(%What%)%)%)%)%,%
%what,%(%else-then(%_What%,%(%tolower(%What%)%)%)%)%,%
%%(%
%///////////////////////////////////////////////////////////////////////
///  Enum: %What%_status
///////////////////////////////////////////////////////////////////////
typedef int %What%_status;
enum {
    %What%_success,
    %What%_failed,
    %What%_invalid
};
template <class TString = char_string>
inline const TString %What%_status_to_string(%What%_status status) {
    switch (status) {
    case %What%_success: return TString("%What%_success");
    case %What%_failed: return TString("%What%_failed");
    case %What%_invalid: return TString("%What%_invalid");
    }
    return TString("unknown");
}
///////////////////////////////////////////////////////////////////////
///  Class: %What%_exceptiont
///////////////////////////////////////////////////////////////////////
template 
<class TImplements = exception_implementt<%What%_status, char, char_string>, 
 class TExtends = exceptiont<%What%_status, char, char_string, TImplements> >
class _EXPORT_CLASS %What%_exceptiont: virtual public TImplements, public TExtends {
public:
    typedef TImplements implements;
    typedef TExtends extends;

    typedef typename implements::status_t status_t;
    typedef typename implements::string_t string_t;
    typedef typename implements::char_t char_t;

    ///////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////
    %What%_exceptiont(status_t status): extends(status) {
    }
    %What%_exceptiont(const %What%_exceptiont &copy): extends(copy) {
    }
    virtual ~%What%_exceptiont() {
    }

    ///////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////
    virtual string_t status_to_string() const {
        return %What%_status_to_string(this->status());
    }
};
typedef %What%_exceptiont<> %What%_exception;
%
%)%)%