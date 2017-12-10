/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module player_setter_4 (
    input clk,
    input rst,
    input button_firstdigit,
    input button_seconddigit,
    input button_confirmation,
    input button_start,
    input [2:0] round_number,
    output reg [3:0] first_digit,
    output reg [3:0] second_digit,
    output reg [7:0] out,
    output reg startgame,
    output reg done
  );
  
  
  
  wire [1-1:0] M_edge_detector_out;
  reg [1-1:0] M_edge_detector_in;
  edge_detector_1 edge_detector (
    .clk(clk),
    .in(M_edge_detector_in),
    .out(M_edge_detector_out)
  );
  wire [1-1:0] M_button_cond_out;
  reg [1-1:0] M_button_cond_in;
  button_conditioner_2 button_cond (
    .clk(clk),
    .in(M_button_cond_in),
    .out(M_button_cond_out)
  );
  wire [1-1:0] M_edge_detector2_out;
  reg [1-1:0] M_edge_detector2_in;
  edge_detector_1 edge_detector2 (
    .clk(clk),
    .in(M_edge_detector2_in),
    .out(M_edge_detector2_out)
  );
  wire [1-1:0] M_button_cond2_out;
  reg [1-1:0] M_button_cond2_in;
  button_conditioner_2 button_cond2 (
    .clk(clk),
    .in(M_button_cond2_in),
    .out(M_button_cond2_out)
  );
  wire [1-1:0] M_edge_detector3_out;
  reg [1-1:0] M_edge_detector3_in;
  edge_detector_1 edge_detector3 (
    .clk(clk),
    .in(M_edge_detector3_in),
    .out(M_edge_detector3_out)
  );
  wire [1-1:0] M_button_cond3_out;
  reg [1-1:0] M_button_cond3_in;
  button_conditioner_2 button_cond3 (
    .clk(clk),
    .in(M_button_cond3_in),
    .out(M_button_cond3_out)
  );
  wire [1-1:0] M_edge_detector4_out;
  reg [1-1:0] M_edge_detector4_in;
  edge_detector_1 edge_detector4 (
    .clk(clk),
    .in(M_edge_detector4_in),
    .out(M_edge_detector4_out)
  );
  wire [1-1:0] M_button_cond4_out;
  reg [1-1:0] M_button_cond4_in;
  button_conditioner_2 button_cond4 (
    .clk(clk),
    .in(M_button_cond4_in),
    .out(M_button_cond4_out)
  );
  reg [3:0] M_fd_d, M_fd_q = 1'h0;
  reg [3:0] M_sd_d, M_sd_q = 1'h0;
  reg [0:0] M_dd_d, M_dd_q = 1'h0;
  
  always @* begin
    M_dd_d = M_dd_q;
    M_sd_d = M_sd_q;
    M_fd_d = M_fd_q;
    
    first_digit = M_fd_q;
    second_digit = M_sd_q;
    done = M_dd_q;
    out = 1'h0;
    startgame = M_edge_detector4_out;
    M_button_cond_in = button_firstdigit;
    M_edge_detector_in = M_button_cond_out;
    M_button_cond2_in = button_seconddigit;
    M_edge_detector2_in = M_button_cond2_out;
    M_button_cond3_in = button_confirmation;
    M_edge_detector3_in = M_button_cond3_out;
    M_button_cond4_in = button_start;
    M_edge_detector4_in = M_button_cond4_out;
    if (!M_edge_detector3_out) begin
      if (round_number == 1'h0) begin
        M_fd_d = 1'h0;
        M_sd_d = 1'h0;
        M_dd_d = 1'h0;
      end
      if (round_number == 1'h1) begin
        if (M_edge_detector_out) begin
          if (M_fd_q == 4'h9) begin
            M_fd_d = 1'h0;
          end else begin
            M_fd_d = M_fd_q + 1'h1;
          end
        end
        if (M_edge_detector2_out) begin
          if (M_sd_q == 4'h9) begin
            M_sd_d = 1'h0;
          end else begin
            M_sd_d = M_sd_q + 1'h1;
          end
        end
      end else begin
        if (M_edge_detector_out) begin
          if (M_sd_q <= 3'h7) begin
            M_sd_d = M_sd_q + 2'h2;
          end
          if (M_fd_q != 4'h9 & M_sd_q == 4'h8) begin
            M_fd_d = M_fd_q + 1'h1;
            M_sd_d = 1'h0;
          end
          if (M_fd_q != 4'h9 & M_sd_q == 4'h9) begin
            M_fd_d = M_fd_q + 1'h1;
            M_sd_d = 1'h1;
          end
        end
        if (M_edge_detector2_out) begin
          if (M_sd_q >= 2'h2) begin
            M_sd_d = M_sd_q - 2'h2;
          end
          if (M_fd_q != 1'h0 & M_sd_q == 1'h0) begin
            M_fd_d = M_fd_q - 1'h1;
            M_sd_d = 4'h8;
          end
          if (M_fd_q != 1'h0 & M_sd_q == 1'h1) begin
            M_fd_d = M_fd_q - 1'h1;
            M_sd_d = 4'h9;
          end
        end
      end
      out = M_fd_q * 4'ha + M_sd_q;
    end else begin
      if (M_dd_q > 1'h1) begin
        M_dd_d = 1'h0;
      end
      M_dd_d = M_dd_q + 1'h1;
    end
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_fd_q <= 1'h0;
      M_sd_q <= 1'h0;
      M_dd_q <= 1'h0;
    end else begin
      M_fd_q <= M_fd_d;
      M_sd_q <= M_sd_d;
      M_dd_q <= M_dd_d;
    end
  end
  
endmodule
