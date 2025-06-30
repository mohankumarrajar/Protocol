// Code your testbench here
// or browse Examples
module tb();
  
  reg clk,rst;
  reg [7:0]data;

  
  initial clk = 1;
  
  top_module dut (.clk(clk),.rst(rst),.data(data));
  
  always #5clk = ~clk;
  initial begin
    
    $dumpfile("dump.vcd");
    $dumpvars();
//     $monitor(baud_clk);
  end
  
  initial begin
    #10 rst = 1;
    #20 rst = 0;
    #10 data = 8'b10010101;

    #100000;
    
    $finish;
  end
  
endmodule
