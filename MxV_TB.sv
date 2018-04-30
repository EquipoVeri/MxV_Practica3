
timeunit 1ps; //It specifies the time unit that all the delay will take in the simulation.
timeprecision 1ps;// It specifies the resolution in the simulation.

module MxV_TB;

	// Parameter Declarations
parameter WORD_LENGTH = 8;

// Input Ports
bit clk;
bit reset;
bit start;
bit [63:0] vector;
bit [WORD_LENGTH-1:0] FIFOvalue;
bit FIFOpush;
bit [31:0] Matrix_length;

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
	.start(start),
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
    forever #2 clk = !clk;
  end
/*----------------------------------------------------------------------------------------*/
initial begin /*Reset*/
	# 0 reset = 1'b0;
	//# 0 vector = 64'b0000011100000110000001010000010000000011000000100000000100000000;	//8x8
	//# 0 vector = 64'b0000000000000000000000000000010000000011000000100000000100000000;	//5x5
	# 0 vector = 64'b0000000000000000000000000000000000000000000000100000000100000000;
	#0 Matrix_length = 3;
	#2 reset = 1'b1;
	#4 start = 1'b1;
	#4 start = 1'b0;
end
/*----------------------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------------------*/ 
initial begin
	# 0  FIFOvalue = 1'b0;
	# 10  FIFOvalue = 0;
	# 4  FIFOvalue = 1;
	# 4  FIFOvalue = 2;
	# 4  FIFOvalue = 0;
	# 4  FIFOvalue = 0;
	# 4  FIFOvalue = 0;
	# 4  FIFOvalue = 0;
	# 4  FIFOvalue = 0;
	# 4  FIFOvalue = 3;
	# 4  FIFOvalue = 4;
	# 4  FIFOvalue = 5;
	# 4  FIFOvalue = 0;
	# 4  FIFOvalue = 0;			//3x3
	# 4  FIFOvalue = 0;
	# 4  FIFOvalue = 0;
	# 4  FIFOvalue = 0;
	# 4  FIFOvalue = 6;
	# 4  FIFOvalue = 7;
	# 4  FIFOvalue = 8;
	# 4  FIFOvalue = 0;					
	# 4  FIFOvalue = 0;
	# 4  FIFOvalue = 0;
	# 4  FIFOvalue = 0;
	# 4  FIFOvalue = 0;
	/*# 10  FIFOvalue = 0;
	# 4  FIFOvalue = 1;
	# 4  FIFOvalue = 2;
	# 4  FIFOvalue = 3;
	# 4  FIFOvalue = 4;
	# 4  FIFOvalue = 0;
	# 4  FIFOvalue = 0;
	# 4  FIFOvalue = 0;
	# 4  FIFOvalue = 5;
	# 4  FIFOvalue = 6;
	# 4  FIFOvalue = 7;
	# 4  FIFOvalue = 8;
	# 4  FIFOvalue = 9;
	# 4  FIFOvalue = 0;
	# 4  FIFOvalue = 0;
	# 4  FIFOvalue = 0;
	# 4  FIFOvalue = 10;
	# 4  FIFOvalue = 11;
	# 4  FIFOvalue = 12;
	# 4  FIFOvalue = 13;					//5x5
	# 4  FIFOvalue = 14;
	# 4  FIFOvalue = 0;
	# 4  FIFOvalue = 0;
	# 4  FIFOvalue = 0;
	# 4  FIFOvalue = 15;
	# 4  FIFOvalue = 16;
	# 4  FIFOvalue = 17;
	# 4  FIFOvalue = 18;
	# 4  FIFOvalue = 19;
	# 4  FIFOvalue = 0;
	# 4  FIFOvalue = 0;
	# 4  FIFOvalue = 0;
	# 4  FIFOvalue = 0;
	# 4  FIFOvalue = 1;
	# 4  FIFOvalue = 2;
	# 4  FIFOvalue = 3;
	# 4  FIFOvalue = 4;
	# 4  FIFOvalue = 0;
	# 4  FIFOvalue = 0;
	# 4  FIFOvalue = 0;*/
/*	# 10  FIFOvalue = 0;
	# 4  FIFOvalue = 1;
	# 4  FIFOvalue = 2;
	# 4  FIFOvalue = 3;
	# 4  FIFOvalue = 4;
	# 4  FIFOvalue = 5;
	# 4  FIFOvalue = 6;
	# 4  FIFOvalue = 7;
	# 4  FIFOvalue = 8;
	# 4  FIFOvalue = 9;
	# 4  FIFOvalue = 10;
	# 4  FIFOvalue = 11;
	# 4  FIFOvalue = 12;
	# 4  FIFOvalue = 13;
	# 4  FIFOvalue = 14;
	# 4  FIFOvalue = 15;
	# 4  FIFOvalue = 16;
	# 4  FIFOvalue = 17;
	# 4  FIFOvalue = 18;
	# 4  FIFOvalue = 19;
	# 4  FIFOvalue = 0;
	# 4  FIFOvalue = 1;
	# 4  FIFOvalue = 2;
	# 4  FIFOvalue = 3;
	# 4  FIFOvalue = 4;
	# 4  FIFOvalue = 1;
	# 4  FIFOvalue = 3;
	# 4  FIFOvalue = 8;
	# 4  FIFOvalue = 0;
	# 4  FIFOvalue = 11;
	# 4  FIFOvalue = -5;
	# 4  FIFOvalue = 2;
	# 4  FIFOvalue = 1;
	# 4  FIFOvalue = 3;
	# 4  FIFOvalue = 10;
	# 4  FIFOvalue = -9;
	# 4  FIFOvalue = 1;
	# 4  FIFOvalue = 2;
	# 4  FIFOvalue = 3;
	# 4  FIFOvalue = 4;
	# 4  FIFOvalue = 5;
	# 4  FIFOvalue = 6;
	# 4  FIFOvalue = 7;				//8x8
	# 4  FIFOvalue = 8;
	# 4  FIFOvalue = 9;
	# 4  FIFOvalue = 1;
	# 4  FIFOvalue = 2;
	# 4  FIFOvalue = 3;
	# 4  FIFOvalue = 4;
	# 4  FIFOvalue = 1;
	# 4  FIFOvalue = 2;
	# 4  FIFOvalue = 3;
	# 4  FIFOvalue = 4;
	# 4  FIFOvalue = 5;
	# 4  FIFOvalue = 6;
	# 4  FIFOvalue = 7;
	# 4  FIFOvalue = 8;
	# 4  FIFOvalue = 9;
	# 4  FIFOvalue = 12;
	# 4  FIFOvalue = -2;
	# 4  FIFOvalue = -2;
	# 4  FIFOvalue = -1;
	# 4  FIFOvalue = -3;
	# 4  FIFOvalue = -1;*/
	
end

endmodule
 
 
/*************************************************************/
/*************************************************************/

 