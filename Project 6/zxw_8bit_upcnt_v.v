module zxw_8bit_upcnt_v (D, Resetn, Cnt_EN, LD_EN, Clock, Q);
	input [7:0] D;
	input Resetn, Cnt_EN, LD_EN, Clock;
	output reg [7:0] Q;
// Remember: This always block is executed when a falling edge
// is detected on Resetn or a rising edge is detected on Clock
	always @(negedge Resetn, posedge Clock)
	 	if (!Resetn)
			Q <= 0;
		else if (LD_EN)
				Q <= D;
		else if (Cnt_EN)
				Q <= Q + 1;		
endmodule

