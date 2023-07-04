module uart_tx(
 input [7:0]a,
 input i_clk,
 input star,
 output reg ser_out,
 output done
);
 reg [3:0]p=4'b0;
 reg [7:0]t;
 reg par=1'b0;
 reg lod=1'b0;
 reg dn=1'b0;
 assign done=dn;

 always @(posedge i_clk) begin
 if(star) begin
 if(~done) begin
  if(~lod) begin
  t[0]<=a[0];
  t[1]<=a[1];
  t[2]<=a[2];
  t[3]<=a[3];
  t[4]<=a[4];
  t[5]<=a[5];
  t[6]<=a[6];
  t[7]<=a[7];
  ser_out<=1'b0;
  p<=p+1;
  lod=1'b1;
  end
  else begin
  if((~p[3])|((~p[0])&(~p[1]))) begin
   ser_out<=t[0];
   t<=t>>1;
   p<=p+1;
   par<=par^t[0];
  end
  else if(p[3]&p[0]&(~p[2])&(~p[1])) begin
   ser_out<=par;
   p<=p+1;
  end
  else if((p[3])&(~p[2])&(p[1])&(~p[0])) begin
   ser_out<=1'b1;
   dn<=1'b1;
  end
  end
 end
 end
 end
endmodule
