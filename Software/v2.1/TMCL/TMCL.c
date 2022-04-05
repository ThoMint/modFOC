#include "TMCL.h"

const char *VersionString = "0011V307";
uint32_t commLoopCounter = 0;

extern uint8_t USB_retrieveCMD(uint8_t *Buf, uint32_t *Len);

void tmcl_getVersion()
{
	uint32_t i;

	if (ActualCommand.Type == 0)
	{
		TMCLReplyFormat = RF_SPECIAL;
		SpecialReply[0] = HOST_ADDRESS;
		for (i = 0; i < 8; i++)
			SpecialReply[i + 1] = VersionString[i];
	}
	else if (ActualCommand.Type == 1)
	{
		ActualReply.Value.Byte[3] = ((VersionString[0] - '0') * 10) + (VersionString[1] - '0');
		ActualReply.Value.Byte[2] = ((VersionString[2] - '0') * 10) + (VersionString[3] - '0');
		ActualReply.Value.Byte[1] = (VersionString[5] - '0');
		ActualReply.Value.Byte[0] = ((VersionString[6] - '0') * 10) + (VersionString[7] - '0');
	}
}

void tmcl_getInput()
{
	switch (ActualCommand.Type)
	{
	case 5: // analog_inputs
		ActualReply.Value.Int32 = getVM(DEFAULT_MC);
		break;
	default:
		ActualReply.Status = REPLY_INVALID_VALUE;
		break;
	}
}

void tmcl_executeActualCommand()
{
	// prepare reply command
	ActualReply.Opcode = ActualCommand.Opcode;
	ActualReply.Status = REPLY_OK;
	ActualReply.Value.Int32 = ActualCommand.Value.Int32;

	printf("Opcode: %d\n", ActualCommand.Opcode);

	switch (ActualCommand.Opcode)
	{
	case TMCL_GetVersion:
		tmcl_getVersion();
		break;
	case TMCL_GIO:
		tmcl_getInput();
		break;
	case TMCL_readRegisterChannel_1:
		if (ActualCommand.Motor == 0)
			ActualReply.Value.Int32 = tmc4671_readInt(DEFAULT_MC, ActualCommand.Type);
		break;
	case TMCL_writeRegisterChannel_1:
		if (ActualCommand.Motor == 0)
			tmc4671_writeInt(DEFAULT_MC, ActualCommand.Type, ActualCommand.Value.Int32);
		break;
	}
}

void tmcl_processCommand()
{
	static uint8_t TMCLCommandState;
	uint32_t i;
	uint32_t CMDLen;

	uint8_t USBCmd[9];
	uint8_t USBReply[9];

	/* send reply for last TMCL request */
	if (TMCLCommandState == TCS_USB) // reply via USB
	{
		if (TMCLReplyFormat == RF_STANDARD)
		{
			uint8_t Checksum = HOST_ADDRESS + MODULE_ADDRESS + ActualReply.Status + ActualReply.Opcode + ActualReply.Value.Byte[3] + ActualReply.Value.Byte[2] + ActualReply.Value.Byte[1] + ActualReply.Value.Byte[0];

			USBReply[0] = HOST_ADDRESS;
			USBReply[1] = MODULE_ADDRESS;
			USBReply[2] = ActualReply.Status;
			USBReply[3] = ActualReply.Opcode;
			USBReply[4] = ActualReply.Value.Byte[3];
			USBReply[5] = ActualReply.Value.Byte[2];
			USBReply[6] = ActualReply.Value.Byte[1];
			USBReply[7] = ActualReply.Value.Byte[0];
			USBReply[8] = Checksum;
		}
		else if (TMCLReplyFormat == RF_SPECIAL)
		{
			for (i = 0; i < 9; i++)
			{
				USBReply[i] = SpecialReply[i];
			}
		}
		CDC_Transmit_FS(USBReply, 9);
	}
	else if (TMCLCommandState == TCS_USB_ERROR) // last command had a wrong checksum
	{
		ActualReply.Opcode = 0;
		ActualReply.Status = REPLY_CHKERR;
		ActualReply.Value.Int32 = 0;

		uint8_t Checksum = HOST_ADDRESS + MODULE_ADDRESS + ActualReply.Status + ActualReply.Opcode + ActualReply.Value.Byte[3] + ActualReply.Value.Byte[2] + ActualReply.Value.Byte[1] + ActualReply.Value.Byte[0];

		USBReply[0] = HOST_ADDRESS;
		USBReply[1] = MODULE_ADDRESS;
		USBReply[2] = ActualReply.Status;
		USBReply[3] = ActualReply.Opcode;
		USBReply[4] = ActualReply.Value.Byte[3];
		USBReply[5] = ActualReply.Value.Byte[2];
		USBReply[6] = ActualReply.Value.Byte[1];
		USBReply[7] = ActualReply.Value.Byte[0];
		USBReply[8] = Checksum;

		CDC_Transmit_FS(USBReply, 9);
	}

	// reset command state (reply has been send)
	TMCLCommandState = TCS_IDLE;
	TMCLReplyFormat = RF_STANDARD;

	// last command was a reset?

	/* read next request */
	if (USB_retrieveCMD(USBCmd, &CMDLen))
	{
		if (CMDLen == 9)
		{
			commLoopCounter++;

			if (USBCmd[0] == MODULE_ADDRESS)	 // check address
			{
				uint8_t checksum = 0;
				for (i = 0; i < 8; i++)
					checksum += USBCmd[i];

				if (checksum == USBCmd[8])  // check checksum
				{
					ActualCommand.Opcode = USBCmd[1];
					ActualCommand.Type = USBCmd[2];
					ActualCommand.Motor = USBCmd[3];
					ActualCommand.Value.Byte[3] = USBCmd[4];
					ActualCommand.Value.Byte[2] = USBCmd[5];
					ActualCommand.Value.Byte[1] = USBCmd[6];
					ActualCommand.Value.Byte[0] = USBCmd[7];
					TMCLCommandState = TCS_USB;
				}
				else
					TMCLCommandState = TCS_USB_ERROR;  // checksum was wrong
			}
		}
	}

	// handle request after successful reading
	if (TMCLCommandState != TCS_IDLE && TMCLCommandState != TCS_UART_ERROR && TMCLCommandState != TCS_RS485_ERROR && TMCLCommandState != TCS_USB_ERROR)
	{
		tmcl_executeActualCommand();
	}
}
