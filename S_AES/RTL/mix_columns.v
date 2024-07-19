module mix_columns(
					input Encrypt,
					input [15:0] data,
					output reg[15:0] mixed_column
					);
integer i;
reg[3:0] temp ,newtemp;
function reg[3:0] mul;
input [3:0] a;
begin
if(a[3])
	mul = (a<<1) ^ 4'b0011;
else
	mul = (a<<1);
end 
endfunction

always @(*) begin 
	if(Encrypt) begin
		/*
	 	if(data[11] || (!data[11] && data[10]) || (data[11] && data[10]))
				mixed_column[15:12] = data[15:12] ^ 4'b1101;
		else
				mixed_column[15:12] = data[15:12] ^ (data[11:8] <<2);
		////////////////////////////////////////////////////////////////
		if(data[15] || (!data[15] && data[14]) || (data[15] && data[14]))
				mixed_column[11:8] = data[11:8] ^ 4'b1101;
		else
				mixed_column[11:8] = data[11:8] ^ (data[15:12] <<2);
		////////////////////////////////////////////////////////////////
		if(data[3] || (!data[3] && data[2]) || (data[3] && data[2]))
				mixed_column[7:4] = data[7:4] ^ 4'b1101;
		else
				mixed_column[7:4] = data[7:4] ^ (data[3:0]<<2);
		////////////////////////////////////////////////////////////////
		if(data[7] || (!data[7] && data[6]) || (data[7] && data[6]))
				mixed_column[3:0] = data[3:0] ^ 4'b1101;
		else
				mixed_column[3:0] = data[3:0] ^ (data[7:4]<<2);
		////////////////////////////////////////////////////////////////
		*/
		temp = mul(data[11:8]);
		newtemp = mul(temp);
		mixed_column[15:12] = data[15:12] ^ newtemp; 

		temp = mul(data[15:12]);
		newtemp = mul(temp);
		mixed_column[11:8] = data[11:8] ^ newtemp; 

		temp = mul(data[3:0]);
		newtemp = mul(temp);
		mixed_column[7:4] = data[7:4] ^ newtemp; 

		temp = mul(data[7:4]);
		newtemp = mul(temp);
		mixed_column[3:0] = data[3:0] ^ newtemp; 
		
		
	end 
	else begin 
		temp = mul(data[15:12]);
		newtemp = mul(temp);
		temp = mul(newtemp);
		newtemp = mul(data[11:8]);
		mixed_column[15:12] = temp ^ data[15:12] ^ newtemp; 

		temp = mul(data[11:8]);
		newtemp = mul(temp);
		temp = mul(newtemp);
		newtemp = mul(data[15:12]);
		mixed_column[11:8] = temp ^ data[11:8] ^ newtemp; 

		temp = mul(data[7:4]);
		newtemp = mul(temp);
		temp = mul(newtemp);
		newtemp = mul(data[3:0]);
		mixed_column[7:4] = temp ^ data[7:4] ^ newtemp; 

		temp = mul(data[3:0]);
		newtemp = mul(temp);
		temp = mul(newtemp);
		newtemp = mul(data[7:4]);
		mixed_column[3:0] = temp ^ data[3:0] ^ newtemp; 
		////////////////////////////////////////////////////////////////
		//mixed_column[15:12] = (9*data[15:12]) + (data[11:8]<<1);
		//mixed_column[11:8] = (9*data[11:8]) + (data[15:12] <<1);
		//mixed_column[7:4] = (9*data[7:4]) + (data[3:0]<<1);
		//mixed_column[3:0] = (9*data[3:0]) + (data[7:4] <<1);
	end 
end 

endmodule

/*
if(data[11] && (data[15] || data[14] || data[13]))
				mixed_column[15:12] = ((data[15:12]<<3) ^ data[15:12] ^ 4'b0011) ^ ((data[11:8]<<1) ^ 4'b0011);
		else if((data[15] || data[14] || data[13]))
				mixed_column[15:12] =  (data[15:12]<<3) ^ data[15:12] ^ 4'b0011 ^ (data[11:8]<<1);
		else if(data[11] && !(data[15] || data[14] || data[13]))
				mixed_column[15:12] = ((data[15:12]<<3) ^ data[15:12]) ^ ((data[11:8]<<1) ^ 4'b0011);
		else
				mixed_column[15:12] = ((data[15:12]<<3) ^ data[15:12]) ^ (data[11:8]<<1);
		////////////////////////////////////////////////////////////////
		if(data[15] && (data[11] || data[10] || data[9]))
				mixed_column[11:8] = ((data[11:8]<<3) ^ data[11:8] ^ 4'b0011) ^ ((data[15:12]<<1) ^ 4'b0011);
		else if(data[11] || data[10] || data[9])
				mixed_column[11:8] =  (data[11:8]<<3) ^ data[11:8] ^ 4'b0011 ^ (data[15:12]<<1);
		else if(data[15] && !(data[11] || data[10] || data[9]))
				mixed_column[11:8] = ((data[11:8]<<3) ^ data[11:8]) ^ ((data[15:12]<<1) ^ 4'b0011);
		else
				mixed_column[11:8] = ((data[11:8]<<3) ^ data[11:8]) ^ (data[15:12]<<1);
		////////////////////////////////////////////////////////////////
		if(data[3] && (data[7] || data[6] || data[5]))
				mixed_column[7:4] = ((data[7:4]<<3) ^ data[7:4] ^ 4'b0011) ^ ((data[3:0]<<1) ^ 4'b0011);
		else if(data[7] || data[6] || data[5])
				mixed_column[7:4] =  (data[7:4]<<3) ^ data[7:4] ^ 4'b0011 ^ (data[3:0]<<1);
		else if(data[3] && !(data[7] || data[6] || data[5]))
				mixed_column[7:4] = ((data[7:4]<<3) ^ data[7:4]) ^ ((data[3:0]<<1) ^ 4'b0011);
		else
				mixed_column[7:4] = ((data[7:4]<<3) ^ data[7:4]) ^ (data[3:0]<<1);
		////////////////////////////////////////////////////////////////
		if(data[7] && (data[3] || data[2] || data[1]))
				mixed_column[3:0] = ((data[3:0]<<3) ^ data[3:0] ^ 4'b0011) ^ ((data[7:4]<<1) ^ 4'b0011);
		else if(data[3] || data[2] || data[1])
				mixed_column[3:0] =  (data[3:0]<<3) ^ data[3:0] ^ 4'b0011 ^ (data[7:4]<<1);
		else if(data[7] && !(data[3] || data[2] || data[1]))
				mixed_column[3:0] = ((data[3:0]<<3) ^ data[3:0]) ^ ((data[7:4]<<1) ^ 4'b0011);
		else
				mixed_column[3:0] = ((data[3:0]<<3) ^ data[3:0]) ^ (data[7:4]<<1);
*/