module UART(
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

wire [7:0] Q_w;
wire par_w;
wire RxInterrupt_w;
wire RX_interrupt_enable_w;
bit clk_uart_b;
bit transmit_b;

assign RxInterrupt = RxInterrupt_w;
assign ParityError = par_w;
assign ReceivedData = Q_w;
	 
UART_RX Receive(
	.clk(clk),
	.reset(reset),
	.rx(SerialDataRx),
	.RxInterrupt(RX_interrupt_enable_w),
	.q(Q_w),
	.paridad(par_w)
);

UART_TX Transm(
	.In(DataToTransmit),
	.clk(clk),
	.rst(reset),
	.enable(transmit_b),
	.Q(SerialOutputTx),
	.clk_uart(clk_uart_b)
);

Register_With_Sync_Reset
#(
	.Word_Length(1)
)
regint
(
	.clk(clk),
	.reset(reset),
	.enable(RX_interrupt_enable_w | ClearInterrupt),
	.Sync_Reset(ClearInterrupt),
	.Data_Input(1'b1),
	.Data_Output(RxInterrupt_w)
);


Register
#(
	.Word_Length(1)
)
regenabletx
(
	// Input Ports
	.clk(clk_uart_b),
	.reset(reset),
	.Data_Input(Transmit),
	// Output Ports
	.Data_Output(transmit_b)
);



endmodule 