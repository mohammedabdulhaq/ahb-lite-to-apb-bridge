/* Name: Mohammed Abdul Haq
UVM Test-Bench Name: AHBLite_APB_Bridge
*/
class monitor_0 extends uvm_monitor;
`uvm_component_utils(monitor_0)
virtual intf_0 vif_0;
sequence_item_0 seq_h_0;
uvm_analysis_port #(sequence_item_0) ap_0;

function new(string name = "monitor_0", uvm_component parent = null);
	super.new(name, parent);
	ap_0=new("ap_0",this);
endfunction
function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	if(!uvm_config_db#(virtual intf_0) :: get(this, "", "vif_0", vif_0))
	`uvm_fatal(get_type_name(), "Not set at top level");
endfunction
task run_phase (uvm_phase phase);
	forever begin
		seq_h_0=sequence_item_0::type_id::create("seq_h_0",this);
		//Drive the DUT from here
		//Declare your clock with proper vif name
		//@(posedge vif.clk);
		//drive signals from DUT and put onto the analysis port
		//`uvm_info("MONITOR",$sformatf("this is from Monitor"),UVM_NONE)
        
        @(posedge vif_0.HCLK);
        wait(vif_0.HREADYOUT);
        
        @(posedge vif_0.HCLK);
        seq_h_0.HWRITE = vif_0.HWRITE;
        seq_h_0.HADDR = vif_0.HADDR;
        
        
        @(posedge vif_0.HCLK);        
        //Write Transfer
        if(vif_0.HWRITE) begin
          seq_h_0.HWDATA = vif_0.HWDATA;
        end
        
        //Read Transfer
        else begin
          @(posedge vif_0.HCLK);
          wait(vif_0.HREADYOUT)
          seq_h_0.HRDATA = vif_0.HRDATA; 
        end 
		ap_0.write(seq_h_0);
	end
endtask


endclass