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
%#   File: linux-driver-c.t
%#
%# Author: $author$
%#   Date: 7/26/2005
%#
%#    $Id$
%#
%# Template for creating a Linux driver.
%#
%#############################################################################
%apply-x(%
%author,%(%else-then(%author%,$author$)%)%,%
%date,%(%date()%)%,%
%year,%(%year()%)%,%
%file,%(%else-then(%file%,%else-then(%output%,driver.c)%)%)%,%
%filename,%(%filename(%file%)%)%,%
%filebase,%(%filebase(%filename%)%)%,%
%fileextension,%(%else-then(%fileextension(%filename%)%,%(%if(%equal(c,%part%)%,c)%)%)%)%,%
%filename,%(%filebase%%if(%fileextension%,.)%%fileextension%)%,%
%filepath,%filepath(%input%)%,%
%copyright,%(%if(%equal(no,%copyright%)%,,%(Copyright (c) 1988-%year% %author%)%)%)%,%
%open_source,%(%if(%equal(no,%open_source%)%,,yes)%)%,%
%name,%(%else-then(%name%,%filebase%)%)%,%
%module,%(%else-then(%equal(yes,%module%)%,)%)%,%
%module_name,%(%else-then(%module_name%,%name%)%)%,%
%module_author,%(%else-then(%module_author%,%author%)%)%,%
%module_description,%(%else-then(%module_description%,%name%)%)%,%
%module_license,%(%else-then(%module_license%,%copyright%)%)%,%
%magic,%(%else-then(%magic%,X)%)%,%
%pci_regs_type,%(%else-then(%pci_regs_type%,int)%)%,%
%for,%(Linux driver "%name%".)%,%
%%(%include(%filepath%/file-cxx.t)%
#include <linux/config.h>
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/sched.h>
#include <linux/locks.h>
#include <linux/interrupt.h>
#include <linux/pci.h>
#include <linux/ioctl.h>
#include <linux/proc_fs.h>
#include <linux/devfs_fs_kernel.h>
#include <linux/string.h>

#include <asm/page.h>
#include <asm/uaccess.h>
#include <asm/atomic.h>
#include <asm/system.h>
#include <asm/types.h>
#include <asm/irq.h>
#include <asm/io.h>

#include "%name%.h"

/*
 **********************************************************************
 * defines
 **********************************************************************
 */

#define %toupper(%name%)%_MODULE_NAME "%module_name%"
#define %toupper(%module_name%)%_REQUEST_IDS 4096
%if(%pci_vendor%,%
%%(#define %toupper(%name%)%_PCI_VENDOR_ID %if(%pci_vendor%,%pci_vendor%,0)%
#define %toupper(%name%)%_PCI_DEVICE_ID %if(%pci_device%,%pci_device%,0)%
#define %toupper(%name%)%_MAX_PCI_DEVICES %if(%pci_devices%,%pci_devices%,16)%
)%)%
#if defined(_DBPRINTK)
#define dbprintk(args...) printk(args)
#else
#define dbprintk(args...)
#endif
%if(%ioctl%,%(%if(%module%,%(%if(%reset%,%(
#if !defined(%toupper(%module_name%_ioctl_magic)%)
#define %toupper(%module_name%_ioctl_magic)% '%magic%'
#endif /* !defined(%toupper(%module_name%_ioctl_magic)%) */

#if !defined(%toupper(%module_name%_ioctl_resetmod)%)
#define %toupper(%module_name%_ioctl_resetmod)% _IO(%toupper(%module_name%_ioctl_magic)%, %reset%)
#endif /* !defined(%toupper(%module_name%_ioctl_resetmod)%) */
)%)%)%)%)%)%
/*
 **********************************************************************
 * types
 **********************************************************************
 */
%if(1,%(
/**
 ************************************************************
 * Struct: %module_name%_request_item
 *
 * Author: %author%
 *   Date: %date%
 ************************************************************
 */
typedef struct %module_name%_request_item
{
    list_t list;
    wait_queue_head_t waitqueue;
    %name%_request_t request;
} %module_name%_request_item_t;
)%)%%if(%pci_vendor%,%(
/**
 **********************************************************************
 * Struct: %module_name%_pci_device
 *
 * Author: %if(%author%,%(%author%)%,%($author$)%)%
 *   Date: %date(month,day,year,%(%month%/%day%/%year%)%)%
 **********************************************************************
 */
typedef struct %module_name%_pci_device
{
    int vendor_id;
    int device_id;
    struct pci_dev *pci_dev;
    volatile %pci_regs_type% *io_regs;
    volatile %pci_regs_type% *regs;
    unsigned char irq;
} %module_name%_pci_device_t;
)%)%
/*
 **********************************************************************
 * vaiables
 **********************************************************************
 */
static const char *module_name = %toupper(%name%)%_MODULE_NAME;

static int %module_name%_device_major = 0;
static devfs_handle_t %module_name%_devfs_handle = 0;
%if(1,%(
static list_t %module_name%_request_list;
static list_t %module_name%_request_freelist;

static spinlock_t %module_name%_request_list_lock;
static spinlock_t %module_name%_request_freelist_lock;

static wait_queue_head_t %module_name%_request_waitqueue;

static unsigned %module_name%_request_ids = 0;
static unsigned %module_name%_request_free_id = -1;
static unsigned %module_name%_request_id[%toupper(%module_name%)%_REQUEST_IDS];
static %module_name%_request_item_t *%module_name%_request_item[%toupper(%module_name%)%_REQUEST_IDS];
)%)%%if(%pci_vendor%,%(
static int %module_name%_pci_vendor_id = %toupper(%name%)%_PCI_VENDOR_ID;
static int %module_name%_pci_device_id = %toupper(%name%)%_PCI_DEVICE_ID;
static int %module_name%_pci_device_count = 0;
static %module_name%_pci_device_t %module_name%_pci_device[%toupper(%name%)%_MAX_PCI_DEVICES];
)%)%
%if(%module%,%(#if defined(MODULE)
/*
 **********************************************************************
 * module information
 **********************************************************************
 */
MODULE_AUTHOR("%module_author%");
MODULE_DESCRIPTION("%module_description%");
MODULE_LICENSE("%module_license%");

/*
 **********************************************************************
 * module parameters
 *
 * The following are module parameters. They are exported using
 * the MODULE_PARM(variable, type) and MODULE_PARM_DESC(variable, desc)
 * macros with the parameters as follows:
 *
 * variable - The identifier of the variable to be exported
 *
 * type - A string indicating the type of the variable
 *        "b" - byte
 *        "h" - short
 *        "i" - integer
 *        "l" - long
 *        "s" - char*
 *
 * desc - A string describing the module parameter.
 **********************************************************************
 */
MODULE_PARM(%module_name%_device_major, "i");
#endif /* defined(MODULE) */
)%)%%if(1,%(
/**
 ************************************************************
 * Function: spin_unlock_interruptible_sleep_on
 *
 *   Author: %author%
 *     Date: %date%
 *
 * Unlock a spin lock while preventing a race condition.
 ************************************************************
 */
static void spin_unlock_interruptible_sleep_on
(spinlock_t *lock, wait_queue_head_t *waitqueue)
{
    wait_queue_t wait;

    /* Add the current task to the wait queue.
     */
    init_waitqueue_entry(&wait, current);
    add_wait_queue(waitqueue, &wait);

    /* Set the state of kernel to INTERRUPTIBLE to
     * prevent task switching.
     */
    set_current_state(TASK_INTERRUPTIBLE);

    /* Unlock the spin lock.
     */
    spin_unlock(lock);

    /* Schedule and switch the next task by setting
     * the state of the kernel back to RUNNING.
     */
    schedule();
    set_current_state(TASK_RUNNING);

    /* Remove the curent task from the wait queue.
     */
    remove_wait_queue(waitqueue, &wait);
}
)%)%%if(%pci_vendor%,%(
/**
 **********************************************************************
 * Function: %module_name%_irq_handler
 *
 *   Author: %author%
 *     Date: %date%
 **********************************************************************
 */
static void %module_name%_irq_handler
(int irq, void *dev_id, struct pt_regs *regs)
{
}

/**
 **********************************************************************
 * Function: %module_name%_request_pci_irq
 *
 *   Author: %author%
 *     Date: %date%
 **********************************************************************
 */
static unsigned char %module_name%_request_pci_irq(void)
{
    int err;
    int pci_device_index;
    unsigned char pci_irq = 0;

    dbprintk
    ("%%s: %%s()\n", module_name, __FUNCTION__);

    if (%module_name%_pci_device_count < 1)
    {
        dbprintk
        ("%%s: %%s() - PCI device 0x%%x:0x%%x not found\n",
         module_name, __FUNCTION__, 
         %module_name%_pci_vendor_id, 
         %module_name%_pci_device_id);

        return 0;
    }

    for (pci_device_index = 0; 
         pci_device_index < %module_name%_pci_device_count; 
         pci_device_index++)
    {
        if (NULL == %module_name%_pci_device[pci_device_index].pci_dev)
        {
            dbprintk
            ("%%s: %%s() - PCI device[%%d] 0x%%x:0x%%x not found\n",
             module_name, __FUNCTION__, pci_device_index,
             %module_name%_pci_device[pci_device_index].vendor_id, 
             %module_name%_pci_device[pci_device_index].device_id);

            continue;
        }

        if (%module_name%_pci_device[pci_device_index].irq)
        {
            dbprintk
            ("%%s: %%s() - PCI device[%%d] aleady using IRQ 0x%%x\n",
             module_name, __FUNCTION__, pci_device_index,
             %module_name%_pci_device[pci_device_index].irq);

            continue;
        }
    
        pci_read_config_byte
        (%module_name%_pci_device[pci_device_index].pci_dev, 
         PCI_INTERRUPT_LINE, &pci_irq);

        if (!pci_irq)
        {
            dbprintk
            ("%%s: %%s() - PCI device[%%d] 0x%%x:0x%%x doesn't use an IRQ\n",
             module_name, __FUNCTION__, pci_device_index,
             %module_name%_pci_device[pci_device_index].vendor_id, 
             %module_name%_pci_device[pci_device_index].device_id);

            continue;
        }

        dbprintk
        ("%%s: %%s() - PCI device[%%d] 0x%%x:0x%%x uses IRQ 0x%%x\n", 
         module_name, __FUNCTION__, pci_device_index,
         %module_name%_pci_device[pci_device_index].vendor_id, 
         %module_name%_pci_device[pci_device_index].device_id, 
         pci_irq);
     
        if ((err = request_irq
            (pci_irq, %module_name%_irq_handler, SA_SHIRQ, 
             module_name, &%module_name%_pci_device[pci_device_index])))
        {
            printk
            ("%%s: %%s() - Unable to get IRQ 0x%%x\n",
             module_name, __FUNCTION__, pci_irq);
         
            if (-EBUSY == err)
                printk
                ("%%s: %%s() - IRQ 0x%%x already in use\n",
                 module_name, __FUNCTION__, pci_irq);

            return pci_device_index;                 
        }

        dbprintk
        ("%%s: %%s() - Using IRQ 0x%%x\n", 
         module_name, __FUNCTION__, pci_irq);

        %module_name%_pci_device[pci_device_index].irq = pci_irq;
    }

    return pci_device_index;
}

/**
 **********************************************************************
 * Function: %module_name%_free_irq
 *
 *   Author: %author%
 *     Date: %date%
 **********************************************************************
 */
static void %module_name%_free_irq(void)
{
    int pci_device_index;

    dbprintk
    ("%%s: %%s()\n", module_name, __FUNCTION__);

    for (pci_device_index = %module_name%_pci_device_count-1; 
         pci_device_index >= 0; --pci_device_index)
    {
        if (!%module_name%_pci_device[pci_device_index].irq)
            continue;

        dbprintk
        ("%%s: %%s() - Freeing IRQ 0x%%x\n",
         module_name, __FUNCTION__, 
         %module_name%_pci_device[pci_device_index].irq);
     
        free_irq
        (%module_name%_pci_device[pci_device_index].irq, 
         &%module_name%_pci_device[pci_device_index]);

        %module_name%_pci_device[pci_device_index].irq = 0;
    }
}

/**
 **********************************************************************
 * Function: %module_name%_map_pci_regs
 *
 *   Author: %author%
 *     Date: %date%
 **********************************************************************
 */
static void %module_name%_map_pci_regs(void)
{
    int pci_device_index;
	int resource_flags;
	int resource_start;

    dbprintk
    ("%%s: %%s()\n", module_name, __FUNCTION__);

    for (pci_device_index = 0; 
         pci_device_index < %module_name%_pci_device_count;
		 pci_device_index++)
    {
		if ((NULL != %module_name%_pci_device[pci_device_index].io_regs) 
		    || (NULL != %module_name%_pci_device[pci_device_index].regs))
			continue;

		resource_flags = %module_name%_pci_device
		[pci_device_index].pci_dev->resource[0].flags;

		resource_start = %module_name%_pci_device
		[pci_device_index].pci_dev->resource[0].start;
         
		if (resource_flags & IORESOURCE_IO)
		{
			%module_name%_pci_device[pci_device_index].io_regs
			= (volatile %pci_regs_type%*)resource_start;

            dbprintk
            ("%%s: %%s() - Mapped PCI device[%%d] 0x%%x:0x%%x at IO 0x%%p\n", 
             module_name, __FUNCTION__, pci_device_index,
             %module_name%_pci_device[pci_device_index].vendor_id, 
             %module_name%_pci_device[pci_device_index].device_id, 
             %module_name%_pci_device[pci_device_index].io_regs);
		}
        else if (NULL != (%module_name%_pci_device[pci_device_index].regs 
                 = (volatile %pci_regs_type%*)ioremap(resource_start, sizeof(%pci_regs_type%))))
        {
            dbprintk
            ("%%s: %%s() - Mapped PCI device[%%d] 0x%%x:0x%%x to 0x%%p\n", 
             module_name, __FUNCTION__, pci_device_index,
             %module_name%_pci_device[pci_device_index].vendor_id, 
             %module_name%_pci_device[pci_device_index].device_id, 
             %module_name%_pci_device[pci_device_index].regs);
        }
        else dbprintk
        ("%%s: %%s()- Unable to map PCI device[%%d] 0x%%x:0x%%x at 0x%%p\n",
         module_name, __FUNCTION__, pci_device_index, 
         %module_name%_pci_device[pci_device_index].vendor_id, 
         %module_name%_pci_device[pci_device_index].device_id, 
		 (caddr_t)resource_start);
    }
}

/**
 **********************************************************************
 * Function: %module_name%_unmap_pci_regs
 *
 *   Author: %author%
 *     Date: %date%
 **********************************************************************
 */
static void %module_name%_unmap_pci_regs(void)
{
    int pci_device_index;

    dbprintk
    ("%%s: %%s()\n", module_name, __FUNCTION__);

    for (pci_device_index = %module_name%_pci_device_count-1; 
         pci_device_index >= 0; --pci_device_index)
    {
        if (NULL != %module_name%_pci_device[pci_device_index].regs)
        {
            iounmap((caddr_t) %module_name%_pci_device[pci_device_index].regs);
            %module_name%_pci_device[pci_device_index].regs = NULL;
        }
    }
}

/**
 **********************************************************************
 * Function: %module_name%_find_pci_device
 *
 *   Author: %author%
 *     Date: %date%
 **********************************************************************
 */
static void %module_name%_find_pci_device(void)
{
	int resource_start;
    struct pci_dev *pci_dev=0;

    if (%module_name%_pci_device_count > 0)
        return;

    dbprintk
    ("%%s: %%s()- Searching for PCI device 0x%%x:0x%%x...\n",
     module_name, __FUNCTION__, 
     %module_name%_pci_vendor_id, 
     %module_name%_pci_device_id);

    while ((pci_dev = pci_find_device
           (%module_name%_pci_vendor_id, 
            %module_name%_pci_device_id, pci_dev)))
    {
        %module_name%_pci_device
        [%module_name%_pci_device_count].vendor_id = %module_name%_pci_vendor_id; 
        %module_name%_pci_device
        [%module_name%_pci_device_count].device_id = %module_name%_pci_device_id; 

        %module_name%_pci_device
        [%module_name%_pci_device_count].pci_dev = pci_dev;
         
        %module_name%_pci_device
        [%module_name%_pci_device_count].io_regs = NULL;
         
        %module_name%_pci_device
        [%module_name%_pci_device_count].regs = NULL;
         
        %module_name%_pci_device
        [%module_name%_pci_device_count].irq = 0;
         
		resource_start = pci_dev->resource[0].start;

        dbprintk
        ("%%s: %%s() - PCI device[%%d] 0x%%x:0x%%x found at 0x%%p\n", 
         module_name, __FUNCTION__, 
         %module_name%_pci_device_count,
         %module_name%_pci_vendor_id, 
         %module_name%_pci_device_id, 
		 (caddr_t)resource_start);

        %module_name%_pci_device_count++;
    }
    
    dbprintk
    ("%%s: %%s()- %%d PCI devices found\n",
     module_name, __FUNCTION__, 
     %module_name%_pci_device_count);
}
)%)%%if(1,%(
/**
 ************************************************************
 * Function: %module_name%_get_request_item
 *
 *   Author: %author%
 *     Date: %date%
 *
 * Get a request item from the free list, or by kmallocing
 * a new one.
 ************************************************************
 */
static %module_name%_request_item_t *%module_name%_get_request_item()
{
    unsigned id;
    %module_name%_request_item_t *item;

    spin_lock(&%module_name%_request_freelist_lock);

    /* I an item is available in the free list,
     * remove it from the free list.
     */
    if (&%module_name%_request_freelist != (list_t*)
        (item = (%module_name%_request_item_t*)
         (%module_name%_request_freelist.next)))
    {
        dbprintk
        ("%%s: %%s() - Got a free item=0x%%p...\n",
         module_name, __FUNCTION__, item);

        list_del_init(&item->list);

        spin_unlock(&%module_name%_request_freelist_lock);
    }
    /* Otherwise create a new one.
     */
    else
    {
        /* Get the next available item id. The ids are used to
         * associate user space requests with kernel space
         * request items.
         */
        if ((id = %module_name%_request_free_id) < %module_name%_REQUEST_IDS)
            %module_name%_request_free_id = %module_name%_request_id[id];

        else if ((id = %module_name%_request_ids) < %module_name%_REQUEST_IDS)
                %module_name%_request_id[%module_name%_request_ids++] = -1;

        spin_unlock(&%module_name%_request_freelist_lock);

        item = NULL;

        /* If the id is valid, create a new request.
         */
        if (id < %module_name%_REQUEST_IDS)
        {
            /* If the kmalloc succedes, initialize the item.
             */
            if (NULL != (item = (%module_name%_request_item_t*)kmalloc
                (sizeof(%module_name%_request_item_t), GFP_KERNEL)))
            {
                dbprintk
                ("%%s: %%s() - kmalloced item=0x%%p...\n",
                 module_name, __FUNCTION__, item);

                item->request.id = id;
                INIT_LIST_HEAD(&item->list);
                init_waitqueue_head(&item->waitqueue);
                %module_name%_request_item[id] = item;
            }
            /* Otherwise free the id already allocated.
             */
            else
            {
                spin_lock(&%module_name%_request_freelist_lock);

                %module_name%_request_id[id] = %module_name%_request_free_id;
                %module_name%_request_free_id = id;

                spin_unlock(&%module_name%_request_freelist_lock);
            }
        }
    }

    return item;
}

/**
 ************************************************************
 * Function: %module_name%_free_request_item
 *
 *   Author: %author%
 *     Date: %date%
 *
 * Add a request item to the free list.
 ************************************************************
 */
static void %module_name%_free_request_item(%module_name%_request_item_t *item)
{
    dbprintk
    ("%%s: %%s(%module_name%_request_item_t *item=0x%%p)\n",
     module_name, __FUNCTION__, item);

    spin_lock(&%module_name%_request_freelist_lock);

    list_add(&item->list, &%module_name%_request_freelist);

    spin_unlock(&%module_name%_request_freelist_lock);
}

/**
 ************************************************************
 * Function: %module_name%_free_request_freelist
 *
 *   Author: %author%
 *     Date: %date%
 *
 * Free all of the items in the free list.
 ************************************************************
 */
static void %module_name%_free_request_freelist()
{
    %module_name%_request_item_t *item;

    dbprintk
    ("%%s: %%s()\n",
     module_name, __FUNCTION__);

    spin_lock(&%module_name%_request_freelist_lock);

    /* Kfree all of the items in the free list.
     */
    while (&%module_name%_request_freelist != (list_t*)
           (item = (%module_name%_request_item_t*)
            (%module_name%_request_freelist.next)))
    {
        dbprintk
        ("%%s: %%s() - kfreeing item=0x%%p...\n",
         module_name, __FUNCTION__, item);

        list_del(&item->list);
        kfree(item);
    }

    /* Reset the id free list.
     */
    %module_name%_request_ids = 0;
    %module_name%_request_free_id = -1;

    spin_unlock(&%module_name%_request_freelist_lock);
}

/**
 ************************************************************
 * Function: %module_name%_wait_receive_request_item
 *
 *   Author: %author%
 *     Date: %date%
 *
 * Wait to receive a request posted from another task.
 ************************************************************
 */
static %module_name%_request_item_t *%module_name%_wait_receive_request_item()
{
    int pending_signal;
    %module_name%_request_item_t *item = NULL;

    dbprintk
    ("%%s: %%s(%module_name%_request_item_t *item=0x%%p)\n",
     module_name, __FUNCTION__, item);

    do
    {
        spin_lock(&%module_name%_request_list_lock);

        /* If a request is available in the request
         * list, remove it from the list.
         */
        if (&%module_name%_request_list != (list_t*)
            (item = (%module_name%_request_item_t*)
             (%module_name%_request_list.next)))
        {
            dbprintk
            ("%%s: %%s() - Got a request item=0x%%p...\n",
             module_name, __FUNCTION__, item);

            list_del_init(&item->list);

            spin_unlock(&%module_name%_request_list_lock);
            break;
        }
        /* Otherwise wait until a request is added to
         * the list.
         */
        else
        {
            item = NULL;

            dbprintk
            ("%%s: %%s() - sleeping...\n",
             module_name, __FUNCTION__);

            spin_unlock_interruptible_sleep_on
            (&%module_name%_request_list_lock, 
             &%module_name%_request_waitqueue);

            dbprintk
            ("%%s: %%s() - ...wokeup\n",
             module_name, __FUNCTION__);

            /* If a signal is received, stop checking, and 
             * return NULL.
             */
            if ((pending_signal = signal_pending(current)))
            {
                dbprintk
                ("%%s: %%s() - received signal\n",
                 module_name, __FUNCTION__);
                break;
            }
        }
    }
    while (NULL == item);

    return item;
}

/**
 ************************************************************
 * Function: %module_name%_wait_service_request_item
 *
 *   Author: %author%
 *     Date: %date%
 *
 * Add a request to the list, and wait for it to be 
 * serviced by another task.
 ************************************************************
 */
static int %module_name%_wait_service_request_item(%module_name%_request_item_t *item)
{
    int pending_signal = 1;

    dbprintk
    ("%%s: %%s(%module_name%_request_item_t *item=0x%%p)\n",
     module_name, __FUNCTION__, item);

    spin_lock(&%module_name%_request_list_lock);

    list_add_tail(&item->list, &%module_name%_request_list);

    /* Wakeup anyboby waiting for requests.
     */
    if (waitqueue_active(&%module_name%_request_waitqueue))
    {
        dbprintk
        ("%%s: %%s() - Wakeup...\n",
         module_name, __FUNCTION__);

        wake_up(&%module_name%_request_waitqueue);
    }

    dbprintk
    ("%%s: %%s() - Sleeping...\n",
     module_name, __FUNCTION__);

    spin_unlock_interruptible_sleep_on
    (&%module_name%_request_list_lock, &item->waitqueue);

    /* If a signal is received, remove the request
     * from the list.
     */
    if ((pending_signal = signal_pending(current)))
    {
        dbprintk
        ("%%s: %%s() - received signal\n",
         module_name, __FUNCTION__);

        spin_lock(&%module_name%_request_list_lock);

        list_del_init(&item->list);

        spin_unlock(&%module_name%_request_list_lock);
    }

    return pending_signal;
}
)%)%%if(%open%,%(
/**
 **********************************************************************
 * Function: %module_name%_open
 *
 *   Author: %if(%author%,%(%author%)%,%($author$)%)%
 *     Date: %date(month,day,year,%(%month%/%day%/%year%)%)%
 **********************************************************************
 */
static int %module_name%_open
(struct inode *inode, struct file *file)
{
    dbprintk
    ("%%s: %%s(struct inode *inode=0x%%p, struct file *file=0x%%p)\n",
     module_name, __FUNCTION__, inode, file);
%if(%module%,%(
    MOD_INC_USE_COUNT;)%)%
    return 0;
}

/**
 **********************************************************************
 * Function: %module_name%_release
 *
 *   Author: %if(%author%,%(%author%)%,%($author$)%)%
 *     Date: %date(month,day,year,%(%month%/%day%/%year%)%)%
 **********************************************************************
 */
static int %module_name%_release
( struct inode *inode, struct file *file )
{
    dbprintk
    ("%%s: %%s(struct inode *inode=0x%%p, struct file *file=0x%%p)\n",
     module_name, __FUNCTION__, inode, file);
%if(%module%,%(
    MOD_DEC_USE_COUNT;)%)%
    return 0;
}
)%)%%if(%ioctl%,%(%if(%module%,%(%if(%reset%,%(
/**
 **********************************************************************
 * Function: %module_name%_ioctl_resetmod
 *
 *   Author: %if(%author%,%(%author%)%,%($author$)%)%
 *     Date: %date(month,day,year,%(%month%/%day%/%year%)%)%
 **********************************************************************
 */
static int %module_name%_ioctl_resetmod(unsigned long arg)
{
    dbprintk
    ("%%s: %%s(unsigned long arg=0x%%lx)\n",
     module_name, __FUNCTION__, arg );

    while (MOD_IN_USE)
        MOD_DEC_USE_COUNT;

    MOD_INC_USE_COUNT;
    return 0;
}
)%)%)%)%%if(1,%(
/**
 ************************************************************
 * Function: %module_name%_ioctl_send_request
 *
 *   Author: %author%
 *     Date: %date%
 *
 * Send a request from user space to kernel space to be
 * serviced by another task.
 ************************************************************
 */
static int %module_name%_ioctl_send_request
(struct inode *inode, struct file *file,
 unsigned int cmd, unsigned long arg)
{
    int pending_signal;
    %module_name%_request_item_t *item;
    %module_name%_request_t *user_request;
    unsigned request_id;

    dbprintk
    ("%%s: %%s(struct inode *inode=0x%%p, struct file *file=0x%%p,"
     " unsigned int cmd=0x%%x, unsigned long arg=0x%%lx)\n",
     module_name, __FUNCTION__, inode, file, cmd, arg );

    if (verify_area
        (VERIFY_WRITE, (void*)
         (user_request=(%module_name%_request_t*)arg), 
         sizeof(%module_name%_request_t)))
    {
        dbprintk
        ("%%s: %%s() - verify_area failed\n", 
         module_name, __FUNCTION__);
        return -EFAULT;
    }

    /* If we are able to get a request item, copy the
     * request from user space, and place the item in
     * the request list. Then wait for the request to
     * be serviced by another task.
     */
    if (NULL != (item = %module_name%_get_request_item()))
    {
        request_id = item->request.id;

        copy_from_user
        (&item->request, user_request, 
         sizeof(%module_name%_request_t));

        item->request.id = request_id;

        dbprintk
        ("%%s: %%s() - Waiting on request id=0x%%x type=0x%%x\n",
         module_name, __FUNCTION__, 
         item->request.id, item->request.type);

        /* If a signal was received, free the item.
         */
        if ((pending_signal = %module_name%_wait_service_request_item(item)))
        {
            dbprintk
            ("%%s: %%s() - received signal\n",
             module_name, __FUNCTION__);

            %module_name%_free_request_item(item);
            %module_name%_free_request_freelist();

            return -ERESTARTSYS;
        }

        dbprintk
        ("%%s: %%s() - Serviced request id=0x%%x type=0x%%x\n",
         module_name, __FUNCTION__, 
         item->request.id, item->request.type);

        /* Copy the results back to user space, and
         * free the item.
         */
        copy_to_user
        (user_request, &item->request, 
         sizeof(%module_name%_request_t));

        %module_name%_free_request_item(item);
        %module_name%_free_request_freelist();

        return 0;
    }

    return -EINVAL;
}

/**
 ************************************************************
 * Function: %module_name%_ioctl_receive_request
 *
 *   Author: %author%
 *     Date: %date%
 *
 * Receive a request from another task, and copy it to
 * user space to be serviced.
 ************************************************************
 */
static int %module_name%_ioctl_receive_request
(struct inode *inode, struct file *file,
 unsigned int cmd, unsigned long arg)
{
    %module_name%_request_item_t *item;
    %module_name%_request_t *user_request;

    dbprintk
    ("%%s: %%s(struct inode *inode=0x%%p, struct file *file=0x%%p,"
     " unsigned int cmd=0x%%x, unsigned long arg=0x%%lx)\n",
     module_name, __FUNCTION__, inode, file, cmd, arg );

    if (verify_area
        (VERIFY_WRITE, (void*)
         (user_request=(%module_name%_request_t*)arg), 
         sizeof(%module_name%_request_t)))
    {
        dbprintk
        ("%%s: %%s() - verify_area failed\n", 
         module_name, __FUNCTION__);
        return -EFAULT;
    }

    /* If we received a request from another task, copy
     * it to user space to be serviced.
     */
    if (NULL != (item = %module_name%_wait_receive_request_item()))
    {
        dbprintk
        ("%%s: %%s() - Received request id=0x%%x type=0x%%x\n",
         module_name, __FUNCTION__, 
         item->request.id, item->request.type);

        copy_to_user
        (user_request, &item->request, 
         sizeof(%module_name%_request_t));

        return 0;
    }

    /* Otherwise a signal must have been received. So we will
     * return -ERESTARTSYS for handling of the signal.
     */
    return -ERESTARTSYS;
}

/**
 ************************************************************
 * Function: %module_name%_ioctl_service_request
 *
 *   Author: %author%
 *     Date: %date%
 *
 * Copy a request serviced in user space to kernel space, and
 * wake up the task waiting for its completion.
 ************************************************************
 */
static int %module_name%_ioctl_service_request
(struct inode *inode, struct file *file,
 unsigned int cmd, unsigned long arg)
{
    %module_name%_request_item_t *item;
    %module_name%_request_t *user_request;
    unsigned request_id;

    dbprintk
    ("%%s: %%s(struct inode *inode=0x%%p, struct file *file=0x%%p,"
     " unsigned int cmd=0x%%x, unsigned long arg=0x%%lx)\n",
     module_name, __FUNCTION__, inode, file, cmd, arg );

    if (verify_area
        (VERIFY_READ, (void*)
         (user_request=(%module_name%_request_t*)arg), 
         sizeof(%module_name%_request_t)))
    {
        dbprintk
        ("%%s: %%s() - verify_area failed\n", 
         module_name, __FUNCTION__);
        return -EFAULT;
    }

    copy_from_user
    (&request_id, &user_request->id, sizeof(request_id));

    /* If the request is a valid one, copy it from
     * user space, and wake up the waiting task.
     */
    if (request_id < %module_name%_request_ids)
    if (NULL != (item = %module_name%_request_item[request_id]))
    if (waitqueue_active(&item->waitqueue))
    {
        copy_from_user
        (&item->request, user_request, 
         sizeof(%module_name%_request_t));

        /* Wakeup anyboby waiting for service.
         */
        wake_up(&item->waitqueue);

        return 0;
    }

    return -EINVAL;
}
)%)%
/**
 **********************************************************************
 * Function: %module_name%_ioctl
 *
 *   Author: %if(%author%,%(%author%)%,%($author$)%)%
 *     Date: %date(month,day,year,%(%month%/%day%/%year%)%)%
 **********************************************************************
 */
static int %module_name%_ioctl
(struct inode *inode, struct file *file,
 unsigned int cmd, unsigned long arg)
{
    dbprintk
    ("%%s: %%s(struct inode *inode=0x%%p, struct file *file=0x%%p,"
     " unsigned int cmd=0x%%x, unsigned long arg=0x%%lx)\n",
     module_name, __FUNCTION__, inode, file, cmd, arg );

    switch(cmd) 
    {%if(1,%(
    case %toupper(%name%_ioctl_send_request)%:
        return %module_name%_ioctl_send_request(inode, file, cmd, arg);

    case %toupper(%name%_ioctl_receive_request)%:
        return %module_name%_ioctl_receive_request(inode, file, cmd, arg);

    case %toupper(%name%_ioctl_service_request)%:
        return %module_name%_ioctl_service_request(inode, file, cmd, arg);
)%)%%if(%module%,%(%if(%reset%,%(
    case %toupper(%name%_ioctl_resetmod)%:
        return %module_name%_ioctl_resetmod(arg);
)%)%)%)%
    default:
        dbprintk
        ("%%s: %%s() - Invalid ioctl command 0x%%x\n",
         module_name, __FUNCTION__, cmd);
        return -EINVAL;
    }
    
    return 0;
}
)%)%
/**
 **********************************************************************
 * Function: %module_name%_proc_info
 *
 *   Author: %if(%author%,%(%author%)%,%($author$)%)%
 *     Date: %date(month,day,year,%(%month%/%day%/%year%)%)%
 **********************************************************************
 */
static int %module_name%_proc_info
(char *buffer, char **start, off_t offset, int length)
{
    char *p;
    
    p=buffer+sprintf(buffer, "%%s Version $Id$\n", module_name);
    
    return p-buffer;
}

/*
 * Device file operations table
 */
static struct file_operations %module_name%_file_operations = 
{
       open: %module_name%_open%if(%open%,%(,
    release: %module_name%_release)%)%%if(%ioctl%,%(,
      ioctl: %module_name%_ioctl)%)%
};

/**
 **********************************************************************
 * Function: %module_name%_init
 *
 *   Author: %if(%author%,%(%author%)%,%($author$)%)%
 *     Date: %date(month,day,year,%(%month%/%day%/%year%)%)%
 **********************************************************************
 */
int __init %module_name%_init(void)
{
    int dynamic_major;
    int devfs_major;

    dbprintk
    ("%%s: %%s()\n", module_name, __FUNCTION__);
%if(1,%(
    INIT_LIST_HEAD(&%module_name%_request_list);
    INIT_LIST_HEAD(&%module_name%_request_freelist);
    spin_lock_init(&%module_name%_request_list_lock);
    spin_lock_init(&%module_name%_request_freelist_lock);
    init_waitqueue_head(&%module_name%_request_waitqueue);
)%)%%if(%pci_vendor%,%(
    %module_name%_find_pci_device();)%)%

    /* Register the device file operations.
     */
    if ((devfs_major = devfs_register_chrdev
        (%module_name%_device_major, 
         module_name, &%module_name%_file_operations)) < 0)
    {
        printk
        ("%%s: Unable to use device major %%d\n", 
         module_name, %module_name%_device_major);

        return devfs_major;
    }
    
    /* If the device major was obtained dynamically
     * via devfs, set the device major to the value
     * obtained from devfs.
     */
    if ((dynamic_major = !%module_name%_device_major))
        %module_name%_device_major = devfs_major;

    printk
    ("%%s: Using device major %%d\n", 
     module_name, %module_name%_device_major);
     
    /* Create a /dev entry 
     */
    %module_name%_devfs_handle = devfs_register
    (NULL, module_name, 
     dynamic_major? DEVFS_FL_AUTO_DEVNUM: DEVFS_FL_NONE,
     %module_name%_device_major, 0, S_IFCHR | S_IRUSR | S_IWUSR, 
     &%module_name%_file_operations, NULL);

    /* Create a /proc entry
     */
    create_proc_info_entry
    (module_name, 0, NULL, %module_name%_proc_info);

    return 0;
}
%if(%module%,%(
#if defined(MODULE)
/**
 **********************************************************************
 * Function: %module_name%_exit
 *
 *   Author: %if(%author%,%(%author%)%,%($author$)%)%
 *     Date: %date(month,day,year,%(%month%/%day%/%year%)%)%
 **********************************************************************
 */
void %module_name%_exit(void)
{
    dbprintk
    ("%%s: %%s()\n", module_name, __FUNCTION__);
    
    /* Remove the /proc entry
     */
    remove_proc_entry(module_name, NULL);

    /* Remove the /dev entry
     */
    devfs_unregister(%module_name%_devfs_handle);

    /* Unregister device file operations.
     */
    devfs_unregister_chrdev
    (%module_name%_device_major, module_name);
%if(%pci_vendor%,%(
    %module_name%_free_irq();

    %module_name%_unmap_pci_regs();)%)%
}

/*
 * export module init and exit
 */
module_init(%module_name%_init);
module_exit(%module_name%_exit);
#endif /* defined(MODULE) */
)%)%)%)%
