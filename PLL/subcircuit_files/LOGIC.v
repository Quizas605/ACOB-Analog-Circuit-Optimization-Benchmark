// Disclaimer:
// THIS FILE IS PROVIDED “AS IS” AND WITH:
// (A)  NO WARRANTY OF ANY KIND, express, implied or statutory, including any implied warranties of merchantability or 
// fitness for a particular purpose, which Mentor Graphics disclaims to the maximum extent permitted by applicable law; and
// (B)  NO INDEMNIFICATION FOR INFRINGEMENT OF INTELLECTUAL PROPERTY RIGHTS.
// LIMITATION OF LIABILITY:  IN NO EVENT SHALL MENTOR GRAPHICS OR ITS LICENSORS BE LIABLE FOR ANY DIRECT, INDIRECT, SPECIAL, 
// INCIDENTAL, OR CONSEQUENTIAL DAMAGES (INCLUDING LOST PROFITS OR SAVINGS) WHATSOEVER, WHETHER BASED ON CONTRACT, TORT OR 
// ANY OTHER LEGAL THEORY, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
// © 2017 Mentor Graphics Corporation. All rights reserved.

// Delays for temp=27C, Vdd=3.3V, input transition time 0%~100% 250ps, output load = 50 fF (fanout=2)
//   #(typ_rise, typ_fall)
`timescale 1ps/1ps

// inverter
`celldefine
module LOGIC_INV (in, out, vdd, vss);
input  in, vdd, vss;
output out;
assign #(130, 150) out = ~in;
endmodule
`endcelldefine

// inverter, with 2X drive
`celldefine
module LOGIC_INVX2 (in, out, vdd, vss);
input  in, vdd, vss;
output out;
assign #(100, 105) out = ~in;
endmodule
`endcelldefine

// inverter, with 4X drive
`celldefine
module LOGIC_INVX4 (in, out, vdd, vss);
input  in, vdd, vss;
output out;
assign #(75, 80) out = ~in;
endmodule
`endcelldefine

// non-inverting buffer
`celldefine
module LOGIC_BUF (in, out, vdd, vss);
input  in, vdd, vss;
output out;
assign #(320, 350) out = in;
endmodule
`endcelldefine

// non-inverting buffer, with 2X drive
`celldefine
module LOGIC_BUFX2 (in, out, vdd, vss);
input  in, vdd, vss;
output out;
assign #(250, 265) out = in;
endmodule
`endcelldefine

// non-inverting buffer, with 4X drive
`celldefine
module LOGIC_BUFX4 (in, out, vdd, vss);
input  in, vdd, vss;
output out;
assign #(200, 225) out = in;
endmodule
`endcelldefine

// non-inverting tri-state buffer, positive active enable
`celldefine
module LOGIC_BUFZ (in, en, out, vdd, vss);
input  in, en, vdd, vss;
output out;
assign #(450, 440) out = en ? in : 1'bz;
endmodule
`endcelldefine

// non-inverting tri-state buffer, with 2X drive, positive active enable
`celldefine
module LOGIC_BUFZX2 (in, en, out, vdd, vss);
input  in, en, vdd, vss;
output out;
assign #(385, 370) out = en ? in : 1'bz;
endmodule
`endcelldefine

// non-inverting tri-state buffer, with 4X drive, positive active enable
`celldefine
module LOGIC_BUFZX4 (in, en, out, vdd, vss);
input  in, en, vdd, vss;
output out;
assign #(340, 340) out = en ? in : 1'bz;
endmodule
`endcelldefine

// pull-up / pull-down
`celldefine
module LOGIC_PUPD (in, out, vdd, vss);
input  in, vdd, vss;
output out;
assign (weak1,weak0) out = in;
endmodule
`endcelldefine

// 2-input NAND 
`celldefine
module LOGIC_NAN2 (a, b, out, vdd, vss);
input  a, b, vdd, vss;
output out;
assign #(95, 135) out = ~(a & b);
endmodule
`endcelldefine

// 3-input NAND 
`celldefine
module LOGIC_NAN3 (a, b, c, out, vdd, vss);
input  a, b, c, vdd, vss;
output out;
assign #(120, 160) out = ~(a & b & c);
endmodule
`endcelldefine

// 4-input NAND 
`celldefine
module LOGIC_NAN4 (a, b, c, d, out, vdd, vss);
input  a, b, c, d, vdd, vss;
output out;
assign #(140, 175) out = ~(a & b & c & d);
endmodule
`endcelldefine

// 2-input NOR 
`celldefine
module LOGIC_NOR2 (a, b, out, vdd, vss);
input  a, b, vdd, vss;
output out;
assign #(180, 205) out = ~(a | b);
endmodule
`endcelldefine

// 3-input NOR 
`celldefine
module LOGIC_NOR3 (a, b, c, out, vdd, vss);
input  a, b, c, vdd, vss;
output out;
assign #(285, 300) out = ~(a | b | c);
endmodule
`endcelldefine

// 4-input NOR 
`celldefine
module LOGIC_NOR4 (a, b, c, d, out, vdd, vss);
input  a, b, c, d, vdd, vss;
output out;
assign #(350, 445) out = ~(a | b | c | d);
endmodule
`endcelldefine

// 2-to-1 multiplexer
`celldefine
module LOGIC_MUX2 (i0, i1, sel, out, outb, vdd, vss);
input  i0, i1, sel, vdd, vss;
output out, outb;
assign #(390, 390) outb = ~(sel ? i1 : i0);
assign #(390, 390) out = ~outb;
endmodule
`endcelldefine

// 2-input exclusive OR
`celldefine
module LOGIC_XOR2 (a, b, out, vdd, vss);
input  a, b, vdd, vss;
output out;
assign #(310, 245) out = a ^ b;
endmodule
`endcelldefine

// 2-input AND
`celldefine
module LOGIC_AND2 (a, b, out, vdd, vss);
input  a, b, vdd, vss;
output out;
assign #(360, 290) out = a & b;
endmodule
`endcelldefine

// 2-input AND, with 2X drive
`celldefine
module LOGIC_AND2X2 (a, b, out, vdd, vss);
input  a, b, vdd, vss;
output out;
assign #(250, 210) out = a & b;
endmodule
`endcelldefine

// 2-input AND, with 4X drive
`celldefine
module LOGIC_AND2X4 (a, b, out, vdd, vss);
input  a, b, vdd, vss;
output out;
assign #(200, 175) out = a & b;
endmodule
`endcelldefine

// 2-input OR 
`celldefine
module LOGIC_OR2 (a, b, out, vdd, vss);
input  a, b, vdd, vss;
output out;
assign #(490, 370) out = a | b;
endmodule
`endcelldefine

// 2-input OR , with 2X drive
`celldefine
module LOGIC_OR2X2 (a, b, out, vdd, vss);
input  a, b, vdd, vss;
output out;
assign #(530, 400) out = a | b;
endmodule
`endcelldefine

// 2-input OR , with 4X drive
`celldefine
module LOGIC_OR2X4 (a, b, out, vdd, vss);
input  a, b, vdd, vss;
output out;
assign #(650, 540) out = a | b;
endmodule
`endcelldefine

// 2-1 AND-OR-invert  out = ~((a&b)|c)
`celldefine
module LOGIC_AOI21 (a, b, c, out, vdd, vss);
input  a, b, c, vdd, vss;
output out;
assign #(170, 230) out = ~((a & b ) | c);
endmodule
`endcelldefine

// 2-2 AND-OR-invert  out = ~((a&b)|(c&d))
`celldefine
module LOGIC_AOI22 (a, b, c, d, out, vdd, vss);
input  a, b, c, d, vdd, vss;
output out;
assign #(185, 260) out = ~((a & b) | (c & d));
endmodule
`endcelldefine

// 2-2-2 AND-OR-invert  out = ~((a&b)|(c&d)|(e&f))
`celldefine
module LOGIC_AOI222 (a, b, c, d, e, f, out, vdd, vss);
input  a, b, c, d, e, f, vdd, vss;
output out;
assign #(270, 265) out = ~((a&b)|(c&d)|(e&f));
endmodule
`endcelldefine

// 3-2 AND-OR-invert  out = ~((a&b&c)|(d&e))
`celldefine
module LOGIC_AOI32 (a, b, c, d, e, out, vdd, vss);
input  a, b, c, d, e, vdd, vss;
output out;
assign #(175, 280) out = ~((a&b&c)|(d&e));
endmodule
`endcelldefine

// 3-3 AND-OR-invert  out = ~((a&b&c)|(d&e&f))
`celldefine
module LOGIC_AOI33 (a, b, c, d, e, f, out, vdd, vss);
input  a, b, c, d, e, f, vdd, vss;
output out;
assign #(155, 350) out = ~((a&b&c)|(d&e&f));
endmodule
`endcelldefine

// 2-1 OR-AND-invert  out = ~((a|b)&c)
`celldefine
module LOGIC_OAI21 (a, b, c, out, vdd, vss);
input  a, b, c, vdd, vss;
output out;
assign #(200, 230) out = ~((a|b)&c);
endmodule
`endcelldefine

// 2-2 OR-AND-invert  out = ~((a|b)&(c|d))
`celldefine
module LOGIC_OAI22 (a, b, c, d, out, vdd, vss);
input  a, b, c, d, vdd, vss;
output out;
assign #(200, 195) out = ~((a|b)&(c|d));
endmodule
`endcelldefine

// 2-2-2 OR-AND-invert  out = ~((a|b)&(c|d)&(e|f))
`celldefine
module LOGIC_OAI222 (a, b, c, d, e, f, out, vdd, vss);
input  a, b, c, d, e, f, vdd, vss;
output out;
assign #(190, 210) out = ~((a|b)&(c|d)&(e|f));
endmodule
`endcelldefine


// 3-2 OR-AND-invert  out = ~((a|b|c)&(d|e))
`celldefine
module LOGIC_OAI32 (a, b, c, d, e, out, vdd, vss);
input  a, b, c, d, e, vdd, vss;
output out;
assign #(190, 210) out = ~((a|b|c)&(d|e));
endmodule
`endcelldefine

// 3-3 OR-AND-invert  out = ~((a|b|c)&(d|e|f))
`celldefine
module LOGIC_OAI33 (a, b, c, d, e, f, out, vdd, vss);
input  a, b, c, d, e, f, vdd, vss;
output out;
assign #(270, 175) out = ~((a|b|c)&(d|e|f));
endmodule
`endcelldefine

// Latch - transparent when EN high
`celldefine
module LOGIC_LAT (en, d, q, qb, vdd, vss);
input  en, d, vdd, vss;
output q, qb;
reg    qb;
always @(en or d)
  if (en == 1'b1)
    #(345) qb = ~d;
assign #(325, 375) q = ~qb;
endmodule
`endcelldefine

// Latch - transparent when EN low
`celldefine
module LOGIC_LATN (enb, d, q, qb, vdd, vss);
input  enb, d, vdd, vss;
output q, qb;
reg    qb;
always @(enb or d)
  if (enb == 1'b0)
    #(365) qb = ~d;
assign #(325, 375) q = ~qb;
endmodule
`endcelldefine

// D-type flip-flop - rising edge clock
`celldefine
module LOGIC_DFF (clk, d, q, qb, vdd, vss);
input  clk, d, vdd, vss;
output q, qb;
reg    qb;
always @(posedge clk)
  #(420) qb <= ~d;
assign #(330, 375) q = ~qb;
endmodule
`endcelldefine

// D-type flip-flop - falling edge clock
`celldefine
module LOGIC_DFFN (clkb, d, q, qb, vdd, vss);
input  clkb, d, vdd, vss;
output q, qb;
reg    qb;
always @(negedge clkb)
  #(405) qb <= ~d;
assign #(325, 375) q = ~qb;
endmodule
`endcelldefine

// D-type flip-flop - rising edge clock, with async positive-active reset
`celldefine
module LOGIC_DFFR (clk, d, r, q, qb, vdd, vss);
input  clk, d, r, vdd, vss;
output q, qb;
reg    qb;
always @(posedge clk or posedge r) begin
  if (r) #(450) qb <= 1'b1;
  else #(450) qb <= ~d;
end
assign #(200, 325) q = ~qb;
endmodule
`endcelldefine

// D-type flip-flop - falling edge clock, with async positive-active reset
`celldefine
module LOGIC_DFFRN (clkb, d, r, q, qb, vdd, vss);
input  clkb, d, r, vdd, vss;
output q, qb;
reg    qb;
always @(negedge clkb or posedge r) begin
  if (r) #(425) qb <= 1'b1;
  else #(425) qb <= ~d;
end
assign #(200, 325) q = ~qb;
endmodule
`endcelldefine

// D-type flip-flop - rising edge clock, with async negative-active set
`celldefine
module LOGIC_DFFS (clk, d, sb, q, qb, vdd, vss);
input  clk, d, sb, vdd, vss;
output q, qb;
reg    qb;
always @(posedge clk or negedge sb) begin
  if (~sb) #(440) qb <= 1'b0;
  else #(440) qb <= ~d;
end
assign #(230, 200) q = ~qb;
endmodule
`endcelldefine


// D-type flip-flop - falling edge clock, with async negative-active set
`celldefine
module LOGIC_DFFSN (clkb, d, sb, q, qb, vdd, vss);
input  clkb, d, sb, vdd, vss;
output q, qb;
reg    qb;
always @(negedge clkb or negedge sb) begin
  if (~sb) #(425) qb <= 1'b0;
  else #(425) qb <= ~d;
end
assign #(130, 380) q = ~qb;
endmodule
`endcelldefine

 
