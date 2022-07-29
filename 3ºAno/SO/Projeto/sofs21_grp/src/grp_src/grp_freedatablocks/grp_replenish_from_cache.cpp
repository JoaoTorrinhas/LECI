/*
 *  \author António Rui Borges - 2012-2015
 *  \authur Artur Pereira - 2016-2020
 */

#include "freedatablocks.h"
#include "bin_freedatablocks.h"
#include "grp_freedatablocks.h"

#include <string.h>
#include <errno.h>
#include <iostream>

#include "core.h"
#include "devtools.h"
#include "daal.h"

namespace sofs21
{
    void grpReplenishFromCache(void)
    {
        soProbe(443, "%s()\n", __FUNCTION__);

        /* replace this comment and following line with your code */
        binReplenishFromCache();
    }
};

