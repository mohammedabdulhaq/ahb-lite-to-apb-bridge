/* Name: Mohammed Abdul Haq
UVM Test-Bench Name: AHBLite_APB_Bridge
*/
class monitor_1 extends uvm_monitor;
`uvm_component_utils(monitor_1)
virtual intf_1 vif_1;
sequence_item_1 seq_h_1;
uvm_analysis_port #(sequence_item_1) ap_1;

function new(string name = "monitor_1", uvm_component parent = null);
	super.new(name, parent);
	ap_1=new("ap_1",this);
endfunction
function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	if(!uvm_config_db#(virtual intf_1) :: get(this, "", "vif_1", vif_1))
	`uvm_fatal(get_type_name(), "Not set at top level");
endfunction
task run_phase (uvm_phase phase);
	forever begin
		seq_h_1=sequence_item_1::type_id::create("seq_h_1",this);
		//Drive the DUT from here
		//Declare your clock with proper vif name
		//@(posedge vif.CLK);
		//drive signals from DUT and put onto the analysis port
		//`uvm_info("MONITOR",$sformatf("this is from Monitor"),UVM_NONE)
        @(posedge vif_1.PCLK);
        @(posedge vif_1.PCLK);
        @(posedge vif_1.PCLK);
        wait(vif_1.PSEL)
        seq_h_1.PWRITE = vif_1.PWRITE;
        seq_h_1.PADDR = vif_1.PADDR;
        
        //Read transfer
        if((vif_1.PWRITE == 0)) begin
          @(posedge vif_1.PCLK);
          wait(vif_1.PENABLE)
          seq_h_1.PRDATA =  vif_1.PRDATA ;
        end
        
        //Write Transfer
        else begin
          seq_h_1.PWDATA = vif_1.PWDATA;
          @(posedge vif_1.PCLK); 
          wait(vif_1.PENABLE);
        end
		ap_1.write(seq_h_1);
	end
endtask


endclass