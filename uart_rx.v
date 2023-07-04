module uart_rx(
 input tx,i_clk,
 output [7:0]a,
 output iscor,done //Parity checker iscor=1 if no parity corruption, iscor=0 if parity is corrupted
);
 reg [3:0]p=4'b0;
 reg [7:0]t=8'b0;
 reg dn=1'b0;
 reg par=1'b0;
 reg [2:0]cor=2'b0;
 assign done=dn;
 assign a=t;
 assign iscor=cor[1];

 always @(negedge i_clk) begin
  if(~(p[3]|p[2]|p[1]|p[0]|tx)) begin
   p<=p+1;
  end
  else if(((p[2])|((~p[3])&(p[0]))|((~p[3])&(p[1]))|((p[3])&(~p[1])&(~p[0])))) begin
   t=t>>1;
   t[7]=tx;
   cor[0]=cor[0]^t[7];
   p=p+1;
  end
  else if(p[3]&(~p[2])&(~p[2])&p[0]) begin
   cor[1]<=cor[0]^tx;
   p<=p+1;
  end
  else begin
   dn<=tx;
   p<=0;
  end
 end
endmodule


 