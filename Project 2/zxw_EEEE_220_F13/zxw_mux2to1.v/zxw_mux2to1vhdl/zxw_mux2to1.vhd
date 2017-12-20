ENTITY zxw_mux2to1 IS
	PORT ( x1, x2, s :IN BIT ;
			 f         :OUT BIT 	);
END zxw_mux2to1  ;

ARCHITECTURE zxw_dataflow OF zxw_mux2to1 IS
BEGIN
	f <= (x1 AND s) OR (NOT s AND x2) ;
END zxw_dataflow   ;
