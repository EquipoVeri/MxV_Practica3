module P3
#(
	parameter WORD_LENGTH = 8
)
(
	input clk,
	input reset,
	input start,
	input SerialDataRx,
	input ClearInterrupt,
	input [63:0] vector,
	input [WORD_LENGTH-1:0] FIFOvalue,
	input [31:0] Matrix_length,
	output SerialOutputTx
);

bit clk_MxV;
bit transmitMxV_b;
bit flag_transmit_b;
bit serialout_b;
bit enable_tx_b;
bit enable_uarttx_b;

assign SerialOutputTx = serialout_b;

wire [WORD_LENGTH-1:0] data_result_w;

UART uartmod
(
    .DataToTransmit(data_result_w),
	 .SerialDataRx(SerialDataRx),
    .reset(reset),
    .Transmit(enable_tx_b),
    .clk(clk),
	 .ClearInterrupt(ClearInterrupt),
    .RxInterrupt(),
	 .ParityError(),
	 .SerialOutputTx(serialout_b),
	 .ReceivedData()
);

MxV
#(
	.WORD_LENGTH(WORD_LENGTH)
)
Matrix_Vector
(
	// Input ports
	.clk(clk_MxV),
	.reset(reset),
	.start(start),
	.vector(vector),
	.FIFOvalue(FIFOvalue),
	.FIFOpush(),
	.Matrix_length(Matrix_length),
	// output ports
	.transmit(transmitMxV_b),
	.results(data_result_w)
);

ClockDivider
#(
	// Parameter Declarations
	.FREQUENCY(5000),
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
	.enable(transmitMxV_b),
	
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
