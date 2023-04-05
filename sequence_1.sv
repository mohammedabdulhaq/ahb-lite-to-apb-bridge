/* Name: Mohammed Abdul Haq
UVM Test-Bench Name: AHBLite_APB_Bridge
*/
class sequence_1 extends uvm_sequence#(sequence_item_1);
`uvm_object_utils(sequence_1)
sequence_item_1 my_item_1;

function new(string name="sequence_1");
        	super.new(name);
        endfunction

task body();
        	begin
        		my_item_1 =sequence_item_1::type_id::create("my_item_1");
        		start_item(my_item_1);
        		assert(my_item_1.randomize());
        		finish_item(my_item_1);
        	end
        endtask

endclass