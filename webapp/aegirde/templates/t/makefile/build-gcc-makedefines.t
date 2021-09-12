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
%#   File: build-gcc-makedefines.t
%#
%# Author: $author$
%#   Date: 11/14/2019
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%is_os,%(%else-then(%is_os%,%()%)%)%,%
%os,%(%else-then(%os%,%(Build)%)%)%,%
%Os,%(%else-then(%Os%,%(%os%)%)%)%,%
%OS,%(%else-then(%OS%,%(%toupper(%Os%)%)%)%)%,%
%os,%(%else-then(%_Os%,%(%tolower(%Os%)%)%)%)%,%
%makefile,%(%else-then(%makefile%,%(Makedefines)%)%)%,%
%Makefile,%(%else-then(%Makefile%,%(%makefile%)%)%)%,%
%MAKEFILE,%(%else-then(%MAKEFILE%,%(%toupper(%Makefile%)%)%)%)%,%
%makefile,%(%else-then(%_Makefile%,%(%tolower(%Makefile%)%)%)%)%,%
%%(%
%%include(%include_path%/gcc-makefile-file.t)%%
%
#
# build CXXVERSION
#
#CXXVERSION = -std=c++98
#CXXVERSION = -std=c++0x
#CXXVERSION = -std=c++11

#
# build HOME
#
#BUILD_HOME = $(HOME)

#
# build OS
#
BUILD_OS = os

#
# build UNAME
#
ifndef UNAME
UNAME = $(shell uname)
endif

#
# build OS
#
ifndef OS
ifneq ($(UNAME),Darwin)
OS = linux
else
OS = macosx
endif
endif

#
# build HOME
#
ifndef BUILD_HOME
ifdef PKG
BUILD_HOME = $(PKG)/../..
else
BUILD_HOME = $(HOME)
endif
endif

#
# install directory
#
ifndef INS
INS = $(BUILD_HOME)/build/%Framework%
endif

%
%)%)%