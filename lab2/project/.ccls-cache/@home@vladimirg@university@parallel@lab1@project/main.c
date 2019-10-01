#include <float.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>

const static int c_a = 392;
const static int c_experiments = 50;

void generate(unsigned int seed, double * p, unsigned int N, unsigned int min, unsigned int max)
{
    unsigned int i;
    for (i = 0; i < N; i++) {
        p[i] = (rand_r(&seed) % max) + min;
    }
}

void lab_swap(double * lhs, double * rhs)
{
    double tmp = *lhs;
    *lhs = *rhs;
    *rhs = tmp;
}

// To heapify a subtree rooted with node i which is 
// an index in arr[]. n is size of heap 
void heapify(double * arr, unsigned int n, unsigned int i)
{ 
    unsigned int largest = i; // Initialize largest as root
    unsigned int l = 2*i + 1; // left = 2*i + 1
    unsigned int r = 2*i + 2; // right = 2*i + 2
  
    // If left child is larger than root 
    if (l < n && arr[l] > arr[largest]) {
        largest = l;
    }

    // If right child is larger than largest so far 
    if (r < n && arr[r] > arr[largest]) {
        largest = r;
    }

    // If largest is not root 
    if (largest != i) {
        lab_swap(&arr[i], &arr[largest]);
        heapify(arr, n, largest);
    } 
} 
  
void heapsort(double * arr, int n) 
{ 
    // Build heap (rearrange array)
    int i;
    for (i = n / 2 - 1; i >= 0; i--) {
        heapify(arr, n, i);
    }

    // One by one extract an element from heap
    for (i=n-1; i>=0; i--) { 
        // Move current root to end
        lab_swap(&arr[0], &arr[i]);
        // call max heapify on the reduced heap
        heapify(arr, i, 0);
    }
}

double lab_abs(double v)
{
    if (v < 0) {
        return -v;
    }
    return v;
}

double lab_min(double lhs, double rhs)
{
    return lhs > rhs ? rhs : lhs;
}

void print_array(double * p, unsigned int N)
{
    unsigned int i = 0;
    for (i = 0; i < N - 1; i++) {
        printf("%f ", p[i]);
    }
    printf("%f\n", p[N - 1]);
}

int main(int argc, char * argv[])
{
    if (argc < 2) {
        return -1;
    }

    struct timeval begin, end;
    const int N = atoi(argv[1]);
    if (N < 0) {
        return -2;
    }

    double * m1 = malloc(sizeof(double) * N);
    double * m2 = malloc(sizeof(double) * N / 2);

    gettimeofday(&begin, NULL);
    double reduced_sum = 0.0;
    unsigned int i;
    for (i = 0; i < c_experiments; i++) {
        // 1. Generate: M1 of N elements, M2 of N/2 elements
        generate(i, m1, N, 1, c_a);
        //    puts("M1");
        //    print_array(m1, N);
        generate(i, m2, N / 2, c_a, 10 * c_a);
        //    puts("M2");
        //    print_array(m2, N / 2);
        // 2. Map: tanh(M1[j]) - 1 , j e N ; M2[j] = abs(sin(M2[j] + M2[j-1])) , j e N/2
        unsigned int j;
        for (j = 0; j < N; j++) {
            m1[j] = tanh(m1[j]) - 1;
        }
        //    puts("M1 tanh");
        //    print_array(m1, N);
        m2[0] = lab_abs(sin(m2[0] /* + 0.0 */));
        for (j = 1; j < N / 2; j++) {
            m2[j] = lab_abs(sin(m2[j] + m2[j - 1]));
        }
        //    puts("M2 abs sin sum");
        //    print_array(m2, N / 2);
        // 3. Merge: M2[j] = min(M1[j], M2[j]) , j e N/2
        for (j = 0; j < N / 2; j++) {
            m2[j] = lab_min(m1[j], m2[j]);
        }
        //    puts("min of M1 M2");
        //    print_array(m2, N / 2);
        // 4. Sort: heapsort(M2, N/2)
        heapsort(m2, N/2);
        //    puts("sorted");
        //    print_array(m2, N / 2);
        // 5. Reduce: 1. min_non_zero(M2)
        //            2. if (((long)(M2[i] / min_non_zero)) & ~(1))
        //                   sum += sin(M2[i])
        double min_non_zero = DBL_MAX;
        for (j = 0; j < N / 2; j++) {
            if (m2[j] != 0) {
                min_non_zero = lab_min(min_non_zero, m2[j]);
            }
        }
        //    printf("Min non zero: %f\n", min_non_zero);
        for (j = 0; j < N / 2; j++) {
            if (((long)(m2[i] / min_non_zero)) & ~(1)) {
                reduced_sum += sin(m2[j]);
            }
        }
        //    printf("Sum: %e\n", reduced_sum);
    }
    gettimeofday(&end, NULL);
    long delta_ms = 1000 * (end.tv_sec - begin.tv_sec) + (end.tv_usec - begin.tv_usec) / 1000;
    printf("N = %d. Milliseconds passed: %ld\n", N, delta_ms);
    printf("N = %d. X=%e\n", N, reduced_sum / c_experiments);

    return 0;
}
