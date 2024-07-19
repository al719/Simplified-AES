// Name : Alaa Salah Abd El-Fattah
// ID : 1900916
// input plaintext [15:0] --> b0 b1 b2 b3 .... b13 b14 b15
module simplified_AES(
						input Encrypt,
						input [15:0] plaintext,
						input [15:0] key,
						output[15:0] cipher_text
						);
wire [15:0] out_from_add_round , out_from_nibble , out_from_shift , out_from_mix;
wire[15:0] out_from_round1;
wire[15:0] key1 , key2;
wire[15:0] out_from_nibble_round2,out_from_shift_round2;
wire[15:0] data_mix , data_round1_key;
wire[15:0] data_inv_sbox;
wire[15:0]  encrypt_key2 ,encrypt_key0;
key_expansion expand_key(
							.Encrypt(Encrypt),
							.key(key),
							//.key0(),
							.key1(key1),
							.key2(key2)
						);
add_round addRoundKey(
						.plain_text(plaintext),
						.key(encrypt_key0),
						.added_round(out_from_add_round)
						);

////////////////////////////// Round 1
nibble_substitution nibble_round1(
						.Encrypt(Encrypt),
						.added_round(out_from_add_round),
						.after_nibble(out_from_nibble)
						);
shift_rows shift_round1(
						.nibble_out(out_from_nibble),
						.shifted_rows(out_from_shift)
						);
mix_columns mix_round1(
						.Encrypt(Encrypt),
						.data(data_mix),
						.mixed_column(out_from_mix)
						);
add_round addRoundKey_round1(
						.plain_text(data_round1_key),
						.key(key1),
						.added_round(out_from_round1)
						);

//////////////////////////////// round 2
nibble_substitution nibble_round2(
						.Encrypt(Encrypt),
						.added_round(data_inv_sbox),
						.after_nibble(out_from_nibble_round2)
						);

shift_rows shift_round2(
						.nibble_out(out_from_nibble_round2),
						.shifted_rows(out_from_shift_round2)
						);

add_round addRoundKey_round2(
						.plain_text(out_from_shift_round2),
						.key(encrypt_key2),
						.added_round(cipher_text)
						);

assign data_mix = (Encrypt) ? out_from_shift : out_from_round1;
assign data_round1_key = (Encrypt) ? out_from_mix : out_from_shift;
assign encrypt_key0 = (Encrypt) ? key : key2;
assign encrypt_key2 = (Encrypt) ? key2 : key;
assign data_inv_sbox = (Encrypt) ? out_from_round1 : out_from_mix;
endmodule