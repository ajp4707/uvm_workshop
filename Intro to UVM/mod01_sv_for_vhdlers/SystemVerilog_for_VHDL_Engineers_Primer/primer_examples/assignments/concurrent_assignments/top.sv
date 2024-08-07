module top;

byte a, b, vhdl_out, sv_out;
bit sel;

initial
  begin
    $monitor("a: %h  b: %h  sel: %b   vhdl_out: %h   sv_out:  %h",
     a, b, sel, vhdl_out, sv_out);
    a = 8'h55;
    b = 8'hAA;
    sel = 0;
    #1;
    sel = 1;
    #1;
    sel = 0;
    #1;
    sel = 1;
  end

mux_sv SV_MUX (.*, .dat_out(sv_out));
mux_vhdl VHDL_MUX(.*, .dat_out(vhdl_out));

endmodule

