`timescale 1ns / 1ps

module ELEVATOR_FSM(
    input logic clk,
    input logic rst,
    input logic stop,
    input logic [1:0] in,
    output logic [1:0] floor
);

//Se asociaza sirurilor de biti folositi pentru codarea starilor nume ce pot fi folosite mai usor in cod.
//La compilare, numele vor fi inlocuite in cod cu numerele asociate la inceput.
localparam FLOOR0 = 2'b00;
localparam FLOOR1 = 2'b01;
localparam FLOOR2 = 2'b10;
localparam FLOOR3 = 2'b11;

logic [1:0] state, state_next;

//registrul de stare
always_ff @(posedge clk) begin
    if(rst == 1)
        state <= FLOOR0;
    else
        state <= state_next;
end

//circuit combinational pentru calculul starii urmatoare
always_comb begin
    state_next = state;
        case(state)
            FLOOR0: begin   
                           if(in==0 || stop==1) state_next=FLOOR0;
                           else if(in > 0) state_next = FLOOR1;
                     end
            FLOOR1: begin
                           if(in==1 || stop==1) state_next=FLOOR1;
                           else if(in < 1) state_next = FLOOR0;
                           else if(in > 1) state_next = FLOOR2;
                     end
             FLOOR2: begin 
                           if(in==2 || stop==1) state_next=FLOOR2;
                           else if(in < 2) state_next = FLOOR1;
                           else if(in > 2) state_next = FLOOR3;
                     end 
             FLOOR3: begin
                           if(in==3 || stop==1) state_next=FLOOR3;
                           else if(in < 3) state_next = FLOOR2;
                     end
            default: state_next = FLOOR0;
        endcase
end


//circuit combinational pentru calculul iesirilor

always_comb 
begin
    case(state)
        FLOOR0: floor=0;
        FLOOR1: floor=1;
        FLOOR2: floor=2;
        FLOOR3: floor=3;
    endcase
end


endmodule
