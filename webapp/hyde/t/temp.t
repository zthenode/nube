%apply-x(%
%return,%(%else-then(%left(%function_return%,/)%,%function_return%)%)%,%
%return_t,%(%if-then(%left-of-right(%return%, )%, )%)%,%
%_return_t,%(%if-then(%left-of-right(%_return%, )%, )%)%,%
%return_n,%(%right(%else-then(%left(%return%,=)%,%return%)%, )%)%,%
%_return_n,%(%right(%else-then(%left(%_return%,=)%,%_return%)%, )%)%,%
%return_v,%(%then-if(%right(%return%,=)%, = )%)%,%
%_return_v,%(%then-if(%right(%_return%,=)%, = )%)%,%
%functions_a,%(%equal(abstract,%functions%)%)%,%
%functions_t,%(%if-then(%else(%equal(no,%functions%)%,%else(%equal(yes,%functions%)%,%if(%functions_a%,virtual,%functions%)%)%)%, )%)%,%
%%(
function_parameters=%function_parameters%
%if(%functions%,%(%parse(%function_name%,;,,,%(
    /**
     **********************************************************************
     * Function: %f%
     *
     *   Author: %author%
     *     Date: %date%
     **********************************************************************
     */
    %functions_t%%return_t%%f%%if(%function_parameters%,%(
    )%)%(%parse(%function_parameters%,;,,%(,
     )%,%(%apply-x(%
%v,%(%right(%p%,=)%)%,%
%n,%(%right(%else-then(%left(%p%,=)%,%p%)%, )%%if(%v%,=)%)%,%
%t,%(%left-of-right(%p%, )%%if(%n%, )%)%,%
%%(%t%%n%%v%)%)%)%,p)%) %if(%functions_a%,= 0;,%(
    {%if(%return_t%,%(
        %return_t%%return_n%%return_v%;
        return %return_n%;)%)%
    })%)%)%,f)%)%)%

)%)%
