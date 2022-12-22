
module clk_div (clk ,slow_clk,rst );
  input rst ;
  input clk;
   output  reg slow_clk   ;
   
   reg [18:0]count ;// num of bits needed to present the 500th cycle
    
   always @(posedge clk)
   begin 
     if(rst)
     count = 0 ; 
  else
    count <= count +1 ;
     if(count== 500000)
    begin
       slow_clk = ~slow_clk ; // toggle every 500th cycle of the original clock  
       count =0 ;
  end   
 end 
 endmodule
  
  