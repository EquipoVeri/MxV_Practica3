timeunit 10ns; 						// It specifies the time unit that all the delay will take in the simulation.
timeprecision 10ns;					// It specifies the resolution in the simulation.

// Module to test.
module Receiver_TB;

parameter WORD_LENGTH = 8;

// Input Ports
bit clk = 0;
bit reset; 
// Output Ports
logic [7:0] ReceivedData_w;
bit interrupt_bit;
logic [7:0] DataOutput;
bit clearInterrupt;
logic [7:0] Data_Vector;


Receiver
#(	.WORD_LENGTH(WORD_LENGTH))
receiver
(
// Input Ports
	.clk(clk),
	.reset(reset),
	.interrupt_bit(interrupt_bit),
	.ReceivedData_w(ReceivedData_w),
	.clearInterrupt(clearInterrupt),
	.DataOutput(DataOutput),
	.Data_Vector(Data_Vector)
);

/******************** Stimulus *************************/

initial // Clock generator
begin
	clk = 1'b0;
	forever #1 clk = !clk;
end
 
/*----------------------------------------------------------------------------------------*/

initial begin /*Reset*/
	#0 reset = 1'b0;
	#3 reset = 1'b1;
end

/*----------------------------------------------------------------------------------------*/

initial begin 
	//Size_Matrix
	#0 ReceivedData_w= 1'h1;
	#20000  ReceivedData_w= 8'hF;
	#20000  ReceivedData_w = 8'hE;
	#20000  ReceivedData_w= 8'h0;
	#20000  ReceivedData_w= 8'h3;
	#20000  ReceivedData_w= 8'h0;
	#20000  ReceivedData_w= 8'h1;
	#20000  ReceivedData_w= 8'h0;
	#20000  ReceivedData_w= 8'h3;   // 35 5x5
	#20000  ReceivedData_w = 8'hE;
	#20000  ReceivedData_w= 8'hF;
	
	//INIT_CAPTURE
	#20000  ReceivedData_w= 8'hF;
	#20000  ReceivedData_w = 8'hE;
	#20000  ReceivedData_w= 8'h0;
	#20000  ReceivedData_w= 8'h2;
	#20000  ReceivedData_w= 8'h0;
	#20000  ReceivedData_w= 8'h3;
	#20000  ReceivedData_w = 8'hE;
	#20000  ReceivedData_w= 8'hF;
	
	//MATRIX_CAPTURE
	#20000  ReceivedData_w= 8'hF;
	#20000  ReceivedData_w = 8'hE;
	#20000  ReceivedData_w= 8'h0;  	// 31 5x5
	#20000  ReceivedData_w= 8'hB;	// 42 5x5
	#20000  ReceivedData_w= 8'h0;
	#20000  ReceivedData_w= 8'h4;
	#20000  ReceivedData_w= 8'h0;
	#20000  ReceivedData_w= 8'h0;
	#20000  ReceivedData_w= 8'h0;
	#20000  ReceivedData_w= 8'h1;
	#20000  ReceivedData_w= 8'h0;
	#20000  ReceivedData_w= 8'h2;
	#20000  ReceivedData_w= 8'h0;
	#20000  ReceivedData_w= 8'h3;
	#20000  ReceivedData_w= 8'h0;
	#20000  ReceivedData_w= 8'h4;
	#20000  ReceivedData_w= 8'h0;
	#20000  ReceivedData_w= 8'h5;
	#20000  ReceivedData_w= 8'h0;
	#20000  ReceivedData_w= 8'h6;
	#20000  ReceivedData_w= 8'h0;
	#20000  ReceivedData_w= 8'h7;
	#20000  ReceivedData_w= 8'h0;
	#20000  ReceivedData_w= 8'h8;
//	#20000  ReceivedData_w= 8'h0;
//	#20000  ReceivedData_w= 8'h9;
//	#20000  ReceivedData_w= 8'h0;
//	#20000  ReceivedData_w= 8'hA;
//	#20000  ReceivedData_w= 8'h0;
//	#20000  ReceivedData_w= 8'hB;
//	#20000  ReceivedData_w= 8'h0;
//	#20000  ReceivedData_w= 8'hC;
//	#20000  ReceivedData_w= 8'h0;
//	#20000  ReceivedData_w= 8'hD;
//	#20000  ReceivedData_w= 8'h0;
//	#20000  ReceivedData_w = 8'hE;
//	#20000  ReceivedData_w= 8'h0;
//	#20000  ReceivedData_w= 8'hF;
//	#20000  ReceivedData_w= 8'h1;
//	#20000  ReceivedData_w= 8'h0;
//	#20000  ReceivedData_w= 8'h1;
//	#20000  ReceivedData_w= 8'h1;
//	#20000  ReceivedData_w= 8'h1;
//	#20000  ReceivedData_w= 8'h2;
//	#20000  ReceivedData_w= 8'h1;
//	#20000  ReceivedData_w= 8'h3;
//	#20000  ReceivedData_w= 8'h0;
//	#20000  ReceivedData_w= 8'h0;
//	#20000  ReceivedData_w= 8'h0;
//	#20000  ReceivedData_w= 8'h1;
//	#20000  ReceivedData_w= 8'h0;
//	#20000  ReceivedData_w= 8'h2;
//	#20000  ReceivedData_w= 8'h0;
//	#20000  ReceivedData_w= 8'h3;
//	#20000  ReceivedData_w= 8'h0;
//	#20000  ReceivedData_w= 8'h4;
	#20000  ReceivedData_w = 8'hE;
	#20000  ReceivedData_w= 8'hF;
	
	//VECTOR_CAPTURE
	#20000  ReceivedData_w= 8'hF;
	#20000  ReceivedData_w = 8'hE;
	#20000  ReceivedData_w= 8'h0;
	#20000  ReceivedData_w= 8'h5; // 37 5x5 35 3x3
	#20000  ReceivedData_w= 8'h0;
	#20000  ReceivedData_w= 8'h4;
	#20000  ReceivedData_w= 8'h0;
	#20000  ReceivedData_w= 8'h0;
	#20000  ReceivedData_w= 8'h0;
	#20000  ReceivedData_w= 8'h1;
	#20000  ReceivedData_w= 8'h0;
	#20000  ReceivedData_w= 8'h2;
//	#20000  ReceivedData_w= 8'h0;
//	#20000  ReceivedData_w= 8'h3;
//	#20000  ReceivedData_w= 8'h0;
//	#20000  ReceivedData_w= 8'h4;
	#20000  ReceivedData_w = 8'hE;
	#20000  ReceivedData_w= 8'hF;
end 

/*
initial begin 
	#0 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	
	//INIT_CAPTURE
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	
	//MATRIX_CAPTURE
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
//VECTOR_CAPTURE
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
//	#20000 start_Tx = 1'b1;
//	#4 start_Tx = 1'b0;
//	#20000 start_Tx = 1'b1;
//	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	#20000 start_Tx = 1'b1;
	#4 start_Tx = 1'b0;
	
end
*/
/*----------------------------------------------------------------------------------------*/
 
endmodule 