module queues_array;
  bit [31:0]queue_1[$];
  string queue_2[$];
  initial begin
    queue_1={0,1,2,3};
    $display("\tQueue_1 sizeis%0d",queue_1.size());
    queue_1.push_front(22);
    $display("\tQueue_1sizeafterpush_front is%0d",queue_1.size());
    queue_1.push_back(44);
    $display("\tQueue_1sizeafterpush_backis%0d",queue_1.size());
    1var=queue_1.pop_front();
    $display("\tQueue_1pop_front valueis%0d",1var);
    1var=queue_1.pop_back();
    $display("\tQueue_1pop_backvalueis%0d",1var);
  end
endmodule
    
