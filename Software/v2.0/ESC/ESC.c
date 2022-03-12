#include "ESC.h"

int32_t getVM(uint8_t motor)
{
	int32_t rawVMADC = tmc4671_readFieldWithDependency(motor, TMC4671_ADC_RAW_DATA, TMC4671_ADC_RAW_ADDR, 1, TMC4671_ADC_VM_RAW_MASK, TMC4671_ADC_VM_RAW_SHIFT) - VM_ADC_OFFSET;
	return ((rawVMADC * (VM_ADC_REF / VM_ADC_RES)) / (VM_DIV_FACTOR)) * 10;
}

void activatePowerStage(uint8_t motor)
{
	HAL_Delay(1);
	tmc4671_writeInt(motor, TMC4671_GPIO_dsADCI_CONFIG, 0xF1010009);
}

void initMotionController(uint8_t motor)
{
	// Motor type &  PWM configuration
	tmc4671_setPolePairs(motor, 14);
	tmc4671_setMotorType(motor, TMC4671_THREE_PHASE_BLDC);
	tmc4671_setPWMPolarity(motor, 0, 0);
	tmc4671_setPWMFreq(motor, 50000);
	tmc4671_setPWMBBM(motor, 25, 25);
	tmc4671_setPWMMode(motor, TMC4671_PWM_CENTRE, 1);

	// ADC configuration
	tmc4671_writeInt(motor, TMC4671_ADC_I_SELECT, 0x06000100);
	tmc4671_writeInt(motor, TMC4671_dsADC_MCFG_B_MCFG_A, 0x00100010);
	tmc4671_writeInt(motor, TMC4671_dsADC_MCLK_A, 0x60000000);
	tmc4671_writeInt(motor, TMC4671_dsADC_MCLK_B, 0x60000000);
	tmc4671_writeInt(motor, TMC4671_dsADC_MDEC_B_MDEC_A, 0x01F201F2);
	tmc4671_writeInt(motor, TMC4671_ADC_I0_SCALE_OFFSET, 0x010080DA);
	tmc4671_writeInt(motor, TMC4671_ADC_I1_SCALE_OFFSET, 0x01008092);

	// Digital hall settings
	tmc4671_writeInt(motor, TMC4671_HALL_MODE, 0x00000001);
	tmc4671_writeInt(motor, TMC4671_HALL_PHI_E_PHI_M_OFFSET, 0x00000000);

	// Feedback selection
	tmc4671_writeInt(motor, TMC4671_PHI_E_SELECTION, 0x00000005);
	tmc4671_writeInt(motor, TMC4671_VELOCITY_SELECTION, 0x0000000C);

	// Limits
	tmc4671_writeInt(motor, TMC4671_PID_TORQUE_FLUX_LIMITS, 0x000003E8);

	// PI settings
	tmc4671_writeInt(motor, TMC4671_PID_TORQUE_P_TORQUE_I, 0x02000200);
	tmc4671_writeInt(motor, TMC4671_PID_FLUX_P_FLUX_I, 0x02000200);
}
