class a_agent extends uvm_agent;
    `uvm_component_utils(a_agent)


    a_driver drv;
    a_monitor mon;
    a_sequencer seqr;


    function new(string name= "a_agent", uvm_component parent);
        super.new(name,parent)
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        drv=a_driver::type_id::create("drv",this);
        mon=a_monitor::type_id::create("mon",this);
        seqr=a_sequencer::type_id::create("seqr",this);

    endfunction

    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);        
        drv.seq_item_port.connect(seqr.seq_item_port);
    endfunction: connect_phase

    task run_phase(uvm_phase phase);
        super.run_phase(phase);
    endtask: run_phase

endclass