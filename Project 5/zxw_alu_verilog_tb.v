module zxw_alu_verilog_tb;
	reg fs3,fs2,fs1,Cin_tb;
   reg [3:0]	x_tb, y_tb;
	wire [3:0]s_tb;
   wire	Cout_tb;
	
zxw_alu_verilog dut(fs3,fs2,fs1,Cin_tb,x_tb, y_tb,s_tb,Cout_tb);

initial begin

	fs3=0;fs2=0; fs1=0;Cin_tb = 0; x_tb = 4'b0000; y_tb = 4'b0000;
	# 20000 if (s_tb !== 4'h0)
				begin
		$display("Sum is wrong for combination 1");
	//	$finish;
				end
		else if (Cout_tb !== 0)
				begin
		$display("Cout is wrong for combination 1");
	//	$finish;
				end
	
	fs3=0;fs2=0; fs1=0;Cin_tb = 0; x_tb = 4'h5; y_tb = 4'h5;
	# 20000 if (s_tb !== 4'h5)
				begin
		$display("Sum is wrong for combination 2");
	//	$finish;
				end
		else if (Cout_tb !== 0)
				begin
		$display("Cout is wrong for combination 2");
//		$finish;
				end
	
	fs3=0;fs2=0; fs1=0;Cin_tb = 0; x_tb = 4'hA; y_tb = 4'hA;
	# 20000 if (s_tb !== 4'hA)
				begin
		$display("Sum is wrong for combination 3");
//		$finish;
				end
		else if (Cout_tb !== 0)
				begin
		$display("Cout is wrong for combination 3");
//		$finish;
				end
				
	fs3=0;fs2=0; fs1=0;Cin_tb = 0; x_tb = 4'hF; y_tb = 4'hF;
	# 20000 if (s_tb !== 4'hF)
				begin
		$display("Sum is wrong for combination 4");
 //  	$finish;
				end
		else if (Cout_tb !== 0)
				begin
		$display("Cout is wrong for combination 4");
//		$finish;
				end
				
	fs3=0;fs2=0; fs1=0;Cin_tb = 1; x_tb = 4'h0; y_tb = 4'h0;
	# 20000 if (s_tb !== 4'h1)
				begin
		$display("Sum is wrong for combination 5");
//		$finish;
				end
		else if (Cout_tb !== 0)
				begin
		$display("Cout is wrong for combination 5");
//		$finish;
				end		
	fs3=0;fs2=0; fs1=0;Cin_tb = 1; x_tb = 4'h5; y_tb = 4'h5;
	# 20000 if (s_tb !== 4'h6)
				begin
		$display("Sum is wrong for combination 6");
//		$finish;
				end
		else if (Cout_tb !== 0)
				begin
		$display("Cout is wrong for combination 6");
//		$finish;
				end		
	fs3=0;fs2=0; fs1=0;Cin_tb = 1; x_tb = 4'hA; y_tb = 4'hA;
	# 20000 if (s_tb !== 4'hB)
				begin
		$display("Sum is wrong for combination 7");
//		$finish;
				end
		else if (Cout_tb !== 0)
				begin
		$display("Cout is wrong for combination 7");
//    	$finish;
				end					

	fs3=0;fs2=0; fs1=0;Cin_tb = 1; x_tb = 4'hF; y_tb = 4'hF;
	# 20000 if (s_tb !== 4'h0)
				begin
		$display("Sum is wrong for combination 8");
//		$finish;
				end
		else if (Cout_tb !== 1)
				begin
		$display("Cout is wrong for combination 8");
	//	$finish;
				end			
				
		fs3=0;fs2=0; fs1=1;Cin_tb = 0; x_tb = 4'b0000; y_tb = 4'b0000;
	# 20000 if (s_tb !== 4'h0)
				begin
		$display("Sum is wrong for combination 9");
	//	$finish;
				end
		else if (Cout_tb !== 0)
				begin
		$display("Cout is wrong for combination 9");
	//	$finish;
				end
	
	fs3=0;fs2=0; fs1=1;Cin_tb = 0; x_tb = 4'h5; y_tb = 4'h5;
	# 20000 if (s_tb !== 4'hA)
				begin
		$display("Sum is wrong for combination 10");
	//	$finish;
				end
		else if (Cout_tb !== 0)
				begin
		$display("Cout is wrong for combination 10");
	//	$finish;
				end
	
	fs3=0;fs2=0; fs1=1;Cin_tb = 0; x_tb = 4'hA; y_tb = 4'hA;
	# 20000 if (s_tb !== 4'h4)
				begin
		$display("Sum is wrong for combination 11");
	//	$finish;
				end
		else if (Cout_tb !== 1)
				begin
		$display("Cout is wrong for combination 11");
	//	$finish;
				end
				
	fs3=0;fs2=0; fs1=1;Cin_tb =0; x_tb = 4'hF; y_tb = 4'hF;
	# 20000 if (s_tb !== 4'hE)
				begin
		$display("Sum is wrong for combination 12");
 //  	$finish;
				end
		else if (Cout_tb !== 1)
				begin
		$display("Cout is wrong for combination 12");
	//	$finish;
				end
				
		fs3=0;fs2=0; fs1=1;Cin_tb = 1; x_tb = 4'b0000; y_tb = 4'b0000;
	# 20000 if (s_tb !== 4'h1)
				begin
		$display("Sum is wrong for combination 13");
//		$finish;
				end
		else if (Cout_tb !== 0)
				begin
		$display("Cout is wrong for combination 13");
//		$finish;
				end
	
	fs3=0;fs2=0; fs1=1;Cin_tb = 1; x_tb = 4'h5; y_tb = 4'h5;
	# 20000 if (s_tb !== 4'hB)
				begin
		$display("Sum is wrong for combination 14");
	//	$finish;
				end
		else if (Cout_tb !== 0)
				begin
		$display("Cout is wrong for combination 14");
	//	$finish;
				end
	
	fs3=0;fs2=0; fs1=1;Cin_tb = 1; x_tb = 4'hA; y_tb = 4'hA;
	# 20000 if (s_tb !== 4'h5)
				begin
		$display("Sum is wrong for combination 15");
//		$finish;
				end
		else if (Cout_tb !== 1)
				begin
		$display("Cout is wrong for combination 15");
//		$finish;
				end
				
	fs3=0;fs2=0; fs1=1;Cin_tb = 1; x_tb = 4'hF; y_tb = 4'hF;
	# 20000 if (s_tb !== 4'hF)
				begin
		$display("Sum is wrong for combination 16");
 //  	$finish;
				end
		else if (Cout_tb !== 1)
				begin
		$display("Cout is wrong for combination 16");
//		$finish;
				end
				
		fs3=0;fs2=1; fs1=0;Cin_tb = 0; x_tb = 4'b0000; y_tb = 4'b0000;
	# 20000 if (s_tb !== 4'hF)
				begin
		$display("Sum is wrong for combination 17");
//		$finish;
				end
		else if (Cout_tb !== 0)
				begin
		$display("Cout is wrong for combination 17");
//		$finish;
				end
	
	fs3=0;fs2=1; fs1=0;Cin_tb = 0; x_tb = 4'h5; y_tb = 4'h5;
	# 20000 if (s_tb !== 4'hF)
				begin
		$display("Sum is wrong for combination 18");
	//	$finish;
				end
		else if (Cout_tb !== 0)
				begin
		$display("Cout is wrong for combination 18");
//		$finish;
				end
	
	fs3=0;fs2=1; fs1=0;Cin_tb = 0; x_tb = 4'hA; y_tb = 4'hA;
	# 20000 if (s_tb !== 4'hF)
				begin
		$display("Sum is wrong for combination 19");
//		$finish;
				end
		else if (Cout_tb !== 0)
				begin
		$display("Cout is wrong for combination 19");
//		$finish;
				end
				
	fs3=0;fs2=1; fs1=0;Cin_tb = 0; x_tb = 4'hF; y_tb = 4'hF;
	# 20000 if (s_tb !== 4'hF)
				begin
		$display("Sum is wrong for combination 20");
 //  	$finish;
				end
		else if (Cout_tb !== 0)
				begin
		$display("Cout is wrong for combination 20");
//		$finish;
				end
		fs3=0;fs2=1; fs1=0;Cin_tb = 1; x_tb = 4'b0000; y_tb = 4'b0000;
	# 20000 if (s_tb !== 4'h0)
				begin
		$display("Sum is wrong for combination 21");
//		$finish;
				end
		else if (Cout_tb !== 1)
				begin
		$display("Cout is wrong for combination 21");
	//	$finish;
				end
	
	fs3=0;fs2=1; fs1=0;Cin_tb = 1; x_tb = 4'h5; y_tb = 4'h5;
	# 20000 if (s_tb !== 4'h0)
				begin
		$display("Sum is wrong for combination 22");
	//	$finish;
				end
		else if (Cout_tb !== 1)
				begin
		$display("Cout is wrong for combination 22");
//		$finish;
				end
	
	fs3=0;fs2=1; fs1=0;Cin_tb = 1; x_tb = 4'hA; y_tb = 4'hA;
	# 20000 if (s_tb !== 4'h0)
				begin
		$display("Sum is wrong for combination 23");
//		$finish;
				end
		else if (Cout_tb !== 1)
				begin
		$display("Cout is wrong for combination 23");
//		$finish;
				end
				
	fs3=0;fs2=1; fs1=0;Cin_tb = 1; x_tb = 4'hF; y_tb = 4'hF;
	# 20000 if (s_tb !== 4'h0)
				begin
		$display("Sum is wrong for combination 24");
//   	$finish;
				end
		else if (Cout_tb !== 1)
				begin
		$display("Cout is wrong for combination 24");
//		$finish;
				end
		fs3=0;fs2=1; fs1=1;Cin_tb = 0; x_tb = 4'b0000; y_tb = 4'b0000;
	# 20000 if (s_tb !== 4'hF)
				begin
		$display("Sum is wrong for combination 25");
//		$finish;
				end
		else if (Cout_tb !== 0)
				begin
		$display("Cout is wrong for combination 25");
	//	$finish;
				end
	
	fs3=0;fs2=1; fs1=1;Cin_tb = 0; x_tb = 4'h5; y_tb = 4'h5;
	# 20000 if (s_tb !== 4'h4)
				begin
		$display("Sum is wrong for combination 26");
//		$finish;
				end
		else if (Cout_tb !== 1)
				begin
		$display("Cout is wrong for combination 26");
//		$finish;
				end
	
	fs3=0;fs2=1; fs1=1;Cin_tb = 0; x_tb = 4'hA; y_tb = 4'hA;
	# 20000 if (s_tb !== 4'h9)
				begin
		$display("Sum is wrong for combination 27");
//		$finish;
				end
		else if (Cout_tb !== 1)
				begin
		$display("Cout is wrong for combination 27");
//		$finish;
				end
				
	fs3=0;fs2=1; fs1=1;Cin_tb = 0; x_tb = 4'hF; y_tb = 4'hF;
	# 20000 if (s_tb !== 4'hE)
				begin
		$display("Sum is wrong for combination 28");
 //  	$finish;
				end
		else if (Cout_tb !== 1)
				begin
		$display("Cout is wrong for combination 28");
//		$finish;
				end
				
	fs3=0;fs2=1; fs1=1;Cin_tb = 1; x_tb = 4'b0000; y_tb = 4'b0000;
	# 20000 if (s_tb !== 4'h0)
				begin
		$display("Sum is wrong for combination 29");
//		$finish;
				end
		else if (Cout_tb !== 1)
				begin
		$display("Cout is wrong for combination 29");
//		$finish;
				end
	
	fs3=0;fs2=1; fs1=1;Cin_tb = 1; x_tb = 4'h5; y_tb = 4'h5;
	# 20000 if (s_tb !== 4'h5)
				begin
		$display("Sum is wrong for combination 30");
//		$finish;
				end
		else if (Cout_tb !== 1)
				begin
		$display("Cout is wrong for combination 30");
//		$finish;
				end
	
	fs3=0;fs2=1; fs1=1;Cin_tb = 1; x_tb = 4'hA; y_tb = 4'hA;
	# 20000 if (s_tb !== 4'hA)
				begin
		$display("Sum is wrong for combination 31");
//		$finish;
				end
		else if (Cout_tb !== 1)
				begin
		$display("Cout is wrong for combination 31");
//		$finish;
				end
				
	fs3=0;fs2=1; fs1=1;Cin_tb = 1; x_tb = 4'hF; y_tb = 4'hF;
	# 20000 if (s_tb !== 4'hF)
				begin
		$display("Sum is wrong for combination 32");
//   	$finish;
				end
		else if (Cout_tb !== 1)
				begin
		$display("Cout is wrong for combination 32");
//		$finish;
				end
					fs3=1;fs2=0; fs1=0;Cin_tb = 0; x_tb = 4'b0000; y_tb = 4'b0000;
	# 20000 if (s_tb !== 4'hF)
				begin
		$display("Sum is wrong for combination 33");
//		$finish;
				end
		else if (Cout_tb !== 1)
				begin
		$display("Cout is wrong for combination 33");
//		$finish;
				end
	
	fs3=1;fs2=0; fs1=0;Cin_tb = 0; x_tb = 4'h5; y_tb = 4'h5;
	# 20000 if (s_tb !== 4'hA)
				begin
		$display("Sum is wrong for combination 34");
//		$finish;
				end
		else if (Cout_tb !== 1)
				begin
		$display("Cout is wrong for combination 34");
//		$finish;
				end
	
	fs3=1;fs2=0; fs1=0;Cin_tb = 0; x_tb = 4'hA; y_tb = 4'hA;
	# 20000 if (s_tb !== 4'h5)
				begin
		$display("Sum is wrong for combination 35");
//		$finish;
				end
		else if (Cout_tb !== 1)
				begin
		$display("Cout is wrong for combination 35");
//		$finish;
				end
				
	fs3=1;fs2=0; fs1=0;Cin_tb = 0; x_tb = 4'hF; y_tb = 4'hF;
	# 20000 if (s_tb !== 4'h0)
				begin
		$display("Sum is wrong for combination 36");
//   	$finish;
				end
		else if (Cout_tb !== 1)
				begin
		$display("Cout is wrong for combination 36");
//		$finish;
				end
					fs3=1;fs2=0; fs1=0;Cin_tb = 1; x_tb = 4'b0000; y_tb = 4'b0000;
	# 20000 if (s_tb !== 4'hF)
				begin
		$display("Sum is wrong for combination 37");
	//	$finish;
				end
		else if (Cout_tb !== 1)
				begin
		$display("Cout is wrong for combination 37");
//		$finish;
				end
	
	fs3=1;fs2=0; fs1=0;Cin_tb = 1; x_tb = 4'h5; y_tb = 4'h5;
	# 20000 if (s_tb !== 4'hA)
				begin
		$display("Sum is wrong for combination 38");
//		$finish;
				end
		else if (Cout_tb !== 1)
				begin
		$display("Cout is wrong for combination 38");
	//	$finish;
				end
	
	fs3=1;fs2=0; fs1=0;Cin_tb = 1; x_tb = 4'hA; y_tb = 4'hA;
	# 20000 if (s_tb !== 4'h5)
				begin
		$display("Sum is wrong for combination 39");
//		$finish;
				end
		else if (Cout_tb !== 1)
				begin
		$display("Cout is wrong for combination 39");
//		$finish;
				end
				
	fs3=1;fs2=0; fs1=0;Cin_tb = 1; x_tb = 4'hF; y_tb = 4'hF;
	# 20000 if (s_tb !== 4'h0)
				begin
		$display("Sum is wrong for combination 40");
//   	$finish;
				end
		else if (Cout_tb !== 1)
				begin
		$display("Cout is wrong for combination 40");
//		$finish;
				end
					fs3=1;fs2=0; fs1=1;Cin_tb = 0; x_tb = 4'b0000; y_tb = 4'b0000;
	# 20000 if (s_tb !== 4'h0)
				begin
		$display("Sum is wrong for combination 41");
//		$finish;
				end
		else if (Cout_tb !== 0)
				begin
		$display("Cout is wrong for combination 41");
//		$finish;
				end
	
	fs3=1;fs2=0; fs1=1;Cin_tb = 0; x_tb = 4'h5; y_tb = 4'h5;
	# 20000 if (s_tb !== 4'h5)
				begin
		$display("Sum is wrong for combination 42");
//		$finish;
				end
		else if (Cout_tb !== 0)
				begin
		$display("Cout is wrong for combination 42");
//		$finish;
				end
	
	fs3=1;fs2=0; fs1=1;Cin_tb = 0; x_tb = 4'hA; y_tb = 4'hA;
	# 20000 if (s_tb !== 4'hA)
				begin
		$display("Sum is wrong for combination 43");
//		$finish;
				end
		else if (Cout_tb !== 0)
				begin
		$display("Cout is wrong for combination 43");
//		$finish;
				end
				
	fs3=1;fs2=0; fs1=1;Cin_tb = 0; x_tb = 4'hF; y_tb = 4'hF;
	# 20000 if (s_tb !== 4'hF)
				begin
		$display("Sum is wrong for combination 44");
//   	$finish;
				end
		else if (Cout_tb !== 0)
				begin
		$display("Cout is wrong for combination 44");
//		$finish;
				end
					fs3=1;fs2=0; fs1=1;Cin_tb = 1; x_tb = 4'b0000; y_tb = 4'b0000;
	# 20000 if (s_tb !== 4'h0)
				begin
		$display("Sum is wrong for combination 45");
//		$finish;
				end
		else if (Cout_tb !== 0)
				begin
		$display("Cout is wrong for combination 45");
//		$finish;
				end
	
	fs3=1;fs2=0; fs1=1;Cin_tb = 1; x_tb = 4'h5; y_tb = 4'h5;
	# 20000 if (s_tb !== 4'h5)
				begin
		$display("Sum is wrong for combination 46");
//		$finish;
				end
		else if (Cout_tb !== 0)
				begin
		$display("Cout is wrong for combination 46");
//		$finish;
				end
	
	fs3=1;fs2=0; fs1=1;Cin_tb = 1; x_tb = 4'hA; y_tb = 4'hA;
	# 20000 if (s_tb !== 4'hA)
				begin
		$display("Sum is wrong for combination 47");
//		$finish;
				end
		else if (Cout_tb !== 0)
				begin
		$display("Cout is wrong for combination 47");
//		$finish;
				end
				
	fs3=1;fs2=0; fs1=1;Cin_tb = 1; x_tb = 4'hF; y_tb = 4'hF;
	# 20000 if (s_tb !== 4'hF)
				begin
		$display("Sum is wrong for combination 48");
//   	$finish;
				end
		else if (Cout_tb !== 0)
				begin
		$display("Cout is wrong for combination 48");
//		$finish;
				end
					fs3=1;fs2=1; fs1=0;Cin_tb = 0; x_tb = 4'b0000; y_tb = 4'b0000;
	# 20000 if (s_tb !== 4'h0)
				begin
		$display("Sum is wrong for combination 49");
//		$finish;
				end
		else if (Cout_tb !== 0)
				begin
		$display("Cout is wrong for combination 49");
//		$finish;
				end
	
	fs3=1;fs2=1; fs1=0;Cin_tb = 0; x_tb = 4'h5; y_tb = 4'h5;
	# 20000 if (s_tb !== 4'h5)
				begin
		$display("Sum is wrong for combination 50");
//		$finish;
				end
		else if (Cout_tb !== 0)
				begin
		$display("Cout is wrong for combination 50");
//		$finish;
				end
	
	fs3=1;fs2=1; fs1=0;Cin_tb = 0; x_tb = 4'hA; y_tb = 4'hA;
	# 20000 if (s_tb !== 4'hA)
				begin
		$display("Sum is wrong for combination 51");
//		$finish;
				end
		else if (Cout_tb !==0)
				begin
		$display("Cout is wrong for combination 51");
//		$finish;
				end
				
	fs3=1;fs2=1; fs1=0;Cin_tb = 0; x_tb = 4'hF; y_tb = 4'hF;
	# 20000 if (s_tb !== 4'hF)
				begin
		$display("Sum is wrong for combination 52");
 //  	$finish;
				end
		else if (Cout_tb !== 0)
				begin
		$display("Cout is wrong for combination 52");
//		$finish;
				end
					fs3=1;fs2=1; fs1=0;Cin_tb = 1; x_tb = 4'b0000; y_tb = 4'b0000;
	# 20000 if (s_tb !== 4'h0)
				begin
		$display("Sum is wrong for combination 53");
//		$finish;
				end
		else if (Cout_tb !== 0)
				begin
		$display("Cout is wrong for combination 53");
//		$finish;
				end
	
	fs3=1;fs2=1; fs1=0;Cin_tb = 1; x_tb = 4'h5; y_tb = 4'h5;
	# 20000 if (s_tb !== 4'h5)
				begin
		$display("Sum is wrong for combination 54");
//		$finish;
				end
		else if (Cout_tb !== 0)
				begin
		$display("Cout is wrong for combination 54");
//		$finish;
				end
	
	fs3=1;fs2=1; fs1=0;Cin_tb = 1; x_tb = 4'hA; y_tb = 4'hA;
	# 20000 if (s_tb !== 4'hA)
				begin
		$display("Sum is wrong for combination 55");
//		$finish;
				end
		else if (Cout_tb !== 0)
				begin
		$display("Cout is wrong for combination 55");
//		$finish;
				end
				
	fs3=1;fs2=1; fs1=0;Cin_tb = 1; x_tb = 4'hF; y_tb = 4'hF;
	# 20000 if (s_tb !== 4'hF)
				begin
		$display("Sum is wrong for combination 56");
//   	$finish;
				end
		else if (Cout_tb !== 0)
				begin
		$display("Cout is wrong for combination 56");
//		$finish;
				end
					fs3=1;fs2=1; fs1=1;Cin_tb = 0; x_tb = 4'b0000; y_tb = 4'b0000;
	# 20000 if (s_tb !== 4'h0)
				begin
		$display("Sum is wrong for combination 57");
//		$finish;
				end
		else if (Cout_tb !== 0)
				begin
		$display("Cout is wrong for combination 57");
//		$finish;
				end
	
	fs3=1;fs2=1; fs1=1;Cin_tb = 0; x_tb = 4'h5; y_tb = 4'h5;
	# 20000 if (s_tb !== 4'h2)
				begin
		$display("Sum is wrong for combination 58");
//		$finish;
				end
		else if (Cout_tb !== 1)
				begin
		$display("Cout is wrong for combination 58");
//		$finish;
				end
	
	fs3=1;fs2=1; fs1=1;Cin_tb = 0; x_tb = 4'hA; y_tb = 4'hA;
	# 20000 if (s_tb !== 4'hD)
				begin
		$display("Sum is wrong for combination 59");
//		$finish;
				end
		else if (Cout_tb !== 0)
				begin
		$display("Cout is wrong for combination 59");
//		$finish;
				end
				
	fs3=1;fs2=1; fs1=1;Cin_tb = 0; x_tb = 4'hF; y_tb = 4'hF;
	# 20000 if (s_tb !== 4'hF)
				begin
		$display("Sum is wrong for combination 60");
 //  	$finish;
				end
		else if (Cout_tb !== 1)
				begin
		$display("Cout is wrong for combination 60");
//		$finish;
				end
					fs3=1;fs2=1; fs1=1;Cin_tb = 1; x_tb = 4'b0000; y_tb = 4'b0000;
	# 20000 if (s_tb !== 4'h0)
				begin
		$display("Sum is wrong for combination 61");
//		$finish;
				end
		else if (Cout_tb !== 0)
				begin
		$display("Cout is wrong for combination 61");
	//	$finish;
				end
	
	fs3=1;fs2=1; fs1=1;Cin_tb = 1; x_tb = 4'h5; y_tb = 4'h5;
	# 20000 if (s_tb !== 4'h2)
				begin
		$display("Sum is wrong for combination 62");
//		$finish;
				end
		else if (Cout_tb !== 1)
				begin
		$display("Cout is wrong for combination 62");
//		$finish;
				end
	
	fs3=1;fs2=1; fs1=1;Cin_tb = 1; x_tb = 4'hA; y_tb = 4'hA;
	# 20000 if (s_tb !== 4'hD)
				begin
		$display("Sum is wrong for combination 63");
//		$finish;
				end
		else if (Cout_tb !== 0)
				begin
		$display("Cout is wrong for combination 63");
//		$finish;
				end
				
	fs3=1;fs2=1; fs1=1;Cin_tb = 1; x_tb = 4'hF; y_tb = 4'hF;
	# 20000 if (s_tb !== 4'hF)
				begin
		$display("Sum is wrong for combination 64");
//   	$finish;
				end
		else if (Cout_tb !== 1)
				begin
		$display("Cout is wrong for combination 64");
	//	$finish;
				end
				
		
	 
		
		
							
		$display("Great Job!");
		$finish;
	end
endmodule