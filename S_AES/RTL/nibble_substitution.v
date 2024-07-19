module nibble_substitution(
							//input clk,rst_n,
							input Encrypt, // if(1) then encrypt else decrypt
							input [15:0] added_round,
							output reg[15:0] after_nibble
							);

reg [0:15] nibble_matrix[0:3];


//always @(posedge clk or negedge rst_n) begin
always @(*) begin 
	if(Encrypt) begin 
		nibble_matrix[0] = 16'h94AB;
		nibble_matrix[1] = 16'hD185;
		nibble_matrix[2] = 16'h6203;
		nibble_matrix[3] = 16'hCEF7;
	end else begin
		nibble_matrix[0] = 16'hA59B;
		nibble_matrix[1] = 16'h178F;
		nibble_matrix[2] = 16'h6023;
		nibble_matrix[3] = 16'hC4DE;
	end 
end 

always @(*) begin
	case(added_round[15:12])
		4'b0000 : after_nibble[15:12] = nibble_matrix[0][0:3];
		4'b0001 : after_nibble[15:12] = nibble_matrix[0][4:7];
		4'b0010 : after_nibble[15:12] = nibble_matrix[0][8:11];
		4'b0011 : after_nibble[15:12] = nibble_matrix[0][12:15];
		4'b0100 : after_nibble[15:12] = nibble_matrix[1][0:3];
		4'b0101 : after_nibble[15:12] = nibble_matrix[1][4:7];
		4'b0110 : after_nibble[15:12] = nibble_matrix[1][8:11];
		4'b0111 : after_nibble[15:12] = nibble_matrix[1][12:15];
		4'b1000 : after_nibble[15:12] = nibble_matrix[2][0:3];
		4'b1001 : after_nibble[15:12] = nibble_matrix[2][4:7];
		4'b1010 : after_nibble[15:12] = nibble_matrix[2][8:11];
		4'b1011 : after_nibble[15:12] = nibble_matrix[2][12:15];
		4'b1100 : after_nibble[15:12] = nibble_matrix[3][0:3];
		4'b1101 : after_nibble[15:12] = nibble_matrix[3][4:7];
		4'b1110 : after_nibble[15:12] = nibble_matrix[3][8:11];
		4'b1111 : after_nibble[15:12] = nibble_matrix[3][12:15];
	endcase
	case(added_round[11:8])
		4'b0000 : after_nibble[11:8] = nibble_matrix[0][0:3];
		4'b0001 : after_nibble[11:8] = nibble_matrix[0][4:7];
		4'b0010 : after_nibble[11:8] = nibble_matrix[0][8:11];
		4'b0011 : after_nibble[11:8] = nibble_matrix[0][12:15];
		4'b0100 : after_nibble[11:8] = nibble_matrix[1][0:3];
		4'b0101 : after_nibble[11:8] = nibble_matrix[1][4:7];
		4'b0110 : after_nibble[11:8] = nibble_matrix[1][8:11];
		4'b0111 : after_nibble[11:8] = nibble_matrix[1][12:15];
		4'b1000 : after_nibble[11:8] = nibble_matrix[2][0:3];
		4'b1001 : after_nibble[11:8] = nibble_matrix[2][4:7];
		4'b1010 : after_nibble[11:8] = nibble_matrix[2][8:11];
		4'b1011 : after_nibble[11:8] = nibble_matrix[2][12:15];
		4'b1100 : after_nibble[11:8] = nibble_matrix[3][0:3];
		4'b1101 : after_nibble[11:8] = nibble_matrix[3][4:7];
		4'b1110 : after_nibble[11:8] = nibble_matrix[3][8:11];
		4'b1111 : after_nibble[11:8] = nibble_matrix[3][12:15];
	endcase
	case(added_round[7:4])
		4'b0000 : after_nibble[7:4] = nibble_matrix[0][0:3];
		4'b0001 : after_nibble[7:4] = nibble_matrix[0][4:7];
		4'b0010 : after_nibble[7:4] = nibble_matrix[0][8:11];
		4'b0011 : after_nibble[7:4] = nibble_matrix[0][12:15];
		4'b0100 : after_nibble[7:4] = nibble_matrix[1][0:3];
		4'b0101 : after_nibble[7:4] = nibble_matrix[1][4:7];
		4'b0110 : after_nibble[7:4] = nibble_matrix[1][8:11];
		4'b0111 : after_nibble[7:4] = nibble_matrix[1][12:15];
		4'b1000 : after_nibble[7:4] = nibble_matrix[2][0:3];
		4'b1001 : after_nibble[7:4] = nibble_matrix[2][4:7];
		4'b1010 : after_nibble[7:4] = nibble_matrix[2][8:11];
		4'b1011 : after_nibble[7:4] = nibble_matrix[2][12:15];
		4'b1100 : after_nibble[7:4] = nibble_matrix[3][0:3];
		4'b1101 : after_nibble[7:4] = nibble_matrix[3][4:7];
		4'b1110 : after_nibble[7:4] = nibble_matrix[3][8:11];
		4'b1111 : after_nibble[7:4] = nibble_matrix[3][12:15];
	endcase
	case(added_round[3:0])
		4'b0000 : after_nibble[3:0] = nibble_matrix[0][0:3];
		4'b0001 : after_nibble[3:0] = nibble_matrix[0][4:7];
		4'b0010 : after_nibble[3:0] = nibble_matrix[0][8:11];
		4'b0011 : after_nibble[3:0] = nibble_matrix[0][12:15];
		4'b0100 : after_nibble[3:0] = nibble_matrix[1][0:3];
		4'b0101 : after_nibble[3:0] = nibble_matrix[1][4:7];
		4'b0110 : after_nibble[3:0] = nibble_matrix[1][8:11];
		4'b0111 : after_nibble[3:0] = nibble_matrix[1][12:15];
		4'b1000 : after_nibble[3:0] = nibble_matrix[2][0:3];
		4'b1001 : after_nibble[3:0] = nibble_matrix[2][4:7];
		4'b1010 : after_nibble[3:0] = nibble_matrix[2][8:11];
		4'b1011 : after_nibble[3:0] = nibble_matrix[2][12:15];
		4'b1100 : after_nibble[3:0] = nibble_matrix[3][0:3];
		4'b1101 : after_nibble[3:0] = nibble_matrix[3][4:7];
		4'b1110 : after_nibble[3:0] = nibble_matrix[3][8:11];
		4'b1111 : after_nibble[3:0] = nibble_matrix[3][12:15];
	endcase
end  
endmodule