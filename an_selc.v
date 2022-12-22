
module an_selc(mux_slc,an_slc ,slow_clk  );
   output an_slc ;
    reg [3:0] an_slc   ;// to select the 7 segment

  output reg   [1:0] mux_slc  ;  // to the mux 
  
  input slow_clk;// slow clock to 7 segment
always @(negedge slow_clk )
// looping the bcd data to 7 segment decoder with every clock
begin

 case (mux_slc)
   // selecting the 7 segment accroding to the data in
   2'b00 : an_slc = 4'b1110;
   2'b01 : an_slc = 4'b1101;
   2'b10: an_slc = 4'b1011;
   2'b11 : an_slc = 4'b0111;
 endcase
 
 mux_slc <= mux_slc +1 ;
   
 end
 
 
 endmodule
 
  

  