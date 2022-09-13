// Code your testbench here
// or browse Examples
//--class--
class adresss_range;
  bit[31:0]start_adress;
  bit[31:0]end_adress;
  function new();
    start_adress = 10;
    end_adress = 50;
  endfunction
endclass
   
class packet;
  //class properties
  bit[31:0]addr;
  bit[31:0]data;
  adress_range ar;//class handle
  
  //constructor
  function new();
    addr =32'h10;
    data =32'hFF;
    ar= new();//creating object
  endfunction
  
  //method to display class properties
  function void display();
    $display("----------------------------------");
    $display("\taddr =%0h",addr);
    $display("\tdata =%0h",data);
    $display("\tstart_adress =%0d",ar.start_adress);
    $display("\tend_adress =%0d",ar.end_adress);
    $display("----------------------------------");
  endfunction
endclass
