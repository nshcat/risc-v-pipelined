`ifndef _CORE_DEFINES_H
`define _CORE_DEFINES_H

// ALU operation control signals
typedef enum logic[3:0]
{
    CONTROL_ALU_OP_ADD          = 4'b0000,
    CONTROL_ALU_OP_SUB          = 4'b0001,
    CONTROL_ALU_OP_SLL          = 4'b0010,
    CONTROL_ALU_OP_SLT          = 4'b0011,
    CONTROL_ALU_OP_SLTU         = 4'b0100,
    CONTROL_ALU_OP_XOR          = 4'b0101,
    CONTROL_ALU_OP_SRL          = 4'b0110,
    CONTROL_ALU_OP_SRA          = 4'b0111,
    CONTROL_ALU_OP_OR           = 4'b1000,
    CONTROL_ALU_OP_AND          = 4'b1001
} control_alu_op_e;

`endif