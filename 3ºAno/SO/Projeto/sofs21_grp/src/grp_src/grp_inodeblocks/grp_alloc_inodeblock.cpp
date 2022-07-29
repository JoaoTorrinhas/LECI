/*
 *  \authur Artur Pereira - 2016-2021
 */

#include "inodeblocks.h"
#include "bin_inodeblocks.h"
#include "grp_inodeblocks.h"

#include "freedatablocks.h"
#include "daal.h"
#include "core.h"
#include "devtools.h"

#include <errno.h>

#include <iostream>

namespace sofs21
{

#if false
    static uint32_t grpAllocIndirectInodeBlock(SOInode * ip, uint32_t afbn);
    static uint32_t grpAllocDoubleIndirectInodeBlock(SOInode * ip, uint32_t afbn);
#endif

    /* ********************************************************* */

    uint32_t grpAllocInodeBlock(int ih, uint32_t fbn)
    {
        soProbe(302, "%s(%d, %u)\n", __FUNCTION__, ih, fbn);

        /* replace the following two lines with your code */
        return binAllocInodeBlock(ih, fbn);
    }

    /* ********************************************************* */

#if false
    /*
    */
    static uint32_t grpAllocIndirectInodeBlock(SOInode * ip, uint32_t afbn)
    {
        soProbe(302, "%s(%d, ...)\n", __FUNCTION__, afbn);

        /* replace the following two lines with your code */
        throw SOException(ENOSYS, __FUNCTION__); 
        return 0;
    }
#endif

    /* ********************************************************* */

#if false
    /*
    */
    static uint32_t grpAllocDoubleIndirectInodeBlock(SOInode * ip, uint32_t afbn)
    {
        soProbe(302, "%s(%d, ...)\n", __FUNCTION__, afbn);

        /* replace the following two lines with your code */
        throw SOException(ENOSYS, __FUNCTION__); 
        return 0;
    }
#endif
};

