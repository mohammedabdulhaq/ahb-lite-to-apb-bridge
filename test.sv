/* Name: Mohammed Abdul Haq
UVM Test-Bench Name: AHBLite_APB_Bridge
*/
class test extends uvm_test;
`uvm_component_utils(test)
sequence_0 seq_h_0;
sequence_1 seq_h_1;
env env_h;

function new(string name , uvm_component parent);
	super.new(name, parent);
endfunction
function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	env_h = env::type_id::create("env_h",this);
endfunction
task run_phase(uvm_phase phase);
	phase.raise_objection(this);
	seq_h_1= sequence_1::type_id::create("seq_h_1",this);

	repeat(10) begin
		fork
			seq_h_0.start(env_h.agt_h_0.sqr_h_0);
seq_h_1.start(env_h.agt_h_1.sqr_h_1);

		join
	end
	phase.drop_objection(this); 
endtask
function void end_of_elaboration_phase(uvm_phase phase);
	super.end_of_elaboration_phase(phase);
	uvm_top.print_topology();
endfunction

endclass