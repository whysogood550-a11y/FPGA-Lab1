`timescale 1ns / 1ns
module comparator_tb;
    // initial buttons
    reg KEY_A   = 1;
    reg KEY_B   = 1;

    wire LED_L;
    wire LED_E;
    wire LED_B;
    //test module
    comparator dut (
    .KEY_A(KEY_A),
    .KEY_B(KEY_B),
    .LED_L(LED_L),
    .LED_E(LED_E),
    .LED_B(LED_B)
    );


    initial begin
        $dumpfile("comparator_tb.vcd");
        $dumpvars(0, comparator_tb);

        //at the begin: KEY_A KEY_B = 0 0

        //KEY_A KEY_B = 0 1
        #25000000;;
        KEY_A   = 0;
        KEY_B   = 1;

        //KEY_A KEY_B = 1 0
        #25000000;;
        KEY_A   = 1;
        KEY_B   = 0;

        //KEY_A KEY_B = 1 1
        #25000000;;
        KEY_A   = 1;
        KEY_B   = 1;

        #25000000 $finish;
    end

endmodule