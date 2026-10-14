`timescale 1ns / 1ns
module full_adder_tb;
    // initial buttons
    reg KEY_A   = 1;
    reg KEY_B   = 1;
    reg KEY_Cin = 1;

    wire LED_S;
    wire LED_Cout;
    //test module
    full_adder dut (
        .KEY_A(KEY_A),
        .KEY_B(KEY_B),
        .KEY_Cin(KEY_Cin),
        .LED_S(LED_S),
        .LED_Cout(LED_Cout)
    );

    initial begin
        $dumpfile("full_adder_tb.vcd");
        $dumpvars(0, full_adder_tb);

        //at the begin: KEY_A KEY_B KEY_Cin = 0 0 0

        //KEY_A KEY_B KEY_Cin = 0 0 1
        #12500000;;
        KEY_A   = 1;
        KEY_B   = 1;
        KEY_Cin = 0;

        //KEY_A KEY_B KEY_Cin = 0 1 0
        #12500000;;
        KEY_A   = 1;
        KEY_B   = 0;
        KEY_Cin = 1;

        //KEY_A KEY_B KEY_Cin = 0 1 1
        #12500000;;
        KEY_A   = 1;
        KEY_B   = 0;
        KEY_Cin = 0;

        //KEY_A KEY_B KEY_Cin = 1 0 0
        #12500000;;
        KEY_A   = 0;
        KEY_B   = 1;
        KEY_Cin = 1;

        //KEY_A KEY_B KEY_Cin = 1 0 1
        #12500000;;
        KEY_A   = 0;
        KEY_B   = 1;
        KEY_Cin = 0;

        //KEY_A KEY_B KEY_Cin = 1 1 0
        #12500000;;
        KEY_A   = 0;
        KEY_B   = 0;
        KEY_Cin = 1;

        //KEY_A KEY_B KEY_Cin = 1 1 1
        #12500000;;
        KEY_A   = 0;
        KEY_B   = 0;
        KEY_Cin = 0;

        #12500000 $finish;
    end

endmodule