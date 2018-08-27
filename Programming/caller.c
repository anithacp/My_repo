#include <stdio.h>
#include <fcntl.h>
#include <errno.h>

#define XDSL_PIPE "/tmp/pipe/dms0_event"
static int dsl_fd = 0;
static unsigned char rx_buff[1024];

int dsl_api_handle(unsigned char *message, int size)
{
    return 0;
}

int main()
{
    int count = 0;
    dsl_fd = open(XDSL_PIPE, O_RDONLY|O_NONBLOCK);
    count = read(dsl_fd, rx_buff, sizeof(rx_buff));    
    dsl_api_handle(rx_buff, count);
}
