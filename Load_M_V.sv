module Load_M_V
#(	parameter Word_Length = 8)(
// Input Ports
	input clk,
	input reset,
	input interrupt,
	input data_ready,
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
enum logic [3:0] {IDLE, START, LENGHT, CMD, SIZE, MATRIX, VECTOR, ERROR, END} state;

logic [Word_Length:0] lenght_command;
logic [Word_Length:0] instruction;
logic [Word_Length:0] lenght_matrix;

// ---------------------------------------------------------------------------------------
/*State assign, secuential process*/

always_ff@(posedge clk, negedge reset) 
begin
	if(reset == 1'b0) 
		begin
			state <= IDLE;
		end
	else begin
		case(state)
		
			IDLE: 
				if(interrupt == 1'b1)
					state <= START;
				else
					state <= IDLE;
							
			START:
				if(data_ready == 1'b1)
					begin
						if(Data_Input == INIT_BYTE) 
							state <= LENGHT;
						else
							state <= ERROR;
					end
				else
					state <= START;		
					
			LENGHT: 
				if(data_ready == 1'b1)
					begin
						state <= CMD;
						lenght_command <= Data_Input;
					end
				else
					state <= LENGHT;	
					
			CMD:
				if(data_ready == 1'b1 && finish_command == 1'b1)
					begin
						state <= END;
						instruction <= Data_Input;
					end
				else if(data_ready == 1'b1 && finish_command == 1'b0)
					begin
						instruction <= Data_Input;
						if(instruction == MATRIX_SIZE)
							state <= SIZE;
						if(instruction == INIT_CAPTURE && lenght_command == (lenght_matrix*lenght_matrix + 2))
							state <= MATRIX;
						if(instruction == INIT_CAPTURE && lenght_command == (lenght_matrix*lenght_matrix + 2))
							state <= MATRIX;
					end
				else 
					state <= CMD;
			
			SIZE: 
				if(data_ready == 1'b1 && finish_command == 1'b1)
					begin
						state <= END;
						lenght_matrix <= Data_Input;
					end
				else if(lenght_command != 4'd3)
					state <= ERROR;
				else
					state <= SIZE;	
			
			MATRIX: 
				if(data_ready == 1'b1 && finish_command == 1'b1)
					state <= END;
				else if(lenght_command != (lenght_matrix*lenght_matrix + 2))
					state <= ERROR;
				else
					state <= MATRIX;	
			
			VECTOR:
				if(data_ready == 1'b1 && finish_command == 1'b1)
					state <= END;
				else if(lenght_command != (lenght_matrix + 2))
					state <= ERROR;
				else
					state <= VECTOR;	
			
			END:
			
			default: begin
			
			end
		
		endcase
	end
end

always_comb 
begin

end

assign command_lenght = lenght_command;

endmodule 