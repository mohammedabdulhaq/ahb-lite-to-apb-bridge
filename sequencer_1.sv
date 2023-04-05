/* Name: Mohammed Abdul Haq
UVM Test-Bench Name: AHBLite_APB_Bridge
*/
class sequencer_1 extends uvm_sequencer#(sequence_item_1);
`uvm_object_utils(sequencer_1)

function new(string name = "sequencer_1", uvm_component parent = null);
        	super.new(name, parent);
        endfunction
function void build_phase(uvm_phase phase);
            super.build_phase(phase);
        endfunction

endclass