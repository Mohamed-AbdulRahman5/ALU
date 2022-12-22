
module debounce (clk,pb , out , rst   );
  
  
  input clk;
  input rst ;
  input pb ;//  the push button input  
  output  reg  out;
  wire   delay1;
  wire   delay2;
  wire    delay3;
  // the d-flip flop used for delays
  dff dff_dly1 (.d(pb), .clk(clk) , .q(delay1)); 
  dff dff_dly2 (.d(delay1), .clk(clk) , .q(delay2));
  dff dff_dly3 ( .d(delay2), .clk(clk) , .q(delay3));

    always @ (clk,rst )
    begin
   if (rst)
    out = 0 ;
    else  out = delay1 & delay2 & delay3 ;// no out 1 until input switch Stabilizes
    
    end 
    
      
  endmodule
   