`timescale 1ns/1ns


// import uvm_pkg::*;
// `include "uvm_macros.svh"

//inlcude files
`include "ahb3lite_pkg.sv"
`include "ahb3lite_apb_bridge.sv"
`include "defines.svh"
`include "seq_item.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"
`include "agent.sv"
`include "env.sv"
`include "test.sv"

module top;

    logic HCLK, PCLK;

    bit clk, sel, rst;

    ahbapb_intf intf(.clk(clk), .sel(sel),.rst(rst))


    // Instantiation of RTL
    ahb3lite_apb_bridge #(
        .HADDR_SIZE(`HADDR_SIZE),
        .HDATA_SIZE(`HDATA_SIZE),
        .PADDR_SIZE(`PADDR_SIZE),
        .PDATA_SIZE(`PDATA_SIZE),
        .SYNC_DEPTH(`SYNC_DEPTH)
    ) 
    DUT(  
        .HCLK(intf.clk),
        .PCLK(intf.clk),
        .HRESETn(intf.rst),
        .HSEL(intf.sel),
        .HADDR(intf.HADDR),
        .HWDATA(intf.HWDATA),
        .HRDATA(intf.HRDATA),
        .HWRITE(intf.HWRITE),
        .HSIZE(intf.HSIZE),
        .HBURST(intf.HBURST),
        .HPROT(intf.HPROT),
        .HTRANS(intf.HTRANS),
        .HMASTLOCK(intf.HMASTLOCK),
        .HREADYOUT(intf.HREADYOUT),
        .HREADY(intf.HREADY),
        .HRESP(intf.HRESP),
        .PRESETn(intf.PRESETn),
        .PSEL(intf.PSEL),
        .PENABLE(intf.PENABLE),
        .PPROT(intf.PPROT),
        .PWRITE(intf.PWRITE),
        .PSTRB(intf.PSTRB),
        .PADDR(intf.PADDR),
        .PWDATA(intf.PWDATA),
        .PRDATA(intf.PRDATA),
        .PREADY(intf.PREADY),
        .PSLVERR(intf.PSLVERR)
);


// Clock generation
initial begin
    fork
        begin
            forever #5 clk=~clk;
        end
        begin
            sel=1;
        end
        begin
            #10;
            rst=0;
            #5 rst=1;
        end
    join
end


// Interface database

initial begin
    uvm_config_db #(virtual ahbapb_intf)::set(null, "*", "interface", intf);
end


// Maximum simulation time
initial begin
    #100
    `uvm_warning(get_name(), "Simulation has reached its maximum simulation time.....")
    `uvm_error(get_name(), "Forcing simulator to end current simulation.")
    $finish();
end

// Generating waveforms
initial begin
    $dumpfile("wave.vcd")
    $dumpvars();
end

initial begin
    run_test("a_test");
end

endmodule: TOP