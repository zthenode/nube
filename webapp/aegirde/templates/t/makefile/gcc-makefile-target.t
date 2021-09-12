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
%#   File: gcc-makefile-target.t
%#
%# Author: $author$
%#   Date: 11/15/2019
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%out,%(%else-then(%out%,%(Lib)%)%)%,%
%Out,%(%else-then(%Out%,%(%out%)%)%)%,%
%OUT,%(%else-then(%OUT%,%(%toupper(%Out%)%)%)%)%,%
%out,%(%else-then(%_Out%,%(%tolower(%Out%)%)%)%)%,%
%slib,%(%else-then(%slib%,%(%else(%equal(EXE,%OUT%)%%equal(LIB,%OUT%)%,Lib)%)%)%)%,%
%SLib,%(%else-then(%SLib%,%(%slib%)%)%)%,%
%SLIB,%(%else-then(%SLIB%,%(%toupper(%SLib%)%)%)%)%,%
%slib,%(%else-then(%_SLib%,%(%tolower(%SLib%)%)%)%)%,%
%lib,%(%else-then(%lib%,%(%else(%equal(EXE,%OUT%)%%equal(SLIB,%OUT%)%,Lib)%)%)%)%,%
%Lib,%(%else-then(%Lib%,%(%lib%)%)%)%,%
%LIB,%(%else-then(%LIB%,%(%toupper(%Lib%)%)%)%)%,%
%lib,%(%else-then(%_Lib%,%(%tolower(%Lib%)%)%)%)%,%
%output,%(%else-then(%output%,%(%else(%Lib%%SLib%,Executable,%if(%SLib%,Shared )%Library)%)%)%)%,%
%Output,%(%else-then(%Output%,%(%output%)%)%)%,%
%OUTPUT,%(%else-then(%OUTPUT%,%(%toupper(%Output%)%)%)%)%,%
%output,%(%else-then(%_Output%,%(%tolower(%Output%)%)%)%)%,%
%target,%(%else-then(%target%,%(%slib%%lib%%Framework%)%)%)%,%
%Target,%(%else-then(%Target%,%(%target%)%)%)%,%
%TARGET,%(%else-then(%TARGET%,%(%toupper(%Target%)%)%)%)%,%
%target,%(%else-then(%_Target%,%(%tolower(%Target%)%)%)%)%,%
%exe,%(%else-then(%exe%,%(%else(%Lib%%SLib%,%(%if(%equal(%Target%,%Framework%)%,%(_exe)%)%)%)%)%)%)%,%
%Exe,%(%else-then(%Exe%,%(%exe%)%)%)%,%
%EXE,%(%else-then(%EXE%,%(%toupper(%Exe%)%)%)%)%,%
%exe,%(%else-then(%_Exe%,%(%tolower(%Exe%)%)%)%)%,%
%%(%
%
#
# target
#
%Target%%Exe%_%OUT%TARGET = %Target%%then-if(%if(%LIB%,%(${LIBEXT})%)%%if(%SLIB%,%(${SLIBEXT})%)%,.)%

########################################################################

#
# user c++ flags
#
%Target%%Exe%_USRCXXFLAGS += \
${%Framework%_USRCXXFLAGS} \

#
# user defines
#
%Target%%Exe%_USRDEFINES += \
${%Framework%_USRDEFINES} \

#
# user includes
#
%Target%%Exe%_USRINCLUDES += \
${%Framework%_USRINCLUDES} \

#
# user libdirs
#
%Target%%Exe%_USRLIBDIRS += \
${%Framework%_USRLIBDIRS} \

########################################################################

%parse(h;hh;hxx;hpp,;,,,,%(#
# %Output% .%cpp% headers
#
#%Target%%Exe%_%OUT%_%toupper(%cpp%)%_HEADERS += \
#${%FRAMEWORK%_SRC}/%Framework%/base/Base.%cpp% \

)%,cpp)%
#
# %Output% headers
#
%Target%%Exe%_%OUT%HEADERS += \
%parse(h;hh;hxx;hpp,;,,,,%(${%Target%%Exe%_%OUT%_%toupper(%cpp%)%_HEADERS} \
)%,cpp)%
########################################################################

%parse(c;cc;cxx;cpp;m;mm,;,,,,%(#
# %Output% .%cpp% sources
#
#%Target%%Exe%_%OUT%_%toupper(%cpp%)%_SOURCES += \
#${%FRAMEWORK%_SRC}/%Framework%/base/Base.%cpp% \

)%,cpp)%
########################################################################

%else(%Lib%,%(#
# %Output% libraries
#
%Target%%Exe%_LIBS += \
${%Framework%_LIBS}
)%)%
%
%)%)%