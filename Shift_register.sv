module Shift_register
#(
	parameter Word_Length = 8
)
(
// Input Ports
	input clk,
	input reset,
	input enable,
	input Sync_Reset,
	input [Word_Length-1:0] Data_Input,
	
// Output Ports	 
   output reg [(Word_Length*Word_Length)-1:0] Data_Output
);
	
logic  [(Word_Length*Word_Length)-1:0] Data_logic;

always_ff@(posedge clk or negedge reset) begin
	if(reset == 1'b0) 
		Data_logic <= {(Word_Length*Word_Length){1'b0}};
	else
		if(enable == 1'b1)
			if(Sync_Reset == 1'b1)
				Data_logic <= {(Word_Length*Word_Length){1'b0}};
			else 	
			//	Data_logic <= {Data_logic[(Word_Length*Word_Length)-1:],Data_Input};
				Data_logic <= {Data_Input,Data_logic[(Word_Length*Word_Length)-1:8]};
			//	Data_logic <= {Data_logic[(Word_Length*Word_Length)-9:0],Data_Input};
end

assign Data_Output = Data_logic;

endmodule 