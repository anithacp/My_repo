#include <stdio.h>
#include <string.h>

int twoDfunc(int input[4][20])
{
	input[2][1] = 1;
	return 0;
}

void printtwoDarr(int input[4][20])
{
	int i,j;
	for (i = 0; i < 4; i++) {
		for (j = 0; j < 20; j++)
			printf("[%u][%u] = %u ", i, j, input[i][j]);
		printf("\n");
	}
}

int func(int input[20])
{
	input[1] = 1;
	return 0;
}

void printarr(int input[20])
{
	int i;
	for (i = 0; i < 20; i++)
		printf("[%u] = %u ", i, input[i]);
}

int ptrfunc(int *input)
{
	*(input + 1) = 1;
	return 0;
}

int main()
{
	int arr[20];
	int twoDarr[4][20];
	memset(arr, 0x00, sizeof(arr));
	memset(twoDarr, 0x00, sizeof(twoDarr));
	//if (!func(arr)) {
	//if (!ptrfunc(&arr)) {
	if (!twoDfunc(twoDarr)) {
		//printarr(arr);
		printtwoDarr(twoDarr);
		return 0;
	} else
		return 1;
}
