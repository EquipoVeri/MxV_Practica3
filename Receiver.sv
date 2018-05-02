module Receiver
#(	parameter WORD_LENGTH = 8)(
// Input Ports
	input clk,
	input reset,
	input interrupt_bit,
	input [WORD_LENGTH-1:0] Data_w,


// Output Ports
	//output finish_command,
	//output SerialOutputTx,
	output clearInterrupt,
	output [WORD_LENGTH-1:0] DataOutput,
	output [(WORD_LENGTH*WORD_LENGTH)-1:0] Data_Vector
);

bit finish_command_bit;
bit error_bit;
//bit interrupt_bit;
//bit clearInterrupt_bit;
bit data_ready_bit;
bit full_Matrix_bit;
bit send_result_bit;
bit enable_pop_bit;
bit enable_push_bit;
bit enable_counter_bit;
bit enable_size_bit;
bit reset_counter_bit;
bit finish_count_bit;
bit enable_vector_bit;
bit clear_vector_bit;

//wire [WORD_LENGTH-1:0] ReceivedData_w;
//wire [WORD_LENGTH-1:0] Data_w;
wire [WORD_LENGTH-1:0] Byte_w;
wire [WORD_LENGTH-1:0] Matrix_length_w;
wire [WORD_LENGTH-1:0] Data_FIFO;
wire [(WORD_LENGTH*WORD_LENGTH)-1:0] Data_Vector_w;
wire [WORD_LENGTH-1:0] command_lenght_wire;

//assign clearInterrupt = clearInterrupt_bit;
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

Load_M_V
#(
	.Word_Length(WORD_LENGTH)
)
load_M_V
(
	.clk(clk), 
	.reset(reset),
	.interrupt(interrupt_bit),
	.data_ready(data_ready_bit),
	.finish_count(finish_count_bit),
	.Data_Input(Data_w),
	
	.push(enable_push_bit),
	.pop(enable_pop_bit),
	.enable_counter(enable_counter_bit),
	.enable_size(enable_size_bit),
	.reset_counter(reset_counter_bit),
	.enable_vector(enable_vector_bit),
	.send_result(send_result_bit),
	.clear_vector(clear_vector_bit),
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
	.pop(enable_pop_bit),
	.push(enable_push_bit & ~interrupt_bit),
	.Depth_of_FIFO(Matrix_length_w*Matrix_length_w),
	.DataInput(Data_w),
	.full(full_Matrix_bit),
	.empty(),
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
	.enable(enable_vector_bit & interrupt_bit & ~finish_count_bit),
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
	.enable(enable_counter_bit & interrupt_bit),
	.Sync_Reset(reset_counter_bit),
	.CountOut(),
	.command_lenght(command_lenght_wire),
	.finish_count(finish_count_bit)
);

assign DataOutput = Data_FIFO;
assign Data_Vector = (Data_Vector_w >> (WORD_LENGTH-Matrix_length_w)*WORD_LENGTH);

endmodule 