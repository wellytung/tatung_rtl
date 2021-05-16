 module cnt(
   clk,
   rst_n
 );
 
 input  clk;
 input  rst_n;
 
 reg [9:0] cnt;
 wire [9:0] cnt_nxt;
 
 // sequential logic 
 always@(posedge clk or negedge rst_n)
   if (~rst_n) cnt <= 10'd0;
   else        cnt <= cnt_nxt;
     
 
 // combinational logic
  assign cnt_nxt = cnt + 1;
   
 endmodule
