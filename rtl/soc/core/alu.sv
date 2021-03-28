`include "core_defines.vh"

module alu(
    input logic [31:0] a_i,
    input logic [31:0] b_i,
    input control_alu_op_e ctrl_alu_op_i,

    output logic [31:0] result_o,
    output logic Z_o,
    output logic N_o,
    output logic S_o,
    output logic C_o,
    output logic V_o
);

logic [31:0] shr = a_i >> b_i;

always_comb begin
    C_o = 1'b0;
    V_o = 1'b0;

    case (ctrl_alu_op_i)
        CONTROL_ALU_OP_ADD: begin
            {C_o, result_o} = a_i + b_i;
            V_o = (a_i[31] & b_i[31] & !result_o[31]) | (!a_i[31] & !b_i[31] & result_o[31]);
        end

        CONTROL_ALU_OP_SUB: begin
            {C_o, result_o} = a_i - b_i;
            V_o = (a_i[31] & !b_i[31] & !result_o[31]) | (!a_i[31] & b_i[31] & result_o[31]);
        end

        CONTROL_ALU_OP_SLL: begin
            result_o = a_i << b_i;
        end

        CONTROL_ALU_OP_SLT: begin
            result_o = ($signed(a_i) <  $signed(b_i)) ? 32'b1 : 32'b0;
        end

        CONTROL_ALU_OP_SLTU: begin
            result_o = ($unsigned(a_i) <  $unsigned(b_i)) ? 32'b1 : 32'b0;
        end

        CONTROL_ALU_OP_XOR: begin
            result_o = a_i ^ b_i;
        end

        CONTROL_ALU_OP_SRL: begin
            result_o = a_i >> b_i;
        end

        CONTROL_ALU_OP_SRA: begin
            result_o = { (a_i[31] ? 1'b1: 1'b0), shr[30:0] };
        end

        CONTROL_ALU_OP_OR: begin
            result_o = a_i | b_i;
        end

        default: begin
            result_o = a_i & b_i;
        end
    endcase
end

assign Z_o = (result_o == 32'b0) ? 1'b1 : 1'b0;
assign N_o = result_o[31];
assign S_o = N_o ^ V_o;

endmodule