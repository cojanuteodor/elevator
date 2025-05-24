`timescale 1ns / 1ps

module CHANGE_DETECTOR(
    input logic clk,
    input logic rst,
    input logic [1:0] in,
    output logic change
);

logic [1:0] in_mem;

always_ff @(posedge clk) 
begin
   if(rst==1) 
    begin
        in_mem<=0;
        change<=0;
    end
    
   else if(rst==0)
    begin
        if(in_mem!=in)
            change<=1;
        else 
            change<=0;
    end
   in_mem<=in;
end
    
endmodule
