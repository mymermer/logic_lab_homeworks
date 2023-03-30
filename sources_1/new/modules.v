`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Abdullah Jafar Mansour Shamout 150200919
//Muhammed Yusuf Mermer 150220762
//////////////////////////////////////////////////////////////////////////////////

module nand_module(in1,in2,o);
    input wire in1;
    input wire in2;
    output wire o;
    assign o = ~(in1 & in2);
endmodule

module SR_latch(set,reset,Q,notQ);
    input wire set;
    input wire reset;
    output wire Q;
    output wire notQ;
    
    nand_module A(set, notQ, Q);
    nand_module B(reset, Q, notQ);
endmodule

module enabled_SR_latch(enabled,set,reset,Q,notQ);
    input wire enabled;
    input wire set;
    input wire reset;
    
    wire notset,notreset;
    
    output wire Q;
    output wire notQ;
    
    nand_module E1(enabled,set,notset);
    nand_module E2(enabled,reset,notreset);
    SR_latch SR1(notset,notreset,Q,notQ);
endmodule


module empty();
endmodule