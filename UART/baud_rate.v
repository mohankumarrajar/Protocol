module baud_rate(
  input clk,rst,
  output reg baud_clk
);
  parameter integer baud_rate = 115200;
  parameter integer fqr = 100000000;
  integer count;
  parameter integer clk_div = fqr / baud_rate;
  
  always@(posedge clk ) begin
    if(rst) begin
      count <= 0;
      baud_clk <= 0;
    end
    else begin
      if(count == clk_div) begin
      count <= 0;
      baud_clk <= 1;
    end
    else begin
      count =count + 1;
      baud_clk <= 0;
    end
    end
  end
endmodule
