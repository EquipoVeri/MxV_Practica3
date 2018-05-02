module Error_RX(
	//INPUTS
	input [7:0] DataInput,
	//OUTPUTS
	output logic [7:0] DataOutput,
	output logic error
);

enum logic [7:0] {ZERO = 8'h0, ONE, TWO, THREE, FOUR, FIVE, SIX, SEVEN, EIGHT, NINE,
						A, B, C, D, E, F} data;
localparam INIT_BYTE = 8'hFE;
localparam STOP_BYTE = 8'hEF;

always_comb
begin
	error = 1'b0;
	case(DataInput) 
		ZERO:
			DataOutput = 8'h0;
		ONE:
			DataOutput = 8'h1;
		TWO:
			DataOutput = 8'h2;
		THREE:
			DataOutput = 8'h3;
		FOUR:
			DataOutput = 8'h4;
		FIVE:
			DataOutput = 8'h5;
		SIX:
			DataOutput = 8'h6;
		SEVEN:
			DataOutput = 8'h7;
		EIGHT:
			DataOutput = 8'h8;
		NINE:
			DataOutput = 8'h9;
		A:
			DataOutput = 8'hA;
		B:
			DataOutput = 8'hB;
		C:
			DataOutput = 8'hC;
		D:
			DataOutput = 8'hD;
		E:
			DataOutput = 8'hE;
		F:
			DataOutput = 8'hF;
			
		INIT_BYTE:
			DataOutput = 8'hFE;
		STOP_BYTE:	
			DataOutput = 8'hEF;
			
		default: begin
			DataOutput = 8'hFF;
			error 	  = 1'b1;
		end
	endcase
end

endmodule 