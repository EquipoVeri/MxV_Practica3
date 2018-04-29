module Load_M_V
#(	parameter Word_Length = 8)(
// Input Ports
	input clk,
	input reset,
	input interrupt,
	input finish_command,
	input [Word_Length-1:0] Data_Input,
	
// Output Ports
	output [WORD_LENGTH-1:0] FIFOvalue,
	output [8*Word_Length-1:0] Vector,
	output [WORD_LENGTH-1:0] Matrix_length,
	output [WORD_LENGTH-1:0] command_lenght
);

//PARAMETERS
localparam INIT_BYTE 	= 8'hFE;
localparam STOP_BYTE 	= 8'hEF;

enum logic [2:0] {MATRIX_SIZE, RESEND_RESULT, INIT_CAPTURE, DATA_CAPTURE} command;
enum logic [3:0] {IDLE, START, LENGHT, CMD, SIZE, MATRIX, VECTOR} state;

bit start_flag;
logic [Word_Length:0] lenght_command;
logic [Word_Length:0] instruction;
logic [Word_Length:0] lenght;

// ---------------------------------------------------------------------------------------
/*State assign, secuential process*/

always_ff@(posedge clk, negedge reset) 
begin
	if(reset == 1'b0) 
		begin
			state <= IDLE;
			start_flag <= 1'b0;
		end
	else begin
		case(state)
		
			IDLE: 
				if(interrupt == 1'b1)
					state <= START;
				else
					state <= IDLE;
							
			START:
				if(Data_Input == INIT_BYTE) 
					begin
						state <= LENGHT;
						start_flag <= 1'b1;		
					end
				else
					state <= START;		
					
			LENGHT: 
				begin
					state <= CMD;
					lenght_command = Data_Input;
				end
				
			CMD:
				begin
					instruction = Data_Input;
					if(finish_command == 1'b1)
						begin
							if(instruction == MATRIX_SIZE)
								
							
						end
				end
			
			SIZE: 
			
			MATRIX: 
			
			VECTOR:
		
		endcase
	end
end

always_comb 
begin

end

assign command_lenght = lenght_command;

endmodule 