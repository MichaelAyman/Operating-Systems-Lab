#include "types.h"
#include "user.h"
#include "stat.h"

int main(int argc, char *argv[]) {
    if (argc != 3) {
        printf(2, "Wrong usage. Usage: setpriority pid pr#\n");
        exit();
    }

    // convert to int
    int pid = atoi(argv[1]);
    int pr = atoi(argv[2]);

    int res = setpriority(pid, pr);

    if (res < 0) {
        printf(2, "failed\n"); // means it returned -1
    } else {
        printf(1, "Prev pr was %d\n", res);
    }
    exit();
}