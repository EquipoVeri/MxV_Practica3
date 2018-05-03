module Load_M_V
#(	parameter Word_Length = 8)(
// Input Ports
	input clk,
	input reset,
	input interrupt,
	input finish_count,
	input [Word_Length-1:0] Data_Input,
	
// Output Ports
	output push,
	output enable_counter,
	output enable_size,
	output reset_counter,
	//output enable_vector,
	output send_result,
	output clear_vector,
	output clearInterrupt,
	output enable_load,
	output flag_Matrix_Vector,
	output [Word_Length-1:0] Matrix_length,
	output [Word_Length-1:0] Command_lenght
);

//PARAMETERS
localparam INIT_BYTE = 8'hFE;
localparam STOP_BYTE = 8'hEF;

enum logic [2:0] {INIT, MATRIX_SIZE, RESEND_RESULT, INIT_CAPTURE, DATA_CAPTURE} command;
enum logic [3:0] {IDLE, START, LENGHT, CMD, SIZE, SEND, CAPTURE, MATRIX, VECTOR, ERROR, END, STOP} state;

logic [Word_Length-1:0] lenght_command;
logic [Word_Length-1:0] instruction;
logic [Word_Length-1:0] lenght_matrix;

bit push_bit;
bit enable_counter_bit;
bit reset_counter_bit;
//bit enable_vector_bit;
bit enable_capture_v;
bit send_result_bit;
bit enable_size_bit;
bit clear_vector_bit;
bit enable_load_bit;
bit clearInterrupt_bit;
bit flag_Matrix_Vector_b;

/*------------------------------------------------------------------------------------------*/
/*Asignacion de estado*/

always_ff@(posedge interrupt, negedge reset) 
begin
	if(reset == 1'b0) 
		begin
			state <= IDLE;
		end
	else begin
		case(state)
		
			IDLE: 
				if(interrupt == 1'b1)
					if(Data_Input == INIT_BYTE) 
						state <= START;
					/*else if(Data_Input == STOP_BYTE) 
						state <= STOP;*/
					else
						state <= ERROR;
				else
					state <= IDLE;
							
			START:
				if(interrupt == 1'b1)begin
					state <= LENGHT;
					lenght_command <= Data_Input;
				end
				else
					state <= START;		
					
			LENGHT: 
				if(interrupt == 1'b1)
					begin
						state <= CMD;
						instruction <= Data_Input;
					end
				else
					state <= LENGHT;	
					
			CMD:
				if(interrupt == 1'b1 && finish_count == 1'b1)
					begin
						state <= IDLE;
						
					end
				else if(interrupt == 1'b1 && finish_count == 1'b0)
					begin
					
						if(instruction == MATRIX_SIZE)begin
							state <= SIZE;
							lenght_matrix <= Data_Input;
						end
						else if(instruction == RESEND_RESULT)
							state <= SEND;
						else if(instruction == INIT_CAPTURE)
							state <= IDLE;
						else if(instruction == DATA_CAPTURE && flag_Matrix_Vector_b == 1'b0)
							state <= MATRIX;
						else if(instruction == DATA_CAPTURE && flag_Matrix_Vector_b == 1'b1)
							state <= VECTOR;
						else 
							state <= ERROR;
					end
				else 
					state <= CMD;
			
			SIZE: 
				if(interrupt == 1'b1 && finish_count == 1'b1)
					begin
						state <= IDLE;
					end
				else if(lenght_command != 4'd3)
					state <= ERROR;
				else
					state <= SIZE;	
					
			SEND:
				if(interrupt == 1'b1 && finish_count == 1'b1)
					state <= IDLE;
				else if(lenght_command != 4'd1)
					state <= ERROR;
				else
					state <= SEND;				
			
			CAPTURE:
				if(lenght_command != 4'd2)
					state <= ERROR;
				else
					state <= IDLE;
	
			
			MATRIX: begin
				flag_Matrix_Vector_b = 1'b1;
				if(interrupt == 1'b1 && finish_count == 1'b1/*&& Data_Input == STOP_BYTE*/)
					state <= IDLE;
				else if(lenght_command != (lenght_matrix*lenght_matrix + 2))
					state <= ERROR;
				else
					state <= MATRIX;	
				end
				
			VECTOR: begin
				flag_Matrix_Vector_b = 1'b0;
				if(interrupt == 1'b1 && finish_count == 1'b1/*&& Data_Input == STOP_BYTE*/) begin
					//flag_Matrix_Vector_b = 1'b0;
					state <= STOP;
				//	enable_load_bit <= 1'b0; 
				end
				else if(lenght_command != (lenght_matrix + 2))
					state <= ERROR;
				else begin
					state <= VECTOR;	
					//enable_vector_bit = 1'b0;
				end
				end
				
			STOP: begin
				if(interrupt == 1'b1 && Data_Input == STOP_BYTE)
					state <= IDLE;
				//	enable_vector_bit = 1'b1;
				//	flag_Matrix_Vector_b = 1'b0;
				//	enable_load_bit = 1'b0; 
			end
				
			END:
				if(interrupt == 1'b1)
					if(Data_Input == STOP_BYTE) 
						state <= IDLE;
					else
						state <= ERROR;
				else 
					state <= END;
			
			ERROR: begin
				lenght_command <= 8'b0;
				lenght_matrix <= 8'b0;
				instruction <= 8'b0;
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
enable_counter_bit = 1'b0;
//enable_vector_bit = 1'b0;
reset_counter_bit = 1'b0;	
enable_size_bit = 1'b0;
send_result_bit = 1'b0;
clear_vector_bit = 1'b0;
clearInterrupt_bit = 1'b0;
enable_load_bit = 1'b0; 
	case(state)
		START: begin
			
			clearInterrupt_bit = 1'b1; 
		end
		
		LENGHT:begin
			reset_counter_bit = 1'b1;
			enable_counter_bit = 1'b1;
			clearInterrupt_bit = 1'b1;
		end	
		
		CMD: begin
			enable_counter_bit = 1'b1;
			clearInterrupt_bit = 1'b1;
		end
		
		SIZE:
			enable_counter_bit = 1'b1;
		
		SEND: begin
			send_result_bit = 1'b1;
			clearInterrupt_bit = 1'b1;	
		end
		
		MATRIX: begin
			enable_counter_bit = 1'b1;
			push_bit = 1'b1;
			clearInterrupt_bit = 1'b1;
		end
		
		VECTOR: begin
			enable_load_bit = 1'b1;
			enable_counter_bit = 1'b1;
			//enable_vector_bit = 1'b0;
			clearInterrupt_bit = 1'b1;
		end
		
		STOP: begin
			enable_load_bit = 1'b0;
			clear_vector_bit = 1'b0;
		end
			
		
		ERROR: begin
			reset_counter_bit = 1'b1;	
			enable_size_bit = 1'b0;
			clear_vector_bit = 1'b1;
			clearInterrupt_bit = 1'b0;
		end
		
		END:
			if(instruction == MATRIX_SIZE)
				enable_size_bit = 1'b1;
				
		default begin
			enable_load_bit = 1'b0;
			push_bit = 1'b0;
			enable_counter_bit = 1'b0;
			//enable_vector_bit = 1'b0;
			reset_counter_bit = 1'b0;	
			enable_size_bit = 1'b0;
			send_result_bit = 1'b0;
			clear_vector_bit = 1'b0;
			clearInterrupt_bit = 1'b0; 
		end
		
	endcase
end

assign push = push_bit;
assign enable_counter = enable_counter_bit;
//assign enable_vector = enable_vector_bit;
assign reset_counter = reset_counter_bit;
assign send_result = send_result_bit;
assign Matrix_length = lenght_matrix;
assign Command_lenght = lenght_command;
assign enable_size = enable_size_bit;
assign clear_vector = clear_vector_bit;
assign clearInterrupt = clearInterrupt_bit;
assign enable_load = enable_load_bit;
assign flag_Matrix_Vector = flag_Matrix_Vector_b;

endmodule 