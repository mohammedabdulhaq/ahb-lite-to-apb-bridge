/* Name: Mohammed Abdul Haq
UVM Test-Bench Name: AHBLite_APB_Bridge
*/
interface intf_1(input logic PRESETn,PCLK);
	logic PSEL;
	logic PENABLE;
	logic [2:0] PPROT;
	logic PWRITE;
	logic [3:0] PSTRB;
	logic [31:0] PADDR;
	logic [31:0] PWDATA;
	logic [31:0] PRDATA;
	logic PREADY;
	logic PSLVERR;
endinterface