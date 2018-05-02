 module FSM_EnableTX
(
	// Input Ports
	input clk,
	input reset,
	input Start,
	input stop_enable,
	// Output Ports

	output enable_tx	
);

enum logic {IDLE, ENABLE1} state; 

bit enable_tx_b;

/*------------------------------------------------------------------------------------------*/
/*Asignacion de estado, proceso secuencial*/
always_ff@(posedge clk, negedge reset) begin

	if(reset == 1'b0)
			state <= IDLE;
	else 
	case(state)
		
		IDLE:
			if(Start == 1'b1)
				state <= ENABLE1;
			else
				state <= IDLE;					
		ENABLE1:
			if (stop_enable == 1'b1)
				state <= IDLE;
			else 
				state <= ENABLE1;
				
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
				enable_tx_b = 1'b0;
			end
			
		ENABLE1: 
			begin
				enable_tx_b = 1'b1;
			end
			
	default: 		
			begin
				enable_tx_b = 1'b0;
			end

	endcase
end

// Asingnación de salidas

assign enable_tx = enable_tx_b;

endmodule
