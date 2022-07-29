#include "direntries.h"

#include "core.h"
#include "devtools.h"
#include "daal.h"
#include "inodeblocks.h"
#include "direntries.h"
#include "bin_direntries.h"

#include <errno.h>
#include <string.h>
#include <libgen.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/stat.h>

namespace sofs21
{
    uint16_t grpTraversePath(char *path)
    {
        soProbe(221, "%s(%s)\n", __FUNCTION__, path);

        /* replace this comment and following line with your code */
        //return binTraversePath(path);
        
        //ver se a path é o root
        if(strcmp(path,(char*) "/") == 0){
        	return 0;
        }
        
        uint16_t parentInode = grpTraversePath(dirname(strdupa(path))); //soTraversePath
        
         if(parentInode == NullInodeReference){
            throw SOException(ENOTDIR, __FUNCTION__);
        }

        // achar o filho
        int pih = soOpenInode(parentInode); //inode handler of the parent directory
        uint16_t childInode = soGetDirentry(pih, basename(strdupa(path)));
        soCloseInode(pih);

        if(childInode == NullInodeReference){
            throw SOException(ENOTDIR, __FUNCTION__);
        }

        int cih = soOpenInode(childInode);
        SOInode* cin = soGetInodePointer(cih);

        // CHECK IF THE COMPONENTS OF THE PATH ARE A DIR
        if (!S_ISDIR(cin->mode)) {
            soCloseInode(cih);
            throw SOException(ENOTDIR, __FUNCTION__);
        }
        
        //PERMISSON
        if (soCheckInodeAccess(cih, X_OK)) {	//(cin->owner == getuid() || cin->group == getgid()) &&  
            soCloseInode(cih);
            return childInode;
        } else {
            soCloseInode(cih);
            throw SOException(EACCES, __FUNCTION__);
        }
    }
};

