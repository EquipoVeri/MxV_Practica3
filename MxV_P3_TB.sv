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
	
	/*0B*/
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
	
end

/*********************************************************/
endmodule 