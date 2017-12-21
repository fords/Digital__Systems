module zxw_mem_v(Din_upcnt,Resetn,Clock,Cnt_EN,LD_EN_upcnt,LD_EN_H,LD_EN_L,LD_EN_M,WR_EN,Q_out); 
			
			input [7:0] Din_upcnt;	
			input Resetn, Clock, Cnt_EN,LD_EN_upcnt, LD_EN_H,LD_EN_L, LD_EN_M, WR_EN;		
			output [7:0] Q_out;		
		
       
		wire[7:0] A;
      wire[3:0] B,C,D;

		wire clkinver =~ Clock;

	
	zxw_8bit_upcnt_v 	stage0 (Din_upcnt,Resetn,	Cnt_EN, LD_EN_upcnt,Clock,A);
	zxw_rom_v 			stage1 (A,clkinver,B);
	zxw_4bit_reg_v 	stage2 (B,Resetn, LD_EN_M,Clock,C	);
	zxw_ram_v 			stage3 (A,clkinver,C,WR_EN,D);
	zxw_4bit_reg_v 	stage4 (D,Resetn, LD_EN_H,Clock, Q_out[7:4]);
	zxw_4bit_reg_v 	stage5(D,Resetn, LD_EN_L,Clock, Q_out[3:0]);
	
 endmodule    