module testbench_aes128;

reg [0:127] key,plaintext,ciphertext;
wire [0:127] encdata,decdata;

aes128_encryption m0(plaintext,key,encdata);
aes128_decryption m1(ciphertext,key,decdata);

initial
begin
	$monitor("%h\n%s",encdata,decdata);
	plaintext = "sentence2encrypt";
	ciphertext = 128'hc47730b1d21a924ae41344842da007ab;
	key = "password123";
	#100;
end
endmodule
