module P3
#(
	parameter WORD_LENGTH = 8
)
(
	input clk,
	input reset,
	input SerialDataRx,
	output SerialOutputTx
);

bit clk_MxV;
bit transmitMxV_b;
bit flag_transmit_b;
bit serialout_b;
bit enable_tx_b;
bit enable_uarttx_b;
bit tx_enable_init_b;
bit start_b;
bit interrupt_bit;
bit clearInterrupt_bit;
bit enable_load_bit;
bit empty_bit;
bit pop_bit;
bit pop_register_bit;
bit start_bit;

assign SerialOutputTx = serialout_b;

wire [WORD_LENGTH-1:0] data_result_w;
wire [WORD_LENGTH-1:0] ReceivedData_w;
wire [WORD_LENGTH-1:0] DataFIFO;
wire [WORD_LENGTH-1:0] DataFIFOTA;
wire [(WORD_LENGTH*WORD_LENGTH)-1:0] vector;
wire [WORD_LENGTH-1:0] Matrix_length;

UART uartmod
(
    .DataToTransmit(data_result_w),
	 .SerialDataRx(SerialDataRx),
    .reset(reset),
    .Transmit(enable_tx_b),
    .clk(clk),
	 .ClearInterrupt(clearInterrupt_bit),
    .RxInterrupt(interrupt_bit),
	 .ParityError(),
	 .SerialOutputTx(serialout_b),
	 .ReceivedData(ReceivedData_w)
);

Receiver
#(
	.WORD_LENGTH(WORD_LENGTH)
)
RX
(
	.clk(clk),
	.clk_MxV(clk_MxV),
	.reset(reset),
	.interrupt(interrupt_bit),
	.pop(pop_register_bit),
	.Data_w(ReceivedData_w),
	.clearInterrupt(clearInterrupt_bit),
	.enable_load(enable_load_bit),
	.empty(empty_bit),
	.start(start_bit),
	.DataOutput(DataFIFOTA),
	.Data_Vector(vector),
	.Matrix_length(Matrix_length)
);

One_Shot shot_start(
	.clk(clk_MxV),
	.reset(reset),
	.Start(start_bit),
	.Shot(start_b)
);

Control_Pop
#(
	.WORD_LENGTH(WORD_LENGTH)
)
Control_Pop
(
	.clk(clk_MxV),
	.reset(reset),
	.start(start_b),
	.empty(empty_bit),
	.FIFOTAvalue(DataFIFOTA),
	.Matrix_length(Matrix_length),
	.pop(pop_register_bit),
	.FIFOvalue(DataFIFO)
);
/*
One_Shot shot_push (
	.clk(clk),
	.reset(reset),
	.Start(push_Mv & clk_MxV),
	.Shot(push_Mv_reg)
);

One_Shot shot_Pop(
	.clk(clk),
	.reset(reset),
	.Start(pop_bit & clk_MxV),
	.Shot(pop_register_bit)
);

Register
#(
	.Word_Length(1)
)
Register_Pop
(
	.clk(clk),
	.reset(reset),
	.Data_Input(pop_bit),
	.Data_Output(pop_register_bit)
);
*/
MxV
#(
	.WORD_LENGTH(WORD_LENGTH)
)
Matrix_Vector
(
	// Input ports
	.clk(clk_MxV),
	.reset(reset),
	.start(start_b),
	.vector(vector),
	.FIFOvalue(DataFIFO),
	.Matrix_length(Matrix_length),
	// output ports
	.transmit(transmitMxV_b),
	.results(data_result_w),
	.txenable_init(tx_enable_init_b)
);

ClockDivider
#(
	// Parameter Declarations
	.FREQUENCY(500),
	.REFERENCE_CLOCK(50_000_000)
)
clkDivider_MxV
(
	// Input Ports
	.clk_FPGA(clk),
	.reset(reset),
	// Output Ports
	.clock_signal(clk_MxV)
);

CounterWithFunction_Result counter_res
(
	// Input Ports
	.clk(clk),
	.reset(reset),
	.enable(transmitMxV_b | tx_enable_init_b),
	
	// Output Ports
	.flag(flag_transmit_b)
);

CounterWithFunction_EnableTX count_enable_tx
(
	// Input Ports
	.clk(clk),
	.reset(reset),
	.enable(enable_tx_b),
	// Output Ports
	.flag(enable_uarttx_b) 
);

FSM_EnableTX statem_enabletx
(
	// Input Ports
	.clk(clk),
	.reset(reset),
	.Start(flag_transmit_b),
	.stop_enable(enable_uarttx_b),
	// Output Ports
	.enable_tx(enable_tx_b)	
);

endmodule
