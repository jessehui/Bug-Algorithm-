#include <stdlib.h>
#include <math.h>
#include "fft.h"

/* macros */
#define TWO_PI (6.2831853071795864769252867665590057683943L)

//prototype
void fft_rec(int N, int offset, int delta, float (*x)[2], float (*X)[2], float (*XX)[2]);

/* FFT */
void fft(int N, float (*x)[2], float (*X)[2])
{
  /* Declare a pointer to scratch space. */
  float (*XX)[2] = malloc(2 * N * sizeof(float));

  /* Calculate FFT by a recursion. */
  fft_rec(N, 0, 1, x, X, XX);

  /* Free memory. */
  free(XX);
}

/* FFT recursion */
void fft_rec(int N, int offset, int delta,
             float (*x)[2], float (*X)[2], float (*XX)[2])
{
  omp_set_num_threads(N_PROC);

//   #pragma omp parallel sections
// {
//     #pragma omp section
//     { 
//         printf("FFT_REC \n");
//         printf ("id = %d, \n", omp_get_thread_num());
//     }

//     #pragma omp section
//     { 
//         printf("FFT_REC \n");
//         printf ("id = %d, \n", omp_get_thread_num());
//     }
// }

  int N2 = N/2;            /* half the number of points in FFT */
  int k;                   /* generic index */
  float cs, sn;           /* cosine and sine */
  int k00, k01, k10, k11;  /* indices for butterflies */
  float tmp0, tmp1;       /* temporary storage */

  if(N != 2)  /* Perform recursive step. */
    {
      /* Calculate two (N/2)-point DFT's. */
      fft_rec(N2, offset, 2*delta, x, XX, X);
      fft_rec(N2, offset+delta, 2*delta, x, XX, X);

      /* Combine the two (N/2)-point DFT's into one N-point DFT. */
      #pragma omp parallel sections
      {
        #pragma omp section
        {
          for(k=0; k<N2/4; k++)
            {
              k00 = offset + k*delta;    k01 = k00 + N2*delta;
              k10 = offset + 2*k*delta;  k11 = k10 + delta;
              cs = cos(TWO_PI*k/(float)N); sn = sin(TWO_PI*k/(float)N);
              tmp0 = cs * XX[k11][0] + sn * XX[k11][1];
              tmp1 = cs * XX[k11][1] - sn * XX[k11][0];
              X[k01][0] = XX[k10][0] - tmp0;
              X[k01][1] = XX[k10][1] - tmp1;
              X[k00][0] = XX[k10][0] + tmp0;
              X[k00][1] = XX[k10][1] + tmp1;
            }
        }

        #pragma omp section
        {
          for(k=N2/4; k<N2/2; k++)
            {
              k00 = offset + k*delta;    k01 = k00 + N2*delta;
              k10 = offset + 2*k*delta;  k11 = k10 + delta;
              cs = cos(TWO_PI*k/(float)N); sn = sin(TWO_PI*k/(float)N);
              tmp0 = cs * XX[k11][0] + sn * XX[k11][1];
              tmp1 = cs * XX[k11][1] - sn * XX[k11][0];
              X[k01][0] = XX[k10][0] - tmp0;
              X[k01][1] = XX[k10][1] - tmp1;
              X[k00][0] = XX[k10][0] + tmp0;
              X[k00][1] = XX[k10][1] + tmp1;
            }
        }

        #pragma omp section
        {
          for(k=N2/2; k<3*N2/4; k++)
            {
              k00 = offset + k*delta;    k01 = k00 + N2*delta;
              k10 = offset + 2*k*delta;  k11 = k10 + delta;
              cs = cos(TWO_PI*k/(float)N); sn = sin(TWO_PI*k/(float)N);
              tmp0 = cs * XX[k11][0] + sn * XX[k11][1];
              tmp1 = cs * XX[k11][1] - sn * XX[k11][0];
              X[k01][0] = XX[k10][0] - tmp0;
              X[k01][1] = XX[k10][1] - tmp1;
              X[k00][0] = XX[k10][0] + tmp0;
              X[k00][1] = XX[k10][1] + tmp1;
            }
        }


        #pragma omp section
        {
          for(k=3*N2/4; k<N2; k++)
            {
              k00 = offset + k*delta;    k01 = k00 + N2*delta;
              k10 = offset + 2*k*delta;  k11 = k10 + delta;
              cs = cos(TWO_PI*k/(float)N); sn = sin(TWO_PI*k/(float)N);
              tmp0 = cs * XX[k11][0] + sn * XX[k11][1];
              tmp1 = cs * XX[k11][1] - sn * XX[k11][0];
              X[k01][0] = XX[k10][0] - tmp0;
              X[k01][1] = XX[k10][1] - tmp1;
              X[k00][0] = XX[k10][0] + tmp0;
              X[k00][1] = XX[k10][1] + tmp1;
            }
        }

      }
  }


  else  /* Perform 2-point DFT. */
    {
      k00 = offset; k01 = k00 + delta;
      X[k01][0] = x[k00][0] - x[k01][0];
      X[k01][1] = x[k00][1] - x[k01][1];
      X[k00][0] = x[k00][0] + x[k01][0];
      X[k00][1] = x[k00][1] + x[k01][1];
    }
}

/* IFFT */
void ifft(int N, float (*x)[2], float (*X)[2])
{

  omp_set_num_threads(N_PROC);

//   #pragma omp parallel sections
// {
//     #pragma omp section
//     { 
//         printf ("id = %d, \n", omp_get_thread_num());
//     }

//     #pragma omp section
//     { 
//         printf ("id = %d, \n", omp_get_thread_num());
//     }
// }

  int N2 = N/2;       /* half the number of points in IFFT */
  int i;              /* generic index */
  float tmp0, tmp1;  /* temporary storage */

  /* Calculate IFFT via reciprocity property of DFT. */
  fft(N, X, x);
  x[0][0] = x[0][0]/N;    x[0][1] = x[0][1]/N;
  x[N2][0] = x[N2][0]/N;  x[N2][1] = x[N2][1]/N;

  #pragma omp parallel sections
  {
    #pragma omp section
    {
      for(i=1; i<N2/4; i++)
        {
          tmp0 = x[i][0]/N;       tmp1 = x[i][1]/N;
          x[i][0] = x[N-i][0]/N;  x[i][1] = x[N-i][1]/N;
          x[N-i][0] = tmp0;       x[N-i][1] = tmp1;
        }
    }

    #pragma omp section
    {
      for(i=N2/4; i<2*N2/4; i++)
        {
          tmp0 = x[i][0]/N;       tmp1 = x[i][1]/N;
          x[i][0] = x[N-i][0]/N;  x[i][1] = x[N-i][1]/N;
          x[N-i][0] = tmp0;       x[N-i][1] = tmp1;
        }
    }

    #pragma omp section
    {
      for(i=2 * N2/4; i<3*N2/4; i++)
        {
          tmp0 = x[i][0]/N;       tmp1 = x[i][1]/N;
          x[i][0] = x[N-i][0]/N;  x[i][1] = x[N-i][1]/N;
          x[N-i][0] = tmp0;       x[N-i][1] = tmp1;
        }
    }

    #pragma omp section
    {
      for(i=3 * N2/4; i<N2/4; i++)
        {
          tmp0 = x[i][0]/N;       tmp1 = x[i][1]/N;
          x[i][0] = x[N-i][0]/N;  x[i][1] = x[N-i][1]/N;
          x[N-i][0] = tmp0;       x[N-i][1] = tmp1;
        }
    }

  }
}