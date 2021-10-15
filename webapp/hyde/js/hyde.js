/**
 **********************************************************************
 * Copyright (c) 1988-2004 $author$.
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
 *   File: hyde.js
 *
 * Author: $author$
 *   Date: 8/27/2004
 *
 *    $Id$
 **********************************************************************
 */

/**
 **********************************************************************
 * Function: getFormValue
 *
 *   Author: $author$
 *     Date: 8/29/2004
 **********************************************************************
 */
function getFormValue(name, form)
{
	if (!form)
		form = 'form';

	if (name)
	if ((value = document[form][name].value))
		return value;

	return '';
}

/**
 **********************************************************************
 * Function: setFormSubmit
 *
 *   Author: $author$
 *     Date: 8/29/2004
 **********************************************************************
 */
function setFormSubmit(action, method, form)
{
	if (!form)
		form='form';

	if (action)
    if ('' != action)
		document[form].action = action;

	if (method)
    if ('' != method)
		document[form].method = method;

    return true;
}

/**
 **********************************************************************
 * Function: onClickTab
 *
 *   Author: $author$
 *     Date: 8/27/2004
 **********************************************************************
 */
function onClickTab(menu_location)
{
    parent.menuFrame.location = menu_location;
    return true;
}

/**
 **********************************************************************
 * Function: onClickItem
 *
 *   Author: $author$
 *     Date: 8/27/2004
 **********************************************************************
 */
function onClickItem(folder_location)
{
    parent.folderFrame.location = folder_location;
    return false;
}

/**
 **********************************************************************
 * Function: onClickFooter
 *
 *   Author: $author$
 *     Date: 11/23/2004
 **********************************************************************
 */
function onClickFooter(footer_location)
{
    parent.location = footer_location;
    return false;
}
