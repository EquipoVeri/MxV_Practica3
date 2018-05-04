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

enum logic [2:0] {IDLE, CLEAR_FLAG, DATA1, DATA2, END, ERROR} state;
logic [3:0] Data_byte_low;
logic [3:0] Data_byte_high;

/*------------------------------------------------------------------------------------------*/
/*Asignacion de estado*/

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
			if(interrupt == 1'b1 && error == 1'b0)begin
				state <= CLEAR_FLAG;
				
			end
			else if(interrupt == 1'b1 && error == 1'b1)
				state <= ERROR;
			else 
				state <= IDLE;
	
		CLEAR_FLAG: begin
			state <= DATA1;
			Data_byte_high <= DataInput [3:0];
		end
			
		DATA1: 
			state <= DATA2;	
			
		DATA2: 
			if(interrupt == 1'b1) begin
				state <= END;
				Data_byte_low <= DataInput [3:0];
			end
			else 
				state <= DATA2;		
		
		END:
			state <= IDLE;
		
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
/*------------------------------------------------------------------------------------------*/
/*Salida de control, proceso combintorio*/
always_comb 
begin
data_flag = 1'b0;
clear_interrupt = 1'b0;
	case(state)
		/*CLEAR_FLAG:
			clear_interrupt = 1'b1;*/
			
		DATA1:
			clear_interrupt = 1'b1;
		
		DATA2: begin
			clear_interrupt = 1'b0;
			data_flag = 1'b1;
		end
		
		END:
			data_flag = 1'b1;

		ERROR:begin
			clear_interrupt = 1'b0;
		end
		
		default: begin
			data_flag = 1'b0;
			clear_interrupt = 1'b0;
		end
		
	endcase
end

assign DataOutput = {Data_byte_high,Data_byte_low};

endmodule 