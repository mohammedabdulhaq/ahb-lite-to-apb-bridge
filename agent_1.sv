/* Name: Mohammed Abdul Haq
UVM Test-Bench Name: AHBLite_APB_Bridge
*/class agent_1 extends uvm_agent;
`uvm_component_utils(agent_1)
driver_1 drv_h_1;
sequencer_1 sqr_h_1;
monitor_1 mon_h_1;

function new(string name = "agent_1", uvm_component parent = null);
	super.new(name, parent);
endfunction
function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	drv_h_1 = driver_1::type_id::create("drv_h_1", this);
	sqr_h_1 = sequencer_1::type_id::create("sqr_h_1", this);
	mon_h_1 = monitor_1::type_id::create("mon_h_1", this); 
endfunction
function void connect_phase(uvm_phase phase);
	super.connect_phase(phase);
	drv_h_1.seq_item_port.connect(sqr_h_1.seq_item_export); 
endfunction

endclass