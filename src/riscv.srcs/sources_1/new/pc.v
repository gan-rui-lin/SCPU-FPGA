`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/07 20:58:18
// Design Name: 
// Module Name: pc
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module pc(
        input clk,
        input rstn,
        input[3:0] initial_addr_sel,
        input [31:0] npc,
        output reg [31:0] pc
);
    always @(posedge clk or negedge rstn) begin
        if(~rstn) begin
            case(initial_addr_sel)
                4'b0000: pc <= 32'h0000_0000 >> 2; // beq
                4'b0001: pc <= 32'h0000_0080 >> 2; // bne
                4'b0010: pc <= 32'h0000_0100 >> 2; // blt
                4'b0011: pc <= 32'h0000_0180 >> 2; // bge
                4'b0100: pc <= 32'h0000_0200 >> 2; // bltu
                4'b0101: pc <= 32'h0000_0280 >> 2; // bgeu
                4'b0110: pc <= 32'h0000_0300 >> 2; // jal
                4'b0111: pc <= 32'h0000_037c >> 2; // jalr
                4'b1000: pc <= 32'h0000_03f0 >> 2; // sll
                4'b1001: pc <= 32'h0000_0410 >> 2; // srl
                4'b1010: pc <= 32'h0000_0430 >> 2; // sra
                default: pc <= 32'h0000_0000;
            endcase
        end
        else begin
            pc <= npc;
        end
   end
endmodule
