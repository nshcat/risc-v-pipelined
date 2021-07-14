// Testbench for register file module
`include "core_defines.vh"

module reg_tf(
);

logic reset, clk;
logic [4:0] read_register_1;
logic [4:0] read_register_2;
logic [4:0] write_register;
logic [31:0] write_back_data;
logic ctrl_write_back;

logic [31:0]  register_data_1;
logic [31:0]  register_data_2;

register_file uut(
    .clk_i(clk),
    .reset_i(reset),
    .read_register_1_i(read_register_1),
    .read_register_2_i(read_register_2),
    .write_register_i(write_register),
    .write_back_data_i(write_back_data),
    .ctrl_write_back_i(ctrl_write_back),
    .register_data_1_o(register_data_1),
    .register_data_2_o(register_data_2)
);

initial begin
    // Set up local registers
    read_register_1 = 5'h0;
    read_register_2 = 5'h0;
    write_register = 5'h0;
    write_back_data = 32'h0;
    ctrl_write_back = 1'h0;

    clk = 1'b0;
    reset = 1'b0;
    #10;
    clk = 1'b1;
    #10;
    reset = 1'b1;
    clk = 1'b0;
    
    // Write register x1 with 0xAABBCCDD
    write_register = 5'h1;
    write_back_data = 32'hAABBCCDD;
    ctrl_write_back = 1'h1;
    #10;
    clk = ~clk;
    #10;
    clk = ~clk;

    // Write register x2 with 0xABCDABCD
    write_register = 5'h2;
    write_back_data = 32'hABCDABCD;
    #10;
    clk = ~clk;
    #10;
    clk = ~clk;
    write_register = 5'h0;
    write_back_data = 32'h0;
    ctrl_write_back = 1'h0;

    // Read both registers
    read_register_1 = 5'h1;
    read_register_2 = 5'h2;
    #10;

    // Test bypass by both writing and reading register x3
    write_register = 5'h3;
    write_back_data = 32'hA0B0C0D0;
    read_register_1 = 5'h3;
    ctrl_write_back = 1'h1;
    #10;
    clk = ~clk;
    #10;
    clk = ~clk;
    #10;
    ctrl_write_back = 1'h0;
    #10;

end


endmodule
