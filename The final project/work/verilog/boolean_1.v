/*
   This file was generated automatically by the Mojo IDE version B1.3.5.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module boolean_1 (
    input [5:0] alufn,
    input [7:0] a,
    input [7:0] b,
    output reg [7:0] boole
  );
  
  
  
  integer i;
  
  always @* begin
    for (i = 1'h0; i < 4'h8; i = i + 1) begin
      
      case (alufn[0+3-:4])
        4'he: begin
          boole[(i)*1+0-:1] = a[(i)*1+0-:1] | b[(i)*1+0-:1];
        end
        4'h4: begin
          boole[(i)*1+0-:1] = ~(a[(i)*1+0-:1] | b[(i)*1+0-:1]);
        end
        4'h8: begin
          boole[(i)*1+0-:1] = (a[(i)*1+0-:1] & b[(i)*1+0-:1]);
        end
        4'h9: begin
          boole[(i)*1+0-:1] = ~(a[(i)*1+0-:1] & b[(i)*1+0-:1]);
        end
        4'h1: begin
          boole[(i)*1+0-:1] = (a[(i)*1+0-:1] ^ b[(i)*1+0-:1]);
        end
        4'h7: begin
          boole[(i)*1+0-:1] = ~(a[(i)*1+0-:1] ^ b[(i)*1+0-:1]);
        end
        4'ha: begin
          boole[(i)*1+0-:1] = a[(i)*1+0-:1];
        end
        default: begin
          boole[(i)*1+0-:1] = 1'h0;
        end
      endcase
    end
  end
endmodule
