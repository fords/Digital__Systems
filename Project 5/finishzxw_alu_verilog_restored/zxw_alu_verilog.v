module zxw_alu_verilog(fs3,fs2,fs1,fs0,A,B,result,carryout);
	input fs0,fs1,fs2,fs3;
	input [3:0]A;
	input [3:0]B;
	
	
	wire [3:0]fun;
	wire  [4:0] logicfun;
	wire coutofAU;
	wire [3:0]sum;
	//wire carryoutinLogic;
	output [3:0]result;
	output carryout;
	
   zxw_alu_blogic_verilog  stage0 (fs2,fs1,A,B,fun); 
	zxw_far                 stage1(fs0, A, fun, sum, coutofAU);
	zxw_alu_logic_verilog   stage2(fs2,fs1,A,B,logicfun);
	
	zxw_mux2to1four_verilog stage3(sum, logicfun[3:0], fs3 ,result);
	zxw_mux2to1_verilog     stage4 (coutofAU,logicfun[4], fs3 ,carryout);
	
	
endmodule 