

module zxw_alu_logic_verilog(fs2,fs1,A,B,fun);
	input fs1,fs2;
	input [3:0]A;
	input [3:0]B;
	output reg[4:0]fun;
  
	always@(fs2 or fs1 or A or B)
	begin
		if(fs2==0 && fs1==0)
		begin
			fun=~A;			
		end
		else if(fs2==0 &&fs1==1)
		begin
			fun= A&B;
		end
		else if(fs2==1 &&fs1==0)
		begin
			fun= A|B;
		end
		else if(fs2==1 &&fs1==1)
		begin
			
			fun[4]=A[0];
			fun[3:0]= A>>1;
			fun[3]=A[3];
			
			
		end
		
	end
	

endmodule
