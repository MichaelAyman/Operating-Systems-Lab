#include "types.h"
#include "user.h"

int
main(void)
{
  int pid;

  printf(1, "Creating 3 child processes...\n");

  for(int i = 0; i < 3; i++) {
    pid = fork();
    if(pid == 0){
      // Child
      sleep(50);  // Stay alive for a bit
      exit();
    }
    // Parent continues
  }

  // Give children time to start
  sleep(10);

  printf(1, "Calling printptable()...\n");
  printptable();
  printf(1, "Finished printptable() call.\n");

  // Wait for all children
  for(int i = 0; i < 3; i++) {
    wait();
  }

  exit();
}
