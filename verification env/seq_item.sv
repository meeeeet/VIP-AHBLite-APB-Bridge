
//  Class: a_seq_item
//
class a_seq_item extends uvm_sequence_item;

    `uvm_object_utils(a_seq_item);

    //  Group: Variables

    //AHBLite IN
    rand bit [`HADDR_SIZE-1 : 0] HADDR;
    rand bit [`HDATA_SIZE-1 : 0] HWDATA;
    rand HWRITE;
    rand bit [2:0] HSIZE;
    rand [2:0] HBURST;
    rand [3:0] HPROT;
    rand [1:0] HTRANS;
    rand HREADY;
 
    //AHBLite OUT
    bit [`HDATA_SIZE-1 : 0] HRDATA;
    bit HREADYOUT;
    bit HRESP;

    //APB In
    rand PREADY;
    rand PSLVERR;
    rand [`PDATA_SIZE-1 : 0] PRDATA;

    //APB Out
    bit PSEL;
    bit PENABLE;
    bit [2:0] PPROT;
    bit PWRITE;
    bit [`PDATA_SIZE/8-1:0] PSTRB;
    bit [`PADDR_SIZE-1 : 0] PADDR;
    bit [`PADDR_SIZE-1 : 0] PWDATA;






    //  Group: Functions

    //  Constructor: new
    function new(string name = "a_seq_item");
        super.new(name);
    endfunction: new




    
endclass: a_seq_item

