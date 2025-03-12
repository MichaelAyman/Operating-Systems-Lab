#include "types.h"
#include "user.h"

// https://www.geeksforgeeks.org/bubble-sort-algorithm/
void bubble(int *arr, int n) {
    int swap;

    for (int i = 0; i < n; i++) {
        swap = 0;

        for (int j = 0; j < (n-i-1); j++) {
            if (arr[j] > arr[j+1]) {
                int temp = arr[j];
                arr[j] = arr[j+1];
                arr[j+1] = temp;
                
                swap = 1;
            }
        }
        if (swap == 0) {
            break;
        }
    }

}

int main(int argc, char *argv[]) {
    if (argc == 1) {
        printf(2, "Incorrect format. Try: bubblesort x y z\n");
        exit();
    }

    // turning arg into array to process
    int arr[argc-1];

    for (int i = 0; i < argc-1; i++) {
        arr[i] = atoi(argv[i+1]);
    }

    bubble(arr, argc-1);
    
    // print everything out
    for (int i = 0; i < argc-1; i++) {
        printf(1, "%d ", arr[i]);
    }
    printf(1,"\n");
    exit();
}