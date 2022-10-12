generator class
class generator;
rand transaction trans;
mailbox gen2_driv;
int repeat_count;
event ended
if gen2_driv
gen2_driv(“repeat the count addr,addr_a,addr_b,data_a,data_b/n”);
else
gen2_driv(“count_all transaction failed/n);
@(posedge clk)
endfunction
endclass
