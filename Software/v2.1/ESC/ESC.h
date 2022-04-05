#ifndef ESC_H
#define ESC_H

#include "main.h"
#include "spi.h"
#include "usb_device.h"
#include "usbd_cdc_if.h"
#include "gpio.h"

#include "TMC4671.h"
#include "TMC4671_Constants.h"

#include "TMCL-Defines.h"
#include "TMCL-Variables.h"

int32_t getVM(uint8_t motor);
void activatePowerStage(uint8_t motor);
void initMotionController(uint8_t motor);

#endif
