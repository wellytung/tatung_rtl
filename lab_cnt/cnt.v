 module cnt(
   clk,
   rst_n,
   cnt_hit
 );
 
 input  clk;
 input  rst_n;
 output cnt_hit;
 
 reg [9:0] cnt;
 reg [9:0] cnt_nxt;

 reg [2:0] cnt_5;
 reg [2:0] cnt_5_nxt;

 reg cnt_hit;
 
 // sequential logic 
 always@(posedge clk or negedge rst_n)
   if (~rst_n) cnt <= 10'd0;
   else        cnt <= cnt_nxt;

 always@(posedge clk or negedge rst_n)
   if (~rst_n) cnt_5 <= 10'd0;
   else        cnt_5 <= cnt_5_nxt;
     
 
 // combinational logic
 always@(*) begin
   cnt_nxt = cnt + 1;
 end

 always@(*) begin
   if (cnt_5 == 4)
     cnt_5_nxt = 3'd0;
   else
     cnt_5_nxt = cnt_5 + 1;
 end

 always@(*) begin
   if (cnt_5 == 0)
     cnt_hit = 1'b1;
   else
     cnt_hit = 1'b0;
 end
   
 endmodule
