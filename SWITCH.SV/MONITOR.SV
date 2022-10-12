Monitor class
class monitor; class monitor;
virtual switch_if vif;
semaphore sema4;

function new ();
sema4 = new(1);
endfunction
task run();
$display (&quot;T=%0t [Monitor] starting ...&quot;, $time);
fork
sample_port(&quot;Thread0&quot;);
sample_port(&quot;Thread1&quot;);
join
endtask
@(posedge vif.clk);
sema4.put();
item.addr_a = vif.addr_a;
item.data_a = vif.data_a;
item.addr_b = vif.addr_b;
item.data_b = vif.data_b;
$display(&quot;T=%0t [Monitor] %s Second part over&quot;,
scb_mbx.put(item);
item.print({&quot;Monitor_&quot;, tag});
end
end
endtask
endclass
