(* keep_hierarchy = "true" *)
module FA(
  input a,b,cin,
  output s, co);
  assign s=a^b^cin;
  assign co=(a&b)|(b&cin)|(a&cin);
endmodule
module RCA(
   input [3:0]a,b,
  input cin,
  output [3:0]s,
  output co);
  wire c[2:0];
  
  FA fa1(.a(a[0]),.b(b[0]),.cin(cin),.s(s[0]),.co(c[0]));
  FA fa2(.a(a[1]),.b(b[1]),.cin(c[0]),.s(s[1]),.co(c[1]));
  FA fa3(.a(a[2]),.b(b[2]),.cin(c[1]),.s(s[2]),.co(c[2]));
  FA fa4(.a(a[3]),.b(b[3]),.cin(c[2]),.s(s[3]),.co(co));
endmodule 
  
