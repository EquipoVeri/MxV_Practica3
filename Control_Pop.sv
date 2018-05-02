module Control_Pop
#(parameter WORD_LENGTH = 8)
(
	input clk,
	input reset,
	input start,
	input empty,
	input [WORD_LENGTH-1:0] Matrix_length,
	input [WORD_LENGTH-1:0] FIFOTAvalue,

	output pop,
	output [WORD_LENGTH-1:0] FIFOvalue
	
);

enum logic [1:0] {IDLE, START, POP, NOT_POP} state;
logic [WORD_LENGTH-1:0] Count_logic;
logic [WORD_LENGTH-1:0] FIFOvalue_logic;

bit pop_bit;

always_ff@(posedge clk, negedge reset) 
begin
	if(reset == 1'b0) 
		begin
			state <= IDLE;
			Count_logic <= 0;	
		end
	else begin
		case(state)
			IDLE: 
				if(start == 1'b1)
					state <= START;
				else
					state <= IDLE;			
			
			START: 
				if(start == 1'b0) begin
					state <= POP;
					Count_logic <= Count_logic + 1'b1;
					FIFOvalue_logic <= FIFOTAvalue;
				end	
				else
					state <= START;
			
			POP: 
				if(empty == 1'b1)
					state <= IDLE;
				else
					if(Count_logic < Matrix_length) begin
						Count_logic <= Count_logic + 1'b1;
						FIFOvalue_logic <= FIFOTAvalue;
						state <= POP;
					end
					else 
						state <= NOT_POP;
					
			NOT_POP:
				if(empty == 1'b1)
					state <= IDLE;
				else
					if(Count_logic >= Matrix_length) begin
						if(Count_logic == 8'd7)
							Count_logic <= 0;
						else begin
							Count_logic <= Count_logic + 1'b1;
						end
						FIFOvalue_logic <= 0;
						state <= NOT_POP;
					end
					else 
						state <= POP;
					
			default:
				state <= IDLE;
				
		endcase
	end
end

/*------------------------------------------------------------------------------------------*/
/*Salida de control, proceso combintorio*/

always_comb 
begin
pop_bit = 1'b0;
	case(state)
	
	POP:
		pop_bit = 1'b1;
		
	default:
		pop_bit = 1'b0;
	
	endcase

end

assign pop = pop_bit;
assign FIFOvalue = FIFOvalue_logic;

endmodule 