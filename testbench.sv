module mux_4to1_assign_tb;
   reg [3:0] a;
   reg [3:0] b;
   reg [3:0] c;
   reg [3:0] d;
   wire [3:0] out;
   reg [1:0] sel;
   integer i;
   mux_4to1_assign  mux0 (.a (a),.b (b),.c (c),.d (d),.sel (sel),.out (out));
   initial begin
    $dumpfile("dumpfile.vcd");
    $dumpvars(1);
    $monitor ("[%0t] sel=0x%0h a=0x%0h b=0x%0h c=0x%0h d=0x%0h out=0x%0h", $time, sel, a, b, c, d, out);
      sel <= 0;
      a <= $random;
      b <= $random;
      c <= $random;
      d <= $random;
      for (i = 1; i < 4; i=i+1) begin
         #5 sel <= i;
      end
      #5 $finish;
   end
endmodule
