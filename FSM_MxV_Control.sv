module FSM_MxV_Control
(
	// Input Ports
	input clk,
	input reset,
	input StartLoad,
	input EndLoad,
	input EndOp,
	input EndTxResults,
	input Op,
	input [7:0] matrix_length,
	// Output Ports
	output enable_counter,
	output op_in_process,
	output pop_1,
	output pop_2,
	output pop_3,
	output pop_4,
	output transmit,
	output [7:0] data,
	output tx_en,
	output last_cmd
);

enum logic [3:0] {IDLE, LOAD_FIFOS1, LOAD_FIFOS_START, POP1, POP12, POP123, POP1234, SEND_FE, SEND_LENGTH, SEND_CMD, TX_RESULT, SEND_EF} state; 

bit enable_counter_b;
bit op_in_process_b;
bit pop1_b;
bit pop2_b;
bit pop3_b;
bit pop4_b;
bit transmit_b;
bit tx_en_init_b;
bit last_cmd_b;

logic [7:0] data_w;

/*------------------------------------------------------------------------------------------*/
/*Asignacion de estado, proceso secuencial*/
always_ff@(posedge clk, negedge reset) begin

	if(reset == 1'b0)
			state <= IDLE;
	else 
	case(state)
		IDLE:
			if(StartLoad == 1'b1)
				state <= LOAD_FIFOS1;
			else
				state <= IDLE;	
		LOAD_FIFOS1:
			if(StartLoad == 1'b0)
				state <= LOAD_FIFOS_START;
			else
				state <= LOAD_FIFOS1;			
		
		LOAD_FIFOS_START:
			if(EndLoad == 1'b1)
				state <= POP1;
			else
				state <= LOAD_FIFOS_START;
				
		POP1:
			if(Op == 1'b1)
				state <= POP12;
			else
				state <= POP1;	
				
		POP12:
			if(Op == 1'b1)
				state <= POP123;
			else
				state <= POP12;

		POP123:
			if(Op == 1'b1)
				state <= POP1234;
			else
				state <= POP123;
				
		POP1234:
			if(EndOp == 1'b1) begin
				state <= SEND_FE;
				data_w = 8'hFE;
			end
			else
				state <= POP1234;
		
		SEND_FE:
		begin
			state <= SEND_LENGTH;
			data_w = matrix_length;
		end
		
		SEND_LENGTH:
		begin
			state <= SEND_CMD;
			data_w = 8'h04;
		end
		
		SEND_CMD: begin
			data_w = 8'hEF;
			state <= TX_RESULT;
		end
			
		TX_RESULT:	
			if(EndTxResults == 1'b1) begin
				state <= SEND_EF;
			end
			else
				state <= TX_RESULT;
			
		SEND_EF:	
			state <= IDLE;
				
		default:
			state <= IDLE;

		endcase
end//end always
/*------------------------------------------------------------------------------------------*/
/*Asignación de salidas,proceso combintorio*/
always_comb begin
	 case(state)
		IDLE: 
			begin
				enable_counter_b = 1'b0;
				op_in_process_b = 1'b0;
				pop1_b = 1'b0;
				pop2_b = 1'b0;
				pop3_b = 1'b0;
				pop4_b = 1'b0;
				transmit_b = 1'b0;
				tx_en_init_b = 1'b0;
				last_cmd_b = 1'b0;
			end
		LOAD_FIFOS1: 
			begin
				enable_counter_b = 1'b0;
				op_in_process_b = 1'b0;
				pop1_b = 1'b0;
				pop2_b = 1'b0;
				pop3_b = 1'b0;
				pop4_b = 1'b0;
				transmit_b = 1'b0;
				tx_en_init_b = 1'b0;
				last_cmd_b = 1'b0;
			end
		LOAD_FIFOS_START: 
			begin
				enable_counter_b = 1'b1;
				op_in_process_b = 1'b0;
				pop1_b = 1'b0;
				pop2_b = 1'b0;
				pop3_b = 1'b0;
				pop4_b = 1'b0;
				transmit_b = 1'b0;
				tx_en_init_b = 1'b0;
				last_cmd_b = 1'b0;
			end
		POP1:
			begin
				enable_counter_b = 1'b0;
				op_in_process_b = 1'b1;
				pop1_b = 1'b1;
				pop2_b = 1'b0;
				pop3_b = 1'b0;
				pop4_b = 1'b0;
				transmit_b = 1'b0;
				tx_en_init_b = 1'b0;
				last_cmd_b = 1'b0;
			end
		POP12:
			begin
				enable_counter_b = 1'b0;
				op_in_process_b = 1'b1;
				pop1_b = 1'b1;
				pop2_b = 1'b1;
				pop3_b = 1'b0;
				pop4_b = 1'b0;
				transmit_b = 1'b0;
				tx_en_init_b = 1'b0;
				last_cmd_b = 1'b0;
			end
		POP123:
			begin
				enable_counter_b = 1'b0;
				op_in_process_b = 1'b1;
				pop1_b = 1'b1;
				pop2_b = 1'b1;
				pop3_b = 1'b1;
				pop4_b = 1'b0;
				transmit_b = 1'b0;
				tx_en_init_b = 1'b0;
				last_cmd_b = 1'b0;
			end
		POP1234:
			begin
				enable_counter_b = 1'b0;
				op_in_process_b = 1'b1;
				pop1_b = 1'b1;
				pop2_b = 1'b1;
				pop3_b = 1'b1;
				pop4_b = 1'b1;
				transmit_b = 1'b0;
				tx_en_init_b = 1'b0;
				last_cmd_b = 1'b0;
			end
		SEND_FE:
			begin
				enable_counter_b = 1'b0;
				op_in_process_b = 1'b0;
				pop1_b = 1'b0;
				pop2_b = 1'b0;
				pop3_b = 1'b0;
				pop4_b = 1'b0;
				transmit_b = 1'b0;
				tx_en_init_b = 1'b1;
				last_cmd_b = 1'b0;
			end
		SEND_LENGTH:
			begin
				enable_counter_b = 1'b0;
				op_in_process_b = 1'b0;
				pop1_b = 1'b0;
				pop2_b = 1'b0;
				pop3_b = 1'b0;
				pop4_b = 1'b0;
				transmit_b = 1'b0;
				tx_en_init_b = 1'b1;
				last_cmd_b = 1'b0;
			end
		SEND_CMD:
			begin
				enable_counter_b = 1'b0;
				op_in_process_b = 1'b0;
				pop1_b = 1'b0;
				pop2_b = 1'b0;
				pop3_b = 1'b0;
				pop4_b = 1'b0;
				transmit_b = 1'b0;
				tx_en_init_b = 1'b1;
				last_cmd_b = 1'b0;
			end
		TX_RESULT:
			begin
				enable_counter_b = 1'b0;
				op_in_process_b = 1'b0;
				pop1_b = 1'b0;
				pop2_b = 1'b0;
				pop3_b = 1'b0;
				pop4_b = 1'b0;
				transmit_b = 1'b1;
				tx_en_init_b = 1'b0;
				last_cmd_b = 1'b0;
			end
		SEND_EF:
			begin
				enable_counter_b = 1'b0;
				op_in_process_b = 1'b0;
				pop1_b = 1'b0;
				pop2_b = 1'b0;
				pop3_b = 1'b0;
				pop4_b = 1'b0;
				transmit_b = 1'b0;
				tx_en_init_b = 1'b0;
				last_cmd_b = 1'b1;
			end
	default: 		
			begin
				enable_counter_b = 1'b0;
				op_in_process_b = 1'b0;
				pop1_b = 1'b0;
				pop2_b = 1'b0;
				pop3_b = 1'b0;
				pop4_b = 1'b0;
				transmit_b = 1'b0;
				tx_en_init_b = 1'b0;
				last_cmd_b = 1'b0;
			end

	endcase
end

// Asingnación de salidas

assign enable_counter = enable_counter_b;
assign op_in_process = op_in_process_b;

assign pop_1 = pop1_b;
assign pop_2 = pop2_b;
assign pop_3 = pop3_b;
assign pop_4 = pop4_b;

assign transmit = transmit_b;

assign data = data_w;
assign tx_en = tx_en_init_b;
assign last_cmd = last_cmd_b;


endmodule
