//  Class: a_sequence
//
class a_base_sequence extends uvm_sequence;

    `uvm_object_utils(a_sequence)

    a_seq_item base;

    function new(string name = "a_sequence");
        super.new(name);
        `uvm_info(get_name(), "Inside Constructor!", UVM_HIGH)
    endfunction: new

    task body();
        base=a_base_sequence::type_id::create("base")
        `uvm_info(get_name(), "Inside body task!",UVM_HIGH)

        // if(!base.randomize() with { a == 0 }) `uvm_error(get_name(), "This is a randomize error");
        base.HADDR<=32'habab_abab;
        base.HWDATA<=32'h0707_0707;
        base.HWRITE<=1;
        base.HSIZE<=3'b010;
        base.HTRANS<=2'b10;
        base.HBURST<=3'b000;
        base.HREADY<=1;
        base.HPROT<=4'b0011;

        base.PREADY<=1;

    endtask

endclass: a_sequence

