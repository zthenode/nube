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
%#   File: gcc-makedirs.t
%#
%# Author: $author$
%#   Date: 11/15/2019
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%is_os,%(%else-then(%is_os%,%()%)%)%,%
%os,%(%else-then(%os%,%(Generic)%)%)%,%
%Os,%(%else-then(%Os%,%(%os%)%)%)%,%
%OS,%(%else-then(%OS%,%(%toupper(%Os%)%)%)%)%,%
%os,%(%else-then(%_Os%,%(%tolower(%Os%)%)%)%)%,%
%is_makefile,%(%else-then(%is_makefile%,%()%)%)%,%
%makefile,%(%else-then(%makefile%,%(Makedirs)%)%)%,%
%Makefile,%(%else-then(%Makefile%,%(%makefile%)%)%)%,%
%MAKEFILE,%(%else-then(%MAKEFILE%,%(%toupper(%Makefile%)%)%)%)%,%
%makefile,%(%else-then(%_Makefile%,%(%tolower(%Makefile%)%)%)%)%,%
%is_framework,%(%else-then(%is_framework%,%(no)%)%)%,%
%%(%
%%include(%include_path%/gcc-makefile-file.t)%%
%
all:
	@for dir in $(SRC_DIRS); do \
		echo "Make $$dir" ; \
		(cd $$dir && make) || (echo "Make $$dir Failed") ; \
	done

install:
	@for dir in $(SRC_DIRS); do \
		echo "Make $$dir install" ; \
		(cd $$dir && make install) || (echo "Make $$dir install Failed") ; \
	done

clean:
	@for dir in $(SRC_DIRS); do \
		echo "Make $$dir clean" ; \
		(cd $$dir && make clean) || (echo "Make $$dir clean Failed") ; \
	done

again:
	@for dir in $(SRC_DIRS); do \
		echo "Make $$dir again" ; \
		(cd $$dir && make again) || (echo "Make $$dir again Failed") ; \
	done
	
########################################################################

help:
	@for dir in $(SRC_DIRS); do \
		echo "Make $$dir help" ; \
		(cd $$dir && make help) || (echo "Make $$dir help Failed") ; \
	done

install-links:
	@for dir in $(SRC_DIRS); do \
		echo "Make $$dir install-links" ; \
		(cd $$dir && make install-links) || (echo "Make $$dir install-links Failed") ; \
	done

build:
	@for dir in $(SRC_DIRS); do \
		echo "Make $$dir build" ; \
		(cd $$dir && make build) || (echo "Make $$dir build Failed") ; \
	done

config:
	@for dir in $(SRC_DIRS); do \
		echo "Make $$dir config" ; \
		(cd $$dir && make config) || (echo "Make $$dir config Failed") ; \
	done

unconfig:
	@for dir in $(SRC_DIRS); do \
		echo "Make $$dir unconfig" ; \
		(cd $$dir && make unconfig) || (echo "Make $$dir unconfig Failed") ; \
	done

extract:
	@for dir in $(SRC_DIRS); do \
		echo "Make $$dir extract" ; \
		(cd $$dir && make extract) || (echo "Make $$dir extract Failed") ; \
	done

unextract:
	@for dir in $(SRC_DIRS); do \
		echo "Make $$dir unextract" ; \
		(cd $$dir && make unextract) || (echo "Make $$dir unextract Failed") ; \
	done

extract-patch:
	@for dir in $(SRC_DIRS); do \
		echo "Make $$dir extract-patch" ; \
		(cd $$dir && make extract-patch) || (echo "Make $$dir extract-patch Failed") ; \
	done

extract-docs:
	@for dir in $(SRC_DIRS); do \
		echo "Make $$dir extract-docs" ; \
		(cd $$dir && make extract-docs) || (echo "Make $$dir extract-docs Failed") ; \
	done

%
%)%)%