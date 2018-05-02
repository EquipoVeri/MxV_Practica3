module Counter_TX(
	input clk, rst, 
	output reg iguales
    );
parameter [25:0] YY = 434;

reg [25:0] CuentaCada20ns;
always @ (negedge rst or posedge clk) begin
	if(rst == 1'b0) 
		CuentaCada20ns <= 0;
	else if (iguales) 
		CuentaCada20ns <= 0;
	else 
		CuentaCada20ns <= CuentaCada20ns + 1'b1;
end

always @ (YY or CuentaCada20ns) begin
	if(CuentaCada20ns == YY) iguales = 1'b1;
	else iguales = 1'b0;
end

endmodule 