module tb();
  
  reg clk,rst;
  reg [7:0]data;
  
  wire baud_clk,tx,done_t,done_r,error;

  
  initial clk = 1;
  
  top_module dut (.clk(clk),.rst(rst),.baud_clk(baud_clk),.data(data),.tx(tx),.done_t(done_t),.done_r(done_r),.error(error));
  
  always #5clk = ~clk;
  initial begin
    
    $dumpfile("dump.vcd");
    $dumpvars();
  end
  
  initial begin
    #10 rst = 1;
    #20 rst = 0;
    #10 data = 8'b11110000;

    #100000;
    
    $finish;
  end
  
endmodule
