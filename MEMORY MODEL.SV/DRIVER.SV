class driver;
   
  //used to count the number of transactions
  int no_transactions;
   
  //creating virtual interface handle
  virtual mem_intf mem_vif;
   
  //creating mailbox handle
  mailbox gen2driv;
   
  //constructor
  function new(virtual mem_intf mem_vif,mailbox gen2driv);
    //getting the interface
    this.mem_vif = mem_vif;
    //getting the mailbox handle from  environment
    this.gen2driv = gen2driv;
  endfunction
   
  //Reset task, Reset the Interface signals to default/initial values
  task reset;
    wait(mem_vif.reset);
    $display(&quot;--------- [DRIVER] Reset Started ---------&quot;);

    `DRIV_IF.wr_en &lt;= 0;
    `DRIV_IF.rd_en &lt;= 0;
    `DRIV_IF.addr  &lt;= 0;
    `DRIV_IF.wdata &lt;= 0;       
    wait(!mem_vif.reset);
    $display(&quot;--------- [DRIVER] Reset Ended---------&quot;);
  endtask
   
  //drive the transaction items to interface signals
  task drive;
    forever begin
      transaction trans;
      `DRIV_IF.wr_en &lt;= 0;
      `DRIV_IF.rd_en &lt;= 0;
      gen2driv.get(trans);
      $display(&quot;--------- [DRIVER-TRANSFER: %0d] ---------
&quot;,no_transactions);
      @(posedge mem_vif.DRIVER.clk);
        `DRIV_IF.addr &lt;= trans.addr;
      if(trans.wr_en) begin
        `DRIV_IF.wr_en &lt;= trans.wr_en;
        `DRIV_IF.wdata &lt;= trans.wdata;
        $display(&quot;\tADDR = %0h \tWDATA = %0h&quot;,trans.addr,trans.wdata);
        @(posedge mem_vif.DRIVER.clk);
      end
      if(trans.rd_en) begin
        `DRIV_IF.rd_en &lt;= trans.rd_en;
        @(posedge mem_vif.DRIVER.clk);
        `DRIV_IF.rd_en &lt;= 0;
        @(posedge mem_vif.DRIVER.clk);
        trans.rdata = `DRIV_IF.rdata;
        $display(&quot;\tADDR = %0h \tRDATA = %0h&quot;,trans.addr,`DRIV_IF.rdata);
      end
      $display(&quot;-----------------------------------------&quot;);
      no_transactions++;
    end
  endtask
          
