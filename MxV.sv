module MxV
#(
	parameter WORD_LENGTH = 8
	//parameter Matrix_length = 5
)
(
	input clk,
	input reset,
	input start,
	input [(WORD_LENGTH*WORD_LENGTH)-1:0] vector,
	input [WORD_LENGTH-1:0] FIFOvalue,
	input [WORD_LENGTH-1:0] Matrix_length,
	output transmit,
	output [WORD_LENGTH-1:0] results,
	output txenable_init
);


bit pop1_bit;
bit pop2_bit;
bit pop3_bit;
bit pop4_bit;

bit push1_bit;
bit push2_bit;
bit push3_bit;
bit push4_bit;
bit pushresult_bit;

bit full_FIFO1_bit;
bit full_FIFO2_bit;
bit full_FIFO3_bit;
bit full_FIFO4_bit;


wire [WORD_LENGTH-1:0] dataoutFIFO1_w;
wire [WORD_LENGTH-1:0] dataoutFIFO2_w;
wire [WORD_LENGTH-1:0] dataoutFIFO3_w;
wire [WORD_LENGTH-1:0] dataoutFIFO4_w;
wire [WORD_LENGTH-1:0] dataoutFIFOResult_w;
wire [WORD_LENGTH-1:0] mux_results_w;

wire [WORD_LENGTH-1:0] InputFIFOs_w;

wire [WORD_LENGTH-1:0] muxout1_w;
wire [WORD_LENGTH-1:0] muxout2_w;
wire [WORD_LENGTH-1:0] muxout3_w;
wire [WORD_LENGTH-1:0] muxout4_w;
wire [WORD_LENGTH-1:0] muxout_feedback_w;


wire [WORD_LENGTH-1:0] inputreg1_w;
wire [WORD_LENGTH-1:0] inputreg2_w;
wire [WORD_LENGTH-1:0] inputreg3_w;
wire [WORD_LENGTH-1:0] inputreg4_w;

wire [WORD_LENGTH-1:0] outputreg1_w;
wire [WORD_LENGTH-1:0] outputreg2_w;
wire [WORD_LENGTH-1:0] outputreg3_w;
wire [WORD_LENGTH-1:0] outputreg4_w;

wire [WORD_LENGTH-1:0] data_w;

bit enable_muxV_bit;
bit enable_mux_feedback_bit;
bit enable_mux0flag_bit;
bit start_load_bit;
bit enable_op_bit;
bit endop_bit;
bit op_bit;
bit endresult_b;
bit transmit_b;
bit tx_en_b;
bit last_cmd_b;

assign results = mux_results_w;
assign transmit = ((transmit_b | tx_en_b) | (last_cmd_b & ~endresult_b));

assign txenable_init = tx_en_b;


//------------- CONTROL -------------------------------------------------//

CounterWithFunction_OP counter_op
(
	// Input Ports
	.clk(clk),
	.reset(reset),
	.enable(enable_op_bit),
	.matrixSize_real(Matrix_length),
	.matrixSize(2*Matrix_length + 3'b100),
	
	// Output Ports
	.op_in_process(op_bit),
	.endop(endop_bit),
	.mux_flag(enable_muxV_bit),
	.result_push(pushresult_bit)
);

FSM_MxV_Control controlMxV
(
	// Input Ports
	.clk(clk),
	.reset(reset),
	.StartLoad(start),
	.EndLoad((full_FIFO1_bit & full_FIFO2_bit & full_FIFO3_bit & full_FIFO4_bit)),
	.EndOp(endop_bit),
	.EndTxResults(endresult_b),
	.Op(op_bit),
	.matrix_length(Matrix_length),
	// Output Ports
	.enable_counter(start_load_bit),
	.op_in_process(enable_op_bit),
	.pop_1(pop1_bit),
	.pop_2(pop2_bit),
	.pop_3(pop3_bit),
	.pop_4(pop4_bit),
	.transmit(transmit_b),
	.data(data_w),
	.tx_en(tx_en_b),
	.last_cmd(last_cmd_b)
);

Multiplexer2to1
#(
	.NBits(WORD_LENGTH)
)
mux_result
(
	.Selector(tx_en_b | last_cmd_b | (~tx_en_b & endresult_b)),
	.MUX_Data0(dataoutFIFOResult_w),
	.MUX_Data1(data_w),
	
	.MUX_Output(mux_results_w)

);

//------------- LOAD FIFO -----------------------------------------------//

CounterWithFunction_M_V
#(
	// Parameter Declarations
	.MAXIMUM_VALUE(8)
)
counterLOAD_FIFO
(
	// Input Ports
	.clk(clk),
	.reset(reset),
	.enable(start_load_bit),
	.matrixSize(Matrix_length),
	
	// Output Ports
	.push1(push1_bit),
	.push2(push2_bit),
	.push3(push3_bit),
	.push4(push4_bit),
	.mux0_flag(enable_mux0flag_bit)
);



Multiplexer2to1
#(
	.NBits(WORD_LENGTH)
)
MUXLOAD
(
	.Selector(enable_mux0flag_bit),
	.MUX_Data0(FIFOvalue),
	.MUX_Data1(8'd0),
	.MUX_Output(InputFIFOs_w)
);


//------------- PROCESSOR 1 -------------------------------------------------//
Multiplexer2to1
#(
	.NBits(WORD_LENGTH)
)
MUX1
(
	.Selector(enable_muxV_bit),
	.MUX_Data0(vector[63:56]),
	.MUX_Data1(vector[31:24]),
	.MUX_Output(muxout1_w)
);

FIFO 
#(
	.Word_Length(WORD_LENGTH)
)
FIFOMxV1
(
	.clk(clk), 
	.reset(reset),
	.pop(pop1_bit),
	.push(push1_bit & start_load_bit),
	.Depth_of_FIFO(2*Matrix_length),
	.DataInput(InputFIFOs_w),
	.full(full_FIFO1_bit),
	.empty(),
	.DataOutput(dataoutFIFO1_w)
);

Processor 
#(
	.WORD_LENGTH(WORD_LENGTH)
)
P1
(
	// INPUTS
	.FIFO_M(dataoutFIFO1_w),
	.Reg_V(8'd0),
	.Mux(muxout1_w),
	.Feeback(8'd0),
	// OUTPUTS
	.Result(inputreg1_w)
);

Register
#(
	.Word_Length(WORD_LENGTH)
)
RegMxV1
(
	// Input Ports
	.clk(clk),
	.reset(reset),
	.Data_Input(inputreg1_w),

	// Output Ports
	.Data_Output(outputreg1_w)
);

//------------- PROCESSOR 2 -------------------------------------------------//

Multiplexer2to1
#(
	.NBits(WORD_LENGTH)
)
MUX2
(
	.Selector(~enable_muxV_bit),
	.MUX_Data0(vector[55:48]),
	.MUX_Data1(vector[23:16]),
	.MUX_Output(muxout2_w)
);

FIFO 
#(
	.Word_Length(WORD_LENGTH)
)
FIFOMxV2
(
	.clk(clk), 
	.reset(reset),
	.pop(pop2_bit),
	.push(push2_bit & start_load_bit),
	.Depth_of_FIFO(2*Matrix_length),
	.DataInput(InputFIFOs_w),
	.full(full_FIFO2_bit),
	.empty(),
	.DataOutput(dataoutFIFO2_w)
);


Processor 
#(
	.WORD_LENGTH(WORD_LENGTH)
)
P2
(
	// INPUTS
	.FIFO_M(dataoutFIFO2_w),
	.Reg_V(outputreg1_w),
	.Mux(muxout2_w),
	.Feeback(8'd0),
	// OUTPUTS
	.Result(inputreg2_w)
);

Register
#(
	.Word_Length(WORD_LENGTH)
)
RegMxV2
(
	// Input Ports
	.clk(clk),
	.reset(reset),
	.Data_Input(inputreg2_w),

	// Output Ports
	.Data_Output(outputreg2_w)
);


//------------- PROCESSOR 3 -------------------------------------------------//

Multiplexer2to1
#(
	.NBits(WORD_LENGTH)
)
MUX3
(
	.Selector(enable_muxV_bit),
	.MUX_Data0(vector[47:40]),
	.MUX_Data1(vector[15:8]),
	.MUX_Output(muxout3_w)
);

FIFO 
#(
	.Word_Length(WORD_LENGTH)
)
FIFOMxV3
(
	.clk(clk), 
	.reset(reset),
	.pop(pop3_bit),
	.push(push3_bit & start_load_bit),
	.Depth_of_FIFO(2*Matrix_length),
	.DataInput(InputFIFOs_w),
	.full(full_FIFO3_bit),
	.empty(),
	.DataOutput(dataoutFIFO3_w)
);


Processor 
#(
	.WORD_LENGTH(WORD_LENGTH)
)
P3
(
	// INPUTS
	.FIFO_M(dataoutFIFO3_w),
	.Reg_V(outputreg2_w),
	.Mux(muxout3_w),
	.Feeback(8'd0),
	// OUTPUTS
	.Result(inputreg3_w)
);

Register
#(
	.Word_Length(WORD_LENGTH)
)
RegMxV3
(
	// Input Ports
	.clk(clk),
	.reset(reset),
	.Data_Input(inputreg3_w),

	// Output Ports
	.Data_Output(outputreg3_w)
);


//------------- PROCESSOR 4 -------------------------------------------------//

Multiplexer2to1
#(
	.NBits(WORD_LENGTH)
)
MUX4
(
	.Selector(~enable_muxV_bit),
	.MUX_Data0(vector[39:32]),
	.MUX_Data1(vector[7:0]),
	.MUX_Output(muxout4_w)
);

FIFO 
#(
	.Word_Length(WORD_LENGTH)
)
FIFOMxV4
(
	.clk(clk), 
	.reset(reset),
	.pop(pop4_bit),
	.push(push4_bit & start_load_bit),
	.Depth_of_FIFO(2*Matrix_length),
	.DataInput(InputFIFOs_w),
	.full(full_FIFO4_bit),
	.empty(),
	.DataOutput(dataoutFIFO4_w)
);


Processor 
#(
	.WORD_LENGTH(WORD_LENGTH)
)
P4
(
	// INPUTS
	.FIFO_M(dataoutFIFO4_w),
	.Reg_V(outputreg3_w),
	.Mux(muxout4_w),
	.Feeback(muxout_feedback_w),
	// OUTPUTS
	.Result(inputreg4_w)
);

Register
#(
	.Word_Length(WORD_LENGTH)
)
RegMxV4
(
	// Input Ports
	.clk(clk),
	.reset(reset),
	.Data_Input(inputreg4_w),

	// Output Ports
	.Data_Output(outputreg4_w)
);

//------------- FEEDBACK -------------------------------------------------//

Multiplexer2to1
#(
	.NBits(WORD_LENGTH)
)
MUX_FEEDBACK
(
	.Selector(enable_muxV_bit),
	.MUX_Data0(8'd0),
	.MUX_Data1(outputreg4_w),
	.MUX_Output(muxout_feedback_w)
);

FIFO 
#(
	.Word_Length(WORD_LENGTH)
)
FIFOMxVResult
(
	.clk(clk), 
	.reset(reset),
	.pop(transmit_b),
	.push(pushresult_bit & ~enable_muxV_bit),
	.Depth_of_FIFO(Matrix_length),
	.DataInput(outputreg4_w),
	.full(),
	.empty(endresult_b),
	.DataOutput(dataoutFIFOResult_w)
);

endmodule
