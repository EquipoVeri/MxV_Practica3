module Load_M_V
#(	parameter Word_Length = 8)(
// Input Ports
	input clk,
	input reset,
	input interrupt,
	input data_ready,
	input finish_count,
	input full_Matrix,
	input [Word_Length-1:0] Data_Input,
	
// Output Ports
	output push,
	output pop,
	output enable_counter,
	output enable_size,
	output reset_counter,
	output enable_vector,
	output send_result,
	output clear_vector,
	output [Word_Length-1:0] Matrix_length,
	output [Word_Length-1:0] Command_lenght
);

//PARAMETERS
localparam INIT_BYTE = 8'hFE;
localparam STOP_BYTE = 8'hEF;

enum logic [2:0] {MATRIX_SIZE, RESEND_RESULT, INIT_CAPTURE, DATA_CAPTURE} command;
enum logic [3:0] {IDLE, START, LENGHT, CMD, SIZE, SEND, CAPTURE, MATRIX, VECTOR, ERROR, END, STOP} state;

logic [Word_Length-1:0] lenght_command;
logic [Word_Length-1:0] instruction;
logic [Word_Length-1:0] lenght_matrix;

bit push_bit;
bit pop_bit;
bit enable_counter_bit;
bit reset_counter_bit;
bit enable_vector_bit;
bit enable_capture_m;
bit enable_capture_v;
bit send_result_bit;
bit enable_size_bit;
bit clear_vector_bit;

/*------------------------------------------------------------------------------------------*/
/*Asignacion de estado*/

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
				if(data_ready == 1'b1 && finish_count == 1'b1)
					begin
						state <= END;
						instruction <= Data_Input;
					end
				else if(data_ready == 1'b1 && finish_count == 1'b0)
					begin
						instruction <= Data_Input;
						if(instruction == MATRIX_SIZE)
							state <= SIZE;
						else if(instruction == RESEND_RESULT)
							state <= SEND;
						else if(instruction == INIT_CAPTURE)
							state <= CAPTURE;
						else if(instruction == DATA_CAPTURE && enable_capture_m == 1'b1)
							state <= MATRIX;
						else if(instruction == DATA_CAPTURE && enable_capture_v == 1'b1)
							state <= VECTOR;
						else 
							state <= ERROR;
					end
				else 
					state <= CMD;
			
			SIZE: 
				if(data_ready == 1'b1 && finish_count == 1'b1)
					begin
						state <= END;
						lenght_matrix <= Data_Input;
					end
				else if(lenght_command != 4'd3)
					state <= ERROR;
				else
					state <= SIZE;	
					
			SEND:
				if(data_ready == 1'b1 && finish_count == 1'b1)
					state <= END;
				else if(lenght_command != 4'd1)
					state <= ERROR;
				else
					state <= SEND;				
			
			CAPTURE:
				if(data_ready == 1'b1 && finish_count == 1'b1)
					state <= END;
				else if(lenght_command != 4'd2)
					state <= ERROR;
				else
					state <= CAPTURE;	
			
			MATRIX: 
				if(data_ready == 1'b1 && finish_count == 1'b1)
					state <= END;
				else if(lenght_command != (lenght_matrix*lenght_matrix + 2))
					state <= ERROR;
				else
					state <= MATRIX;	
			
			VECTOR:
				if(data_ready == 1'b1 && finish_count == 1'b1)
					state <= END;
				else if(lenght_command != (lenght_matrix + 2))
					state <= ERROR;
				else
					state <= VECTOR;	
			
			END:
				if(data_ready == 1'b1)
					if(Data_Input == STOP_BYTE) 
						state <= STOP;
					else
						state <= ERROR;
				else 
					state <= END;
			
			STOP:
				state <= IDLE;
			
			ERROR: begin
				lenght_command <= 8'b0;
				lenght_matrix <= 8'b0;
				instruction <= 8'b0;
				if(data_ready == 1'b1)
					state <= IDLE;
				else 
					state <= ERROR;
			end
			
			default:
				state <= IDLE;
		
		endcase
	end
end

/*------------------------------------------------------------------------------------------*/
/*Salida de control, proceso combintorio*/

always_comb 
begin
push_bit = 1'b0;
pop_bit = 1'b0;
enable_counter_bit = 1'b0;
enable_vector_bit = 1'b0;
reset_counter_bit = 1'b0;	
enable_size_bit = 1'b0;
send_result_bit = 1'b0;
enable_capture_v = 1'b0;
enable_capture_m = 1'b0;
clear_vector_bit = 1'b0;
	case(state)
		LENGHT:
			enable_counter_bit = 1'b1;
		
		CMD:
			enable_counter_bit = 1'b1;
		
		SIZE:
			enable_counter_bit = 1'b1;
		
		SEND:
			send_result_bit = 1'b1;
			
		CAPTURE:
			enable_capture_m = 1'b1;
					
		MATRIX: begin
			enable_capture_v = 1'b1;
			enable_counter_bit = 1'b1;
			push_bit = 1'b1;
		end
		
		VECTOR: begin
			enable_counter_bit = 1'b1;
			enable_vector_bit = 1'b1;
		end
		
		ERROR: begin
			reset_counter_bit = 1'b1;	
			pop_bit = 1'b1;
			enable_size_bit = 1'b0;
			clear_vector_bit = 1'b1;
		end
		
		END:
			if(instruction == MATRIX_SIZE)
				enable_size_bit = 1'b1;
				
		default begin
			push_bit = 1'b0;
			pop_bit = 1'b0;
			enable_counter_bit = 1'b0;
			enable_vector_bit = 1'b0;
			reset_counter_bit = 1'b0;	
			enable_size_bit = 1'b0;
			send_result_bit = 1'b0;
			enable_capture_v = 1'b0;
			enable_capture_v = 1'b0;
			clear_vector_bit = 1'b0;
		end
		
	endcase
end

assign push = push_bit;
assign pop = pop_bit;
assign enable_counter = enable_counter_bit;
assign enable_vector = enable_vector_bit;
assign reset_counter = reset_counter_bit;
assign send_result = send_result_bit;
assign Matrix_length = lenght_matrix;
assign Command_lenght = lenght_command;
assign enable_size = enable_size_bit;
assign clear_vector = clear_vector_bit;

endmodule 