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
%#   File: run-hpp-hpp.t
%#
%# Author: $author$
%#   Date: 9/19/2019
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%is_run,%(%else-then(%is_run%,%()%)%)%,%
%run,%(%else-then(%run%,%(%if-no(%is_run%,,%(run)%)%)%)%)%,%
%Run,%(%else-then(%Run%,%(%run%)%)%)%,%
%RUN,%(%else-then(%RUN%,%(%toupper(%Run%)%)%)%)%,%
%run,%(%else-then(%_Run%,%(%tolower(%Run%)%)%)%)%,%
%is_which,%(%else-then(%is_which%,%()%)%)%,%
%which,%(%else-then(%which%,%()%)%)%,%
%Which,%(%else-then(%Which%,%(%which%)%)%)%,%
%Which,%(%if-then(%Which%,%(%if(%Run%,_)%)%)%)%,%
%WHICH,%(%else-then(%WHICH%,%(%toupper(%Which%)%)%)%)%,%
%which,%(%else-then(%_Which%,%(%tolower(%Which%)%)%)%)%,%
%is_p2m,%(%else-then(%is_p2m%,%()%)%)%,%
%p2m,%(%else-then(%p2m%,%()%)%)%,%
%P2m,%(%else-then(%P2m%,%(%p2m%)%)%)%,%
%P2M,%(%else-then(%P2M%,%(%toupper(%P2m%)%)%)%)%,%
%p2m,%(%else-then(%_P2m%,%(%tolower(%P2m%)%)%)%)%,%
%is_argv,%(%else-then(%is_argv%,%()%)%)%,%
%argv,%(%else-then(%argv%,%(%if-no(%is_argv%,,%(argc, argv, env)%)%)%)%)%,%
%Argv,%(%else-then(%Argv%,%(%argv%)%)%)%,%
%ARGV,%(%else-then(%ARGV%,%(%toupper(%Argv%)%)%)%)%,%
%argv,%(%else-then(%_Argv%,%(%tolower(%Argv%)%)%)%)%,%
%paramv,%(%else-then(%paramv%,%(%if-no(%is_argv%,,%(int argc, char_t** argv, char_t** env)%)%)%)%)%,%
%Paramv,%(%else-then(%Paramv%,%(%paramv%)%)%)%,%
%PARAMV,%(%else-then(%PARAMV%,%(%toupper(%Paramv%)%)%)%)%,%
%paramv,%(%else-then(%_Paramv%,%(%tolower(%Paramv%)%)%)%)%,%
%is_parameters,%(%else-then(%is_parameters%,%()%)%)%,%
%parameters,%(%else-then(%parameters%,%()%)%)%,%
%Parameters,%(%else-then(%Parameters%,%(%parameters%)%)%)%,%
%is_arguments,%(%else-then(%is_arguments%,%()%)%)%,%
%arguments,%(%else-then(%arguments%,%(%parse(%Parameters%,%(,)%,,%(, )%,,%(%right(%t%, )%)%,t)%)%)%)%,%
%Arguments,%(%else-then(%Arguments%,%(%arguments%)%)%)%,%
%Arguments,%(%if-then(%Arguments%,%(%if(%Argv%,%(%(, )%)%)%)%)%)%,%
%ARGUMENTS,%(%else-then(%ARGUMENTS%,%(%toupper(%Arguments%)%)%)%)%,%
%arguments,%(%else-then(%_Arguments%,%(%tolower(%Arguments%)%)%)%)%,%
%Parameters,%(%if-then(%Parameters%,%(%if(%Argv%,%(%(,)% )%)%)%)%)%,%
%Parameters,%(%if(%Parameters%,%if(%Argv%,%(
)%)%)%%(()%%Parameters%)%,%
%PARAMETERS,%(%else-then(%PARAMETERS%,%(%toupper(%Parameters%)%)%)%)%,%
%parameters,%(%else-then(%_Parameters%,%(%tolower(%Parameters%)%)%)%)%,%
%%(
///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
%if(%P2m%,%(int (derives::*%Which%%Run%_%())%%Parameters%%Paramv%);
)%)%%
%virtual int %Which%%Run%%Parameters%%Paramv%) {
    int err = 0;
%if(%P2m%,%(    if ((%Which%%Run%_)) {
        err = (this->*%Which%%Run%_)(%Arguments%%Argv%);
    } else {
        err = default_%Which%%Run%(%Arguments%%Argv%);
    }
)%)%%
%    return err;
}
%if(%P2m%,%(virtual int default_%Which%%Run%%Parameters%%Paramv%) {
    int err = 0;
    return err;
}
)%)%%
%virtual int before_%Which%%Run%%Parameters%%Paramv%) {
    int err = 0;
    return err;
}
virtual int after_%Which%%Run%%Parameters%%Paramv%) {
    int err = 0;
    return err;
}
virtual int all_%Which%%Run%%Parameters%%Paramv%) {
    int err = 0, err2 = 0;
    if (!(err = before_%Which%%Run%(%Arguments%%Argv%))) {
        err = %Which%%Run%(%Arguments%%Argv%);
        if ((err2 = after_%Which%%Run%(%Arguments%%Argv%))) {
            if ((!err)) err = err2;
        }
    }
    return err;
}
)%)%