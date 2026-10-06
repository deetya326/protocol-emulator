/*
 * Copyright (c) 2026 Deetya
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_example (
input wire [7:0] ui_in,    // Dedicated inputs
output wire [7:0] uo_out,   // Dedicated outputs
input wire [7:0] uio_in,   // IOs: Input path
output wire [7:0] uio_out,  // IOs: Output path
output wire [7:0] uio_oe,   // IOs: Enable path
input wire ena,
input wire clk,
input wire rst_n
);

wire uart_tx;

uart_tx uart_tx_inst (.clk(clk), .rst_n(rst_n),
 .data_in (ui_in), .start(uio_in[0]), .tx(uart_tx));

// UART TX on dedicated output 0
assign uo_out = {7'b0, uart_tx};

// We are not using bidirectional IOs yet
assign uio_out = 8'b0;
assign uio_oe  = 8'b0;

// Unused inputs
wire _unused = &{ena, uio_in[7:1], 1'b0};

endmodule