#include <stdio.h>
void line_range(unsigned int line)
{
	if (line == (unsigned int) - 1)
		printf("-1 case\n");
	else
		printf("Line = %u\n", line);
}

int main()
{
	line_range(-1);
	line_range(0);
	line_range(1);
	line_range(2);
	line_range(3);
	return 0;
}
