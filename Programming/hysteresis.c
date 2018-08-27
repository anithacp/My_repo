#include <stdio.h>
#include <stdbool.h>
#include <math.h>
#include <complex.h>

#define LOW_THRESH (-1 * 100) 
#define HIGH_THRESH (8 * 100)
#define GUARD_VAL (1 * 100)
typedef enum  alarm_e {
  ALARM_NONE = 0,
  ALARM_LOW,
  ALARM_HIGH,
} alarm_t;
alarm_t alarm = ALARM_NONE;

const int values[] = { 0,0,-1,-2,0,0,-1,2,1,0,-1,-2,3,2,3,2,3,2,3,2,3,3,2,3,4,5,6,7,8,7,8,9,8,7,8,7,6,7,6,7,8 };

const unsigned int power_val[] = { 5036, 5038, 5049, 6000, 5900 };

void compute_avg()
{
    int i = 0, sum = 0;;
    float avg = 0.0;
    unsigned int int_avg = 0;
    int num_entries = sizeof(power_val)/sizeof(unsigned int);
    for (i = 0; i < num_entries; i++) {
        sum += power_val[i];
    }
    avg = sum/(float)num_entries;
    int_avg = round(avg);
    printf("Avg (float) = %f Avg (int) = %u\n", avg, int_avg);
}
void test_notifications( const int current_val)
{
        bool send_alarm = false, clear = false, raise = false;
	switch (alarm) {
	    case ALARM_HIGH:
		/* Check clearing conditions */
		if (current_val < (HIGH_THRESH - GUARD_VAL)) {
		    alarm = ALARM_NONE;
                    send_alarm = true;
                    clear = true;
                }
		break;

	    case ALARM_LOW:
		/* Check clearing conditions */
		if (current_val > (LOW_THRESH + GUARD_VAL)) {
		    alarm = ALARM_NONE;
                    send_alarm = true;
                    clear = true;
                }
		break;

	    case ALARM_NONE:
		/* Check raising conditions */
		if (current_val >= HIGH_THRESH) {
		    alarm = ALARM_HIGH;
                    send_alarm = true;
                    raise = true;
                }
		else if (current_val <= LOW_THRESH) {
		    alarm = ALARM_LOW;
                    send_alarm = true;
                    raise = true;
                }
		break;

	    default:
		break;
	}
	printf("Val %d : Alarm %u send_alarm %u Clear %u Raise %u\n", current_val, alarm, send_alarm, clear, raise);
}

int main()
{
    int i, n;
    n = sizeof(values)/sizeof(unsigned int);
    printf("Size = %u\n", n);
    for (i = 0; i < n; i++) {
        test_notifications((values[i] * 100));
    }

    //compute_avg();

    return 0;
}

