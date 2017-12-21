module zxw_4bit_reg_v (D, Resetn, LD_EN, Clock, Q);
	input [3:0] D;
	input Resetn, LD_EN, Clock;
	output reg [3:0] Q;
// Execute the always block whenever you detect a 
// falling edge on Resetn or a rising edge on Clock
	always @(negedge Resetn, posedge Clock)
	 	if (!Resetn)
			Q <= 0;
		else
			if (!LD_EN)
				Q <= Q;
			else
				Q <= D;		
endmodule

