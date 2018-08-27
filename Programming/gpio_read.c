#include <stdio.h>
#include <stdint.h>
#include <fcntl.h>
#include <string.h>
#include <errno.h>

#if 0
#define LTC2943_TEMP /sys/class/hwmon/hwmon0/device/dpu_temperature
#endif
#define LTC2943_TEMP "/home/anitha/dpu_temp"

#define REPORTED_SCALE (0.01)

/* DPU is meant to operate in the range of 10-90 degree celsius.
 * Choosing the thresholds to be an offset of 10 degrees.
 */
#define TEMP_HIGH_THRESHOLD (8000) /* 90 degree celsius */
#define TEMP_LOW_THRESHOLD (2000) /* 10 degree celsius */

#define PATH_MAX (128)
#define BUF_LEN (32)

/* Check if the FD is valid */
#define IS_VALID_FD(x)      ((x) >= 0)

int main()
{
    //char temp_path[PATH_MAX];
    uint8_t buf[BUF_LEN];
    int fd;
    int r = 0, temp_val = 0;

    //snprintf(temp_path, PATH_MAX, LTC2943_TEMP);
    fd = open(LTC2943_TEMP, O_RDONLY);
    if (!IS_VALID_FD(fd)) {
        printf("Unable to open %s for reading. Error %s\n", LTC2943_TEMP, strerror(errno));
        return -1;
    }


    if ((r = read(fd, buf, BUF_LEN)) == -1) {
        printf("Read failure (got %d). %s\n", r, strerror(errno));
        return -1;
    }
    temp_val = atoi(buf);
    printf("Temperature read = %u\n", temp_val);

    if ((temp_val < TEMP_LOW_THRESHOLD) || (temp_val > TEMP_HIGH_THRESHOLD)) {
        printf("Threshold of  hit.\n");
        /* Notify sysrepo of the event */
    }
    return 0;
}



