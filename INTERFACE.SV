// Code your testbench here
// or browse Examples
'include"interface.sv"
'include'test.sv"
module tbench_top;
  //clock and reset signal declaration
  bit clk;
  bit reset;
  //clock generation
  always#5 clk=~clk;
  //reset generation
  initial begin
    resety =1 ;
    #5reset =0;
  end
  //creating instance of interface,inorder to connect DUT and testcase
  intfi_intf(clk,reset);
  //Testcase instance,interface handle is passed to test an arguement test t1(i_intf);
  //DUT instance,interface signals are connected to the DUT ports 
  adder DUT(
    .clk(i_intf.clk),
    .reset(i_intf.valid),
    .c(i_intf.c)
  );
  //enabling the wave dump
  initial begin
    $dumpfile("dump.vcd");$dumpvars;
  end
endmodule
