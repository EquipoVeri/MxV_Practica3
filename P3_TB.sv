timeunit 1ps; //It specifies the time unit that all the delay will take in the simulation.
timeprecision 1ps;// It specifies the resolution in the simulation.

module P3_TB;

	// Parameter Declarations
parameter WORD_LENGTH = 8;

// Input Ports
bit clk;
bit reset;
bit start;
bit SerialDataRx;
bit ClearInterrupt;
logic [63:0] vector;
bit [WORD_LENGTH-1:0] FIFOvalue;
logic [31:0] Matrix_length;
bit SerialOutputTx;

// Output Ports



/******************** Device Under Verification **************/
P3
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
	.SerialDataRx(SerialDataRx),
	.ClearInterrupt(ClearInterrupt),
	.vector(vector),
	.FIFOvalue(FIFOvalue),
	.Matrix_length(Matrix_length),
	// Output Ports
	.SerialOutputTx(SerialOutputTx)
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
	# 0 vector = 64'b0000000000000000000000000000010000000011000000100000000100000000;	//5x5
	//# 0 vector = 64'b0000000000000000000000000000000000000000000000100000000100000000;		//3x3
	#0 Matrix_length = 5;
	#2 reset = 1'b1;
	#40000 start = 1'b1;
	#40000 start = 1'b0;
end
/*----------------------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------------------*/ 
initial begin
	# 0  FIFOvalue = 1'b0;
	/*# 50000   FIFOvalue = 0;
	# 20000 FIFOvalue = 1;
	# 20000  FIFOvalue = 2;
	# 20000 FIFOvalue = 0;
	# 20000  FIFOvalue = 0;
	# 20000  FIFOvalue = 0;
	# 20000  FIFOvalue = 0;
	# 20000  FIFOvalue = 0;
	# 20000  FIFOvalue = 3;
	# 20000  FIFOvalue = 4;
	# 20000  FIFOvalue = 5;
	# 20000  FIFOvalue = 0;
	# 20000  FIFOvalue = 0;			//3x3
	# 20000  FIFOvalue = 0;
	# 20000  FIFOvalue = 0;
	# 20000  FIFOvalue = 0;
	# 20000  FIFOvalue = 6;
	# 20000  FIFOvalue = 7;
	# 20000  FIFOvalue = 8;
	# 20000  FIFOvalue = 0;					
	# 20000  FIFOvalue = 0;
	# 20000  FIFOvalue = 0;
	# 20000  FIFOvalue = 0;
	# 20000  FIFOvalue = 0;*/
	# 100000  FIFOvalue = 0;
	# 40000  FIFOvalue = 1;
	# 40000  FIFOvalue = 2;
	# 40000  FIFOvalue = 3;
	# 40000  FIFOvalue = 4;
	# 40000  FIFOvalue = 0;
	# 40000  FIFOvalue = 0;
	# 40000  FIFOvalue = 0;
	# 40000  FIFOvalue = 5;
	# 40000  FIFOvalue = 6;
	# 40000  FIFOvalue = 7;
	# 40000  FIFOvalue = 8;
	# 40000  FIFOvalue = 9;
	# 40000  FIFOvalue = 0;
	# 40000  FIFOvalue = 0;
	# 40000  FIFOvalue = 0;
	# 40000  FIFOvalue = 10;
	# 40000  FIFOvalue = 11;
	# 40000  FIFOvalue = 12;
	# 40000  FIFOvalue = 13;					//5x5
	# 40000  FIFOvalue = 14;
	# 40000  FIFOvalue = 0;
	# 40000  FIFOvalue = 0;
	# 40000  FIFOvalue = 0;
	# 40000  FIFOvalue = 15;
	# 40000  FIFOvalue = 16;
	# 40000  FIFOvalue = 17;
	# 40000  FIFOvalue = 18;
	# 40000  FIFOvalue = 19;
	# 40000  FIFOvalue = 0;
	# 40000  FIFOvalue = 0;
	# 40000  FIFOvalue = 0;
	# 40000  FIFOvalue = 0;
	# 40000  FIFOvalue = 1;
	# 40000  FIFOvalue = 2;
	# 40000  FIFOvalue = 3;
	# 40000  FIFOvalue = 4;
	# 40000  FIFOvalue = 0;
	# 40000  FIFOvalue = 0;
	# 40000  FIFOvalue = 0;
	/* 10  FIFOvalue = 0;
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

 