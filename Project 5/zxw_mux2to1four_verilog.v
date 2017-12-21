module zxw_mux2to1four_verilog (x1, x2, s ,f );
  input s;
  input [3:0] x1,x2;
  output reg [3:0] f;
 
  
  always@(x1 or x2 or s)
  
  begin
	if(s==0)
	begin
		f=x1;
	end
	
	if(s==1)
	begin
		f=x2;
	end
	
  end 
  
endmodule 