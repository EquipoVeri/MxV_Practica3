module CounterWithFunction_OP
#(
	// Parameter Declarations
	parameter MAXIMUM_VALUE = 20,
	parameter NBITS_FOR_COUNTER = CeilLog2(MAXIMUM_VALUE)
)
(
	// Input Ports
	input clk,
	input reset,
	input enable,
	input [7:0] matrixSize_real,
	input [31:0] matrixSize,
	
	// Output Ports
	output op_in_process,
	output endop,
	output mux_flag,
	output result_push
);

bit endop_bit, mux_bit, op_in_process_bit, result_push_bit;

logic [31:0] result_size_log = 32'd4; 
 
logic [NBITS_FOR_COUNTER-1 : 0] Count_logic;

always_ff@(posedge clk or negedge reset) begin
	if (reset == 1'b0) begin
		Count_logic <= {NBITS_FOR_COUNTER{1'b0}};
		mux_bit = 1'b1;
	end
	else begin
			if(enable == 1'b1)
				if(Count_logic == matrixSize) begin
					Count_logic <= 0;
					mux_bit <= 1'b1;
				end
				else begin
					Count_logic <= Count_logic + 1'b1;
					mux_bit <= ~mux_bit;
				end
	end
end

//--------------------------------------------------------------------------------------------

always_comb begin
	if(Count_logic >= result_size_log)
		result_push_bit = 1'b1;
	else
		result_push_bit = 1'b0;
	
	if (Count_logic >= matrixSize) begin
		endop_bit = 1'b1;
		op_in_process_bit = 1'b0;
	end
	
	else 
		endop_bit = 1'b0;
		op_in_process_bit = 1'b1;
end
		
//---------------------------------------------------------------------------------------------
assign mux_flag = mux_bit;
assign endop = endop_bit;
assign op_in_process = op_in_process_bit;
assign result_push = result_push_bit;
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