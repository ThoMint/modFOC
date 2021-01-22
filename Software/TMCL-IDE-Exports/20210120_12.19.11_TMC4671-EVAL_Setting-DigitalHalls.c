// use TMC4671 API
#include "hal/ic/TMC4671.h"

// Motor type &  PWM configuration
tmc4671_writeInt(0, TMC4671_MOTOR_TYPE_N_POLE_PAIRS, 0x0003000F);
tmc4671_writeInt(0, TMC4671_PWM_POLARITIES, 0x00000000);
tmc4671_writeInt(0, TMC4671_PWM_MAXCNT, 0x00000F9F);
tmc4671_writeInt(0, TMC4671_PWM_BBM_H_BBM_L, 0x00001919);
tmc4671_writeInt(0, TMC4671_PWM_SV_CHOP, 0x00000007);

// ADC configuration
tmc4671_writeInt(0, TMC4671_ADC_I_SELECT, 0x18000100);
tmc4671_writeInt(0, TMC4671_dsADC_MCFG_B_MCFG_A, 0x00100010);
tmc4671_writeInt(0, TMC4671_dsADC_MCLK_A, 0x20000000);
tmc4671_writeInt(0, TMC4671_dsADC_MCLK_B, 0x00000000);
tmc4671_writeInt(0, TMC4671_dsADC_MDEC_B_MDEC_A, 0x014E014E);
tmc4671_writeInt(0, TMC4671_ADC_I0_SCALE_OFFSET, 0x010081D1);
tmc4671_writeInt(0, TMC4671_ADC_I1_SCALE_OFFSET, 0x010081FF);

// Digital hall settings
tmc4671_writeInt(0, TMC4671_HALL_MODE, 0x00000100);
tmc4671_writeInt(0, TMC4671_HALL_PHI_E_PHI_M_OFFSET, 0xD5560000);

// Feedback selection
tmc4671_writeInt(0, TMC4671_PHI_E_SELECTION, 0x00000005);
tmc4671_writeInt(0, TMC4671_VELOCITY_SELECTION, 0x0000000C);

// Limits
tmc4671_writeInt(0, TMC4671_PID_TORQUE_FLUX_LIMITS, 0x000003E8);

// PI settings
tmc4671_writeInt(0, TMC4671_PID_TORQUE_P_TORQUE_I, 0x01000100);
tmc4671_writeInt(0, TMC4671_PID_FLUX_P_FLUX_I, 0x01000100);

// ===== Digital hall test drive =====

// Switch to torque mode
tmc4671_writeInt(0, TMC4671_MODE_RAMP_MODE_MOTION, 0x00000001);

// Rotate right
tmc4671_writeInt(0, TMC4671_PID_TORQUE_FLUX_TARGET, 0x03E80000);
wait(3000);

// Rotate left
tmc4671_writeInt(0, TMC4671_PID_TORQUE_FLUX_TARGET, 0xFC180000);
wait(3000);

// Stop
tmc4671_writeInt(0, TMC4671_PID_TORQUE_FLUX_TARGET, 0x00000000);
