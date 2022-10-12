Transaction class
class switch;
rand bit [7:0] addr;
rand bit [15:0] data;
bit [7:0] addr_a;
bit [15:0] data_a;
bit [7:0] addr_b;
bit [15:0] data_b;
begin
function void $display(“mswitch display/”);
//assigning the values for each of them
void$display(“switch=%0h,addr=%0h,data=%0h,addr_a=%0h,data_a=%0h,addr_b=%0h,
data_b=%0h);
end
endclass
