module zxw_fa_v_tb;
	reg Cin_tb, x_tb, y_tb;
	wire s_tb, Cout_tb;
	
fulladd dut (Cin_tb, x_tb, y_tb, s_tb, Cout_tb);

initial begin

	Cin_tb = 0; x_tb = 0; y_tb = 0;
	# 20000 if (s_tb !== 0)
				begin
		$display("Sum is wrong for combination 000");
		$finish;
				end
		else if (Cout_tb !== 0)
				begin
		$display("Cout is wrong for combination 000");
		$finish;
				end

	Cin_tb = 0; x_tb = 0; y_tb = 1;
	# 20000 if (s_tb !== 1)
				begin
		$display("Sum is wrong for combination 000");
		$finish;
				end
		else if (Cout_tb !== 0)
				begin
		$display("Cout is wrong for combination 000");
		$finish;
				end

	Cin_tb = 0; x_tb = 1; y_tb = 0;
	# 20000 if (s_tb !== 1)
				begin
		$display("Sum is wrong for combination 000");
		$finish;
				end
		else if (Cout_tb !== 0)
				begin
		$display("Cout is wrong for combination 000");
		$finish;
				end

	Cin_tb = 0; x_tb = 1; y_tb = 1;
	# 20000 if (s_tb !== 0)
				begin
		$display("Sum is wrong for combination 000");
		$finish;
				end
		else if (Cout_tb !== 1)
				begin
		$display("Cout is wrong for combination 000");
		$finish;
				end

	Cin_tb = 1; x_tb = 0; y_tb = 0;
	# 20000 if (s_tb !== 1)
				begin
		$display("Sum is wrong for combination 000");
		$finish;
				end
		else if (Cout_tb !== 0)
				begin
		$display("Cout is wrong for combination 000");
		$finish;
				end

	Cin_tb = 1; x_tb = 0; y_tb = 1;
	# 20000 if (s_tb !== 0)
				begin
		$display("Sum is wrong for combination 000");
		$finish;
				end
		else if (Cout_tb !== 1)
				begin
		$display("Cout is wrong for combination 000");
		$finish;
				end

	Cin_tb = 1; x_tb = 1; y_tb = 0;
	# 20000 if (s_tb !== 0)
				begin
		$display("Sum is wrong for combination 000");
		$finish;
				end
		else if (Cout_tb !== 1)
				begin
		$display("Cout is wrong for combination 000");
		$finish;
				end

	Cin_tb = 1; x_tb = 1; y_tb = 1;
	# 20000 if (s_tb !== 1)
				begin
		$display("Sum is wrong for combination 000");
		$finish;
				end
		else if (Cout_tb !== 1)
				begin
		$display("Cout is wrong for combination 000");
		$finish;
				end

		$display("Great Job!");
		$finish;
	end
endmodule