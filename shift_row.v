module shift_row(inp_matrix,shifted_matrix);

input [0:127] inp_matrix;
inout [0:127] shifted_matrix;

assign shifted_matrix[0:7]   = inp_matrix[0:7];//0 
assign shifted_matrix[8:15] = inp_matrix[40:47];//1
assign shifted_matrix[16:23] = inp_matrix[80:87];//2
assign shifted_matrix[24:31] = inp_matrix[120:127];//3

assign shifted_matrix[32:39] = inp_matrix[32:39];//4
assign shifted_matrix[40:47] = inp_matrix[72:79];//5
assign shifted_matrix[48:55] = inp_matrix[112:119];//6
assign shifted_matrix[56:63] = inp_matrix[24:31];//7

assign shifted_matrix[64:71] = inp_matrix[64:71];//8
assign shifted_matrix[72:79] = inp_matrix[104:111];//9
assign shifted_matrix[80:87] = inp_matrix[16:23];//10
assign shifted_matrix[88:95] = inp_matrix[56:63];//11

assign shifted_matrix[96:103] = inp_matrix[96:103];//12
assign shifted_matrix[104:111] = inp_matrix[8:15];//13s
assign shifted_matrix[112:119] = inp_matrix[48:55];//14
assign shifted_matrix[120:127] = inp_matrix[88:95];//15

endmodule

module inv_shift_row(inp_matrix,shifted_matrix);

input [0:127] inp_matrix;
inout [0:127] shifted_matrix;

assign shifted_matrix[0:7]   = inp_matrix[0:7];//0 
assign shifted_matrix[8:15] = inp_matrix[104:111];//1
assign shifted_matrix[16:23] = inp_matrix[80:87];//2
assign shifted_matrix[24:31] = inp_matrix[56:63];//3

assign shifted_matrix[32:39] = inp_matrix[32:39];//4
assign shifted_matrix[40:47] = inp_matrix[8:15];//5
assign shifted_matrix[48:55] = inp_matrix[112:119];//6
assign shifted_matrix[56:63] = inp_matrix[88:95];//7

assign shifted_matrix[64:71] = inp_matrix[64:71];//8
assign shifted_matrix[72:79] = inp_matrix[40:47];//9
assign shifted_matrix[80:87] = inp_matrix[16:23];//10
assign shifted_matrix[88:95] = inp_matrix[120:127];//11

assign shifted_matrix[96:103] = inp_matrix[96:103];//12
assign shifted_matrix[104:111] = inp_matrix[72:79];//13s
assign shifted_matrix[112:119] = inp_matrix[48:55];//14
assign shifted_matrix[120:127] = inp_matrix[24:31];//15

endmodule
