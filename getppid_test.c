#include "user.h"

int main() {
	int pid = fork();

		if(pid < 0) {
			printf(1, "Fork failed\n");
			exit();
		} else if(pid ==0) {
			int ppid= getppid();
			printf(1,"pid: %d. ppid: %d\n", getpid(),ppid);
			exit();
		}
		else {
			wait();
		}
	exit();
}
