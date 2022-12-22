module alu(   sw,pb1,pb2,pb3 , result,rst ,clk ,m_3   ); 
  input pb1,pb2,pb3;
input clk ;
input   rst ;
  
  reg [7:0] a;
     
  reg [7:0]  b;
  input [7:0] sw ;
        
     
  reg [2:0]  alu_control;
   output reg [3:0] m_3 ;// the 7 segment letter bcd input 
  output   reg  [7:0]  result;

 always @(posedge clk , posedge rst  )
begin 
  if (rst==1 )
  begin
    // initialize the data by 0
   a = 8'b0;
   b=8'b0 ;
   result =8'b0 ;  
end 
else if(rst==0)
begin
   // assign the sw data to the selected input by pbs  and the letter     
    if (pb1== 1)
     begin
       m_3 = 4'b1010;// the letter a bcd code
      a = sw[7:0] ;
     result = sw ;
   end
 else if (pb2==1)
   begin 
      m_3 = 4'b1011;//the letter b bcd code
    b= sw[7:0] ;
   result =sw; 
 end
 else if (pb3 ==1 )
   begin
     alu_control = sw[2:0]; 
    m_3 = 4'b1100; // the letter c bcd code
    //selecting the opretion
      case(alu_control)  
      3'b001: result = a + b;  
      3'b010: result = a - b;  
      3'b100: result = a & b;  
      3'b101: result = a | b;
      3'b110: result = a ^ b;
      3'b011: result = ~a;
   
      
                  
      default:result = 0;  //to prevent latch 
      endcase
end  
end
 end  
 endmodule 