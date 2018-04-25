
timeunit 1ps; //It specifies the time unit that all the delay will take in the simulation.
timeprecision 1ps;// It specifies the resolution in the simulation.

module MxV_TB;

	// Parameter Declarations
parameter WORD_LENGTH = 8;

// Input Ports
bit clk;
bit reset;
bit [63:0] vector;
bit [WORD_LENGTH-1:0] FIFOvalue;
bit FIFOpush;
bit [WORD_LENGTH-1:0] Matrix_length;

// Output Ports



/******************** Device Under Verification **************/
MxV
#(
	// Parameter Declarations
	.WORD_LENGTH(WORD_LENGTH)
)
DUV
(
	// Input Ports
	.clk(clk),
	.reset(reset),
	.vector(vector),
	.FIFOvalue(FIFOvalue),
	.FIFOpush(FIFOpush),
	.Matrix_length(Matrix_length)

	// Output Ports
);

/**************************************************************************/
	
/******************** Stimulus *************************/
initial // Clock generator
  begin
    clk = 1'b0;
    forever #2 clk = !clk;
  end
/*----------------------------------------------------------------------------------------*/
initial begin /*Reset*/
	# 0 reset = 1'b0;
	#0 
	#3 reset = 1'b1;
end
/*----------------------------------------------------------------------------------------*/
initial begin 
	# 0 pop  = 1'b0;
	# 80 pop  = 1'b1;
	# 4 pop  = 1'b1;
	# 4 pop  = 1'b1;
	# 4 pop  = 1'b1;
	# 4 pop  = 1'b0;
	# 4 pop  = 1'b1;
	# 4 pop  = 1'b0;
	# 4 pop  = 1'b1;
	# 4 pop  = 1'b0;
	# 4 pop  = 1'b1;
	# 4 pop  = 1'b0;
	# 4 pop  = 1'b1;
	# 4 pop  = 1'b0;
end 
/*----------------------------------------------------------------------------------------*/
initial begin 
	# 0  push = 0;
	# 10  push = 1'b1;
	# 4  push = 1'b1;
	# 4  push = 1'b1;
	# 4  push = 1'b1;
	# 4  push = 0;
	# 4  push = 1'b1;
	# 4  push = 0;
	# 4  push = 1'b1;
	# 4  push = 0;
	# 4  push = 1'b1;
	# 4  push = 0;
	# 4  push = 1'b1;
	# 4  push = 0;
end
/*----------------------------------------------------------------------------------------*/ 
initial begin
	# 0  DataInput = 1'b0;
	# 8  DataInput = 8;
	# 4  DataInput = 7;
	# 4  DataInput = 6;
	# 4  DataInput = 5;
	# 4  DataInput = 0;
	# 4  DataInput = 4;
	# 4  DataInput = 0;
	# 4  DataInput = 3;
	# 4  DataInput = 0;
	# 4  DataInput = 2;
	# 4  DataInput = 0;
	# 4  DataInput = 1;
end

endmodule
 
 
/*************************************************************/
/*************************************************************/

 