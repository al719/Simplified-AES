module tst();
reg Encrypr;
reg[15:0] plaintext,key;
wire[15:0] ciphertext;


initial begin
	$display("-------------------Test Case (1)-------------------------");
	$display("------------Encryption");
	Encrypr = 1'b1;
	plaintext = 16'hD728;
	key		  = 16'h4AF5;
	#2;
	if(ciphertext == 16'h24ec)
		$display("Encryption-Succeeded");
	else 
		$display("Encryption-Failed");
	#10;
	$display("------------Decryption");
	Encrypr = 1'b0;
	plaintext = 16'h24ec;
	#2;
	if(ciphertext == 16'hD728)
		$display("Decryption-Succeeded");
	else 
		$display("Decryption-Failed");
	#10;
	$display("-------------------Test Case (2)-------------------------");
	$display("------------Encryption");
	Encrypr = 1'b1;
	plaintext = 16'hA501;
	key		  = 16'h3AD9;
	#2;
	if(ciphertext == 16'hdc14)
		$display("Encryption-Succeeded");
	else 
		$display("Encryption-Failed");
	#10;
	$display("------------Decryption");
	Encrypr = 1'b0;
	plaintext = 16'hdc14;
	#2;
	if(ciphertext == 16'hA501)
		$display("Decryption-Succeeded");
	else 
		$display("Decryption-Failed");
	#10;
	$display("-------------------Test Case (3)-------------------------");
	$display("------------Encryption");
	Encrypr = 1'b1;
	key = 16'hA73B;
	plaintext= 16'h6F6B;
	#2;
	if(ciphertext == 16'h0738)
		$display("Encryption-Succeeded");
	else 
		$display("Encryption-Failed");
	#10;
	$display("------------Decryption");
	Encrypr = 1'b0;
	plaintext = 16'h0738;
	#2;
	if(ciphertext == 16'h6F6B)
		$display("Decryption-Succeeded");
	else 
		$display("Decryption-Failed");
	#10;
	$display("-------------------Test Case (4)-------------------------");
	$display("------------Encryption");
	Encrypr = 1'b1;
	key = 16'hBBFF;
	plaintext= 16'h1238;
	#2;
	if(ciphertext == 16'h720E)
		$display("Encryption-Succeeded");
	else 
		$display("Encryption-Failed");
	#10;
	$display("------------Decryption");
	Encrypr = 1'b0;
	plaintext = 16'h720E;
	#2;
	if(ciphertext == 16'h1238)
		$display("Decryption-Succeeded");
	else 
		$display("Decryption-Failed");
	#10;
	$display("-------------------Test Case (5)-------------------------");
	$display("------------Encryption");
	Encrypr = 1'b1;
	key = 16'hAB89;
	plaintext= 16'h89A8;
	#2;
	if(ciphertext == 16'hC2AA)
		$display("Encryption-Succeeded");
	else 
		$display("Encryption-Failed");
	#10;
	$display("------------Decryption");
	Encrypr = 1'b0;
	plaintext = 16'hC2AA;
	#2;
	if(ciphertext == 16'h89A8)
		$display("Decryption-Succeeded");
	else 
		$display("Decryption-Failed");
	#10;
	$display("-------------------Test Case (6)-------------------------");
	$display("------------Encryption");
	Encrypr = 1'b1;
	key = 16'hAB89;
	plaintext= 16'h04B0;
	#2;
	if(ciphertext == 16'h89A8)
		$display("Encryption-Succeeded");
	else 
		$display("Encryption-Failed");
	#10;
	$display("------------Decryption");
	Encrypr = 1'b0;
	plaintext = 16'h89A8;
	#2;
	if(ciphertext == 16'h04B0)
		$display("Decryption-Succeeded");
	else 
		$display("Decryption-Failed");
	#10;
	$stop();
end 
initial begin
	$monitor("Encrypt = %0d,plaintext = 0x%h , key = 0x%h , ciphertext = 0x%h",Encrypr,plaintext,key,ciphertext);
end

simplified_AES DUT(
					.Encrypt(Encrypr),
					.plaintext(plaintext),
					.key(key),
					.cipher_text(ciphertext)
					); 
endmodule