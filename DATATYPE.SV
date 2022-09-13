module enum_datatype;
  enum{red,green,blue,yellow,white,black} Colors;
  initial begin
    Colors= Colors.first;
    for(inti=0;i<6;i++)begin
      $display("Colors:: Value of %0s \t is=,Colors.name,Colors)
               Colors= Colors.next;
               end
               end
               endmodule
               
               
               
