#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

int main(int argc, char *argv[]){
	int gid;
	//create child using fork
        int child_pid = fork();
        int pid;
        //Check pid to run parent code
        if(child_pid > 0) {
                pid = getpid();
		gid = getpgid(pid);
                printf(2,"PARENT\nPID: %d\n",pid);
                printf(2,"PGID: %d\n",gid);
        }
        else {
                pid = getpid();
		//setting pgid to different value
		setpgid(2);
		gid = getpgid(pid);
                printf(2,"CHILD\nPID: %d\n",pid);
                printf(2,"PGID: %d\n",gid);
                exit();
        }

	exit();
	return 0;
}
