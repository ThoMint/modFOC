/*
 * TMCL-Variables.h
 *
 *  Created on: 01.04.2020
 *      Author: OK / ED
 */

#ifndef TMCL_VARIABLES_H
#define TMCL_VARIABLES_H

#include "TMCL-Defines.h"

uint8_t TMCLReplyFormat;
uint8_t SpecialReply[9];
uint8_t TMCLSuppressReply;

TTMCLCommand ActualCommand;
TTMCLReply ActualReply;

#endif /* TMCL_VARIABLES_H */
