`include "core_defines.vh"

module top_verilator(
    input logic clk_i,
    input logic reset_i
);

logic [31:0] a;
logic [31:0] b;
logic [31:0] result;

logic C, N, V, Z, S;

alu uut(
    .a_i(a),
    .b_i(b),
    .result_o(result),
    .ctrl_alu_op_i(CONTROL_ALU_OP_SUB),
    .Z_o(Z),
    .N_o(N),
    .S_o(S),
    .C_o(C),
    .V_o(V)
);

always_ff @(posedge clk_i) begin
    if(!reset_i) begin
        a <= 32'd1200;
        b <= 32'd0;
    end
    else begin
        b <= b + 32'd1;
    end
end

endmodule;