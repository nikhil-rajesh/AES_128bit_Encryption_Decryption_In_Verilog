module aes128_encryption(plaintext,key,en_msg);
input [0:127] plaintext,key;
output [0:127] en_msg;
wire [0:127] en_msg0,en_msg1,en_msg2,en_msg3,en_msg4,en_msg5,en_msg6,en_msg7,en_msg8;
wire [0:127] subbyte0,subbyte1,subbyte2,subbyte3,subbyte4,subbyte5,subbyte6,subbyte7,subbyte8,subbyte9;
wire [0:127] shiftrow0,shiftrow1,shiftrow2,shiftrow3,shiftrow4,shiftrow5,shiftrow6,shiftrow7,shiftrow8,shiftrow9;
wire [0:127] mixcol0,mixcol1,mixcol2,mixcol3,mixcol4,mixcol5,mixcol6,mixcol7,mixcol8;
wire [127:0] key1,key2,key3,key4,key5,key6,key7,key8,key9,key10;
wire [0:127] pr_key;

//code to generate round keys
round_key11 r1(key,key1,key2,key3,key4,key5,key6,key7,key8,key9,key10);
assign pr_key = plaintext^key;

//Round1
sub_byte s0(pr_key,subbyte0);
shift_row s00(subbyte0,shiftrow0);
mix_col  m0(shiftrow0,mixcol0);
assign en_msg0 = mixcol0 ^ key1;

//Round2
sub_byte s1(en_msg0,subbyte1);
shift_row s01(subbyte1,shiftrow1);
mix_col  m1(shiftrow1,mixcol1);
assign en_msg1 = mixcol1 ^ key2;

//Round3
sub_byte s2(en_msg1,subbyte2);
shift_row s02(subbyte2,shiftrow2);
mix_col  m2(shiftrow2,mixcol2);
assign en_msg2 = mixcol2 ^ key3;

//Round4
sub_byte s3(en_msg2,subbyte3);
shift_row s03(subbyte3,shiftrow3);
mix_col  m3(shiftrow3,mixcol3);
assign en_msg3 = mixcol3 ^ key4;

//Round5
sub_byte s4(en_msg3,subbyte4);
shift_row s04(subbyte4,shiftrow4);
mix_col  m4(shiftrow4,mixcol4);
assign en_msg4 = mixcol4 ^ key5;

//Round6
sub_byte s5(en_msg4,subbyte5);
shift_row s05(subbyte5,shiftrow5);
mix_col  m5(shiftrow5,mixcol5);
assign en_msg5 = mixcol5 ^ key6;

//Round7
sub_byte s6(en_msg5,subbyte6);
shift_row s06(subbyte6,shiftrow6);
mix_col  m6(shiftrow6,mixcol6);
assign en_msg6 = mixcol6 ^ key7;

//Round8
sub_byte s7(en_msg6,subbyte7);
shift_row s07(subbyte7,shiftrow7);
mix_col  m7(shiftrow7,mixcol7);
assign en_msg7 = mixcol7 ^ key8;

//Round9
sub_byte s8(en_msg7,subbyte8);
shift_row s08(subbyte8,shiftrow8);
mix_col  m8(shiftrow8,mixcol8);
assign en_msg8 = mixcol8 ^ key9;

//Round10
sub_byte s9(en_msg8,subbyte9);
shift_row s09(subbyte9,shiftrow9);//no mix column
assign en_msg = shiftrow9 ^ key10;

endmodule
