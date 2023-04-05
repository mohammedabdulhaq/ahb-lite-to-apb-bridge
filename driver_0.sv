/* Name: Mohammed Abdul Haq
UVM Test-Bench Name: AHBLite_APB_Bridge
*/
class driver_0 extends uvm_driver #(sequence_item_0);
`uvm_component_utils(driver_0)
virtual intf_0 vif_0;
function new(string name = "driver_0", uvm_component parent = null);
	super.new(name, parent);
endfunction
function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	if(!uvm_config_db#(virtual intf_0) :: get(this, "", "vif_0", vif_0))
	`uvm_fatal(get_type_name(), "Not set at top level");
endfunction
task run_phase (uvm_phase phase);
	forever begin
		// Driver to the DUT declare signals
		//declare your clock signal here
		//@(posedge vif.clk);
		seq_item_port.get_next_item(req);
		drive();
		seq_item_port.item_done();
	end
endtask
//drive stimulus to dut in this method
task drive();
	 @(posedge vif_0.HCLK);//T1
    wait(vif_0.HREADYOUT);
    vif_0.HWRITE = req.HWRITE;
    vif_0.HADDR = req.HADDR;
    vif_0.HSEL =  1'b1; //default slave selection
    vif_0.HREADYIN = 1;  ///ready for the transfer
    vif_0.HTRANS = 2'b10;  //non-sequential 
    vif_0.HSIZE = 3'b010; //size of 32bit
    vif_0.HBURST = 1'b0; //single burst
    vif_0.HMASTERLOCK = 0;  //0 - non-locking sequence transfer
    vif_0.HPROT=4'b0011; //Non-cacheable, Non-bufferable, privileged, data access
    
    @(posedge vif_0.HCLK);//T2       
    //Write Transfer
    if(vif_0.HWRITE) begin
      vif_0.HWDATA = req.HWDATA;
    end
        

  
endtask

endclass