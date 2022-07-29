#include "grp_mksofs.h"

#include "rawdisk.h"
#include "core.h"
#include "devtools.h"
#include "bin_mksofs.h"

#include <string.h>
#include <inttypes.h>

namespace sofs21
{
    void grpFillInSuperblock(const char *name, uint32_t ntotal, uint16_t itsize, uint32_t dbtotal)
    {
        soProbe(602, "%s(%s, %u, %u, %u)\n", __FUNCTION__, name, ntotal, itsize, dbtotal);
	
        /* replace this comment and following line with your code */
        //binFillInSuperblock(name, ntotal, itsize, dbtotal);
        //SOSuperblock* sb = (SOSuperblock*) malloc(sizeof(SOSuperblock));
        SOSuperblock sb = SOSuperblock();	//sizeOf é 1024	SOSuperblock()
        
        sb.magic = 0xFFFF;	
        sb.version = VERSION_NUMBER;
        sb.mntstat = 0;
        memcpy(&(sb.name), name, 20);		//strcpy(sb.name,name) tb funciona
        sb.ntotal = ntotal;
        sb.itotal = itsize*IPB; //itsize*IPB = numero total de inodes
        //inodes
        sb.ifree = (itsize*IPB)-1;
        sb.iidx=0;		
        sb.ibitmap[0]=0xFFFFFFFE;
        for (int i = 1; i < MAX_INODES/32; i++){
            if(i < sb.itotal/32)
                sb.ibitmap[i] = NullBlockReference;
            else 
                sb.ibitmap[i] = 0;
        }
        //data blocks
        sb.dbp_start=1+sb.itotal/IPB+1;   
        sb.dbtotal=dbtotal;
        sb.dbfree=dbtotal-1;
        
        sb.rbm_start=itsize+1;	//1+(sb.itotal/IPB)+dbtotal;	itsize+1
        sb.rbm_size=1;		//ntotal-sb.rbm_start
        sb.rbm_idx = 0;
        
        //deleted_queue
        sb.iqhead = 0;
        sb.iqcount = 0;
        for(uint32_t i = 0; i < DELETED_QUEUE_SIZE; i++){
             sb.iqueue[i] = NullInodeReference; 
        }

        /* fill  retrieval cache */
        //sb.retrieval_cache = SOSuperblock::ReferenceCache();
        //if(REF_CACHE_SIZE < dbtotal){
        	//sb.retrieval_cache.idx = 0;
        //}else{
        	//sb.retrieval_cache.idx = REF_CACHE_SIZE + 1 - dbtotal;
        //}
        
        //sb.retrieval_cache.ref[REF_CACHE_SIZE] = {0};
        //int aux = 0;
        //for(int i = 0; i < REF_CACHE_SIZE; i++){
        	//if(i<(int)sb.retrieval_cache.idx){
        		//sb.retrieval_cache.ref[i] = NullBlockReference;
        	//}else{
        		//sb.retrieval_cache.ref[i] = aux+1;
        		//aux++;
        	//}
        //}
        //int aux = 0;
        //sb.retrieval_cache = SOSuperblock::ReferenceCache();
        //for (uint32_t i = 0; i < REF_CACHE_SIZE; i++){
            //if(i < sb.retrieval_cache.idx){
                //sb.retrieval_cache.ref[i] = NullBlockReference;
            //}else{
                //sb.retrieval_cache.ref[i] = aux;
                //aux++;
            //}
        //}
        
        sb.retrieval_cache = SOSuperblock::ReferenceCache();
        sb.retrieval_cache.idx=60;
        for(uint32_t i = 0; i<REF_CACHE_SIZE;i++){
            sb.retrieval_cache.ref[i]=NullBlockReference;
        }
        
        /* insertion cache */ 
	sb.insertion_cache = SOSuperblock::ReferenceCache();
        sb.insertion_cache.idx=0;
        for(uint32_t i = 0; i<REF_CACHE_SIZE;i++){
            sb.insertion_cache.ref[i]=NullBlockReference;
        }
        
        soWriteRawBlock(0,&sb);
        //free(&sb);	//sem o free() o magic number nao muda	
    }
};

