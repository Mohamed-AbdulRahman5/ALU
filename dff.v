 module dff ( d , clk , q  ) ;
  // the d-flip-flop used in debounce 
  input d ;
  input clk ;
  output reg  q  ;
  
  always @ (negedge clk )
  begin
  q = d ;

end
 endmodule
