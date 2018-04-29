module Data_RX (
	//INPUTS
	input clk,
	input reset,
	input [7:0] DataInput,
	input RxInterrupt,
	
	//OUTPUTS
	output enable_counter_error,
	output logic [7:0] DataOutput,
	output logic data_flag,
	output logic clear_flag
);

enum logic [2:0] {IDLE, CLEAR_FLAG, DATA1, DATA2, ERROR} state;

