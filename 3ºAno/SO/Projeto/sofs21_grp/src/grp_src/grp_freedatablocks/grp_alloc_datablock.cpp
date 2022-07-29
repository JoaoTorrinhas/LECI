/*
 *  \author António Rui Borges - 2012-2015
 *  \authur Artur Pereira - 2009-2020
 */

#include "freedatablocks.h"
#include "bin_freedatablocks.h"
#include "grp_freedatablocks.h"

#include <stdio.h>
#include <errno.h>
#include <inttypes.h>
#include <time.h>
#include <unistd.h>
#include <sys/types.h>

#include "core.h"
#include "devtools.h"
#include "daal.h"

namespace sofs21
{
    uint32_t grpAllocDataBlock()
    {
        soProbe(441, "%s()\n", __FUNCTION__);

        /* replace this comment and following line with your code */
        //return binAllocDataBlock();
        
        //pointer
        SOSuperblock* sb = soGetSuperblockPointer();
        
        //if retrieval cache is empty soReplenishFromCache must be called
        if(sb->retrieval_cache.idx == REF_CACHE_SIZE){
        	//if there are no free data blocks
        	if(sb->dbfree == 0){
        		throw SOException(ENOSPC, __FUNCTION__);
        	}
        	//soReplenishFromBitmap();
        	soReplenishFromCache();
        }
        //soReplenishFromCache();
        soReplenishFromBitmap();
        
        //retrive the first index of the retrievel cache
        uint32_t db = sb->retrieval_cache.ref[sb->retrieval_cache.idx];
        
        //update retrievel cache
        sb->retrieval_cache.ref[sb->retrieval_cache.idx] = NullBlockReference;
        sb->retrieval_cache.idx++;
        sb->dbfree -= 1;  //alocamos um free datablock logo dbfree-1
        
        soSaveSuperblock();
        return db;
    }
};

