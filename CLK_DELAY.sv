`timescale 1ns / 1ps

module CLK_DELAY(
    input logic clk,
    input logic rst,
    input logic en,
    input logic clk_delay
);

logic [31:0] count;

always_ff @(posedge clk) 
begin
    if(rst==1) 
        count<=0;
    else 
        begin
            if(en==0)
                count<=count;
            else if(en==1)
                count<=count+1;
        end
end

assign clk_delay = count[27];

endmodule
