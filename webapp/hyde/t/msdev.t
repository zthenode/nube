#
# %tolower(%filename(%output%)%)%
# %date(mon,day,year,%(%mon%/%day%/%year%)%)%
# %time(hour,min,sec,%(%hour%:%min%:%sec%)%)%
#
# %if(%project.platform%,%(%project.platform%)%,MSDEV)% makefile for "%project.target%" generated from "%filename(%input%)%"
#
#########################################

.SUFFIXES: .c .cxx .obj .mak .dep

INCLUDE  = .
LIB      = .
BIN      = .

CCSWITCHES = %parse(%if(%project.build.cc.switches%,%(%project.build.cc.switches%)%,Zi;Od)%,;,/, )%
CCDEFINES  = %parse(%if(%project.build.cc.defines%,%(%project.build.cc.defines%)%,WIN32)%,;,/D, )%
CCINCLUDE  = %parse(%if(%project.build.cc.includepaths%,%(%project.build.cc.includepaths%)%,.;..\generic;\msdev\include)%,;,/I, )%
CCLIBPATH  = /link /LIBPATH:%parse(%if(%project.build.cclibpaths%,%(%project.build.cclibpaths%)%,\msdev\lib)%,;,,;)%
CCLIB      = %parse(%if(%project.build.cclibs%,%(%project.build.cclibs%)%,MD)%,;,/, )%

SRC = \
    %parse(%project.source%,;,, \
    ,%(%replace(%file%,/,\)%)%,file)%

OBJ =  \
    %parse(%project.source%,;,, \
    ,%(%filebase(%filename(%file%)%)%.obj)%,file)%

MAK = %tolower(%filename(%output%)%)%
PRJ = %tolower(%project.target%)%

#########################################
# rules

.c.obj:
	cl /c $(CCSWITCHES) $(CCDEFINES) $(CCINCLUDE) $<

.cpp.obj:
	cl /c $(CCSWITCHES) $(CCDEFINES) $(CCINCLUDE) $<

.cxx.obj:
	cl /c $(CCSWITCHES) $(CCDEFINES) $(CCINCLUDE) $<

all: $(PRJ)

build: clean $(PRJ)

clean:
	del $(OBJ)

install: $(PRJ)
	copy $(PRJ) $(BIN)

compile: $(OBJ)

$(PRJ): $(OBJ)
	cl $(OBJ) /Fe$(PRJ) $(CCLIB) $(CCLIBPATH)

%if(%project.build.rules%,%(%project.build.rules%
)%)%%#
#########################################
# dependancies
%parse(%project.source%,;,,,%(
%filebase(%filename(%file%)%)%.obj: %replace(%file%,/,\)%
	cl /c $(CCSWITCHES) $(CCDEFINES) $(CCINCLUDE) %replace(%file%,/,\)%
)%,file)%