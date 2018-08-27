#ifndef SYSMOND_SENSORS_H
#define SYSMOND_SENSORS_H

#include <stddef.h>
#include <stdbool.h>
#include <stdint.h>

#include <time.h>

/**
 * A  node  using  this  data type represents the sensor  measurement  data  type
 * associated with a physical sensor value. The actual data units are  determined
 * by examining a node of this type  together  with the associated  sensor-value-
 * scale node.
 *
 * A  node of  this type SHOULD  be defined together  with nodes of  type sensor-
 * value-scale and sensor-value-precision. These three types are used to identify
 * the semantics of a node of type sensor-value.
 */
typedef enum sensor_value_type_e {
    /** A measure other than those listed below. */
    SVT_OTHER       = 1,
    /** An unknown measurement, or arbitrary, relative numbers. */
    SVT_UNKNOWN     = 2,
    /** A measure of electric potential (alternating current). */
    SVT_VOLTS_AC    = 3,
    /** A measure of electric potential (direct current). */
    SVT_VOLTS_DC    = 4,
    /** A measure of electric current. */
    SVT_AMPERES     = 5,
    /** A measure of power. */
    SVT_WATTS       = 6,
    /** A measure of frequency. */
    SVT_HERTZ       = 7,
    /** A measure of temperature. */
    SVT_CELSIUS     = 8,
    /** A measure of percent relative humidity. */
    SVT_PERCENT_RH  = 9,
    /** A measure of shaft revolutions per minute. */
    SVT_RPM         = 10,
    /** A measure of cubic meters per minute (airflow). */
    SVT_CMM         = 11,
    /** Value is one of 1 (true) or 2 (false). */
    SVT_TRUTH_VALUE = 12,
} sensor_value_type_t;

/**
 * A node using this data type represents a data scaling factor, represented with
 * an  International System of  Units  (SI)  prefix.  The  actual  data units are
 * determined  by  examining  a node  of this  type together with  the associated
 * sensor-value-type.
 *
 * A node of  this  type SHOULD be  defined together with nodes  of type  sensor-
 * value-type and  sensor-value-precision.  Together, associated nodes  of  these
 * three types are used to identify the semantics of a node of type sensor-value.
 */
typedef enum sensor_scale_e {
    SC_YOCTO = 1,   /*!< 10^-24 */
    SC_ZEPTO = 2,   /*!< 10^-21 */
    SC_ATTO  = 3,   /*!< 10^-18 */
    SC_FEMTO = 4,   /*!< 10^-15 */
    SC_PICO  = 5,   /*!< 10^-12 */
    SC_NANO  = 6,   /*!< 10^-9  */
    SC_MICRO = 7,   /*!< 10^-6  */
    SC_MILLI = 8,   /*!< 10^-3  */
    SC_UNITS = 9,   /*!< 10^0   */
    SC_KILO  = 10,  /*!< 10^3   */
    SC_MEGA  = 11,  /*!< 10^6   */
    SC_GIGA  = 12,  /*!< 10^9   */
    SC_TERA  = 13,  /*!< 10^12  */
    SC_EXA   = 14,  /*!< 10^15  */
    SC_PETA  = 15,  /*!< 10^18  */
    SC_ZETTA = 16,  /*!< 10^21  */
    SC_YOTTA = 17,  /*!< 10^24  */
} sensor_scale_t;

/**
 * A node using this data type represents the operational status of a physical sensor.
 */
typedef enum sensor_status_s {
    /**
     * Indicates that the server can obtain the sensor value.
     */
    SS_OK             = 1,

    /**
     * Indicates that the server presently cannot obtain the sensor value.
     */
    SS_UNAVAILABLE    = 2,

    /**
     * Indicates that the server believes the sensor is  broken. The sensor could
     * have a hard failure (disconnected wire), or a soft failure such as out-of-
     * range, jittery, or wildly fluctuating readings.
     */
    SS_NONOPERATIONAL = 3,
} sensor_status_t;

/**
 * An enumerated value that provides an indication  of  the general hardware type
 * of a particular physical entity. There are no restrictions as to the number of
 * entPhysicalEntries of each entPhysicalClass, which  must be instantiated by an
 * agent.
 */
typedef enum iana_hw_class_e {
       HWC_OTHER        = 1,
       HWC_UNKNOWN      = 2,
       HWC_CHASSIS      = 3,
       HWC_BACKPLANE    = 4,
       HWC_CONTAINER    = 5,
       HWC_POWERSUPPLY  = 6,
       HWC_FAN          = 7,
       HWC_SENSOR       = 8,
       HWC_MODULE       = 9,
       HWC_PORT         = 10,
       HWC_STACK        = 11,
       HWC_CPU          = 12,
       HWC_ENERGYOBJECT = 13,
       HWC_BATTERY      = 14,
       HWC_STORAGEDRIVE = 15
} iana_hw_class_t;

typedef enum ietf_severity_e {
    IS_CLEARED       = 1,
    IS_INDETERMINATE = 2,
    IS_MINOR         = 3,
    IS_WARNING       = 4,
    IS_MAJOR         = 5,
    IS_CRITICAL      = 6,
} ietf_severity_t;

#define IETF_NAME_LEN                       32
#define IETF_TIME_SIZE                      28

/**
 * Complete data about a single hardware object being monitored. This
 */
typedef struct ietf_hw_sensor_data_s {
    char                name[IETF_NAME_LEN];
    iana_hw_class_t     hw_class;

    int32_t             value;
    sensor_value_type_t type;
    sensor_scale_t      scale;
    sensor_status_t     oper_status;
    /* Use ietf_date_and_time function directly on this string. */
    char                timestamp[IETF_TIME_SIZE];
} ietf_hw_sensor_data_t;

typedef struct ietf_alarm_s {
    char                name[IETF_NAME_LEN];

    char                time_created[IETF_TIME_SIZE];
    bool                is_cleared;
    char                last_changed[IETF_TIME_SIZE];
    ietf_severity_t     severity;

    char                alarm_type_id[IETF_NAME_LEN];
    char                alarm_text[IETF_NAME_LEN];
} ietf_alarm_t;

/**
 * Get the current time and write it to the string in the ISO-8601 format. For example, "2018-02-22T19:05:16+00:00".
**/
static inline void ietf_date_and_time(char *out)
{
    time_t now;

    time(&now);
    strftime(out, IETF_TIME_SIZE, "%FT%TZ", gmtime(&now));
}

/**
 * Dump alarm to `syslog`.
 *
 * \arg alarm       The alarm to be dumped.
**/
void dump_alarm(ietf_alarm_t *alarm);

/**
 * Dump sensor data to `syslog`.
 *
 * \arg dat     The sensor data to be dumped.
 */
void dump_sensor(ietf_hw_sensor_data_t *dat);

#endif /* SYSMOND_SENSORS_H */
