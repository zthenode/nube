%#################################################################
%#
%#   File: cmain-cxx.t
%#
%# Author: $author$
%#   Date: 11/1/2004
%#
%#    $Id$
%#
%#################################################################
%if(%file%,%(/**
 **********************************************************************
 * Copyright (c) 1988-%year()% %if(%author%,%(%author%)%,%($author$)%)%.
 *
 * This software is provided by the author and contributors ``as is'' and
 * any express or implied warranties, including, but not limited to, the
 * implied warranties of merchantability and fitness for a particular purpose
 * are disclaimed.  In no event shall the author or contributors be liable
 * for any direct, indirect, incidental, special, exemplary, or consequential
 * damages (including, but not limited to, procurement of substitute goods
 * or services; loss of use, data, or profits; or business interruption)
 * however caused and on any theory of liability, whether in contract, strict
 * liability, or tort (including negligence or otherwise) arising in any way
 * out of the use of this software, even if advised of the possibility of
 * such damage.
 *
 *   File: %filename(%file%)%
 *
 * Author: %if(%author%,%(%author%)%,%($author$)%)%
 *   Date: %date(month,day,year,%(%month%/%day%/%year%)%)%
 *
 *    $Id$
 **********************************************************************
 */
#include "cmainarg.hxx"
#include "cmain.hxx"
%if(%include%,%(%parse(%include%,;,
#include ",")%"
)%)%)%)%
/**
 **********************************************************************
 *  Class: c%main_name%Main
 *
 * Author: %else-then(%author%,$author$)%
 *   Date: %date()%
 **********************************************************************
 */
class c%main_name%Main
: public cMain
{
public:
    typedef cMain cIs;

    bool m_usage;

    /**
     **********************************************************************
     * Constructor: c%main_name%Main
     *
     *      Author: %else-then(%author%,$author$)%
     *        Date: %date()%
     **********************************************************************
     */
    c%main_name%Main()
    : m_usage(false)
    {
    }
    /**
     **********************************************************************
     * Function: OnRun
     *
     *   Author: %else-then(%author%,$author$)%
     *     Date: %date()%
     **********************************************************************
     */
    virtual int OnRun(int argc, char **argv)
    {
        if (m_usage)
            return OnUsage(argc, argv);

        return 0;
    }
    /**
     **********************************************************************
     * Function: OnUsage
     *
     *   Author: %else-then(%author%,$author$)%
     *     Date: %date()%
     **********************************************************************
     */
    virtual int OnUsage(int argc, char **argv)
    {
        int result=0;
        cMainArg *a;

        printf("usage: %%s", argv[0]);

        if ((a = cMainArg::m_list.GetFirst()))
        do
        {
            a->OnUsage();
        }
        while ((a = a->GetNext()));

        printf("\n");
        return result;
    }
    /**
     **********************************************************************
     * Function: OnMainArgSwitch
     *
     *   Author: %else-then(%author%,$author$)%
     *     Date: %date()%
     **********************************************************************
     */
    virtual int OnMainArgSwitch
    (int args, int argn, char *arg, int argc, char **argv)
    {
        cMainArg *a;

        if ((a = cMainArg::m_list.FindFirstByName(arg)))
            return a->OnMainArgSwitch
            (args, argn, arg, argc, argv);

        return argn;
    }
    /**
     **********************************************************************
     * Function: OnMainArgValue
     *
     *   Author: %else-then(%author%,$author$)%
     *     Date: %date()%
     **********************************************************************
     */
    virtual int OnMainArgValue
    (int args, int argn, char *arg, int argc, char **argv)
    {
        if (!strcmp("?", arg))
            m_usage = true;
        return argn;
    }
} g_%tolower(%main_name%)%_main;

/**
 **********************************************************************
 *  Class: c%main_name%MainArg
 *
 * Author: %else-then(%author%,$author$)%
 *   Date: %date()%
 **********************************************************************
 */
class c%main_name%MainArg
: public cMainArg
{
public:
    typedef cMainArg cIs;

    c%main_name%Main &m_main;

    /**
     **********************************************************************
     * Constructor: c%main_name%MainArg
     *
     *      Author: %else-then(%author%,$author$)%
     *        Date: %date()%
     **********************************************************************
     */
    c%main_name%MainArg(c%main_name%Main &p_main, const char *name)
    : cIs(name),
      m_main(p_main)
    {
    }
};
%if(%main_args%,%(%parse(%main_args%,;,,,%(%apply(%
%arg_switch,%left(%arg%,:)%,%
%arg_name,%right(%arg%,:)%,%(
/**
 **********************************************************************
 *  Class: c%main_name%MainArg%arg_name% ("%arg_switch%")
 *
 * Author: %else-then(%author%,$author$)%
 *   Date: %date()%
 **********************************************************************
 */
class c%main_name%MainArg%arg_name%
: public c%main_name%MainArg
{
public:
    typedef c%main_name%MainArg cIs;

    c%main_name%MainArg%arg_name%
    (c%main_name%Main &p_main, const char *name)
    : cIs(p_main, name)
    {
    }
    virtual int OnMainArgSwitch
    (int args, int argn, const char *arg, int argc, const char **argv)
    {
        return argn;
    }
} g_%tolower(%main_name%)%_main_%tolower(%arg_name%)%(g_%tolower(%main_name%)%_main, "%arg_switch%");
)%)%)%,arg)%)%)%