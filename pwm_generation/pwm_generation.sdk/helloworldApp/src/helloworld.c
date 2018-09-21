#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xil_io.h"
/**************************************************************************
****
*
* Copyright (C) 2009 - 2014 Xilinx, Inc. All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a
copy
* of this software and associated documentation files (the "Software"), to
deal
* in the Software without restriction, including without limitation the
rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included
in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be
used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
***************************************************************************
***/
/*
* helloworld.c: simple test application
*
* This application configures UART 16550 to baud rate 9600.
* PS7 UART (Zynq) is not initialized by this application, since
* bootrom/bsp configures it to baud rate 115200
*
* ------------------------------------------------
* | UART TYPE BAUD RATE |
* ------------------------------------------------
* uartns550 9600
* uartlite Configurable only in HW design
* ps7_uart 115200 (configured by bootrom/bsp)
*/
// SW - reg0 bit0 0x43C00000
// FreqHigh - reg1 0x43C00004
// FreqLow - reg2 0x43C00008
// Not used - reg3 0x43C00008
int main()
{
  unsigned int data = 0;
  init_platform();
  xil_printf("owo what's this\n\r");
  //what happens here is - we are writing the data from
  //the ARM processor to the addresses of our IPs
  Xil_Out32(0x43C00000, 0x0);
  xil_printf("1");
  // set div_factor_freqhigh 0x43C00004 - 4 is there for an offset
  Xil_Out32(0x43C00004, 10592);
  xil_printf("1");
  // set div_factor_freqlow
  Xil_Out32(0x43C00008, 689120);
  xil_printf("1");
  data = Xil_In32(0x41200004);
  xil_printf("1");
  xil_printf("%d \n\r",data );
  while(1)
  {
    // get SW data
    data = Xil_In32(0x41200000);
    // print SW value
    //xil_printf("%d \n\r",data );
    if (data & 0x1)
    {
      xil_printf("SW0 ON");
      Xil_Out32(0x43C00000, 0x1);
    }
    else
    {
      xil_printf("SW0 OFF");
      Xil_Out32(0x43C00000, 0x0);
    }
  }
}
