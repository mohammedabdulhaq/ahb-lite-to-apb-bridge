/* Name: Mohammed Abdul Haq
UVM Test-Bench Name: AHBLite_APB_Bridge
*/
class sequence_item_1 extends uvm_sequence_item;
bit PSEL;
bit PENABLE;
bit [2:0] PPROT;
bit PWRITE;
bit [3:0] PSTRB;
rand bit [31:0] PADDR;
bit [31:0] PWDATA;
bit [31:0] PRDATA;
bit PREADY;
bit PSLVERR;

function new(string name="sequence_item_1");
        	super.new(name);
endfunction
`uvm_object_utils_begin(sequence_item_1)
	`uvm_field_int(PSEL,UVM_ALL_ON)
	`uvm_field_int(PENABLE,UVM_ALL_ON)
	`uvm_field_int([2:0] PPROT,UVM_ALL_ON)
	`uvm_field_int(PWRITE,UVM_ALL_ON)
	`uvm_field_int([3:0] PSTRB,UVM_ALL_ON)
	`uvm_field_int([31:0] PADDR,UVM_ALL_ON)
	`uvm_field_int([31:0] PWDATA,UVM_ALL_ON)
	`uvm_field_int([31:0] PRDATA,UVM_ALL_ON)
	`uvm_field_int(PREADY,UVM_ALL_ON)
	`uvm_field_int(PSLVERR,UVM_ALL_ON)
`uvm_object_utils_end
endclass