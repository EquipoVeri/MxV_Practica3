timeunit 10ps; //It specifies the time unit that all the delay will take in the simulation.
timeprecision 1ps;// It specifies the resolution in the simulation.

// Parameter Declarations
parameter WORD_LENGTH = 8;

module MxV_P3_TB;

bit clk;
bit reset;
bit SerialDataRx;
bit SerialOutputTx;


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
	.SerialDataRx(SerialDataRx),
	// Output Ports
	.SerialOutputTx(SerialOutputTx)
);


/*********************************************************/
initial // Clock generator
  begin
    forever #1 clk = !clk;
  end
/*********************************************************/
initial begin // reset generator
	#0 reset = 0;
	#0 SerialDataRx = 1;
end

/*********************************************************/

initial begin 
	#5 reset = 1;
	
/************************SIZE****************************/

	/*FE*/
	#5 SerialDataRx = 0; //start
	#868 SerialDataRx = 0;  
	#868 SerialDataRx = 1; 
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
	/*03*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 1;  
	#868 SerialDataRx = 1; 
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
		/*01*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 1;  
	#868 SerialDataRx = 0; 
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
//		/*03*/
//	#1000 SerialDataRx = 0; //start
//	#868 SerialDataRx = 1;  
//	#868 SerialDataRx = 1; 
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 1;//paridad
//	#868 SerialDataRx = 1; //stop
//	
// 
//	/*04*/
//	#1000 SerialDataRx = 0; //start
//	#868 SerialDataRx = 0;  
//	#868 SerialDataRx = 0; 
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 1;//paridad
//	#868 SerialDataRx = 1; //stop
	
//	/*05*/
//	#1000 SerialDataRx = 0; //start
//	#868 SerialDataRx = 1;  
//	#868 SerialDataRx = 0; 
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 1;//paridad
//	#868 SerialDataRx = 1; //stop
	

//	/*06*/
//	#1000 SerialDataRx = 0; //start
//	#868 SerialDataRx = 0;  
//	#868 SerialDataRx = 1; 
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 1;//paridad
//	#868 SerialDataRx = 1; //stop
//	
	/*07*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 1;  
	#868 SerialDataRx = 1; 
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
//	/*08*/
//	#1000 SerialDataRx = 0; //start
//	#868 SerialDataRx = 0;  
//	#868 SerialDataRx = 0; 
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 1;//paridad
//	#868 SerialDataRx = 1; //stop
	
	/*EF*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 1;  
	#868 SerialDataRx = 1; 
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
/*********************************************************/
/***************START TRANSMiT****************************/

	/*FE*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 0;  
	#868 SerialDataRx = 1; 
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
	/*02*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 0;  
	#868 SerialDataRx = 1; 
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
	/*03*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 1;  
	#868 SerialDataRx = 1; 
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
	/*EF*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 1;  
	#868 SerialDataRx = 1; 
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
/*********************************************************/
/***************TRANSMiT MATRIX***************************/
	
	/*FE*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 0;  
	#868 SerialDataRx = 1; 
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
//	/*0B*/////* 3 X 3 *////
//	#1000 SerialDataRx = 0; //start
//	#868 SerialDataRx = 1;  
//	#868 SerialDataRx = 1; 
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 1;//paridad
//	#868 SerialDataRx = 1; //stop
//	
//	/*H12*/////* 4 X 4 *////
//	#1000 SerialDataRx = 0; //start
//	#868 SerialDataRx = 0;  
//	#868 SerialDataRx = 1; 
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 1;//paridad
//	#868 SerialDataRx = 1; //stop
	
//	/*1B*/////* 5 X 5 *////
//	#1000 SerialDataRx = 0; //start
//	#868 SerialDataRx = 1;  
//	#868 SerialDataRx = 1; 
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 1;//paridad
//	#868 SerialDataRx = 1; //stop
	
//	/*26*/////* 6 X 6 *////
//	#1000 SerialDataRx = 0; //start
//	#868 SerialDataRx = 0;  
//	#868 SerialDataRx = 1; 
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 1;//paridad
//	#868 SerialDataRx = 1; //stop
////	
	/*H33*/////* 7 X 7 *////
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 1;  
	#868 SerialDataRx = 1; 
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop	
//	
//	/*H42*/////* 8 X 8 *////
//	#1000 SerialDataRx = 0; //start
//	#868 SerialDataRx = 0;  
//	#868 SerialDataRx = 1; 
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 1;//paridad
//	#868 SerialDataRx = 1; //stop		

	/*04*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 0;  
	#868 SerialDataRx = 0; 
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
	/*00*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 0;  
	#868 SerialDataRx = 0; 
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
	/*01*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 1;  
	#868 SerialDataRx = 0; 
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
	/*02*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 0;  
	#868 SerialDataRx = 1; 
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
	/*03*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 1;  
	#868 SerialDataRx = 1; 
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
	/*04*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 0;  
	#868 SerialDataRx = 0; 
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
	/*05*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 1;  
	#868 SerialDataRx = 0; 
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
	/*06*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 0;  
	#868 SerialDataRx = 1; 
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
	/*07*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 1;  
	#868 SerialDataRx = 1; 
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
	/*08*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 0;  
	#868 SerialDataRx = 0; 
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
/******************* 3 X 3 *********************************/
	
	/*09*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 1;  
	#868 SerialDataRx = 0; 
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
	/*10*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 0;  
	#868 SerialDataRx = 1; 
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
	/*11*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 1;  
	#868 SerialDataRx = 1; 
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
	/*12*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 0;  
	#868 SerialDataRx = 0; 
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
	/*13*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 1;  
	#868 SerialDataRx = 0; 
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
	/*14*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 0;  
	#868 SerialDataRx = 1; 
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
	/*15*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 1;  
	#868 SerialDataRx = 1; 
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
/******************* 4 X 4 *********************************/
	
	/*16*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 0;  
	#868 SerialDataRx = 0; 
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
	/*17*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 1;  
	#868 SerialDataRx = 0; 
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
	/*18*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 0;  
	#868 SerialDataRx = 1; 
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
	/*19*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 1;  
	#868 SerialDataRx = 1; 
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
	/*20*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 0;  
	#868 SerialDataRx = 0; 
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
	/*21*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 1;  
	#868 SerialDataRx = 0; 
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
	/*22*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 0;  
	#868 SerialDataRx = 1; 
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
	/*23*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 1;  
	#868 SerialDataRx = 1; 
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
	/*24*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 0;  
	#868 SerialDataRx = 0; 
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
/******************* 5 X 5 *********************************/
	
	/*25*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 1;  
	#868 SerialDataRx = 0; 
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
	/*26*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 0;  
	#868 SerialDataRx = 1; 
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
	/*27*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 1;  
	#868 SerialDataRx = 1; 
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
	/*28*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 0;  
	#868 SerialDataRx = 0; 
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
	/*29*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 1;  
	#868 SerialDataRx = 0; 
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
	/*30*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 0;  
	#868 SerialDataRx = 1; 
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
	/*31*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 1;  
	#868 SerialDataRx = 1; 
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
	/*32*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 0;  
	#868 SerialDataRx = 0; 
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
	/*33*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 1;  
	#868 SerialDataRx = 0; 
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
	/*34*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 0;  
	#868 SerialDataRx = 1; 
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
	/*35*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 1;  
	#868 SerialDataRx = 1; 
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
/******************* 6 X 6 *********************************/

	/*36*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 0;  
	#868 SerialDataRx = 0; 
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
	/*37*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 1;  
	#868 SerialDataRx = 0; 
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
	/*38*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 0;  
	#868 SerialDataRx = 1; 
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
	/*39*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 1;  
	#868 SerialDataRx = 1; 
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
	/*40*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 0;  
	#868 SerialDataRx = 0; 
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
	/*41*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 1;  
	#868 SerialDataRx = 0; 
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
	/*42*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 0;  
	#868 SerialDataRx = 1; 
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
	/*43*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1; 
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
	/*44*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0; 
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
	/*45*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0; 
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
	/*46*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1; 
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
	/*47*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1; 
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
	/*48*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0; 
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
//
///******************* 7 X 7 *********************************/
//	
//	/*49*/
//	#1000 SerialDataRx = 0; //start
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 0; 
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 1;//paridad
//	#868 SerialDataRx = 1; //stop
//	
//	/*50*/
//	#1000 SerialDataRx = 0; //start
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 1; 
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 1;//paridad
//	#868 SerialDataRx = 1; //stop
//	
//	/*51*/
//	#1000 SerialDataRx = 0; //start
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 1; 
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 1;//paridad
//	#868 SerialDataRx = 1; //stop
//	
//	/*52*/
//	#1000 SerialDataRx = 0; //start
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0; 
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 1;//paridad
//	#868 SerialDataRx = 1; //stop
//	
//	/*53*/
//	#1000 SerialDataRx = 0; //start
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 0; 
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 1;//paridad
//	#868 SerialDataRx = 1; //stop
//	
//	/*54*/
//	#1000 SerialDataRx = 0; //start
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 1; 
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 1;//paridad
//	#868 SerialDataRx = 1; //stop
//	
//	/*55*/
//	#1000 SerialDataRx = 0; //start
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 1; 
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 1;//paridad
//	#868 SerialDataRx = 1; //stop
//	
//	/*56*/
//	#1000 SerialDataRx = 0; //start
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0; 
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 1;//paridad
//	#868 SerialDataRx = 1; //stop
//	
//	/*57*/
//	#1000 SerialDataRx = 0; //start
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 0; 
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 1;//paridad
//	#868 SerialDataRx = 1; //stop
//	
//	/*58*/
//	#1000 SerialDataRx = 0; //start
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 1; 
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 1;//paridad
//	#868 SerialDataRx = 1; //stop
//	
//	/*59*/
//	#1000 SerialDataRx = 0; //start
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 1; 
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 1;//paridad
//	#868 SerialDataRx = 1; //stop
//	
//	/*60*/
//	#1000 SerialDataRx = 0; //start
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0; 
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 1;//paridad
//	#868 SerialDataRx = 1; //stop
//	
//	/*61*/
//	#1000 SerialDataRx = 0; //start
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 0; 
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 1;//paridad
//	#868 SerialDataRx = 1; //stop
//	
//	/*62*/
//	#1000 SerialDataRx = 0; //start
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 1; 
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 1;//paridad
//	#868 SerialDataRx = 1; //stop
//	
//	/*63*/
//	#1000 SerialDataRx = 0; //start
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 1; 
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 1;//paridad
//	#868 SerialDataRx = 1; //stop
	
	/*EF*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 1;  
	#868 SerialDataRx = 1; 
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
/*********************************************************/
/***************TRANSMiT VECTOR***************************/
	
	/*FE*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 0;  
	#868 SerialDataRx = 1; 
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
//	/*05*////* 3 X 3 *////
//	#1000 SerialDataRx = 0; //start
//	#868 SerialDataRx = 1;  
//	#868 SerialDataRx = 0; 
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 1;//paridad
//	#868 SerialDataRx = 1; //stop
//	
//	/*06*////* 4 X 4 *////
//	#1000 SerialDataRx = 0; //start
//	#868 SerialDataRx = 0;  
//	#868 SerialDataRx = 1; 
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 1;//paridad
//	#868 SerialDataRx = 1; //stop
	
//	/*07*////* 5 X 5 *////
//	#1000 SerialDataRx = 0; //start
//	#868 SerialDataRx = 1;  
//	#868 SerialDataRx = 1; 
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 1;//paridad
//	#868 SerialDataRx = 1; //stop
	
//	/*08*////* 6 X 6 *////
//	#1000 SerialDataRx = 0; //start
//	#868 SerialDataRx = 0;  
//	#868 SerialDataRx = 0; 
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 1;//paridad
//	#868 SerialDataRx = 1; //stop
//		
	/*09*////* 7 X 7 *////
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 1;  
	#868 SerialDataRx = 0; 
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
//	
//	/*10*////* 8 X 8 *////
//	#1000 SerialDataRx = 0; //start
//	#868 SerialDataRx = 0;  
//	#868 SerialDataRx = 1; 
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 1;//paridad
//	#868 SerialDataRx = 1; //stop	
	
	/*04*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 0;  
	#868 SerialDataRx = 0; 
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
	/*00*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 0;  
	#868 SerialDataRx = 0; 
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
	/*01*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 1;  
	#868 SerialDataRx = 0; 
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
	/*00*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 0;  
	#868 SerialDataRx = 0; 
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
	/*01*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 1;  
	#868 SerialDataRx = 0; 
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
	/*00*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 0;  
	#868 SerialDataRx = 0; 
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
	/*01*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 1;  
	#868 SerialDataRx = 0; 
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
	
	/*00*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 0;  
	#868 SerialDataRx = 0; 
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop
//	
//	/*01*/
//	#1000 SerialDataRx = 0; //start
//	#868 SerialDataRx = 1;  
//	#868 SerialDataRx = 0; 
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 1;//paridad
//	#868 SerialDataRx = 1; //stop
	
//	/*02*/
//	#1000 SerialDataRx = 0; //start
//	#868 SerialDataRx = 0;  
//	#868 SerialDataRx = 1; 
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 1;//paridad
//	#868 SerialDataRx = 1; //stop	
//	
///******************* 3 X 3 *********************************/
//
//	/*03*/
//	#1000 SerialDataRx = 0; //start
//	#868 SerialDataRx = 1;  
//	#868 SerialDataRx = 1; 
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 1;//paridad
//	#868 SerialDataRx = 1; //stop
//	
//	/*04*/
//	#1000 SerialDataRx = 0; //start
//	#868 SerialDataRx = 0;  
//	#868 SerialDataRx = 0; 
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 1;//paridad
//	#868 SerialDataRx = 1; //stop
//	
//	/*05*/
//	#1000 SerialDataRx = 0; //start
//	#868 SerialDataRx = 1;  
//	#868 SerialDataRx = 0; 
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 1;//paridad
//	#868 SerialDataRx = 1; //stop
//	
//	/*06*/
//	#1000 SerialDataRx = 0; //start
//	#868 SerialDataRx = 0;  
//	#868 SerialDataRx = 1; 
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 1;//paridad
//	#868 SerialDataRx = 1; //stop
//	
//	/*07*/
//	#1000 SerialDataRx = 0; //start
//	#868 SerialDataRx = 1;  
//	#868 SerialDataRx = 1; 
//	#868 SerialDataRx = 1;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 0;
//	#868 SerialDataRx = 1;//paridad
//	#868 SerialDataRx = 1; //stop
	
	/*EF*/
	#1000 SerialDataRx = 0; //start
	#868 SerialDataRx = 1;  
	#868 SerialDataRx = 1; 
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 0;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1;
	#868 SerialDataRx = 1;//paridad
	#868 SerialDataRx = 1; //stop

/*********************************************************/	
	
end

/*********************************************************/
endmodule 