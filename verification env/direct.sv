`timescale 1ns/1ns
`include "ahb3lite_apb_bridge.sv"
module tb_ahb3lite_apb_bridge;

  // Parameters
  parameter HADDR_SIZE = 32;
  parameter HDATA_SIZE = 32;
  parameter PADDR_SIZE = 10;
  parameter PDATA_SIZE = 8;
  parameter SYNC_DEPTH = 3;

  // Signals
  reg HRESETn, HCLK, HSEL, HWRITE, HREADY;
  reg [HADDR_SIZE - 1:0] HADDR;
  reg [HDATA_SIZE - 1:0] HWDATA;
  reg [2:0] HSIZE;
  reg [2:0] HBURST;
  reg [3:0] HPROT;
  reg [1:0] HTRANS;
  reg HREADYOUT, HRESP;

  reg PRESETn, PCLK, PSEL, PENABLE, PWRITE, PSTRB;
  reg [2:0] PPROT;
  reg [PADDR_SIZE - 1:0] PADDR;
  reg [PDATA_SIZE - 1:0] PWDATA;
  wire [PDATA_SIZE - 1:0] PRDATA;
  wire PREADY, PSLVERR;

  // Instantiate the DUT (Design Under Test)
  ahb3lite_apb_bridge dut (
    .HRESETn(HRESETn),
    .HCLK(HCLK),
    .HSEL(HSEL),
    .HADDR(HADDR),
    .HWDATA(HWDATA),
    .HRDATA(PRDATA),
    .HWRITE(HWRITE),
    .HSIZE(HSIZE),
    .HBURST(HBURST),
    .HPROT(HPROT),
    .HTRANS(HTRANS),
    .HREADYOUT(HREADYOUT),
    .HREADY(HREADY),
    .HRESP(HRESP),
    .PRESETn(PRESETn),
    .PCLK(PCLK),
    .PSEL(PSEL),
    .PENABLE(PENABLE),
    .PPROT(PPROT),
    .PWRITE(PWRITE),
    .PSTRB(PSTRB),
    .PADDR(PADDR),
    .PWDATA(PWDATA),
    .PRDATA(PRDATA),
    .PREADY(PREADY),
    .PSLVERR(PSLVERR)
  );

  // Clock generation
  initial begin
    HCLK = 0;
    PCLK = 0;
    fork
        forever #5 HCLK = ~HCLK;
        forever #10 PCLK = ~PCLK;  
    join
  end

  // Reset assertion
  initial begin
    HRESETn = 0;
    PRESETn = 0;
    #20 HRESETn = 1;
    #20 PRESETn = 1;
  end

  // Test scenario
  initial begin
    // Your test scenario goes here
    // Initialize signals, apply stimulus, and check responses
    // Example: Write some data from AHB Lite side

    // Set AHB Lite write signal
    HWRITE = 1;

    // Set AHB Lite address
    HADDR = 32'h00000000;

    // Set AHB Lite data
    HWDATA = 32'hA5A5A5A5;

    // Set AHB Lite size
    HSIZE = 3'b100; // Assuming you want to write 4 bytes

    // Set AHB Lite burst type
    HBURST = 3'b000; // Single transfer

    HREADY=1'b1;

    // Set AHB Lite transfer type
    HTRANS = 2'b01; // Non-sequential, non-prefetchable

    // Wait for AHB Lite ready signal
    repeat (10) @(posedge HCLK) if (HREADY) break;

    // Deassert AHB Lite write signal
    HWRITE = 0;

    // Wait for AHB Lite ready signal
    repeat (10) @(posedge HCLK) if (HREADY) break;

    // Continue with other test scenarios or assertions
    // ...

    // End the simulation after a while
    #1000 $finish;
  end

  initial begin
    $dumpfile("wave.vcd");
    $dumpvars();
  end
endmodule
