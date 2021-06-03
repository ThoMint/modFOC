#ifndef TMCL_H
#define TMCL_H

#define MODULE_ADDRESS 1
#define HOST_ADDRESS 2

#define SW_TYPE_HIGH 		0x00
#define SW_TYPE_LOW  		0x14

#define SW_VERSION_HIGH 	1
#define SW_VERSION_LOW  	11

#include "main.h"
#include "spi.h"
#include "usb_device.h"
#include "usbd_cdc_if.h"
#include "gpio.h"

#include "TMC4671.h"
#include "TMC4671_Constants.h"

#include "TMCL-Defines.h"
#include "TMCL-Variables.h"

#include "ESC.h"

//void tmcl_init();
void tmcl_processCommand();
//void tmcl_resetCPU(uint8_t resetPeripherals);

#endif
