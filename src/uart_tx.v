module uart_tx (
input  wire clk,
input  wire rst_n,
input  wire [7:0] data_in,
input  wire start,
output reg tx
);

reg [3:0] bit_count;
reg [9:0] shift_reg;
reg busy;
always @(posedge clk or negedge rst_n) begin
if (!rst_n) begin
bit_count<=4'd0;
shift_reg<=10'b1111111111;
busy<=1'b0;
tx<=1'b1;
end

else begin
if (!busy) begin
tx<=1'b1;

if (start) begin
shift_reg<={1'b1, data_in, 1'b0};
bit_count<=4'd0;
busy<=1'b1;
tx<=1'b0;
end
end

else begin
tx<=shift_reg[1];
shift_reg<={1'b1, shift_reg[9:1]};

if (bit_count==4'd8) begin
busy<=1'b0;
end

else begin
bit_count<=bit_count + 1'b1;
end
end
end
end
endmodule