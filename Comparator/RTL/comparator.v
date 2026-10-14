`timescale 1ns / 1ns
module comparator (
    input wire KEY_A,
    input wire KEY_B,

    output wire LED_L,
    output wire LED_E,
    output wire LED_B
);

    //inside input interfaces
    wire a;
    wire b;

    //inside output
    wire lt;
    wire eq;
    wire bt;

    //let the button connect the revert inside input interface
    assign a = ~ KEY_A;
    assign b = ~ KEY_B;

    //3 logical compare
    assign lt = (~a) & b;
    assign eq = ~(a ^ b);
    assign bt = a & (~b);

    //let inside output interface connect the revert led
    assign LED_L = ~lt;
    assign LED_E = ~eq;
    assign LED_B = ~bt;

endmodule