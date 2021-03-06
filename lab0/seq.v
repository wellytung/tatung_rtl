 module seq(
   clk,
   rst_n,
   seq_in,
   seq_out
 );
 
 input  clk;
 input  rst_n;
 input  seq_in;
 output seq_out;
 
 parameter IDLE = 3'b000;
 // 0
 parameter S0   = 3'b001;
 // 01 
 parameter S1   = 3'b010;
 // 011 
 parameter S2   = 3'b011;
 // 0110 
 parameter S3   = 3'b100;
 // 01101 
 parameter S4   = 3'b101;
 
 reg [2:0] curr_state;
 reg [2:0] next_state;
 wire seq_out;
 
 // state reg
 always@(posedge clk or negedge rst_n)
   if (~rst_n) curr_state <= IDLE;
   else        curr_state <= next_state;
     
 // next state logic    
 always@(*)
   case (curr_state)
      // first 0 detect
     IDLE    : if (seq_in) next_state = IDLE;
               else     next_state = S0;
      // 0
     S0      : if (seq_in) next_state = S1;
               else     next_state = S0;
      // 01
     S1      : if (seq_in) next_state = S2;
               else     next_state = S0;
      // 011
     S2      : if (seq_in) next_state = IDLE;
               else     next_state = S3;
      // 0110
     S3      : if (seq_in) next_state = S4;
               else     next_state = S0;
      // 01101 hit
     S4      : if (seq_in) next_state = S2;
               else     next_state = S0;
     default :          next_state = IDLE;
   endcase    
 
 // output logic
  assign seq_out = ( curr_state == S4 ) ? 1'b1 : 1'b0;
   
 endmodule
