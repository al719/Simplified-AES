module add_round(
					input [15:0] plain_text, key,
					output [15:0] added_round
				);

assign added_round = plain_text ^ key;

endmodule