`timescale 1ns / 1ps

module COUNTER #(parameter WIDTH=4)(
    input logic clk,
    input logic rst,
    input logic en,
    output logic [WIDTH-1:0] changes_count
);

always_ff @(posedge clk) begin
    if(rst == 1)
        changes_count <= 0;
     else 
      begin
            if(en==0)
                begin
                   changes_count <= changes_count;  
                end
            else if(en==1)
                begin
                    changes_count <= changes_count+1;
                end
                    
      end
end


endmodule
