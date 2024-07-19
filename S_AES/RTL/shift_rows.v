module shift_rows(
					input [15:0] nibble_out,
					output [15:0] shifted_rows
					);
assign shifted_rows = {nibble_out[15:12],nibble_out[3:0],nibble_out[7:4],nibble_out[11:8]};


endmodule