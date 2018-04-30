module Receiver
#(	parameter WORD_LENGTH = 8)(
// Input Ports
	input clk,
	input reset,
	input [Word_Length-1:0] Data_Input,
	input [WORD_LENGTH-1:0] Matrix_length,


// Output Ports
	output finish_command
)

bit finish_command_bit;
bit command_lenght_bit;
bit error_bit;
bit interrupt_bit;

wire [WORD_LENGTH-1:0] ReceivedData_w;
wire [WORD_LENGTH-1:0] Data_w;
wire [WORD_LENGTH-1:0] Byte_w;



UART Uart
(
    input [7:0] DataToTransmit,
	 input SerialDataRx,
    input reset,
    input Transmit,
    input clk,
	 input ClearInterrupt,
    .RxInterrupt(interrupt_bit),
	 output ParityError,
	 output SerialOutputTx,
	 .ReceivedData(ReceivedData_w)
);


Error_RX Error(
	.DataInput(ReceivedData_w),
	.DataOutput(Byte_w),
	.error(error_bit)
);

Data_RX (
	.clk(clk), 
	.reset(reset),
	.interrupt(interrupt_bit),
	.error(error_bit)
	.DataInput(Byte_w),

	
	//OUTPUTS
	output logic data_flag,
	output logic clear_interrupt,
	.DataOutput(Data_w)
);

CounterWithFunction_With_Sync_Reset
#(	
	.WORD_LENGTH(WORD_LENGTH)
)
counter_error
(	
	.clk(clk), 
	.reset(reset),
	input enable,
	input Sync_Reset,
	input [WORD_LENGTH-1:0] command_lenght,
	
	// Output Ports
	output [WORD_LENGTH-1:0] CountOut,
	output finish_count 
);

FIFO 
#(
	.Word_Length(WORD_LENGTH)
)
FIFOTA
(
	.clk(clk), 
	.reset(reset),
	.pop(),
	.push(),
	.Depth_of_FIFO(Matrix_length*Matrix_length),
	.DataInput(Data_w),
	.full(),
	.empty(),
	.DataOutput()
);

CounterWithFunction_With_Sync_Reset
#(	
	.WORD_LENGTH(WORD_LENGTH)
)
counterFIFOTA
(
	.clk(clk), 
	.reset(reset),
	input enable,
	input Sync_Reset,
	.command_lenght(command_lenght_bit),
	
	// Output Ports
	output [WORD_LENGTH-1:0] CountOut,
	.finish_count(finish_command_bit)
);

Load_M_V
#(
	.Word_Length(WORD_LENGTH)
)
load_M_V
(
	.clk(clk), 
	.reset(reset),
	.interrupt(interrupt_bit),
	.finish_command(finish_command_bit),
	input [Word_Length-1:0] Data_Input,
	
// Output Ports
	output [WORD_LENGTH-1:0] FIFOvalue,
	output [8*Word_Length-1:0] Vector,
	output [WORD_LENGTH-1:0] Matrix_length,
	.command_lenght(command_lenght_bit)
);

endmodule 