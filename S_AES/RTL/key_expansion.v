module key_expansion(
						input Encrypt,
						input [15:0] key,
						//output reg[15:0] key0,
						output [15:0] key1,
						output [15:0] key2
					);

reg[7:0] w0,w1,w2,w3,w4,w5;
wire[7:0] temp0,temp1;
always @(*) begin 
	w0 = key[15:8];
	w1 = key[7:0];
	w2 = w0 ^ 8'b1000_0000 ^ temp0; // 1110 0010  1000 0111  --> 1110 0101 e5
	w3 = w1 ^ w2; // 1110 0101  1010 1111      0100 1010
	w4 = w2 ^ 8'b0011_0000 ^ temp1;
	w5 = w4 ^ w3;
end 

//assign key0 = {w0,w1};
assign key1 = {w2,w3}; // 1110 0101 0100 1010
assign key2 = {w4,w5};


nibble_substitution u0(
						.Encrypt(1'b1),
						.added_round({key[3:0],key[7:4]}),
						.after_nibble(temp0)
						);

nibble_substitution u1(
						.Encrypt(1'b1),
						.added_round({w3[3:0],w3[7:4]}),
						.after_nibble(temp1)
						);


endmodule