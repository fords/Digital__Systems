module zxw_far(carryin, x, y, s, carryout);
	input carryin;
   input	[3:0] x, y;
	
	output [3:0] s;
   output	carryout;

	xor(z0,y[0],carryin );
	xor(z1,y[1],carryin );
	xor(z2,y[2],carryin );
	xor(z3,y[3],carryin );
	
	fulladd stage0 (carryin, x[0], z0, s[0], c1);
	fulladd stage1 (c1, x[1], z1, s[1], c2);
	fulladd stage2 (c2, x[2], z2, s[2], c3);
	fulladd stage3 (c3, x[3], z3, s[3], carryout);
endmodule
