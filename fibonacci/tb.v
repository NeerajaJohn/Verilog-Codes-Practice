module tb_Fibonacci;


  reg clk;
  reg rst;
  wire [3:0] fib_out;

  Fibonacci uut (
    .clk(clk),
    .rst(rst),
    .fib_out(fib_out)
  );

  // Clock 
  always #5 clk = ~clk; //clk period 10 ns

  // Reset 
  initial begin
    clk = 0;
    rst = 1;
    #20; 
    rst = 0;
  end

  // Stimulus
  initial begin
    repeat (9) begin
      #10; 
	  //Display simulation time, clk, rst, and fib_out
	  $display("Time | clk | rst | fib_out");
      $write("%d | %b | %b | ", $time, clk, rst);
      $write("%d\n", fib_out);
    end
    $finish;
  end
  
  //to see results in gtk wave
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0);
    end

endmodule
