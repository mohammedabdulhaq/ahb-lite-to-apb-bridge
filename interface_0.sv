/* Name: Mohammed Abdul Haq
UVM Test-Bench Name: AHBLite_APB_Bridge
*/
interface intf_0(input logic HRESETn,HCLK);
	logic HSEL;
	logic [31:0] HADDR;
	logic [31:0] HWDATA;
	logic [31:0] HRDATA;
	logic HWRITE;
  	logic Hreadyout;
  	logic Hreadyin;
	logic [2:0] HSIZE;
	logic [2:0] HBURST;
	logic [3:0] HPROT;
	logic [1:0] HTRANS;
	logic HMASTERLOCK;
endinterface