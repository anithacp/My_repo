#include "prints.h"

#define IETF_NAME_LEN (64)
#define CURRENT_TEMP (50)
#define HIGH_THRESH (45)

int sysmond_alarms[] = { 34, 45, 65 };

int called()
{
	char alarm_text[IETF_NAME_LEN];
	sprintf(alarm_text, "DPU temperature %u crossed high threshold %u.", CURRENT_TEMP, HIGH_THRESH);
	printf("Text %s sysmond_alarms[2] = %u \n", alarm_text, sysmond_alarms[2]);
	return 0;
}
