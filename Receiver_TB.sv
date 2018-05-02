timeunit 10ps; 						// It specifies the time unit that all the delay will take in the simulation.
timeprecision 10ps;					// It specifies the resolution in the simulation.

// Module to test.
module Receiver_TB;

parameter WORD_LENGTH = 8;

// Input Ports
bit clk = 0;
bit reset; 
// Output Ports
logic [7:0] Data_w;
bit interrupt_bit;
logic [7:0] DataOutput;
bit clearInterrupt_bit;
logic [63:0] Data_Vector;
bit SerialDataRx;
logic SerialDataTx;


Receiver
#(	.WORD_LENGTH(WORD_LENGTH))
DUV
(
	.clk(clk),
	.reset(reset),
	.interrupt_bit(interrupt_bit),
	.Data_w(Data_w),
	
	.clearInterrupt(clearInterrupt),
	.DataOutput(DataOutput),
	.Data_Vector(Data_Vector)
);
/*
UART Uart
(	
	.clk(clk), 
	.reset(reset),
   .DataToTransmit(Data_w),
	.SerialDataRx(SerialDataRx),
   .Transmit(),
	.ClearInterrupt(clearInterrupt_bit),
   .RxInterrupt(interrupt_bit),
	.ParityError(),
	.SerialOutputTx(SerialDataTx),
	.ReceivedData()
);*/

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
	#0 Data_w = 1'h1;
	#5  Data_w = 8'hFE;
	//#4  Data_w = 8'hE;
	#4  Data_w = 8'h03;
	//#4  Data_w = 8'h3;
	#4  Data_w = 8'h01;
	//#4  Data_w = 8'h1;
	#4  Data_w = 8'h03;
	//#4  Data_w = 8'h3;   // 35 5x5
	#4  Data_w = 8'hEF;
	//#4  Data_w = 8'hF;
	
	//INIT_CAPTURE
	#4  Data_w = 8'hFE;
	//#4  Data_w = 8'hE;
	#4  Data_w = 8'h02;
	//#4  Data_w = 8'h2;
	#4  Data_w = 8'h03;
	//#4  Data_w = 8'h3;
	#4  Data_w = 8'hEF;
	//#4  Data_w = 8'hF;
	
	//MATRIX_CAPTURE
	#4  Data_w = 8'hFE;
	//#4  Data_w = 8'hE;
	#4  Data_w = 8'h0B;  	// 31 5x5
	//#4  Data_w = 8'hB;	// 42 5x5
	#4  Data_w = 8'h04;
	//#4  Data_w = 8'h4;
	#4  Data_w = 8'h00;
	//#4  Data_w = 8'h0;
	#4  Data_w = 8'h01;
	//#4  Data_w = 8'h1;
	#4  Data_w = 8'h02;
	//#4  Data_w = 8'h2;
	#4  Data_w = 8'h03;
	//#4  Data_w = 8'h3;
	#4  Data_w = 8'h04;
	//#4  Data_w = 8'h4;
	#4  Data_w = 8'h05;
	//#4  Data_w = 8'h5;
	#4  Data_w = 8'h06;
	//#4  Data_w = 8'h6;
	#4  Data_w = 8'h07;
	//#4  Data_w = 8'h7;
	#4  Data_w = 8'h08;
	//#4  Data_w = 8'h8;
//	#4  Data_w = 8'h0;
//	#4  Data_w = 8'h9;
//	#4  Data_w = 8'h0;
//	#4  Data_w = 8'hA;
//	#4  Data_w = 8'h0;
//	#4  Data_w = 8'hB;
//	#4  Data_w = 8'h0;
//	#4  Data_w = 8'hC;
//	#4  Data_w = 8'h0;
//	#4  Data_w = 8'hD;
//	#4  Data_w = 8'h0;
//	#4  Data_w = 8'hE;
//	#4  Data_w = 8'h0;
//	#4  Data_w = 8'hF;
//	#4  Data_w = 8'h1;
//	#4  Data_w = 8'h0;
//	#4  Data_w = 8'h1;
//	#4  Data_w = 8'h1;
//	#4  Data_w = 8'h1;
//	#4  Data_w = 8'h2;
//	#4  Data_w = 8'h1;
//	#4  Data_w = 8'h3;
//	#4  Data_w = 8'h0;
//	#4  Data_w = 8'h0;
//	#4  Data_w = 8'h0;
//	#4  Data_w = 8'h1;
//	#4  Data_w = 8'h0;
//	#4  Data_w = 8'h2;
//	#4  Data_w = 8'h0;
//	#4  Data_w = 8'h3;
//	#4  Data_w = 8'h0;
//	#4  Data_w = 8'h4;
	#4  Data_w = 8'hEF;
//	#4  Data_w = 8'hF;
	
	//VECTOR_CAPTURE
	#4  Data_w = 8'hFE;
	//#4  Data_w = 8'hE;
	#4  Data_w = 8'h05;
	//#4  Data_w = 8'h5; // 37 5x5 35 3x3
	#4  Data_w = 8'h04;
	//#4  Data_w = 8'h4;
	#4  Data_w = 8'h00;
	//#4  Data_w = 8'h0;
	#4  Data_w = 8'h01;
	//#4  Data_w = 8'h1;
	#4  Data_w = 8'h02;
	//#4  Data_w = 8'h2;
//	#4  Data_w = 8'h0;
//	#4  Data_w = 8'h3;
//	#4  Data_w = 8'h0;
//	#4  Data_w = 8'h4;
	#4  Data_w = 8'hEF;
//	#4  Data_w = 8'hF;
end 


initial begin 
	#0 interrupt_bit = 1'b0;
	#5 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	
	//INIT_CAPTURE
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	
	//MATRIX_CAPTURE
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
//VECTOR_CAPTURE
	#4 interrupt_bit = 1'b1;
	#4 interrupt_bit = 1'b0;
	#4 interrupt_bit = 1'b1;
	#4 interrupt_bit = 1'b0;
	#4 interrupt_bit = 1'b1;
	#4 interrupt_bit = 1'b0;
	#4 interrupt_bit = 1'b1;
	#4 interrupt_bit = 1'b0;
	#4 interrupt_bit = 1'b1;
	#4 interrupt_bit = 1'b0;
	#4 interrupt_bit = 1'b1;
	#4 interrupt_bit = 1'b0;
	#4 interrupt_bit = 1'b1;
	#4 interrupt_bit = 1'b0;
	#4 interrupt_bit = 1'b1;
	#4 interrupt_bit = 1'b0;
	#4 interrupt_bit = 1'b1;
	#4 interrupt_bit = 1'b0;
	#4 interrupt_bit = 1'b1;
	#4 interrupt_bit = 1'b0;
	#4 interrupt_bit = 1'b1;
	#4 interrupt_bit = 1'b0;
	#4 interrupt_bit = 1'b1;
	#4 interrupt_bit = 1'b0;
	#4 interrupt_bit = 1'b1;
	#4 interrupt_bit = 1'b0;
	#4 interrupt_bit = 1'b1;
	#4 interrupt_bit = 1'b0;
//	#4 interrupt_bit = 1'b1;
//	#4 interrupt_bit = 1'b0;
//	#4 interrupt_bit = 1'b1;
//	#4 interrupt_bit = 1'b0;
	#4 interrupt_bit = 1'b1;
	#4 interrupt_bit = 1'b0;
	#4 interrupt_bit = 1'b1;
	#4 interrupt_bit = 1'b0;
	
end

/*----------------------------------------------------------------------------------------*/
 
endmodule 