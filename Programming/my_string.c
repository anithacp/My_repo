#include <stdio.h>
#include <string.h>

int main(void)
{
	char str_1[25] = {0};
	char str_2[25] = {0};
	//printf("ret = %d\n", strncmp(str, "0", sizeof(str)));
	printf("ret = %d\n", memcmp(str_1, str_2, sizeof(str_1)));
        return 0;
}

