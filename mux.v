module mux_16x4(sel, bcd_in, out);
    input wire [1:0] sel;// the select of data
    input wire [15:0] bcd_in; // the  full data to be selected from
    output reg [3:0] out; // the out data selected to the 7 segment decoder 

    always @(sel, bcd_in)
     
        case (sel)
          //assignig the data out accroding to select value
            2'b00: out <= bcd_in[3:0];
            2'b01: out <= bcd_in[7:4];
            2'b10: out <= bcd_in[11:8];
            2'b11: out <= bcd_in[15:12];
            default: out <= 4'b0;
        endcase
    
endmodule