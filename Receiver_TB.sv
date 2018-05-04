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
	#4  Data_w = 8'h03;
	#4  Data_w = 8'h01;
	#4  Data_w = 8'h03; //3*3
/*	#4  Data_w = 8'h04;
	#4  Data_w = 8'h05;
	#4  Data_w = 8'h06;
	#4  Data_w = 8'h07;
	#4  Data_w = 8'h08; //3x3*/
	#4  Data_w = 8'hEF;
	
	//INIT_CAPTURE
	#4  Data_w = 8'hFE;
	#4  Data_w = 8'h02;
	#4  Data_w = 8'h03;
	#4  Data_w = 8'hEF;
	
	//MATRIX_CAPTURE
	#4  Data_w = 8'hFE;
	#4  Data_w = 8'h0B;  //3x3	
/*	#4  Data_w = 8'h12;  //4*4
	#4  Data_w = 8'h1B;	//5*5
	#4  Data_w = 8'h26;	//6*6
	#4  Data_w = 8'h33;  //7*7
	#4  Data_w = 8'h42;  //8*8*/
	#4  Data_w = 8'h04;
	#4  Data_w = 8'h00; //
	#4  Data_w = 8'h01;
	#4  Data_w = 8'h02;
	#4  Data_w = 8'h03;
	#4  Data_w = 8'h04;
	#4  Data_w = 8'h05;
	#4  Data_w = 8'h06;
	#4  Data_w = 8'h07;
	#4  Data_w = 8'h08; //3x3
/*	#4  Data_w = 8'h09;
	#4  Data_w = 8'h0A;
	#4  Data_w = 8'h0B;
	#4  Data_w = 8'h0C;
	#4  Data_w = 8'h0D;
	#4  Data_w = 8'h0E;
	#4  Data_w = 8'h0F; //4*4
	#4  Data_w = 8'h00;
	#4  Data_w = 8'h01;
	#4  Data_w = 8'h02;
	#4  Data_w = 8'h03;
	#4  Data_w = 8'h04;
	#4  Data_w = 8'h05;
	#4  Data_w = 8'h06;
	#4  Data_w = 8'h07;
	#4  Data_w = 8'h08; //5x5
	#4  Data_w = 8'h09;
	#4  Data_w = 8'h0A;
	#4  Data_w = 8'h0B;
	#4  Data_w = 8'h0C;
	#4  Data_w = 8'h0D;
	#4  Data_w = 8'h0E;
	#4  Data_w = 8'h0F; 
	#4  Data_w = 8'h00;
	#4  Data_w = 8'h01;
	#4  Data_w = 8'h02;
	#4  Data_w = 8'h03; //6*6
	#4  Data_w = 8'h04;
	#4  Data_w = 8'h05;
	#4  Data_w = 8'h06;
	#4  Data_w = 8'h07;
	#4  Data_w = 8'h08; 
	#4  Data_w = 8'h09;
	#4  Data_w = 8'h0A;
	#4  Data_w = 8'h0B;
	#4  Data_w = 8'h0C;
	#4  Data_w = 8'h0D;
	#4  Data_w = 8'h0E;
	#4  Data_w = 8'h0F;
	#4  Data_w = 8'h00; //7*7
	#4  Data_w = 8'h01;
	#4  Data_w = 8'h02;
	#4  Data_w = 8'h03;
	#4  Data_w = 8'h04;
	#4  Data_w = 8'h05;
	#4  Data_w = 8'h06; 
	#4  Data_w = 8'h07;
	#4  Data_w = 8'h08; 
	#4  Data_w = 8'h09;
	#4  Data_w = 8'h0A;
	#4  Data_w = 8'h0B;
	#4  Data_w = 8'h0C;
	#4  Data_w = 8'h0D;
	#4  Data_w = 8'h0E;
	#4  Data_w = 8'h0F; //8*8 */
	#4  Data_w = 8'hEF;
	
	//VECTOR_CAPTURE
	#4  Data_w = 8'hFE;
	#4  Data_w = 8'h05; //3*3
/*	#4  Data_w = 8'h06; //4*4
	#4  Data_w = 8'h07; //5*5
	#4  Data_w = 8'h08; //6*6
	#4  Data_w = 8'h09; //7*7
	#4  Data_w = 8'h0A; //8*8*/
	#4  Data_w = 8'h04;
	#4  Data_w = 8'h00;
	#4  Data_w = 8'h01;
	#4  Data_w = 8'h02; //3*3
/*	#4  Data_w = 8'h03; //4*4
	#4  Data_w = 8'h04; //5*5
	#4  Data_w = 8'h05; //6*6
	#4  Data_w = 8'h06; //7*7
	#4  Data_w = 8'h07; //8*8*/
	#4  Data_w = 8'hEF;
end 


initial begin 
	#0 interrupt_bit = 1'b0;
	#1 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
/*	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;//
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0; 
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;*/
	
	//INIT_CAPTURE
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;//
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
	#2 interrupt_bit = 1'b0;//
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
	#2 interrupt_bit = 1'b1; //3*3
/*	#2 interrupt_bit = 1'b0;
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
	#2 interrupt_bit = 1'b1; //4*4
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
	#2 interrupt_bit = 1'b1; //5*5
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
	#2 interrupt_bit = 1'b1; //6*6
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
	#2 interrupt_bit = 1'b1; //7*7
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
	#2 interrupt_bit = 1'b1; //8*8*/
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	
//VECTOR_CAPTURE
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;//
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
/*	#2 interrupt_bit = 1'b1; //2*2
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1; //3*3
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1; //4*4
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1; //5*5
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1; //6*6
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1; //7*7
	#2 interrupt_bit = 1'b0;
	#2 interrupt_bit = 1'b1; //8*8*/
	#2 interrupt_bit = 1'b1;
	#2 interrupt_bit = 1'b0;
	
end

/*----------------------------------------------------------------------------------------*/
 
endmodule 