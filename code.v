

`timescale 1ns / 1ps

module project (op,clk,s1,s2,s3,s4);

input clk;
input s1;
input s2;
input s3;
input s4;
output op;

wire op;

reg  [32:0] counter;

reg r_TOGGLE = 1'b0;
  reg [31:0] match_counter ;



always @ (s1 or s2 or s3 or s4)

  begin
    case ({s1, s2,s3,s4}) // Concatenation Operator { }
     4'b0000 :  match_counter <=0;
      4'b0001 :  match_counter <=32'hE4E1C000; // hexadecimal  use for reduse a overflow
       4'b0010 :  match_counter <=1920000000;
        4'b0011 :  match_counter <=1280000000;
         4'b0100 :  match_counter <= 960000000;
          4'b0101 : match_counter <= 768000000;
           4'b0110 : match_counter <= 640000000;
            4'b0111 :  match_counter <= 544000000;
             4'b1000 :  match_counter <= 480000000;
              4'b1001 :  match_counter <= 427000000;
               4'b1010 :  match_counter <= 384000000;
                4'b1011 :  match_counter <= 349000000;
                 4'b1100 :  match_counter <=320000000;
                  4'b1101 :  match_counter <= 295000000;
                   4'b1110 :  match_counter <=274000000;
                    4'b1111 : match_counter <= 256000000;
                   
    endcase  
  
  end
always @ (posedge clk)
  begin
counter <=0;
counter <= counter + 1'b1;
  if (counter > match_counter)
begin
r_TOGGLE <= !r_TOGGLE;
counter <=0;
end
end  

assign op = r_TOGGLE;

   
 endmodule
