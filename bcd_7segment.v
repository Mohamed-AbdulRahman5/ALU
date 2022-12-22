module bcd_7segment ( bcd , seg );
  
  input   [3:0] bcd ;//the input to decoder
  output reg [6:0] seg; 
  
  always @ (bcd)
  begin 
  case(bcd)
  // the decoded data out to 7 segment  
 0 : seg = 7'b0000001;
 1: seg = 7'b1001111;
 2: seg = 7'b0010010;
 3: seg = 7'b0000110;
 4: seg = 7'b1001100;
 5: seg = 7'b0100100;
 6: seg = 7'b0100000;
 7: seg = 7'b0001111;
 8: seg = 7'b0000000;
 9: seg = 7'b0000100;
 10 : seg =7'b0001000; // letter a
 11: seg = 7'b1100000;// letter b 
 12 : seg = 7'b0110001;// letter c 
 
 default : seg = 7'b1111111;// 7 segment is off
endcase
end 
endmodule  