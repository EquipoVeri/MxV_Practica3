module shift_register_er
#(
	parameter WORD_LENGTH = 11
)
(
    input clk,
    input reset,
    input enable,
    input d,
    output reg [WORD_LENGTH-1:0] q
);

//wire [WORD_LENGTH-1:0] q_w;

always_ff @(negedge reset, posedge clk)
	begin
		if (reset == 1'b0)
			q <= 0;
		else
			if (enable)
				q <= {d,q[WORD_LENGTH-1:1]};
	end

//assign q = q_w;

endmodule
