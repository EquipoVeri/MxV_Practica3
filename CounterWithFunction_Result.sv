module CounterWithFunction_Result
#(
	// Parameter Declarations
	parameter MAXIMUM_VALUE = 100000,
	parameter HALF_VALUE = 50000,
	parameter NBITS_FOR_COUNTER = CeilLog2(MAXIMUM_VALUE)
)

(
	// Input Ports
	input clk,
	input reset,
	input enable,
	
	// Output Ports
	output flag
);

bit MaxValue_Bit;
bit flagfirstcount_b;

logic [NBITS_FOR_COUNTER-1 : 0] Count_logic;
logic [31:0] limit;

	always_ff@(posedge clk or negedge reset) begin
		if (reset == 1'b0) begin
			Count_logic <= {NBITS_FOR_COUNTER{1'b0}};
			flagfirstcount_b <= 1'b0;
		end
		else begin
				if(enable) begin
					if(Count_logic == limit - 1) begin
						Count_logic <= 0;
						flagfirstcount_b <= 1'b1;
					end
					else
						Count_logic <= Count_logic + 1'b1;
				end
				else
					flagfirstcount_b <= 1'b0;
		end
	end

//--------------------------------------------------------------------------------------------

always_comb begin
	if(flagfirstcount_b == 1'b0)
		limit = HALF_VALUE;
	else
		limit = MAXIMUM_VALUE;

	if(Count_logic == limit-1)
		MaxValue_Bit = 1;
	else
		MaxValue_Bit = 0;

end		
//---------------------------------------------------------------------------------------------
assign flag = MaxValue_Bit;
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
