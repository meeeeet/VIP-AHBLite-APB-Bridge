interface ahbapb_intf(input logic clk, sel, rst);
    
//AHB Slave Interface
logic                    HCLK;
logic                    HRESETn;
logic                    HSEL;
logic [`HADDR_SIZE  -1:0] HADDR;
logic [`HDATA_SIZE  -1:0] HWDATA;
logic [`HDATA_SIZE  -1:0] HRDATA;
logic                    HWRITE;
logic [             2:0] HSIZE;
logic [             2:0] HBURST;
logic [             3:0] HPROT;
logic [             1:0] HTRANS;
logic                    HMASTLOCK;
logic                    HREADYOUT;
logic                    HREADY;
logic                    HRESP;
//APB Master Interfac;
logic                    PRESETn;
logic PCLK;
logic                    PSEL;
logic                    PENABLE;
logic [             2:0] PPROT;
logic                    PWRITE;
logic [`PDATA_SIZE/8-1:0] PSTRB;
logic [`PADDR_SIZE  -1:0] PADDR;
logic [`PDATA_SIZE  -1:0] PWDATA;
logic [`PDATA_SIZE  -1:0] PRDATA;
logic                    PREADY;
logic                    PSLVERR;

endinterface