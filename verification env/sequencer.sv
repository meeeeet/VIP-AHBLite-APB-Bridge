//  Class: a_sequencer
//
class a_sequencer extends uvm_sequencer # (a_seq_item);
    `uvm_component_utils(a_sequencer);

    function new(string name = "a_sequencer", uvm_component parent);
        super.new(name, parent);
    endfunction: new
    
endclass: a_sequencer
