module CounterWithFunction_With_Sync_Reset
#(	parameter WORD_LENGTH = 8)(
	// Input Ports
	input clk,
	input reset,
	input enable,
	input Sync_Reset,
	input [WORD_LENGTH-1:0] command_lenght,
	
	// Output Ports
	output [WORD_LENGTH-1:0] CountOut,
	output finish_count 
);

logic [WORD_LENGTH-1 : 0] Count_logic;
bit MaxValue_Bit;

always_ff@(posedge clk or negedge reset) begin
	if (reset == 1'b0)
		Count_logic <= {WORD_LENGTH{1'b0}};
	else begin
			if(enable == 1'b1) begin: Enable
				if(Sync_Reset == 1'b1)
					Count_logic <= {WORD_LENGTH{1'b0}};
				else 	begin: SynchronousReset	
					if(Count_logic == command_lenght - 1)
						Count_logic <= 0;
					else
						Count_logic <= Count_logic + 1'b1;
				end: SynchronousReset
			end: Enable
	end
end

//--------------------------------------------------------------------------------------------

always_comb begin
	if(Count_logic == command_lenght-1)
		MaxValue_Bit = 1'b1; 
	else
		MaxValue_Bit = 1'b0;
end
		
//---------------------------------------------------------------------------------------------
assign finish_count = MaxValue_Bit;
assign CountOut = Count_logic;
//----------------------------------------------------------------------------------------------


endmodule 