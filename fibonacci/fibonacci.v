module Fibonacci(
input clk, rst,
output [3:0] fib_out);


//displays only upto 13. for more increase width of all registers and wires and output
reg [3:0] fibn_minus1, fibn_minus2, fibn;
wire [3:0] mux1, mux2;

//Sequential Part
always @(posedge clk)
begin
	fibn_minus1 <= mux1;
	fibn_minus2 <= mux2;
end

//Combinatioanal Part

//Initial reset condition is required to start the series
assign mux1 = rst ? 4'd1 : fibn; 
assign mux2 = rst ? 4'd0 : fibn_minus1;

assign fibn = fibn_minus1 + fibn_minus2;
assign fib_out = fibn_minus2;

endmodule
