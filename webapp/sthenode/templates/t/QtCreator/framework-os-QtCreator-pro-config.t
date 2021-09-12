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
%#   File: framework-os-QtCreator-pro-config.t
%#
%# Author: $author$
%#   Date: 10/27/2019
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%%(
BUILD_OS = %FRAMEWORK%_OS

contains(BUILD_OS,%FRAMEWORK%_OS) {
BUILD_OS = $${%FRAMEWORK%_OS}
} else {
BUILD_OS = os
}

contains(%FRAMEWORK%_OS,linux) {
QMAKE_CXXFLAGS += -fpermissive
}
)%)%