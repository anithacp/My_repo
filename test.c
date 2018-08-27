#include <stdio.h>
#include "handle.h"

#define NUM_PORTS (4)
static int fds[NUM_PORTS];

void configure() {
	for (int i = 0; i < NUM_PORTS; i++) {
		fds[i] = i;
	}
}

int main() {
	char cmd[20];
	unsigned short line = 1;
	bool enable = true;
	sprintf(cmd, "port_enable %u %d\r", line, enable);
	printf("Cmd is %s \nSize is %u\n", cmd, sizeof(cmd));
	//handle_msg(0);

	configure();
	for (int i = 0; i < NUM_PORTS; i++) 
		printf("fds[%d] = %d", i, fds[i]);

	return 0;
}
