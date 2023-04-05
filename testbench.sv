/* Name: Mohammed Abdul Haq
UVM Test-Bench Name: AHBLite_APB_Bridge
*/`include "uvm_macros.svh"
import uvm_pkg::*;
`include "interface_0.sv"
`include "interface_1.sv"
`include "package.sv"

module Top;
bit PCLK,HCLK,PRESETn,HRESETn;

always #5 PCLK=~PCLK;

always #5 HCLK=~HCLK;
initial begin
	PRESETn=1;
	#20;
	PRESETn=0;
end
initial begin
	HRESETn=1;
	#20;
	HRESETn=0;
end

intf_0 vif_0(HCLK,HRESETn);

intf_1 vif_1(PCLK,PRESETn);

AHBLite_APB_Bridge DUT_0(.HRESETn(vif_0.HRESETn),
	.HCLK(vif_0.HCLK),
	.HSEL(vif_0.HSEL),
	.HADDR(vif_0.HADDR),
	.HWDATA(vif_0.HWDATA),
	.HRDATA(vif_0.HRDATA),
	.HWRITE(vif_0.HWRITE),
	.HSIZE(vif_0.HSIZE),
	.HBURST(vif_0.HBURST),
	.HPROT(vif_0.HPROT),
	.HTRANS(vif_0.HTRANS),
	.HMASTERLOCK(vif_0.HMASTERLOCK),
    .HREADYIN(vif_0.HREADYIN), 
    .HREADYOUT(vif_0.HREADYOUT), 
	.PRESETn(vif_1.PRESETn),
	.PCLK(vif_1.PCLK),
	.PSEL(vif_1.PSEL),
	.PENABLE(vif_1.PENABLE),
	.PPROT(vif_1.PPROT),
	.PWRITE(vif_1.PWRITE),
	.PSTRB(vif_1.PSTRB),
	.PADDR(vif_1.PADDR),
	.PWDATA(vif_1.PWDATA),
	.PRDATA(vif_1.PRDATA),
	.PREADY(vif_1.PREADY),
	.PSLVERR(vif_1.PSLVERR));

	
initial begin
        	uvm_config_db#(virtual intf_0)::set(uvm_root::get(), "*", "vif_0", vif_0);
        end
initial begin
        	uvm_config_db#(virtual intf_1)::set(uvm_root::get(), "*", "vif_1", vif_1);
        end
initial begin
        	$dumpfile("dump.vcd");
        	$dumpvars();
        end

initial begin
	run_test("test");
end

endmodule