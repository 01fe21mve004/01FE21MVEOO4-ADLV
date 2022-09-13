// Code your testbench here
// or browse Examples
module break_in_while_loop;
  int i;
     initial begin
    $display(&quot;------------------------------------------&quot;);
    i = 8;
    while(i!=0) begin
      $display(&quot;\tValue of i=%0d&quot;,i);
      if(i == 4) begin
        $display(&quot;\tCalling break,&quot;);
        break;
      end 
      i--;
    end
         $display(&quot;---------------------------------------------------&quot;);
  end     
endmodule
