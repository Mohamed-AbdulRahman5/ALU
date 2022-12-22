
module top_module(clk,pb1,pb2,pb3 ,sw, slc,rst, seg_op , led);
  // the input data from user to fpga kit
   input[7:0] sw ; input clk ;   input rst ; input pb1,pb2,pb3 ;
   // the output data from fpga to be presented 
    output [7:0] led ;  output [6:0] seg_op ;output [3:0] slc ; 

  
wire pb1_db ,pb2_db,pb3_db ;
wire slow_clk ;
wire [11:0] bcd ;
wire [3:0] seg_in ;
wire [15:0]  mux_in ;
wire [3:0] letter ;
wire [7:0] result ;
wire [1:0] mux_slc ;

  // slowing the clock
 clk_div s_clk (.clk(clk), .slow_clk(slow_clk) , .rst(rst) );
 // push buttons bedounce 
debounce b1 (.clk(clk) , .pb(pb1) ,.out(pb1_db) , .rst(rst));
debounce b2 (.clk(clk) , .pb(pb2) ,.out(pb2_db), .rst(rst));
debounce b3 (.clk(clk) , .pb(pb3) ,.out(pb3_db), .rst(rst)) ;
// arthmitic logic unit 
alu al (.sw(sw), .pb1(pb1_db), .pb2(pb2_db),.pb3(pb3_db), .result(result),.rst(rst),.clk(clk),.m_3(letter));
// input indicators by led
assign led = sw ;
// converting to binary coded decimal
bin2bcd  sg_bcd (.bin(result),.bcd(bcd));

assign mux_in ={letter,bcd} ;
// the slecetor of the segment 
an_selc anode (.mux_slc(mux_slc),.slow_clk(slow_clk),.an_slc(slc));
// the selctor of the data to segment decoder
mux_16x4 sg_mux (.bcd_in(mux_in),.sel(mux_slc),.out(seg_in));
// the segment decoder 
bcd_7segment sg_out (.bcd(seg_in),.seg(seg_op));

endmodule

   module t_alu_top();
	// top module test
	 

	reg clk; reg rst;  reg pb1;  reg pb2;  reg pb3;  reg [7:0] sw;
	wire [7:0] led;  wire [3:0] slc; wire [6:0] seg_op;
	integer i;
  //simulate 200 ms
   	 top_module tb (clk,pb1,pb2,pb3 ,sw, slc,rst, seg_op , led);

  initial begin
      clk =1; rst=1; pb1=0; pb2=0; pb3=0; sw=0;
      #1 rst = 0;
      #5000 pb1 = 1; sw = 200;// dec 10 --> REG A
      #1000 pb1 = 0; 
      #5000 pb2 = 1; sw = 15;// dec 2 --> REG B
      
      #10000000 pb2 = 0;    
      sw = 0;
      for (i=0;i<=7;i=i+1)
        begin
          #5000 pb3 = 1; sw = sw + 1; // REG C 
          #1000 pb3 = 0; 
        end
      
    end
 
  always #10 clk = ~clk;

  // put an instance of your ALU top
endmodule

 
  
  
  
  
  
  
    