
`timescale 1ns/10ps

module  CONV(
	input		clk,
	input		reset,
	output		busy,	
	input		ready,	
			
	output		iaddr,
	input		idata,	
	
	output	 	cwr,
	output	 	caddr_wr,
	output	 	cdata_wr,
	
	output	 	crd,
	output	 	caddr_rd,
	input	 	cdata_rd,
	
	output	 	csel
	);



endmodule




