 module tb;

 reg clk = 1'b1;
 reg rst_n = 1'b1;


 // clk
 always #10 clk = ~clk;

 event after_rst;

 // rst_n
 initial begin
  #6; // 6ns
  rst_n = 1'b0;
  #30; // 36ns
  rst_n = 1'b1;
  ->after_rst;
 end


initial begin
  $fsdbDumpfile("seq.fsdb");
  $fsdbDumpvars(tb, 0);

  repeat(50)@(posedge clk); 
  $finish;
  
end


cnt u_cnt(
  .clk (clk),
  .rst_n (rst_n)
);

endmodule
