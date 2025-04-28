#include "user.h"
#include "types.h"


int average(int *arr, int n) {
    if (n == 0) {
      return 0;
    } 
    int sum = 0;
    int i;
    for (i = 0; i < n; i++){
      sum += arr[i];
    }
    return sum / n;
}

int median(int *arr, int n) {
    if (n <= 0)  {
      return 0;
    }
    if (n % 2 == 0) {
      return (arr[n/2 - 1] + arr[n/2]) / 2;
    } else {
      return arr[n/2];
    }
}

int std(int *arr, int n) {
    if (n <= 1) return 0;
    int sum = 0;
    int m = average(arr, n);
    int i;
    for (i = 0; i < n; i++){
        sum += ((arr[i]-m) * (arr[i]-m));
    }
    return (int) sqrt(sum / n);
}

int min(int *arr, int n) {
    if (n <= 0) return 0;
    int mini = 0;
    if (arr != 0) {
      mini = arr[0];
    }
  
    for (int i = 1; i < n; i++) {
      if (arr[i] < mini) {
        mini = arr[i];
      }
    }
    return mini;
  
}

int max(int *arr, int n) {
    if (n <= 0) return 0;
    int maxi = arr[0];
  
    for (int i = 1; i < n; i++) {
      if (arr[i] > maxi) {
        maxi = arr[i];
      }
    }
    return maxi;
  
}

int main(int argc, char *argv[]) {
    if (argc == 1) {
        printf(2, "Incorrect format. Try: printstats x y z\n");
        exit();
    }

    int arr[argc-1];

    for (int i = 0; i < argc-1; i++) {
        arr[i] = atoi(argv[i+1]);
    }

    // need to sort array

    int med = median(arr, argc-1);
    int avg = average(arr, argc-1);
    int standard = std(arr, argc-1);
    int mini = min(arr, argc-1);
    int maxi = max(arr, argc-1);

    printf(1, "Average: %d\n", avg);
    printf(1, "Standard Deviation: %d\n", standard);
    printf(1, "Median: %d\n", med);
    printf(1, "Minimum: %d\n", mini);
    printf(1, "Maximum: %d\n", maxi);
    exit();
}

