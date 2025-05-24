module FLOOR_TRANSCODER(

    input logic [1:0] in,
    output logic [6:0]out

                        );
                           
    always_comb 
        begin
            case(in)
                2'b00:out=7'b0001100;
                2'b01:out=7'b1111001;
                2'b10:out=7'b0100100;
                2'b11:out=7'b0110000;
                default: out=7'b1111111;
             endcase
                
        end                        
endmodule
