module zxw_farr_v_tb;
	reg Cin_tb;
   reg [3:0]	x_tb, y_tb;
	wire [3:0]s_tb;
   wire	Cout_tb;
	
zxw_far dut (Cin_tb, x_tb, y_tb, s_tb, Cout_tb);

initial begin

	Cin_tb = 0; x_tb = 4'b0000; y_tb = 4'b0000;
	# 20000 if (s_tb !== 4'b0000)
				begin
		$display("Sum is wrong for combination 1");
		$finish;
				end
		else if (Cout_tb !== 0)
				begin
		$display("Cout is wrong for combination 1");
		$finish;
				end

	Cin_tb = 0; x_tb = 4'b0000; y_tb = 4'b1111;
	# 20000 if (s_tb !== 4'b1111)
				begin
		$display("Sum is wrong for combination 2");
		$finish;
				end
		else if (Cout_tb !== 0)
				begin
		$display("Cout is wrong for combination 2");
		$finish;
				end

	Cin_tb = 0; x_tb = 4'b1111; y_tb = 4'b1111;
	# 20000 if (s_tb !== 4'b1110)
				begin
		$display("Sum is wrong for combination 3 ");
		$finish;
				end
		else if (Cout_tb !== 1)
				begin
		$display("Cout is wrong for combination 3");
		$finish;
				end

	Cin_tb = 0; x_tb = 4'b1111; y_tb = 4'b0000;
	# 20000 if (s_tb !== 4'b1111)
				begin
		$display("Sum is wrong for combination 4");
		$finish;
				end
		else if (Cout_tb !== 0)
				begin
		$display("Cout is wrong for combination 4");
		$finish;
				end

	Cin_tb = 0; x_tb = 4'b0101; y_tb = 4'b0101;
	# 20000 if (s_tb !== 4'b1010)
				begin
		$display("Sum is wrong for combination 5");
		$finish;
				end
		else if (Cout_tb !== 0)
				begin
		$display("Cout is wrong for combination 5");
		$finish;
				end

	Cin_tb = 0; x_tb = 4'b0101; y_tb = 4'b1010;
	# 20000 if (s_tb !== 4'b1111)
				begin
		$display("Sum is wrong for combination 6");
		$finish;
				end
		else if (Cout_tb !== 0)
				begin
		$display("Cout is wrong for combination 6");
		$finish;
				end

	Cin_tb = 0; x_tb = 4'b1010; y_tb = 4'b1010;
	# 20000 if (s_tb !== 4'b0100)
				begin
		$display("Sum is wrong for combination 7");
		$finish;
				end
		else if (Cout_tb !== 1)
				begin
		$display("Cout is wrong for combination 7");
		$finish;
				end

	Cin_tb = 0; x_tb = 4'b1010; y_tb = 4'b0101;
	# 20000 if (s_tb !== 4'b1111)
				begin
		$display("Sum is wrong for combination 8");
		$finish;
				end
		else if (Cout_tb !== 0)
				begin
		$display("Cout is wrong for combination 8");
		$finish;
				end
	Cin_tb = 1; x_tb = 4'b0000; y_tb = 4'b0000;
	# 20000 if (s_tb !== 4'b0000)
				begin
		$display("Sum is wrong for combination 9");
		$finish;
				end
		else if (Cout_tb !== 1)
				begin
		$display("Cout is wrong for combination 9");
		$finish;
				end			
		
	Cin_tb = 1; x_tb = 4'b0000; y_tb = 4'b1111;
	# 20000 if (s_tb !== 4'b0001)
				begin
		$display("Sum is wrong for combination 10");
		$finish;
				end
		else if (Cout_tb !== 0)
				begin
		$display("Cout is wrong for combination 10");
		$finish;
				end		
	Cin_tb = 1; x_tb = 4'b1111; y_tb = 4'b1111;
	# 20000 if (s_tb !== 4'b0000)
				begin
		$display("Sum is wrong for combination 11");
		$finish;
				end
		else if (Cout_tb !== 1)
				begin
		$display("Cout is wrong for combination 11");
		$finish;
				end		
	Cin_tb = 1; x_tb = 4'b1111; y_tb = 4'b0000;
	# 20000 if (s_tb !== 4'b1111)
				begin
		$display("Sum is wrong for combination 12");
		$finish;
				end
		else if (Cout_tb !== 1)
				begin
		$display("Cout is wrong for combination 12");
		$finish;
				end		
	Cin_tb = 1; x_tb = 4'b0101; y_tb = 4'b0101;
	# 20000 if (s_tb !== 4'b0000)
				begin
		$display("Sum is wrong for combination 13");
		$finish;
				end
		else if (Cout_tb !== 1)
				begin
		$display("Cout is wrong for combination 13");
		$finish;
				end		
	Cin_tb = 1; x_tb = 4'b0101; y_tb = 4'b1010;
	# 20000 if (s_tb !== 4'b1011)
				begin
		$display("Sum is wrong for combination 14");
		$finish;
				end
		else if (Cout_tb !== 0)
				begin
		$display("Cout is wrong for combination 14");
		$finish;
				end		
	Cin_tb = 1; x_tb = 4'b1010; y_tb = 4'b1010;
	# 20000 if (s_tb !== 4'b0000)
				begin
		$display("Sum is wrong for combination 15");
		$finish;
				end
		else if (Cout_tb !== 1)
				begin
		$display("Cout is wrong for combination 15");
		$finish;
				end		
	Cin_tb = 1; x_tb = 4'b1010; y_tb = 4'b0101;
	# 20000 if (s_tb !== 4'b0101)
				begin
		$display("Sum is wrong for combination 16");
		$finish;
				end
		else if (Cout_tb !== 1)
				begin
		$display("Cout is wrong for combination 16");
		$finish;
				end		
		
		
							
		$display("Great Job!");
		$finish;
	end
endmodule