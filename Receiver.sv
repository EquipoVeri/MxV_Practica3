module Receiver
#(	parameter WORD_LENGTH = 8)(
// Input Ports
	input clk,
	input reset,
	input interrupt,
	input [WORD_LENGTH-1:0] Data_w,
	input pop,
	
// Output Ports
	output clearInterrupt,
	output enable_load,
	output empty,
	output [WORD_LENGTH-1:0] DataOutput,
	output [(WORD_LENGTH*WORD_LENGTH)-1:0] Data_Vector,
	output [WORD_LENGTH-1:0] Matrix_length
);

bit finish_command_bit;
bit error_bit;
//bit interrupt;
bit clearInterrupt_bit;
bit data_ready_bit;
bit full_Matrix_bit;
bit send_result_bit;
bit enable_push_bit;
bit enable_counter_bit;
bit enable_size_bit;
bit reset_counter_bit;
bit finish_count_bit;
bit enable_vector_bit;
bit clear_vector_bit;
bit enable_load_bit;
bit empty_bit;

//wire [WORD_LENGTH-1:0] ReceivedData_w;
//wire [WORD_LENGTH-1:0] Data_w;
wire [WORD_LENGTH-1:0] Byte_w;
wire [WORD_LENGTH-1:0] Matrix_length_w;
wire [WORD_LENGTH-1:0] Data_FIFO;
wire [(WORD_LENGTH*WORD_LENGTH)-1:0] Data_Vector_w;
wire [WORD_LENGTH-1:0] command_lenght_wire;


Load_M_V
#(
	.Word_Length(WORD_LENGTH)
)
load_M_V
(
	.clk(clk), 
	.reset(reset),
	.interrupt(interrupt),
	.data_ready(data_ready_bit),
	.finish_count(finish_count_bit),
	.Data_Input(Data_w),
	
	.push(enable_push_bit),
	.enable_counter(enable_counter_bit),
	.enable_size(enable_size_bit),
	.reset_counter(reset_counter_bit),
	.enable_vector(enable_vector_bit),
	.send_result(send_result_bit),
	.clear_vector(clear_vector_bit),
	.enable_load(enable_load_bit),
	.clearInterrupt(clearInterrupt_bit),
	.Matrix_length(Matrix_length_w),
	.Command_lenght(command_lenght_wire)
);

Register_With_Clock_Enable
#(
	.Word_Length(WORD_LENGTH)
)
Register_size
(
	.clk(clk), 
	.reset(reset),
	.enable(enable_size_bit),
	.Data_Input(Data_w),
	.Data_Output()
);

FIFO 
#(
	.Word_Length(WORD_LENGTH)
)
FIFOTA
(
	.clk(clk), 
	.reset(reset),
	.pop(pop),
	.push(enable_push_bit & ~interrupt),
	.Depth_of_FIFO(Matrix_length_w*Matrix_length_w),
	.DataInput(Data_w),
	.full(full_Matrix_bit),
	.empty(empty_bit),
	.DataOutput(Data_FIFO)
);

Shift_register
#(
	.Word_Length(WORD_LENGTH)
)
Register_Vector
(
	.clk(clk), 
	.reset(reset),
	.enable(enable_vector_bit & interrupt & ~finish_count_bit),
	.Sync_Reset(clear_vector_bit),
	.Data_Input(Data_w),
	.Data_Output(Data_Vector_w)
);

CounterWithFunction_With_Sync_Reset
#(	
	.WORD_LENGTH(WORD_LENGTH)
)
counter_Lenght_Command
(
	.clk(clk), 
	.reset(reset),
	.enable(enable_counter_bit & interrupt),
	.Sync_Reset(reset_counter_bit),
	.CountOut(),
	.command_lenght(command_lenght_wire),
	.finish_count(finish_count_bit)
);

/*
UART Uart
(	
	.clk(clk), 
	.reset(reset),
   .DataToTransmit(),
	.SerialDataRx(),
   .Transmit(),
	.ClearInterrupt(clearInterrupt_bit),
   .RxInterrupt(interrupt_bit),
	.ParityError(),
	.SerialOutputTx(),
	.ReceivedData(ReceivedData_w)
);

UART_RX Receive(
	.clk(clk),
	.reset(reset),
	.rx(),
	.RxInterrupt(interrupt_bit),
	.q(ReceivedData_w),
	.paridad()
);*/


/*
Error_RX Error(
	.DataInput(ReceivedData_w),
	.DataOutput(Data_w),
	.error(error_bit)
);

Data_RX Data
(
	.clk(clk), 
	.reset(reset),
	.interrupt(interrupt_bit),
	.error(error_bit),
	.DataInput(Byte_w),

	.data_flag(data_ready_bit),
	.clear_interrupt(clearInterrupt_bit),
	.DataOutput(Data_w)
);
*/

assign DataOutput = Data_FIFO;
assign Data_Vector = (Data_Vector_w >> (WORD_LENGTH-Matrix_length_w)*WORD_LENGTH);
assign Matrix_length = Matrix_length_w;
assign clearInterrupt = clearInterrupt_bit;
assign enable_load = enable_load_bit;
assign empty = empty_bit;

endmodule 