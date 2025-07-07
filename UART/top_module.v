module top_module(
  input clk,rst,
  output reg baud_clk,
  input [7:0]data,
  output reg tx,done_t,
  output reg done_r,error
);
  baud_rate baud(.clk(clk),.rst(rst),.baud_clk(baud_clk));
  
  wire baud_tclk;
  assign baud_tclk = baud_clk;
  
  transmitter trans(.clk(clk),.rst(rst),.data(data),.baud_tclk(baud_tclk),.tx(tx),.done_t(done_t));
  
  wire rx;
  assign rx = tx;
  reciver res(.clk(clk),.rst(rst),.baud_rclk(baud_tclk),.rx(rx),.done_r(done_r),.error(error));
endmodule
