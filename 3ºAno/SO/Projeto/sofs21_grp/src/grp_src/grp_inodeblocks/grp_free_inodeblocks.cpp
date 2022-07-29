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

#include <inttypes.h>
#include <errno.h>
#include <assert.h>

namespace sofs21
{
#if false
    /* free all blocks between positions ffbn and RPB - 1
     * existing in the block of references given by i1.
     * Return true if, after the operation, all references become NullBlockReference.
     * It assumes i1 is valid.
     */
    static bool grpFreeIndirectInodeBlocks(SOInode * ip, uint32_t i1, uint32_t ffbn);

    /* free all blocks between positions ffbn and RPB**2 - 1
     * existing in the block of indirect references given by i2.
     * Return true if, after the operation, all references become NullBlockReference.
     * It assumes i2 is valid.
     */
    static bool grpFreeDoubleIndirectInodeBlocks(SOInode * ip, uint32_t i2, uint32_t ffbn);
#endif

    /* ********************************************************* */

    void grpFreeInodeBlocks(int ih, uint32_t ffbn)
    {
        soProbe(303, "%s(%d, %u)\n", __FUNCTION__, ih, ffbn);

        /* replace this comment and following line with your code */
        binFreeInodeBlocks(ih, ffbn);
    }

    /* ********************************************************* */

#if false
    static bool grpFreeIndirectInodeBlocks(SOInode * ip, uint32_t i1, uint32_t ffbn)
    {
        soProbe(303, "%s(..., %u, %u)\n", __FUNCTION__, i1, ffbn);

        /* replace this comment and following line with your code */
        throw SOException(ENOSYS, __FUNCTION__); 
    }
#endif

    /* ********************************************************* */

#if false
    static bool grpFreeDoubleIndirectInodeBlocks(SOInode * ip, uint32_t i2, uint32_t ffbn)
    {
        soProbe(303, "%s(..., %u, %u)\n", __FUNCTION__, i2, ffbn);

        /* replace this comment and following line with your code */
        throw SOException(ENOSYS, __FUNCTION__); 
    }
#endif

    /* ********************************************************* */
};

