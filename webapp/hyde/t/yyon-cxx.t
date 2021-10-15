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
%#   File: yyon-cxx.t
%#
%# Author: $author$
%#   Date: 11/23/2005
%#
%#    $Id$
%#
%#############################################################################
%apply-x(%
%author,%(%else-then(%author%,$author$)%)%,%
%date,%(%date()%)%,%
%year,%(%year()%)%,%
%copyright,%(%if(%equal(no,%copyright%)%,,%(Copyright (c) 1988-%year% %author%)%)%)%,%
%open_source,%(%if(%equal(no,%open_source%)%,,yes)%)%,%
%file,%(%else-then(%file%,%output%)%)%,%
%filename,%(%filename(%file%)%)%,%
%filebase,%(%filebase(%filename%)%)%,%
%fileextension,%(%fileextension(%filename%)%)%,%
%filepath,%filepath(%input%)%,%
%prefix,%(%else-then(%left(%prefixsuffix_name%,/)%,%else(%right(%prefixsuffix_name%,/)%,%prefixsuffix_name%)%)%)%,%
%suffix,%(%else-then(%right(%prefixsuffix_name%,/)%,)%)%,%
%functions,%(yes)%,%
%functions_p,%(%equal(yes,%function_prototype%)%)%,%
%functions_a,%(%equal(abstract,%functions%)%)%,%
%functions_t,%(%if-then(%else(%equal(no,%functions%)%,%else(%equal(yes,%functions%)%,%if(%functions_a%,virtual,%functions%)%)%)%, )%)%,%
%functions_c,%(%if(%equal(yes,%function_const%)%,const )%)%,%
%%(%if(%functions%,%(%parse(%function_name%,;,,,%(
    /**
     **********************************************************************
     * Function: On%prefix%%f%%suffix%
     *
     *   Author: %author%
     *     Date: %date%
     **********************************************************************
     */
    virtual eError On%prefix%%f%%suffix%() 
    {
        eError error = e_ERROR_NONE;
        m_err.Write("On%prefix%%f%%suffix%()\n");
        return error;
    })%,f)%)%)%
)%)%