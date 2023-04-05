/* Name: Mohammed Abdul Haq
UVM Test-Bench Name: AHBLite_APB_Bridge
*/
class sequence_item_0 extends uvm_sequence_item;
bit HSEL;
rand bit [31:0] HADDR;
rand bit [31:0] HWDATA;
bit [31:0] HRDATA;
rand bit HWRITE;
bit [2:0] HSIZE;
bit [2:0] HBURST;
bit [3:0] HPROT;
bit [1:0] HTRANS;
bit HMASTERLOCK;

function new(string name="sequence_item_0");
        	super.new(name);
endfunction
`uvm_object_utils_begin(sequence_item_0)
	`uvm_field_int(HSEL,UVM_ALL_ON)
	`uvm_field_int(HADDR,UVM_ALL_ON)
	`uvm_field_int(HWDATA,UVM_ALL_ON)
	`uvm_field_int(HRDATA,UVM_ALL_ON)
	`uvm_field_int(HWRITE,UVM_ALL_ON)
	`uvm_field_int(HSIZE,UVM_ALL_ON)
	`uvm_field_int(HBURST,UVM_ALL_ON)
	`uvm_field_int(HPROT,UVM_ALL_ON)
	`uvm_field_int(HTRANS,UVM_ALL_ON)
	`uvm_field_int(HMASTERLOCK,UVM_ALL_ON)
`uvm_object_utils_end
endclass