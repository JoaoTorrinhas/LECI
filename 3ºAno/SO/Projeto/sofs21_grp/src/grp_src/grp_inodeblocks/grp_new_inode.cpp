/*
 *  \authur Artur Pereira - 2016-2021
 */

#include "inodeblocks.h"
#include "bin_inodeblocks.h"
#include "grp_inodeblocks.h"

#include "daal.h"
#include "core.h"
#include "devtools.h"

#include <string.h>
#include <inttypes.h>

namespace sofs21
{
    uint16_t grpNewInode(uint16_t type, uint16_t perm)
    {
        soProbe(333, "%s(%04x, %9o)\n", __FUNCTION__, type, perm);

        /* replace this comment and following line with your code */
        return binNewInode(type, perm);
    }
};

