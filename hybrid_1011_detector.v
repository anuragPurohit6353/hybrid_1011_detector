`timescale 1ns / 1ps



module hybrid_1011_detector (
    input clk,
    input reset,
    input din,
    output reg dout_moore,
    output reg dout_mealy
);
 
// Moore FSM for 1011 
parameter M_S0 = 3'd0, M_S1 = 3'd1, M_S2 = 3'd2, M_S3 = 3'd3, M_S4 = 3'd4;
reg [2:0] moore_state;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        moore_state <= M_S0;
        dout_moore <= 1'b0;
    end else begin
        case (moore_state)
            M_S0: begin
                dout_moore <= 1'b0;
                if (din) moore_state <= M_S1;
                else moore_state <= M_S0;
            end
            M_S1: begin
                dout_moore <= 1'b0;
                if (!din) moore_state <= M_S2;
                else moore_state <= M_S1;
            end
            M_S2: begin
                dout_moore <= 1'b0;
                if (din) moore_state <= M_S3;
                else moore_state <= M_S0;
            end
            M_S3: begin
                dout_moore <= 1'b0;
                if (din) moore_state <= M_S4;
                else moore_state <= M_S2;
            end
            M_S4: begin
                dout_moore <= 1'b1;
                if (din) moore_state <= M_S1;
                else moore_state <= M_S2;
            end
            default: begin
                moore_state <= M_S0;
                dout_moore <= 1'b0;
            end
        endcase
    end
end

//Mealy FSM for 1011
parameter L_S0 = 2'd0, L_S1 = 2'd1, L_S2 = 2'd2, L_S3 = 2'd3;
reg [1:0] mealy_state;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        mealy_state <= L_S0;
        dout_mealy <= 1'b0;
    end else begin
        case (mealy_state)
            L_S0: begin
                dout_mealy <= 1'b0;
                if (din) mealy_state <= L_S1;
                else mealy_state <= L_S0;
            end
            L_S1: begin
                dout_mealy <= 1'b0;
                if (!din) mealy_state <= L_S2;
                else mealy_state <= L_S1;
            end
            L_S2: begin
                dout_mealy <= 1'b0;
                if (din) mealy_state <= L_S3;
                else mealy_state <= L_S0;
            end
            L_S3: begin
                if (din) begin
                    dout_mealy <= 1'b1;
                    mealy_state <= L_S1;
                end else begin
                    dout_mealy <= 1'b0;
                    mealy_state <= L_S2;
                end
            end
            default: begin
                mealy_state <= L_S0;
                dout_mealy <= 1'b0;
            end
        endcase
    end
end

endmodule