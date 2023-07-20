`include "uart_tx.v"
`include "uart_rx.v"

module rx_tb();
 reg [7:0]t;
 reg st=1'b1;
 reg clk=1'b0;
 wire done;
 wire ser_out;
 wire [7:0]n;
 wire iscor,dn;
 wire c;
 assign c=ser_out;
 uart_tx m1(.a(t),.star(st),.i_clk(clk),.ser_out(ser_out),.done(done));
 uart_rx m2(.tx(c),.i_clk(clk),.a(n),.iscor(iscor),.done(dn));
    initial begin
        #0 t=8'b00001011;
        repeat(32) begin
        #5 clk=~clk;
        if(clk) begin
        #0 $display(n);
        #0 $display(iscor);
        end
        end
       
        #100 $finish;
    end
endmodule