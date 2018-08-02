#define U 64
#include "my_type.h"
static int s = 0;
void rotate(int n, MY_TYPE src[n][n], MY_TYPE dst[n][n]) {
    int i, j;
    for(i = 0; i < n; i++) 
        for(j = 0; j < n; j+=U) {
            dst[n-1-j][i] = src[i][j];
            dst[n-1-j+1][i] = src[i][j+1];
            dst[n-1-j+2][i] = src[i][j+2];
            dst[n-1-j+3][i] = src[i][j+3];
            dst[n-1-j+4][i] = src[i][j+4];
            dst[n-1-j+5][i] = src[i][j+5];
            dst[n-1-j+6][i] = src[i][j+6];
            dst[n-1-j+7][i] = src[i][j+7];
            dst[n-1-j+8][i] = src[i][j+8];
            dst[n-1-j+9][i] = src[i][j+9];
            dst[n-1-j+10][i] = src[i][j+10];
            dst[n-1-j+11][i] = src[i][j+11];
            dst[n-1-j+12][i] = src[i][j+12];
            dst[n-1-j+13][i] = src[i][j+13];
            dst[n-1-j+14][i] = src[i][j+14];
            dst[n-1-j+15][i] = src[i][j+15];
            dst[n-1-j+16][i] = src[i][j+16];
            dst[n-1-j+17][i] = src[i][j+17];
            dst[n-1-j+18][i] = src[i][j+18];
            dst[n-1-j+19][i] = src[i][j+19];
            dst[n-1-j+20][i] = src[i][j+20];
            dst[n-1-j+21][i] = src[i][j+21];
            dst[n-1-j+22][i] = src[i][j+22];
            dst[n-1-j+23][i] = src[i][j+23];
            dst[n-1-j+24][i] = src[i][j+24];
            dst[n-1-j+25][i] = src[i][j+25];
            dst[n-1-j+26][i] = src[i][j+26];
            dst[n-1-j+27][i] = src[i][j+27];
            dst[n-1-j+28][i] = src[i][j+28];
            dst[n-1-j+29][i] = src[i][j+29];
            dst[n-1-j+30][i] = src[i][j+30];
            dst[n-1-j+31][i] = src[i][j+31];
            dst[n-1-j+32][i] = src[i][j+32];
            dst[n-1-j+33][i] = src[i][j+33];
            dst[n-1-j+34][i] = src[i][j+34];
            dst[n-1-j+35][i] = src[i][j+35];
            dst[n-1-j+36][i] = src[i][j+36];
            dst[n-1-j+37][i] = src[i][j+37];
            dst[n-1-j+38][i] = src[i][j+38];
            dst[n-1-j+39][i] = src[i][j+39];
            dst[n-1-j+40][i] = src[i][j+40];
            dst[n-1-j+41][i] = src[i][j+41];
            dst[n-1-j+42][i] = src[i][j+42];
            dst[n-1-j+43][i] = src[i][j+43];
            dst[n-1-j+44][i] = src[i][j+44];
            dst[n-1-j+45][i] = src[i][j+45];
            dst[n-1-j+46][i] = src[i][j+46];
            dst[n-1-j+47][i] = src[i][j+47];
            dst[n-1-j+48][i] = src[i][j+48];
            dst[n-1-j+49][i] = src[i][j+49];
            dst[n-1-j+50][i] = src[i][j+50];
            dst[n-1-j+51][i] = src[i][j+51];
            dst[n-1-j+52][i] = src[i][j+52];
            dst[n-1-j+53][i] = src[i][j+53];
            dst[n-1-j+54][i] = src[i][j+54];
            dst[n-1-j+55][i] = src[i][j+55];
            dst[n-1-j+56][i] = src[i][j+56];
            dst[n-1-j+57][i] = src[i][j+57];
            dst[n-1-j+58][i] = src[i][j+58];
            dst[n-1-j+59][i] = src[i][j+59];
            dst[n-1-j+60][i] = src[i][j+60];
            dst[n-1-j+61][i] = src[i][j+61];
            dst[n-1-j+62][i] = src[i][j+62];
            dst[n-1-j+63][i] = src[i][j+63];
        }
        for(;j < n; j++) dst[n-1-j][i] = src[i][j];
    s++;
}
