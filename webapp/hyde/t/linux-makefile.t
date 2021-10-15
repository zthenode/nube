%#############################################################################
%# Copyright (c) 1988-2005 $author$.
%#
%# This software is provided by the author and contributors ``as is'' and
%# any express or implied warranties, including, but not limited to, the
%# implied warranties of merchantability and fitness for a particular purpose
%# are disclaimed.  In no event shall the author or contributors be liable
%# for any direct, indirect, incidental, special, exemplary, or consequential
%# damages (including, but not limited to, procurement of substitute goods
%# or services; loss of use, data, or profits; or business interruption)
%# however caused and on any theory of liability, whether in contract, strict
%# liability, or tort (including negligence or otherwise) arising in any way
%# out of the use of this software, even if advised of the possibility of
%# such damage.
%#
%#   File: linux-makefile.t
%#
%# Author: $author$
%#   Date: 10/6/2005
%#
%#    $Id$
%#
%#############################################################################
%apply-x(%
%author,%(%else-then(%author%,$author$)%)%,%
%date,%(%date()%)%,%
%year,%(%year()%)%,%
%file,%(%else-then(%file%,%else-then(%output%,driver.c)%)%)%,%
%filename,%(%filename(%file%)%)%,%
%filebase,%(%filebase(%filename%)%)%,%
%fileextension,%(%else-then(%fileextension(%filename%)%,%(%if(%equal(makefile,%part%)%,makefile)%)%)%)%,%
%filename,%(%filebase%%if(%fileextension%,.)%%fileextension%)%,%
%filepath,%filepath(%input%)%,%
%copyright,%(%if(%equal(no,%copyright%)%,,%(Copyright (c) 1988-%year% %author%)%)%)%,%
%open_source,%(%if(%equal(no,%open_source%)%,,yes)%)%,%
%target,%(%else-then(%target%,target)%)%,%
%TARGET,%(%toupper(%target%)%)%,%
%gcc_path,%(%if-then(%gcc_path%,/)%)%,%
%gxx_path,%(%if-then(%gxx_path%,/)%)%,%
%gcc,%(%else-then(%gcc%,gcc)%)%,%
%gxx,%(%else-then(%gxx%,g++)%)%,%
%module,%(%else-then(%equal(yes,%module%)%,)%)%,%
%module_name,%(%else-then(%module_name%,%name%)%)%,%
%module_author,%(%else-then(%module_author%,%author%)%)%,%
%module_description,%(%else-then(%module_description%,%name%)%)%,%
%module_license,%(%else-then(%module_license%,%copyright%)%)%,%
%magic,%(%else-then(%magic%,X)%)%,%
%pci_regs_type,%(%else-then(%pci_regs_type%,int)%)%,%
%for,%(Makefile for "%target%".)%,%
%%(%include(%filepath%/file-makefile.t)%

INCLUDEFILE=

ifneq "$(INCLUDEFILE)" ""
include $(INCLUDEFILE)
endif

MAKEFILE=%filename%
DEPENDFILE=dependfile

###################################################################
# path settings

TEMPLATE=.
INCLUDE=.
SRC=.
LIB=.
OBJ=.
BIN=.

KERNEL_INCLUDE_PATHS= \
	-I/usr/src/linux-2.4/include

INCLUDE_PATHS= \
	-I../ccl/src/chttp \
	-I../ccl/src/cservlet \
	-I../ccl/src/ieee80215 \
	-I../ccl/src

###################################################################
# compiler settings

GCC=%gcc_path%%gcc%
GXX=%gxx_path%%gxx%

KERNEL_CC=$(GCC) -c
CC=$(GCC) -c
CCXX=$(GXX) -c

KERNEL_CC_OPTIONS= -D_DBPRINTK -D__KERNEL__ -DLINUX -DMODULE -Wall -O2 -pipe
CC_OPTIONS= -g
CCXX_OPTIONS= -g

KERNEL_CC_INCLUDE_PATHS= $(KERNEL_INCLUDE_PATHS) $(INCLUDE_PATHS)
CC_INCLUDE_PATHS= $(INCLUDE_PATHS)
CCXX_INCLUDE_PATHS= $(INCLUDE_PATHS)

###################################################################
# linker settings

KERNEL_LDC=ld
LDC=gcc
LDCXX=g++

KERNEL_LDC_OPTIONS= -r
LDC_OPTIONS= -g
LDCXX_OPTIONS= -g

KERNEL_LDC_LIB_PATHS= -L.
LDC_LIB_PATHS= -L.
LDCXX_LIB_PATHS= -L.

###################################################################
# makedepend settings

MAKEDEPEND_INCLUDE_PATHS=$(CC_INCLUDE_PATHS) $(CCXX_INCLUDE_PATHS)
MAKEDEPEND_OPTIONS=$(MAKEDEPEND_INCLUDE_PATHS) -s"\# dependancies"

#################################################################
# target

%TARGET%_CXX=%parse(%sources%,;,%( \
	)%,,%($(SRC)/%s%)%,s)%

%TARGET%_CXX_OBJS=$(%TARGET%_CXX:.cxx=.o)

%TARGET%_OBJS=$(%TARGET%_CXX_OBJS) 

%TARGET%_EXE=%target%

###################################################################
# all targets

C=
CXX=$(%TARGET%_CXX)
CPP=

OBJS=$(%TARGET%_OBJS)
EXES=$(%TARGET%_EXE)

###################################################################
# standard rules

all: $(EXES) $(OBJS)

depend:
	makedepend $(MAKEDEPEND_OPTIONS) -f$(DEPENDFILE) \
	$(CC_INCLUDE_PATHS) $(CCXX_INCLUDE_PATHS) \
	$(C) $(CXX) $(CPP)

clean:
	rm -f $(EXES)
	rm -f $(OBJS)

#################################################################
# target rules

$(%TARGET%_EXE): $(%TARGET%_OBJS) $(%TARGET%_LIBS)
	$(LDCXX) $(LDCXX_OPTIONS) -o $(@) $(LDCXX_LIB_PATHS) $(%TARGET%_LIBS) $(%TARGET%_OBJS)

#################################################################
# implicit rules

$(C:.c=.o): %%.o: %%.c
	$(CC) $(CC_OPTIONS) $(CC_INCLUDE_PATHS) -o $@ $<

$(CXX:.cxx=.o): %%.o: %%.cxx
	$(CCXX) $(CCXX_OPTIONS) $(CCXX_INCLUDE_PATHS) -o $@ $<

$(CPP:.cpp=.o): %%.o: %%.cpp
	$(CCPP) $(CCPP_OPTIONS) $(CCPP_INCLUDE_PATHS) -o $@ $<


######################################################################
# included dependancies

ifneq "$(MAKEFILE)" "$(DEPENDFILE)"
ifneq "$(DEPENDFILE)" ""

$(DEPENDFILE): $(MAKEFILE)
	touch $(DEPENDFILE)
	
include $(DEPENDFILE)
endif
endif

###################################################################
# dependancies
)%)%
