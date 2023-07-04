module jdoodle;
 reg [7:0]a;
 reg st=1'b1;
 reg clk=1'b0;
 wire done;
 wire ser_out;
 uart_tx m1(.a(a),.star(st),.i_clk(clk),.ser_out(ser_out),.done(done));
    initial begin
        #0 a=8'b00001011;
        repeat(32) begin
        #5 clk=~clk;
        if(~clk) begin
        #0 $display(ser_out);
        end
        end
       
        #100 $finish;
    end
endmodule