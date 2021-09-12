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
%#   File: xttp-message-part-class-hpp.t
%#
%# Author: $author$
%#   Date: 11/11/2019
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%%(%
%
/// class %NameT%
template 
<class TExtends = message::part, class TImplements = typename TExtends::implements>

class exported %NameT%: virtual public TImplements, public TExtends {
public:
    typedef TImplements implements;
    typedef TExtends extends;
    typedef %NameT% derives;

    typedef typename extends::reader_t reader_t;
    typedef typename extends::writer_t writer_t;
    typedef typename extends::string_t string_t;
    typedef typename extends::char_t char_t;
    typedef typename extends::end_char_t end_char_t;
    enum { end_char = extends::end_char };

    /// constructors / destructor
    %NameT%(const string_t& chars): extends(chars) {
        this->separate();
    }
    %NameT%(const char_t* chars, size_t length): extends(chars, length) {
        this->separate();
    }
    %NameT%(const char_t* chars): extends(chars) {
        this->separate();
    }
    %NameT%(const %NameT%& copy): extends(copy) {
    }
    %NameT%() {
        this->set_default();
    }
    virtual ~%NameT%() {
    }

    /// read / write
    virtual bool read(ssize_t& count, char_t& c, reader_t& reader) {
        bool success = false;
        if (!(this->is_combined())) {
            success = this->read_this(count, c, reader);
        }
        return success;
    }
    virtual bool write(ssize_t& count, writer_t& writer) {
        bool success = false;
        if (!(this->is_combined())) {
            success = this->write_this(count, writer);
        }
        return success;
    }

    /// combine / separate
    virtual bool combine() {
        bool success = true;
        return success;
    }
    virtual bool separate() {
        bool success = true;
        return success;
    }
    virtual bool is_combined() const {
        return this->is_combined_;
    }

    /// set_default...
    virtual message::part& set_default() {
        this->clear();
        this->set_defaults();
        this->combine();
        return *this;
    }
    virtual message::part& set_defaults() {
        return *this;
    }

protected:
}; /// class %NameT%
typedef %NameT%<> %Name%;
%
%)%)%