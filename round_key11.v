`timescale 1ns / 1ps

module round_key11(key1,key11);

input [0:127] key1;
output [0:127] key11;
wire [0:127] temp_key2;
reg [0:127] temp_key1;
wire [0:31] rcon [10],rc;

assign rcon [9] = 32'h36000000;
assign rcon [8] = 32'h1b000000;
assign rcon [7] = 32'h80000000;
assign rcon [6] = 32'h40000000;
assign rcon [5] = 32'h20000000;
assign rcon [4] = 32'h10000000;
assign rcon [3] = 32'h08000000;
assign rcon [2] = 32'h04000000;
assign rcon [1] = 32'h02000000;
assign rcon [0] = 32'h01000000;
integer i;
always @(key1)
begin
    temp_key1 = key1;
    rc = rcon[0];
    i = 1;
end
round_key r1(temp_key1,temp_key2);
always@(temp_key2)
begin
    if(i < 10)
    begin
    temp_key1 = temp_key2;
    rc = rcon[i];
    i = i+1;
    end
    else
        assign key11 = temp_key2;
end
endmodule

module round_key(temp_key,rcon,ko);

input [0:127] temp_key;
input [0:31] rcon;
output [0:127] ko;
wire [0:127] ko;

//shifting operation

wire [0:127] key,key2;
assign key[0:95]    = temp_key[0:95];
assign key[96:103]  = temp_key[104:111];
assign key[104:111] = temp_key[112:119];
assign key[112:119] = temp_key[120:127];
assign key[120:127] = temp_key[96:103];

//sub_bytes operation

sbox s1(key[96:99],key[100:103],key2[96:103]);
sbox s2(key[104:107],key[108:111],key2[104:111]);
sbox s3(key[112:115],key[116:119],key2[112:119]);
sbox s4(key[120:123],key[124:127],key2[120:127]);

//multiplication with rcon values
//xor with different columns
//ko is also numbered column wise

assign ko[0:31]  = key2[96:127]^key[0:31]^rcon[0:31]; 
assign ko[32:63]  = key2[96:127]^key[0:31]^key[32:63]^rcon[0:31]; 
assign ko[64:95]  = key2[96:127]^key[0:31]^key[32:63]^key[64:95]^rcon[0:31]; 
assign ko[96:127]  = key2[96:127]^key[0:31]^key[32:63]^key[64:95]^temp_key[96:127]^rcon[0:31]; 

endmodule
