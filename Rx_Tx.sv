module Rx_Tx(
    input [7:0] DataToTransmit,
	 input SerialDataRx,
    input reset,
    input Transmit,
    input clk,
	 input ClearInterrupt,
    output RxInterrupt,
	 output ParityError,
	 output SerialOutputTx,
	 output [7:0] ReceivedData
);

wire RxInterrupt_w;
wire [7:0] ReceivedData_w;


UART uart(
    .DataToTransmit,
	 .SerialDataRx,
    .reset(reset),
    .Transmit,
    .clk(clk),
	 .ClearInterrupt,
	 
    .RxInterrupt(RxInterrupt_w),
	 .ParityError,
	 .SerialOutputTx,
	 .ReceivedData(ReceivedData_w)
);

Load_M_V
#(
	.Word_Length(WORD_LENGTH)
)
Recieve
(
	.clk,
	.reset,
	.RxInterrupt(RxInterrupt_w),
	.Data_Input(ReceivedData_w),
	
// Output Ports
	output [WORD_LENGTH-1:0] FIFOvalue,
	output [8*Word_Length-1:0] Vector,
	output [WORD_LENGTH-1:0] Matrix_length

);