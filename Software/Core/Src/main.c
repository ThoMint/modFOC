/* USER CODE BEGIN Header */
/**
 ******************************************************************************
 * @file           : main.c
 * @brief          : Main program body
 ******************************************************************************
 * @attention
 *
 * <h2><center>&copy; Copyright (c) 2021 STMicroelectronics.
 * All rights reserved.</center></h2>
 *
 * This software component is licensed by ST under Ultimate Liberty license
 * SLA0044, the "License"; You may not use this file except in compliance with
 * the License. You may obtain a copy of the License at:
 *                             www.st.com/SLA0044
 *
 ******************************************************************************
 */
/* USER CODE END Header */
/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "spi.h"
#include "usb_device.h"
#include "gpio.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include "usbd_cdc_if.h"
#include "TMC4671.h"
#include "TMC4671_Constants.h"
#include "TMCL.h"
#include "ESC.h"
/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */
/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/

/* USER CODE BEGIN PV */
_Bool RUN_MODE;	//0-Normal	1-TMCL
/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
/* USER CODE BEGIN PFP */
uint8_t tmc4671_readwriteByte(uint8_t motor, uint8_t data, uint8_t lastTransfer);
/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */
int _write(int file, char *ptr, int len)
{
	for (int i = 0; i < len; i++)
	{
		ITM_SendChar(*ptr++);
	}
	return len;
}
/* USER CODE END 0 */

/**
 * @brief  The application entry point.
 * @retval int
 */
int main(void)
{
	/* USER CODE BEGIN 1 */

	/* USER CODE END 1 */

	/* MCU Configuration--------------------------------------------------------*/

	/* Reset of all peripherals, Initializes the Flash interface and the Systick. */
	HAL_Init();

	/* USER CODE BEGIN Init */

	/* USER CODE END Init */

	/* Configure the system clock */
	SystemClock_Config();

	/* USER CODE BEGIN SysInit */

	/* USER CODE END SysInit */

	/* Initialize all configured peripherals */
	MX_GPIO_Init();
	MX_SPI2_Init();
	MX_USB_Device_Init();
	/* USER CODE BEGIN 2 */
	//Indicate Initialization
	HAL_GPIO_WritePin(LED_GPIO_Port, LED1_Pin | LED2_Pin | LED3_Pin, GPIO_PIN_SET);
	//Wait for TMC boot
	HAL_Delay(500);
	//Determine Run Mode
	RUN_MODE = HAL_GPIO_ReadPin(AUX_SW_GPIO_Port, AUX_SW_Pin);
	//Setup GPIOs and calibrate ADC offset
	tmc4671_disablePWM(DEFAULT_MC);

	//Wait for sufficient supply voltage
	while (getVM(DEFAULT_MC) < 65)
		;

	//Calibrate the shunt amplifiers of the default motion controller
	calibrateShuntAmplifier(DEFAULT_MC);

	//Init the default motion controller
	if (RUN_MODE == RM_ESC)
	{
		initMotionController(DEFAULT_MC);
	}

	//Indicate Initialization finished
	HAL_GPIO_WritePin(LED_GPIO_Port, LED1_Pin | LED2_Pin | LED3_Pin, GPIO_PIN_RESET);
	/* USER CODE END 2 */

	/* Infinite loop */
	/* USER CODE BEGIN WHILE */
	while (1)
	{
		if (RUN_MODE == RM_TMCL)
		{
			tmcl_processCommand();
		}
		if (RUN_MODE == RM_ESC)
		{
			tmc4671_writeInt(DEFAULT_MC, TMC4671_MODE_RAMP_MODE_MOTION, 0x00000001);
			tmc4671_writeInt(DEFAULT_MC, TMC4671_PID_TORQUE_FLUX_TARGET, 0x03E80000);
		}
		/*
		 if (getVM(DEFAULT_MC) < 65)
		 {
		 HAL_GPIO_WritePin(LED_GPIO_Port, LED1_Pin | LED2_Pin | LED3_Pin, GPIO_PIN_SET);
		 tmc4671_writeInt(DEFAULT_MC, TMC4671_PID_TORQUE_FLUX_TARGET, 0x00000000);
		 if (RUN_MODE == RM_ESC)
		 {
		 tmc4671_disablePWM(DEFAULT_MC);
		 while (getVM(DEFAULT_MC) < 65);
		 calibrateShuntAmplifier(DEFAULT_MC);
		 initMotionController(DEFAULT_MC);
		 }
		 HAL_Delay(500);
		 HAL_GPIO_WritePin(LED_GPIO_Port, LED1_Pin | LED2_Pin | LED3_Pin, GPIO_PIN_RESET);
		 }
		 */
		/* USER CODE END WHILE */

		/* USER CODE BEGIN 3 */
	}
	/* USER CODE END 3 */
}

/**
 * @brief System Clock Configuration
 * @retval None
 */
void SystemClock_Config(void)
{
	RCC_OscInitTypeDef RCC_OscInitStruct =
	{ 0 };
	RCC_ClkInitTypeDef RCC_ClkInitStruct =
	{ 0 };
	RCC_PeriphCLKInitTypeDef PeriphClkInit =
	{ 0 };

	/** Configure the main internal regulator output voltage
	 */
	HAL_PWREx_ControlVoltageScaling(PWR_REGULATOR_VOLTAGE_SCALE1_BOOST);
	/** Initializes the RCC Oscillators according to the specified parameters
	 * in the RCC_OscInitTypeDef structure.
	 */
	RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI48 | RCC_OSCILLATORTYPE_HSE;
	RCC_OscInitStruct.HSEState = RCC_HSE_ON;
	RCC_OscInitStruct.HSI48State = RCC_HSI48_ON;
	RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
	RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSE;
	RCC_OscInitStruct.PLL.PLLM = RCC_PLLM_DIV4;
	RCC_OscInitStruct.PLL.PLLN = 85;
	RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV2;
	RCC_OscInitStruct.PLL.PLLQ = RCC_PLLQ_DIV2;
	RCC_OscInitStruct.PLL.PLLR = RCC_PLLR_DIV2;
	if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
	{
		Error_Handler();
	}
	/** Initializes the CPU, AHB and APB buses clocks
	 */
	RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK | RCC_CLOCKTYPE_SYSCLK | RCC_CLOCKTYPE_PCLK1 | RCC_CLOCKTYPE_PCLK2;
	RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
	RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
	RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV1;
	RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

	if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_4) != HAL_OK)
	{
		Error_Handler();
	}
	/** Initializes the peripherals clocks
	 */
	PeriphClkInit.PeriphClockSelection = RCC_PERIPHCLK_USB;
	PeriphClkInit.UsbClockSelection = RCC_USBCLKSOURCE_HSI48;
	if (HAL_RCCEx_PeriphCLKConfig(&PeriphClkInit) != HAL_OK)
	{
		Error_Handler();
	}
	/** Enables the Clock Security System
	 */
	HAL_RCC_EnableCSS();
}

/* USER CODE BEGIN 4 */
uint8_t tmc4671_readwriteByte(uint8_t motor, uint8_t data, uint8_t lastTransfer)
{
	uint8_t buffer;

	HAL_GPIO_WritePin(CS0_GPIO_Port, (CS2_Pin * ((motor >> 2) & 0x01)) | (CS1_Pin * ((motor >> 1) & 0x01)) | (CS0_Pin * ((motor >> 0) & 0x01)), GPIO_PIN_SET);

	HAL_SPI_TransmitReceive(&hspi2, &data, &buffer, 1, 100);

	if (lastTransfer)
	{
		HAL_GPIO_WritePin(CS0_GPIO_Port, (CS2_Pin * ((motor >> 2) & 0x01)) | (CS1_Pin * ((motor >> 1) & 0x01)) | (CS0_Pin * ((motor >> 0) & 0x01)), GPIO_PIN_RESET);
	}

	return buffer;
}
/* USER CODE END 4 */

/**
 * @brief  This function is executed in case of error occurrence.
 * @retval None
 */
void Error_Handler(void)
{
	/* USER CODE BEGIN Error_Handler_Debug */
	/* User can add his own implementation to report the HAL error return state */
	__disable_irq();
	while (1)
	{
	}
	/* USER CODE END Error_Handler_Debug */
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
