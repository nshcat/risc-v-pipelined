`include "core_defines.vh"

module alu_tf(
);

logic [31:0] a;
logic [31:0] b;
logic [31:0] result;
control_alu_op_e alu_op;

logic C, N, V, Z, S;

alu uut(
    .a_i(a),
    .b_i(b),
    .result_o(result),
    .ctrl_alu_op_i(alu_op),
    .Z_o(Z),
    .N_o(N),
    .S_o(S),
    .C_o(C),
    .V_o(V)
);

initial begin
    // Init the two operands
    a = 32'd3000;
    b = 32'd1500;
    
    alu_op = CONTROL_ALU_OP_ADD;
    #100;
    alu_op = CONTROL_ALU_OP_SUB;
    #100;

    alu_op = CONTROL_ALU_OP_SLT;
    #100;
    b = 32'd4000;
    #100;

    a = 32'hFF;
    b = 32'h4;
    alu_op = CONTROL_ALU_OP_SLL;
    #100;

    a = 32'b1001;
    b = 32'b1101;
    alu_op = CONTROL_ALU_OP_XOR;
    #100;
    alu_op = CONTROL_ALU_OP_OR;
    #100;
    alu_op = CONTROL_ALU_OP_AND;
end

endmodule