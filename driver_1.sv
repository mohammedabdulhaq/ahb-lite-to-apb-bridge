/* Name: Mohammed Abdul Haq
UVM Test-Bench Name: AHBLite_APB_Bridge
*/
class driver_1 extends uvm_driver #(sequence_item_1);
`uvm_component_utils(driver_1)
virtual intf_1 vif_1;
function new(string name = "driver_1", uvm_component parent = null);
	super.new(name, parent);
endfunction
function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	if(!uvm_config_db#(virtual intf_1) :: get(this, "", "vif_1", vif_1))
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
	 @(posedge vif_1.PCLK);//T1
    vif_1.PREADY = 1; //1 indicates completion of apb transfer
    vif_1.PSLVERR = 0; // 1- trnasfer failure
    
    @(posedge vif_1.PCLK);//T2
    req.PWRITE = vif_1.PWRITE;
    req.PADDR = vif_1.PADDR;
    
    wait(vif_1.PSEL)
      
    //Read transfer
    if((vif_1.PWRITE == 0)) begin
      @(posedge vif_1.PCLK);//T3
      wait(vif_1.PENABLE)
      vif_1.PRDATA = req.PRDATA;
    end
    
    //Write Transfer
    else begin
      req.PWDATA = vif_1.PWDATA; 
      @(posedge vif_1.PCLK); 
      wait(vif_1.PENABLE);
    end
endtask

endclass