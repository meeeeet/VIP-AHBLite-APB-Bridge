class a_test extends uvm_test;
    `uvm_component_utils(a_test)


    a_env env;
    a_base_sequence base;



    function new(string name= "a_test", uvm_component parent);
        super.new(name,parent)
        // `uvm_info(get_name(), "", UVM_NONE)
        
    endfunction

    function void build_phase(uvm_phase phase);
        super.connect_phase(phase);
        env=a_env::type_id::create("env",this);

    endfunction

    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);        
    endfunction: connect_phase

    task run_phase(uvm_phase phase);
        super.run_phase(phase);
        `uvm_info(get_name(), "Running tests.......", UVM_NONE)

        phase.raise_objection(this);

        base = a_base_sequence::type_id::create("base");
        base.start(env.agnt.seqr);


        phase.drop_objection(phase);
        
    endtask: run_phase

endclass