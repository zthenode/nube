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
%#   File: msdev-makefile.t
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
%file,%(%else-then(%file%,%else-then(%output%,makefile)%)%)%,%
%filename,%(%filename(%file%)%)%,%
%filebase,%(%filebase(%filename%)%)%,%
%fileextension,%(%else-then(%fileextension(%filename%)%,%(%if(%equal(makefile,%part%)%,makefile)%)%)%)%,%
%filename,%(%filebase%%if(%fileextension%,.)%%fileextension%)%,%
%filepath,%filepath(%input%)%,%
%copyright,%(%if(%equal(no,%copyright%)%,,%(Copyright (c) 1988-%year% %author%)%)%)%,%
%open_source,%(%if(%equal(no,%open_source%)%,,yes)%)%,%
%for,%(MSDEV Makefile%if(%name%,%( for "%name%")%)%)%,%
%%(%include(%filepath%/file-makefile.t)%
###################################################################
# path settings

INCLUDE=.
LIB=.
BIN=.

###################################################################
# compiler settings

CL=cl /c

CL_SWITCHES = %parse(%if(%project.build.cc.switches%,%(%project.build.cc.switches%)%,Zi;Od)%,;,/, )%
CL_DEFINES  = %parse(%if(%project.build.cc.defines%,%(%project.build.cc.defines%)%,WIN32)%,;,/D, )%
CL_INCLUDE  = %parse(%if(%project.build.cc.includepaths%,%(%project.build.cc.includepaths%)%,.;..\generic;\msdev\include)%,;,/I, )%
CL_LIBPATH  = /link /LIBPATH:%parse(%if(%project.build.cclibpaths%,%(%project.build.cclibpaths%)%,\msdev\lib)%,;,,;)%
CL_LIB      = %parse(%if(%project.build.cclibs%,%(%project.build.cclibs%)%,MD)%,;,/, )%

###################################################################
# target

SRC = \
    %parse(%project.source%,;,, \
    ,%(%replace(%file%,/,\)%)%,file)%

OBJ =  \
    %parse(%project.source%,;,, \
    ,%(%filebase(%filename(%file%)%)%.obj)%,file)%

EXE = %tolower(%project.target%)%

###################################################################
# standard rules

all: $(EXE)

rebuild: clean $(EXE)

clean:
	del $(OBJ)

compile: $(OBJ)

$(EXE): $(OBJ)
	cl $(OBJ) /Fe$(EXE) $(CL_LIB) $(CL_LIBPATH)

###################################################################
# implicit rules

.c.obj:
	$(CL) $(CL_SWITCHES) $(CL_DEFINES) $(CL_INCLUDE) $<

.cpp.obj:
	$(CL) $(CL_SWITCHES) $(CL_DEFINES) $(CL_INCLUDE) $<

.cxx.obj:
	$(CL) $(CL_SWITCHES) $(CL_DEFINES) $(CL_INCLUDE) $<

###################################################################
# dependancies
%parse(%project.source%,;,,,%(
%filebase(%filename(%file%)%)%.obj: %replace(%file%,/,\)%
	$(CL) $(CL_SWITCHES) $(CL_DEFINES) $(CL_INCLUDE) %replace(%file%,/,\)%
)%,file)%)%)%
