module CounterWithFunction_M_V
#(
	// Parameter Declarations
	parameter MAXIMUM_VALUE = 8,
	parameter NBITS_FOR_COUNTER = CeilLog2(MAXIMUM_VALUE)
)
(
	// Input Ports
	input clk,
	input reset,
	input enable,
	input [7:0] matrixSize,
	
	// Output Ports
	output push1, push2, push3, push4,
	output mux0_flag
);

bit push1_bit, push2_bit, push3_bit, push4_bit, mux0_bit;

logic [NBITS_FOR_COUNTER-1 : 0] Count_logic;

always_ff@(posedge clk or negedge reset) begin
	if (reset == 1'b0)
		Count_logic <= {NBITS_FOR_COUNTER{1'b0}};
	else begin
			if(enable == 1'b1)
				if(Count_logic == MAXIMUM_VALUE - 1)
					Count_logic <= 0;
				else
					Count_logic <= Count_logic + 1'b1;
	end
end

//--------------------------------------------------------------------------------------------

always_comb begin
	if(Count_logic == 4'd0 || Count_logic == 4'd4)begin 
		push1_bit = 1'b0; 
		push2_bit = 1'b0;
		push3_bit = 1'b0;
		push4_bit = 1'b1;
	end
	
	else if (Count_logic == 4'd1 || Count_logic == 4'd5)begin
		push1_bit = 1'b0;
		push2_bit = 1'b0;
		push3_bit = 1'b1;
		push4_bit = 1'b0;
	end 
	
	else if (Count_logic == 4'd2 || Count_logic == 4'd6) begin
		push1_bit = 1'b0;
		push2_bit = 1'b1;
		push3_bit = 1'b0;
		push4_bit = 1'b0;	
	end 
	
	else if (Count_logic == 4'd3 || Count_logic == 4'd7) begin
		push1_bit = 1'b1;
		push2_bit = 1'b0;
		push3_bit = 1'b0;
		push4_bit = 1'b0;	
	end 
	
	else begin
		push1_bit = 1'b0;
		push2_bit = 1'b0;
		push3_bit = 1'b0;
		push4_bit = 1'b0;
	end 
	
	if (Count_logic >= matrixSize)
		mux0_bit = 1'b1;
	
	else 
		mux0_bit = 1'b0;
	
end
		
//---------------------------------------------------------------------------------------------
assign push1 = push1_bit;
assign push2 = push2_bit;
assign push3 = push3_bit;
assign push4 = push4_bit;
assign mux0_flag = mux0_bit;
//----------------------------------------------------------------------------------------------

/*--------------------------------------------------------------------*/
 /*--------------------------------------------------------------------*/
 /*--------------------------------------------------------------------*/
   
 /*Log Function*/
     function integer CeilLog2;
       input integer data;
       integer i,result;
       begin
          for(i=0; 2**i < data; i=i+1)
             result = i + 1;
          CeilLog2 = result;
       end
    endfunction

/*--------------------------------------------------------------------*/
 /*--------------------------------------------------------------------*/
 /*--------------------------------------------------------------------*/
endmodule 