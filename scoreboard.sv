/* Name: Mohammed Abdul Haq
UVM Test-Bench Name: AHBLite_APB_Bridge
*/
class my_scoreboard extends uvm_scoreboard;
`uvm_component_utils(my_scoreboard)
uvm_tlm_analysis_fifo #( sequence_item_0) fifo_h_0;
uvm_tlm_analysis_fifo #( sequence_item_1) fifo_h_1;
sequence_item_0 my_item_0;
sequence_item_1 my_item_1;

function new(string name="my_scoreboard", uvm_component parent);
	super.new(name, parent);
	my_item_0 = new("my_item_0");
	my_item_1 = new("my_item_1");
	fifo_h_0=new("fifo_h_0",this);
	fifo_h_1=new("fifo_h_1",this);
endfunction

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
endfunction

task run_phase (uvm_phase phase);
	forever begin
		fork
			fifo_h_0.get(my_item_0);
			fifo_h_1.get(my_item_1);
		join
		compare();
	end
endtask

virtual function void compare();
	
    if(my_item_0.HWRITE)
      begin
        
        if((my_item_0.HWDATA == my_item_1.PWDATA) && (my_item_0.HADDR == my_item_1.PADDR)) begin
          `uvm_info("WRITE TRANSFER",$sformatf(".........W TEST PASS......HADDR = %0d == PADDR = %0d ........ HWDATA = %0d == PWDATA = %0d \n",my_item_0.HADDR, my_item_1.PADDR, my_item_0.HWDATA, my_item_1.PWDATA), UVM_LOW)
        end
        
        else begin
          `uvm_error("compare",$sformatf("W TEST FAILED!!HADDR = %0d, PADDR = %0d, HWDATA = %0d, PWDATA = %0d",my_item_0.HADDR, my_item_1.PADDR, my_item_0.HWDATA, my_item_1.PWDATA))
        end
        
      end
    
    else
      begin
        
        if((my_item_0.HRDATA == my_item_1.PRDATA) && (my_item_0.HADDR == my_item_1.PADDR)) begin
          `uvm_info("READ TRANSFER",$sformatf(".........R TEST PASS......HADDR = %0d == PADDR = %0d ........ HRDATA = %0d == PRDATA = %0d \n",my_item_0.HADDR, my_item_1.PADDR, my_item_0.HRDATA, my_item_1.PRDATA), UVM_LOW)
        end
        
        else begin
          `uvm_error("compare",$sformatf("R TEST FAILED!! HADDR = %0d, PADDR = %0d, HRDATA = %0d, PRDATA = %0d",my_item_0.HADDR, my_item_1.PADDR, my_item_0.HRDATA, my_item_1.PRDATA))
        end
        
      end
        
endfunction


endclass