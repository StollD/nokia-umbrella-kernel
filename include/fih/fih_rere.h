#ifndef __FIH_RERE_H
#define __FIH_RERE_H

//#include <linux/qpnp/power-on.h>
#include <dt-bindings/msm/power-on.h>

/*
enum pon_restart_reason {
	PON_RESTART_REASON_UNKNOWN		= 0x00,
	PON_RESTART_REASON_RECOVERY		= 0x01,
	PON_RESTART_REASON_BOOTLOADER		= 0x02,
	PON_RESTART_REASON_RTC			= 0x03,
	PON_RESTART_REASON_DMVERITY_CORRUPTED	= 0x04,
	PON_RESTART_REASON_DMVERITY_ENFORCE	= 0x05,
	PON_RESTART_REASON_KEYS_CLEAR		= 0x06,
};
*/

#define FIH_RERE_ANDROID_MODE         0x00
#define FIH_RERE_RECOVERY_MODE        0x01
#define FIH_RERE_FASTBOOT_MODE        0x02
#define FIH_RERE_ALARM_BOOT           0x03
#define FIH_RERE_DM_VERITY_LOGGING    0x04
#define FIH_RERE_DM_VERITY_ENFORCING  0x05
#define FIH_RERE_DM_VERITY_KEYSCLEAR  0x06
#define FIH_RERE_FACTORY_MODE         0x07
#define FIH_RERE_EMERGENCY_DLOAD      0xFF

#define FIH_RERE_KERNEL_BUG           0x20
#define FIH_RERE_KERNEL_PANIC         0x21
#define FIH_RERE_KERNEL_RESTART       0x22
#define FIH_RERE_KERNEL_SHUTDOWN      0x23
#define FIH_RERE_KERNEL_WDOG          0x24
#define FIH_RERE_MODEM_FATAL          0x25
#define FIH_RERE_SYSTEM_CRASH         0x26
#define FIH_RERE_UNKNOWN_RESET        0x27
#define FIH_RERE_OVER_TAMPERATURE     0x28
#define FIH_RERE_MEMORY_TEST          0x29
#define FIH_RERE_SHUTDOWN_DEVICE      0x2A
#define FIH_RERE_REBOOT_DEVICE        0x2B

unsigned int fih_rere_rd_imem(void);
void fih_rere_wt_imem(unsigned int rere);

#endif

