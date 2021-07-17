`ifndef _CONTROL_SIGNALS_H
`define _CONTROL_SIGNALS_H


// ======== Control signal enumerations ======== 

// ALU operation control signal
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

// IMM source control signal
typedef enum logic[2:0]
{
    CONTROL_IMM_SRC_U_TYPE      = 3'b000,
    CONTROL_IMM_SRC_I_TYPE      = 3'b001,
    CONTROL_IMM_SRC_S_TYPE      = 3'b010,
    CONTROL_IMM_SRC_B_TYPE      = 3'b011,
    CONTROL_IMM_SRC_J_TYPE      = 3'b100
} control_imm_source_e;

`endif