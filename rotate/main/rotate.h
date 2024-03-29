#ifndef ROTATE_H
#define ROTATE_H
#include "my_type.h"
void init_src(int n, MY_TYPE src[n][n]);
void use_dst(int n, MY_TYPE dst[n][n]);
void rotate(int n, MY_TYPE src[n][n], MY_TYPE dst[n][n]);
void print_min(int trials, double time[trials]);

#endif

// メイン関数がインクルードする実験用のヘッダファイル.