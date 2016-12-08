module exl_addr_get
(
	input is_exl,
	input [4:0]cause_type,
	input wb_reset,
	input [31:0]cp0_epc,
	output [31:0]ex_addr,
	output ex_taken,
	output other_reset
	// input is_exl,
	// input [4:0]cause_type,
	// input [31:0]cp0_epc,
);
	assign ex_addr = (wb_reset)?32'hbfc0_0000:
	(cause_type==5'h10)?cp0_epc:32'hbfc0_0380;
	// (cp0_cause_value)?:;
	assign ex_taken = (cause_type==5'h10)| is_exl | wb_reset;

	assign other_reset = wb_reset | is_exl;

endmodule