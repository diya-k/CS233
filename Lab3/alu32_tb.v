module alu32_test;
    reg [31:0] A = 0, B = 0;
    reg [2:0] control = 0;

    initial begin
        $dumpfile("alu32.vcd");
        $dumpvars(0, alu32_test);

             A = 0; B = 0; control = `ALU_ADD;
        # 10 A = 0; B = 0; control = `ALU_SUB;
        # 10 A = 0; B = 0; control = `ALU_AND;
	# 10 A = 0; B = 0; control = `ALU_OR;
	# 10 A = 0; B = 0; control = `ALU_NOR;
	# 10 A = 0; B = 0; control = `ALU_XOR;
	# 10 A = 8; B = 4; control = `ALU_ADD;
	# 10 A = 5; B = 2; control = `ALU_SUB; // try subtracting 5 from 2
        # 10 A = 3; B = 5; control = `ALU_AND;
        # 10 A = 5; B = 6; control = `ALU_OR;
        # 10 A = 5; B = 4; control = `ALU_NOR;
        # 10 A = 7; B = 4; control = `ALU_XOR;
	# 10 A = 5; B = 5; control = `ALU_SUB;
	# 10 A = 567; B = 6; control = `ALU_SUB;
	# 10 A = 6; B = 567; control = `ALU_SUB;
	# 10 A = 233472632427889; B = 332442423467889; control = `ALU_ADD;
	# 10 A = -2189371287; B = -12379184799; control = `ALU_ADD;
	# 10 A = 123473298472729457; B = -12387462736427464; control = `ALU_SUB;
	 // add more test cases here!

        # 10 $finish;
    end

    wire [31:0] out;
    wire overflow, zero, negative;
    alu32 a(out, overflow, zero, negative, A, B, control);  
endmodule // alu32_test
