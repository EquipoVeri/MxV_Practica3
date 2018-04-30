module Processor 
#(
	// PARAMETERS
	parameter WORD_LENGTH = 8
)
(
	// INPUTS
	input  [WORD_LENGTH - 1:0] FIFO_M,
	input  [WORD_LENGTH - 1:0] Reg_V,
	input  [WORD_LENGTH - 1:0] Mux,
	input  [WORD_LENGTH - 1:0] Feeback,
	// OUTPUTS
	output logic [WORD_LENGTH - 1:0] Result
);


always_comb begin

	Result = FIFO_M * Mux + Reg_V + Feeback;

end


endmodule
