module CLA(
    input [3:0] a, b,
    input cin,
    output [3:0] s,
    output co
);
    wire [3:0] G, P;
    wire [2:0] c;       
    assign G = a & b;
    assign P = a ^ b;
	 assign c[0] = G[0] | (P[0] & cin);
    assign c[1] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & cin);
    assign c[2] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & cin);
    assign co   = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & cin);
    assign s = P ^ {c[2:0], cin};

endmodule
