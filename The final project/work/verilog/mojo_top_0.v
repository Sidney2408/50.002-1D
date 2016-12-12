/*
   This file was generated automatically by the Mojo IDE version B1.3.5.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input cclk,
    output reg spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    output reg [3:0] spi_channel,
    input avr_tx,
    output reg avr_rx,
    input avr_rx_busy,
    output reg [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    input [4:0] io_button,
    input [23:0] io_dip,
    input button,
    input button2,
    output reg right,
    output reg wrong,
    output reg buzzer,
    output reg red
  );
  
  
  
  integer i;
  
  reg rst;
  
  reg [71:0] longarr;
  
  reg [3:0] check;
  
  reg bitcheck;
  
  wire [8-1:0] M_boolean_module_boole;
  reg [6-1:0] M_boolean_module_alufn;
  reg [8-1:0] M_boolean_module_a;
  reg [8-1:0] M_boolean_module_b;
  boolean_1 boolean_module (
    .alufn(M_boolean_module_alufn),
    .a(M_boolean_module_a),
    .b(M_boolean_module_b),
    .boole(M_boolean_module_boole)
  );
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_2 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [1-1:0] M_button_conditioner_out;
  reg [1-1:0] M_button_conditioner_in;
  button_conditioner_3 button_conditioner (
    .clk(clk),
    .in(M_button_conditioner_in),
    .out(M_button_conditioner_out)
  );
  wire [1-1:0] M_button_conditioner2_out;
  reg [1-1:0] M_button_conditioner2_in;
  button_conditioner_3 button_conditioner2 (
    .clk(clk),
    .in(M_button_conditioner2_in),
    .out(M_button_conditioner2_out)
  );
  wire [1-1:0] M_edge_detector_out;
  reg [1-1:0] M_edge_detector_in;
  edge_detector_5 edge_detector (
    .clk(clk),
    .in(M_edge_detector_in),
    .out(M_edge_detector_out)
  );
  wire [1-1:0] M_button_detector_out;
  reg [1-1:0] M_button_detector_in;
  edge_detector_6 button_detector (
    .clk(clk),
    .in(M_button_detector_in),
    .out(M_button_detector_out)
  );
  wire [1-1:0] M_button_detector2_out;
  reg [1-1:0] M_button_detector2_in;
  edge_detector_6 button_detector2 (
    .clk(clk),
    .in(M_button_detector2_in),
    .out(M_button_detector2_out)
  );
  wire [7-1:0] M_seg_seg;
  wire [4-1:0] M_seg_sel;
  reg [16-1:0] M_seg_values;
  multi_seven_seg_8 seg (
    .clk(clk),
    .rst(rst),
    .values(M_seg_values),
    .seg(M_seg_seg),
    .sel(M_seg_sel)
  );
  wire [16-1:0] M_dec_ctr_digits;
  reg [1-1:0] M_dec_ctr_inc;
  multi_dec_ctr_9 dec_ctr (
    .clk(clk),
    .rst(rst),
    .inc(M_dec_ctr_inc),
    .digits(M_dec_ctr_digits)
  );
  wire [1-1:0] M_ctr_value;
  counter_10 ctr (
    .clk(clk),
    .rst(rst),
    .value(M_ctr_value)
  );
  reg [27:0] M_gameclock_d, M_gameclock_q = 1'h0;
  reg [3:0] M_index_d, M_index_q = 1'h0;
  reg [3:0] M_attempts_d, M_attempts_q = 1'h0;
  reg [3:0] M_mistakes_d, M_mistakes_q = 1'h0;
  reg [35:0] M_storage_d, M_storage_q = 1'h0;
  reg [3:0] M_iteration_d, M_iteration_q = 2'h3;
  reg [63:0] M_randomseed_d, M_randomseed_q = 1'h1;
  reg [7:0] M_randomstore_d, M_randomstore_q = 1'h0;
  reg [27:0] M_delay_d, M_delay_q = 1'h0;
  wire [32-1:0] M_random_num;
  reg [1-1:0] M_random_next;
  reg [32-1:0] M_random_seed;
  pn_gen_11 random (
    .clk(clk),
    .rst(rst),
    .next(M_random_next),
    .seed(M_random_seed),
    .num(M_random_num)
  );
  reg [3:0] M_level_d, M_level_q = 1'h0;
  localparam IDLE_state = 3'd0;
  localparam DISPLAY_state = 3'd1;
  localparam BUTTONS_state = 3'd2;
  localparam TRANSITION_state = 3'd3;
  localparam GAMEOVER_state = 3'd4;
  
  reg [2:0] M_state_d, M_state_q = IDLE_state;
  
  always @* begin
    M_state_d = M_state_q;
    M_randomseed_d = M_randomseed_q;
    M_mistakes_d = M_mistakes_q;
    M_index_d = M_index_q;
    M_level_d = M_level_q;
    M_randomstore_d = M_randomstore_q;
    M_attempts_d = M_attempts_q;
    M_delay_d = M_delay_q;
    M_gameclock_d = M_gameclock_q;
    M_iteration_d = M_iteration_q;
    M_storage_d = M_storage_q;
    
    M_button_conditioner_in = !button;
    M_button_conditioner2_in = !button2;
    buzzer = 1'h0;
    red = 1'h1;
    M_button_detector_in = M_button_conditioner_out;
    M_button_detector2_in = M_button_conditioner2_out;
    M_boolean_module_a = 1'h0;
    M_boolean_module_b = 1'h0;
    M_boolean_module_alufn = 1'h0;
    longarr[0+3-:4] = 4'h8;
    longarr[4+3-:4] = 4'h1;
    longarr[8+3-:4] = 4'h1;
    longarr[12+3-:4] = 4'h8;
    longarr[16+3-:4] = 4'h1;
    longarr[20+3-:4] = 4'h8;
    longarr[24+3-:4] = 4'h1;
    longarr[28+3-:4] = 4'h8;
    longarr[32+3-:4] = 4'h1;
    longarr[36+3-:4] = 4'h8;
    longarr[40+3-:4] = 4'h8;
    longarr[44+3-:4] = 4'h1;
    longarr[48+3-:4] = 4'h8;
    longarr[52+3-:4] = 4'h1;
    longarr[56+3-:4] = 4'h8;
    longarr[60+3-:4] = 4'h1;
    longarr[64+3-:4] = 4'h1;
    longarr[68+3-:4] = 4'h8;
    io_led[16+4+3-:4] = 1'h0;
    io_led[16+0+3-:4] = 1'h0;
    io_led[8+3+4-:5] = 1'h0;
    io_led[0+6+1-:2] = 1'h0;
    io_led[0+0+5-:6] = 1'h0;
    M_random_seed = 1'h0;
    M_random_next = 1'h0;
    right = 1'h0;
    wrong = 1'h0;
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    led = {3'h0, io_button};
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    M_edge_detector_in = M_ctr_value;
    M_dec_ctr_inc = M_edge_detector_out;
    M_seg_values = M_dec_ctr_digits;
    io_seg = ~M_seg_seg;
    io_sel = ~M_seg_sel;
    if (M_mistakes_q == 2'h3) begin
      M_state_d = GAMEOVER_state;
    end
    
    case (M_state_q)
      IDLE_state: begin
        if (io_dip[8+0+0-:1] == 1'h1) begin
          M_state_d = DISPLAY_state;
        end
      end
      DISPLAY_state: begin
        io_led[16+4+3-:4] = 1'h0;
        io_led[16+0+3-:4] = 1'h0;
        io_led[8+3+4-:5] = longarr[(M_randomstore_q[0+2-:3])*4+3-:4];
        io_led[8+0+4-:5] = M_index_q;
        io_led[0+4+3-:4] = M_storage_q[(M_index_q)*4+3-:4];
        io_led[0+0+3-:4] = M_randomstore_q[0+2-:3];
        M_gameclock_d = M_gameclock_q + 1'h1;
        if ((M_gameclock_q[0+27-:28] > 28'h47868c0) && (M_iteration_q > 1'h0) && M_gameclock_q[0+27-:28] < 28'hee6b280) begin
          io_led[16+4+3-:4] = longarr[(M_randomstore_q[0+2-:3])*4+3-:4];
        end
        if (M_gameclock_q[0+27-:28] == 28'hd693a40 && M_iteration_q > 1'h0) begin
          M_storage_d[(M_index_q)*4+3-:4] = longarr[(M_randomstore_q[0+2-:3])*4+3-:4];
        end
        if (M_gameclock_q[0+27-:28] == 28'hfffffff && M_iteration_q > 1'h0) begin
          M_random_seed = M_randomseed_q;
          M_random_next = 1'h1;
          M_randomseed_d = M_randomseed_q + 1'h1;
          M_randomstore_d = M_random_num;
          M_index_d = M_index_q + 1'h1;
          M_iteration_d = M_iteration_q - 1'h1;
        end
        if (M_iteration_q == 1'h0) begin
          M_index_d = 1'h0;
          M_state_d = BUTTONS_state;
        end
      end
      TRANSITION_state: begin
        M_delay_d = M_delay_q + 1'h1;
        M_gameclock_d = 1'h0;
        M_index_d = 1'h0;
        M_attempts_d = 1'h0;
        for (i = 1'h0; i < 4'h9; i = i + 1) begin
          M_storage_d[(i)*4+3-:4] = 1'h0;
        end
        
        case (M_level_q)
          1'h0: begin
            M_iteration_d = 2'h3;
          end
          1'h1: begin
            M_iteration_d = 3'h5;
          end
          2'h2: begin
            M_iteration_d = 3'h7;
          end
          2'h3: begin
            M_iteration_d = 4'h9;
          end
          default: begin
            M_iteration_d = 1'h0;
          end
        endcase
        if (M_delay_q >= 25'h1ffffff) begin
          M_delay_d = 1'h0;
          M_state_d = DISPLAY_state;
        end
      end
      GAMEOVER_state: begin
        io_led[16+7-:8] = 8'hff;
        io_led[8+7-:8] = 8'hff;
        io_led[0+7-:8] = 8'hff;
        if (M_button_detector_out) begin
          io_led[16+7-:8] = 1'h0;
          io_led[8+7-:8] = 1'h0;
          io_led[0+7-:8] = 1'h0;
          M_mistakes_d = 1'h0;
          M_level_d = 1'h0;
          M_index_d = 1'h0;
          M_iteration_d = 2'h3;
          M_gameclock_d = 1'h0;
          for (i = 1'h0; i < 4'h9; i = i + 1) begin
            M_storage_d[(i)*4+3-:4] = 1'h0;
          end
          M_state_d = IDLE_state;
        end
      end
      BUTTONS_state: begin
        io_led[16+4+3-:4] = 1'h0;
        io_led[16+0+3-:4] = M_storage_q[(M_index_q)*4+3-:4];
        io_led[8+4+3-:4] = M_mistakes_q;
        io_led[8+0+3-:4] = M_index_q;
        io_led[0+4+3-:4] = M_level_q;
        io_led[0+0+3-:4] = M_attempts_q;
        
        case (M_level_q)
          1'h0: begin
            if (M_attempts_q == 2'h3) begin
              M_level_d = M_level_q + 1'h1;
              M_state_d = TRANSITION_state;
            end
          end
          1'h1: begin
            if (M_attempts_q == 3'h5) begin
              M_level_d = M_level_q + 1'h1;
              M_state_d = TRANSITION_state;
            end
          end
          2'h2: begin
            if (M_attempts_q == 3'h7) begin
              M_level_d = M_level_q + 1'h1;
              M_state_d = TRANSITION_state;
            end
          end
          2'h3: begin
            if (M_attempts_q == 4'h9) begin
              M_level_d = M_level_q + 1'h1;
              M_state_d = TRANSITION_state;
            end
          end
        endcase
        if (M_button_detector_out) begin
          M_boolean_module_alufn = 6'h07;
          M_boolean_module_a = 8'h01;
          M_boolean_module_b = M_storage_q[(M_index_q)*4+3-:4];
          check = (&M_boolean_module_boole[0+3-:4]);
          if (check == 1'h1) begin
            right = 1'h1;
            M_attempts_d = M_attempts_q + 1'h1;
            M_index_d = M_index_q + 1'h1;
          end
          if (check == 1'h0) begin
            M_mistakes_d = M_mistakes_q + 1'h1;
            wrong = 1'h1;
            M_state_d = TRANSITION_state;
          end
        end
        if (M_button_conditioner_out) begin
          M_boolean_module_alufn = 6'h07;
          M_boolean_module_a = 8'h01;
          M_boolean_module_b = M_storage_q[(M_index_q)*4+3-:4];
          check = (&M_boolean_module_boole[0+3-:4]);
          if (check == 1'h1) begin
            right = 1'h1;
          end
          if (check == 1'h0) begin
            wrong = 1'h1;
          end
        end
        if (M_button_detector2_out) begin
          M_boolean_module_alufn = 6'h07;
          M_boolean_module_a = 8'h08;
          M_boolean_module_b = M_storage_q[(M_index_q)*4+3-:4];
          check = (&M_boolean_module_boole[0+3-:4]);
          if (check == 1'h1) begin
            right = 1'h1;
            M_attempts_d = M_attempts_q + 1'h1;
            M_index_d = M_index_q + 1'h1;
          end
          if (check != 1'h1) begin
            M_mistakes_d = M_mistakes_q + 1'h1;
            wrong = 1'h1;
            M_state_d = TRANSITION_state;
          end
        end
        if (M_button_conditioner2_out) begin
          M_boolean_module_alufn = 6'h07;
          M_boolean_module_a = 8'h08;
          M_boolean_module_b = M_storage_q[(M_index_q)*4+3-:4];
          check = (&M_boolean_module_boole[0+3-:4]);
          if (check == 1'h1) begin
            right = 1'h1;
          end
          if (check != 1'h1) begin
            wrong = 1'h1;
          end
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_gameclock_q <= 1'h0;
      M_index_q <= 1'h0;
      M_attempts_q <= 1'h0;
      M_mistakes_q <= 1'h0;
      M_storage_q <= 1'h0;
      M_iteration_q <= 2'h3;
      M_randomseed_q <= 1'h1;
      M_randomstore_q <= 1'h0;
      M_delay_q <= 1'h0;
      M_level_q <= 1'h0;
      M_state_q <= 1'h0;
    end else begin
      M_gameclock_q <= M_gameclock_d;
      M_index_q <= M_index_d;
      M_attempts_q <= M_attempts_d;
      M_mistakes_q <= M_mistakes_d;
      M_storage_q <= M_storage_d;
      M_iteration_q <= M_iteration_d;
      M_randomseed_q <= M_randomseed_d;
      M_randomstore_q <= M_randomstore_d;
      M_delay_q <= M_delay_d;
      M_level_q <= M_level_d;
      M_state_q <= M_state_d;
    end
  end
  
endmodule
