`timescale 1ns / 1ns
module full_adder (
    input  wire KEY_A,
    input  wire KEY_B,
    input  wire KEY_Cin,

    output wire LED_S,
    output wire LED_Cout
);
    //inside input interfaces
    wire a;
    wire b;
    wire cin;
    //connect between 2 adder
    wire s1;
    wire c1;
    wire c2;
    //inside output
    wire s;
    wire cout;

    //let the button connect the revert inside input interface
    assign a   = ~ KEY_A;
    assign b   = ~ KEY_B;
    assign cin = ~ KEY_Cin;

    //put half adder into full adder
    half_adder h1(
        .a(a),
        .b(b),
        .sum(s1),
        .carry(c1)
    );
    half_adder h2(
        .a(s1),
        .b(cin),
        .sum(s),
        .carry(c2)
    );

    assign cout = c1 | c2;

    //let inside output interface connect the revert led
    assign LED_S = ~s;
    assign LED_Cout = ~cout;

endmodule