
module clk_div_n #(
parameter WIDTH = 7)
 
(clk,reset,div_num, clk_out);
 
input clk;
input reset; 
input [WIDTH-1:0] div_num;
output clk_out;
 
reg [WIDTH-1:0] pos_count, neg_count;
wire [WIDTH-1:0] r_nxt;
 
 always @(posedge clk)
 if (reset)
 pos_count <=0;
 else if (pos_count ==div_num-1) pos_count <= 0;
 else pos_count<= pos_count +1;
 
 always @(negedge clk)
 if (reset)
 neg_count <=0;
 else  if (neg_count ==div_num-1) neg_count <= 0;
 else neg_count<= neg_count +1; 
 
assign clk_out = ((pos_count > (div_num>>1)) | (neg_count > (div_num>>1))); 
endmodule