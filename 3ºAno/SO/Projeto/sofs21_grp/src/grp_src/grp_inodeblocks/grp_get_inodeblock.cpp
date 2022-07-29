/*
 *  \authur Artur Pereira - 2016-2021
 */

#include "inodeblocks.h"
#include "bin_inodeblocks.h"
#include "grp_inodeblocks.h"

#include "daal.h"
#include "core.h"
#include "devtools.h"

#include <errno.h>

namespace sofs21
{
    /* ********************************************************* */

//#if false
    static uint32_t grpGetIndirectInodeBlock(SOInode * ip, uint32_t fbn);
    static uint32_t grpGetDoubleIndirectInodeBlock(SOInode * ip, uint32_t fbn);
//#endif

    /* ********************************************************* */

    uint32_t grpGetInodeBlock(int ih, uint32_t fbn)
    {
        soProbe(301, "%s(%d, %u)\n", __FUNCTION__, ih, fbn);
        /* replace this comment and following line with your code */
        //return binGetInodeBlock(ih, fbn);
        
        SOInode* inode = soGetInodePointer(ih);
        
        //Check if ibn is valid
        if(N_DIRECT + RPB + RPB*RPB < fbn || inode == NULL){		//numero de blocos na pior das hipoteses = N_DIRECT+ RBP + RPB*RBP
         	throw SOException(EINVAL, __FUNCTION__);
        }
        
        uint32_t inodeblockNumber;
        if(fbn<N_DIRECT){
        	inodeblockNumber = inode->d[fbn];	//inodeblockNumber = inode->d[fbn];	//fbn = ibn
        }else if(fbn<N_DIRECT+RPB){
         	inodeblockNumber = grpGetIndirectInodeBlock(inode,fbn-N_DIRECT);	
        }else{
         	inodeblockNumber = grpGetDoubleIndirectInodeBlock(inode, fbn-N_DIRECT-RPB);		
        }
        return inodeblockNumber;
        
    }

    /* ********************************************************* */

//#if false
    static uint32_t grpGetIndirectInodeBlock(SOInode * ip, uint32_t afbn)	//buscar a referencia a i1, afbn é para cada i1,i2 começar no indice 0 -> tenho de corrigir o fbn na função principal para i1 começar no indice 0
    {
        soProbe(301, "%s(%d, ...)\n", __FUNCTION__, afbn);

        /* replace the following two lines with your code */
        //throw SOException(ENOSYS, __FUNCTION__); 
        //return 0;
        uint32_t inodeBlock[RPB];
        //ip->i1 = afbn/RPB;	////ip->i1[afbn/RPB]
        if(ip->i1 == NullBlockReference){		
        	return NullBlockReference;
        }
        soReadDataBlock(ip->i1,&inodeBlock);		
        return inodeBlock[afbn%RPB];				//[afbn]
        
    }
//#endif

    /* ********************************************************* */

//#if false
    static uint32_t grpGetDoubleIndirectInodeBlock(SOInode * ip, uint32_t afbn)	//buscar a referencia a i2, a msm coisa
    {
        soProbe(301, "%s(%d, ...)\n", __FUNCTION__, afbn);

        /* replace the following two lines with your code */
        //throw SOException(ENOSYS, __FUNCTION__); 
        //return 0;
        uint32_t inodeBlock2[RPB];
        //ip->i2 = afbn/(RPB*RPB);
        if(ip->i2 == NullBlockReference) return NullBlockReference;	//ip->i2[afbn/(RPB*RPB)]
        soReadDataBlock(ip->i2, &inodeBlock2);			//ip->i2[afbn/(RPB*RPB)]
	uint32_t idx = afbn%RPB;
	//uint32_t position = afbn/RPB;
	//ip->i2 = inodeBlock2[afbn/RPB];
	//return grpGetIndirectInodeBlock(ip, idx);
	SOInode dummy;
	dummy.i1 = inodeBlock2[afbn/RPB];
	return grpGetIndirectInodeBlock(&dummy,idx);
        //uint32_t inodeBlock1[RPB];
        //if(inodeBlock2[afbn/RPB%RPB]==NullBlockReference) return NullBlockReference;	//[afbn/RPB%RPB]
        //soReadDataBlock(inodeBlock2[afbn/RPB%RPB] ,&inodeBlock1);

        //return inodeBlock1[afbn%RPB%RPB];	//inodeBlock1[afbn]
        
    }
//#endif
};

