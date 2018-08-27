#include <stdio.h>
#include <stdint.h>
#include <fcntl.h>
#include <string.h>
#include <errno.h>
#include "sensors.h"

#if 0
#define LTC2943_TEMP /sys/class/hwmon/hwmon0/device/dpu_temperature
const char LTC2943_TEMP[] = "dpu_temp";
const char LTC2943_DIR[] = "/home/anitha/";
#endif

#define LTC2943_TEMP "dpu_temp"
#define LTC2943_DIR "/home/anitha/"

#define REPORTED_SCALE (0.01)

/* DPU is meant to operate in the range of 10-90 degree celsius.
 * Choosing the thresholds to be an offset of 10 degrees.
 */
#define TEMP_HIGH_THRESHOLD (8000) /* 90 degree celsius */
#define TEMP_LOW_THRESHOLD (2000) /* 10 degree celsius */

#define PATH_LEN (128)
#define BUF_LEN (32)

/* Check if the FD is valid */
#define IS_VALID_FD(x)      ((x) >= 0)

#define SECURITY_SENSOR (0)
#define TEMP_SENSOR (1)
#define POWER_SENSOR (2)

ietf_hw_sensor_data_t dpu_sensors[3];
ietf_alarm_t dpu_alarms[3];
const char temp_dir[] = LTC2943_DIR LTC2943_TEMP;

static int read_fd_value(const char *path, uint32_t *value)
{
    char buf[BUF_LEN];
    int fd;
    int num_bytes = 0;

    if (NULL == path) {
        printf("Error: Uninitialised pointer\n");
        return -1;
    }
    printf("Incoming path = %s\n", path);

    bzero(buf, sizeof(buf));
    fd = open(path, O_RDONLY);
    if (fd < 0) {
        printf("Unable to open %s for reading. Error %s\n", path, strerror(errno));
        return -1;
    }

    if ((num_bytes = read(fd, buf, BUF_LEN)) == -1) {
        printf("Error in reading %s (read %d). %s\n", path, num_bytes, strerror(errno));
        close(fd);
        return -1;
    }

    buf[num_bytes] = '\0';
    *value = atoi(buf);
    close(fd);
    printf("Value read = %u\n", *value);
    return 0;
}

int get_current_temperature_common(uint32_t *current_temp)
{
    return (read_fd_value(temp_dir, current_temp));
}
                                        
int get_current_temperature(uint32_t *current_temp)
{
    char temperature_path[PATH_LEN];
    uint8_t buf[BUF_LEN];
    //char *buf[BUF_LEN];
    int fd;
    int r = 0, temp_val = 0;

    printf ("=========== %s", temp_dir);
    strcpy(temperature_path, LTC2943_DIR);
    strcat(temperature_path, LTC2943_TEMP);
    printf("Constructed temperature path = %s\n", temperature_path);

    //snprintf(temp_path, PATH_MAX, LTC2943_TEMP);
    fd = open(temperature_path, O_RDONLY);
    if (!IS_VALID_FD(fd)) {
        printf("Unable to open %s for reading. Error %s\n", temperature_path, strerror(errno));
        return -1;
    }


    if ((r = read(fd, buf, BUF_LEN)) == -1) {
        printf("Read failure (got %d). %s\n", r, strerror(errno));
        return -1;
    }
    temp_val = atoi(buf);
    //temp_val = atoi(buf[0]);
    //printf("Temperature read = %u\n", temp_val);
    *current_temp = temp_val;

    if ((temp_val < TEMP_LOW_THRESHOLD) || (temp_val > TEMP_HIGH_THRESHOLD)) {
        printf("Threshold of  hit.\n");
        /* Notify sysrepo of the event */
    }
    return 0;
}

int initialize_temp_sensor_struct()
{
    uint32_t current_temp = 0;
    int ret = 0;
    strcpy(dpu_sensors[TEMP_SENSOR].name, "temperature-sensor");
    dpu_sensors[TEMP_SENSOR].hw_class = HWC_SENSOR;

    ret = get_current_temperature(&current_temp);
    dpu_sensors[TEMP_SENSOR].value = current_temp * 10; /* To report in milli range */

    dpu_sensors[TEMP_SENSOR].type = SVT_CELSIUS;
    dpu_sensors[TEMP_SENSOR].scale = SC_MILLI;
    dpu_sensors[TEMP_SENSOR].oper_status = SS_OK;
    ietf_date_and_time(dpu_sensors[TEMP_SENSOR].timestamp);

    return 0;
}

void dump_sensor(ietf_hw_sensor_data_t *dat)
{
    printf("NAME: %s\n", dat->name);
    printf("CLASS: %u\n", dat->hw_class);
    printf("VALUE: %u\n", dat->value);
    printf("TYPE: %u\n", dat->type);
    printf("SCALE: %u\n", dat->scale);
    printf("OPER_STATUS: %u\n", dat->oper_status);
    printf("TIMESTAMP: %s\n", dat->timestamp);
}
#if 0
void dump_alarm(ietf_alarm_t *alarm)
{
    printf("NAME: %s\n", dat->name);
    printf("CLASS: %u\n", dat->hw_class);
    printf("VALUE: %u\n", dat->value);
    printf("TYPE: %u\n", dat->type);
    printf("SCALE: %u\n", dat->scale);
    printf("OPER_STATUS: %u\n", dat->oper_status);
    printf("TIMESTAMP: %s\n", dat->timestamp);
}
#endif
int main()
{
   uint32_t current_temp = 0;
   //get_current_temperature(&current_temp);
   get_current_temperature_common(&current_temp);
   printf("Temperature read = %u\n", current_temp);

   initialize_temp_sensor_struct();
   dump_sensor(&dpu_sensors[TEMP_SENSOR]);

#if 0   
   /* Update the alarm list after sending notification */
   strcpy(dpu_alarms[TEMP_SENSOR].name,"temp-high");
   dpu_alarms[TEMP_SENSOR].last_changed = dpu_alarms[TEMP_SENSOR].time_created;
   ietf_date_and_time(dpu_alarms[TEMP_SENSOR].time_created); 
   dpu_alarms[TEMP_SENSOR].is_cleared = false;
   dpu_alarms[TEMP_SENSOR].severity = IS_CRITICAL;
   strcpy(dpu_alarms[TEMP_SENSOR].alarm_type_id, "Temerature Alarm");
   sprintf(dpu_alarms[TEMP_SENSOR].alarm_text, "Current temperature: %f degree celsius", 
                                          (dpu_sensors[TEMP_SENSOR].value)/1000);
   
   dump_alarm(&dpu_alarm[TEMP_SENSOR]);
#endif
   return 0;
}
