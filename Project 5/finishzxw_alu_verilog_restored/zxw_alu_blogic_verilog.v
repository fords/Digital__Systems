module zxw_alu_blogic_verilog(fs2,fs1,A,B,fun);
	input fs1,fs2;
	input [3:0]A;
	input [3:0]B;
	output reg [3:0]fun;

	
	always@(fs2 or fs1 or B)
	begin
		if(fs2==0 && fs1==0)
		begin
		fun=4'b0000;			
		end
		else if(fs2==0 && fs1==1)
		begin
			fun= B;
		end
		else if(fs2==1 && fs1==0)
		begin
			fun= ~B;
		end
		else if(fs2==1 && fs1==1)
		begin
			fun= 4'b1111;
		end
		
	end
   
endmodule 