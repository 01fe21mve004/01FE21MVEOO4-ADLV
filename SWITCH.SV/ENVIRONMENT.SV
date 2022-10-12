class env;
driver d0;
monitor m0;
generator g0;
scoreboard s0;
mailbox drv_mbx;
mailbox scb_mbx;
virtual switch_if vif;

function new();
d0 = new;
m0 = new;
g0 = new;
s0 = new;
drv_mbx = new();
scb_mbx = new();
endfunction
fork
d0.run();
m0.run();
endtask
endclass
