module zxw_blogic_tb;
	reg fs2,fs1;
	
   reg [3:0]	A, B;
	wire [3:0] fun;
//  wire	Cout_tb;
	
//zxw_alu_verilog dut(fs3,fs2,fs1,Cin_tb,x_tb, y_tb,s_tb,Cout_tb);
zxw_alu_blogic_verilog dut(fs2,fs1,A,B,fun);
initial begin

	fs2=0; fs1=0; A=4'h0  ; B=4'h0;
	# 20000 if (fun!== 4'h0)
				begin
		$display("Sum is wrong for combination 1");
		
				end
		
	
	fs2=0; fs1=1;A=4'h0; B=4'hF;
	# 20000 if (fun!==4'hF)
				begin
		$display("Sum is wrong for combination 2");

				end
	fs2=1; fs1=0; A=4'h0  ; B=4'hF;
	# 20000 if (fun!== 4'h0)
				begin
		$display("Sum is wrong for combination 3");
		
				end
		
	
	fs2=1; fs1=1;A=4'h0; B=4'h1;
	# 20000 if (fun!==4'hF)
				begin
		$display("Sum is wrong for combination 4");

				end
							
		$display("Great Job!");
		$finish;
	end
	
	endmodule 