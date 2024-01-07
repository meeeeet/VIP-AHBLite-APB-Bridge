class a_env extends uvm_env;
    `uvm_component_utils(a_env)


    function new(string name= "a_env", uvm_component parent);
        super.new(name,parent)
    endfunction

    function void build_phase(uvm_phase phase);
        super.connect_phase(phase);
    endfunction

    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);        
    endfunction: connect_phase

    task run_phase(uvm_phase phase);
        super.run_phase(phase);
    endtask: run_phase

endclass