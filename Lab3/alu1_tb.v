module alu1_test;
    // exhaustively test your 1-bit ALU by adapting mux4_tb.v

    // cycle through all combinations of A, B, C, D every 16 time units
    reg A = 0;
    always #1 A = !A;
    reg B = 0;
    always #2 B = !B;
    reg Carryin =0 ;
    always #4 Carryin = !Carryin;
     
    reg [2:0] control = 0;
     
    initial begin
        $dumpfile("alu1.vcd");
        $dumpvars(0, alu1_test);

        // control is initially 0
        # 16 control = 1; // wait 16 time units (why 16?) and then set it to 1
        # 16 control = 2; // wait 16 time units and then set it to 2
        # 16 control = 3;
	# 16 control = 4; // wait 16 time units and then set it to 3
	# 16 control = 5;
	# 16 control = 6;
	# 16 control = 7;
        # 16 $finish; // wait 16 time units and then end the simulation
    end

    wire out, carryout;
    alu1 a4(out,carryout, A, B,Carryin,control);


    // you really should be using gtkwave instead
    /*
    initial begin
        $display("A B C D s o");
        $monitor("%d %d %d %d %d %d (at time %t)", A, B, C, D, control, out, $time);
    end
    */
endmodule // alu1_test


