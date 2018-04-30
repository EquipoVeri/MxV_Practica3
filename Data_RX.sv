module Data_RX (
	//INPUTS
	input clk,
	input reset,
	input interrupt,
	input error,
	input [7:0] DataInput,

	
	//OUTPUTS
	output logic data_flag,
	output logic clear_interrupt,
	output logic [7:0] DataOutput
);

enum logic [2:0] {IDLE, CLEAR_FLAG, DATA1, DATA2, ERROR} state;
logic [3:0] Data_byte_low;
logic [3:0] Data_byte_high;

always_ff@(posedge clk, negedge reset)
begin
	if(reset == 1'b0) 
		begin
			state <= IDLE;
			Data_byte_low <= 4'd0;
			Data_byte_high <= 4'd0;
		end
	else begin
		case(state)
		
		IDLE:
			if(interrupt == 1'b1 && error == 1'b0)
				state <= CLEAR_FLAG;
			else if(interrupt == 1'b1 && error == 1'b1)
				state <= ERROR;
			else 
				state <= IDLE;
	
		CLEAR_FLAG:
			state <= DATA1;
			
		DATA1: 
			begin
				Data_byte_high <= DataInput [3:0];
				state <= DATA2;
			end	
			
		DATA2: 
			if(interrupt == 1'b1)
				begin
					Data_byte_low <= DataInput [3:0];
					state <= IDLE;
				end
			else 
				state <= DATA2;
		
		ERROR:
			if(interrupt == 1'b0) 
				state <= IDLE;
			else 
				state <= ERROR;
		
		default: 
			begin
				state <= IDLE;
				Data_byte_low <= 4'd0;
				Data_byte_high <= 4'd0;
			end
		endcase
	end
end

always_comb 
begin
data_flag = 1'b0;
clear_interrupt = 1'b0;
	case(state)
		CLEAR_FLAG:
			clear_interrupt = 1'b1;
		
		DATA1:
			clear_interrupt = 1'b1;

		DATA2:
			data_flag = 1'b1;

		ERROR:begin
			data_flag = 1'b0;
			clear_interrupt = 1'b0;
		end
	endcase
end

assign DataOutput = {Data_byte_high,Data_byte_low};

endmodule 