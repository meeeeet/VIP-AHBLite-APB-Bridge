class a_driver extends uvm_driver;
    `uvm_component_utils(a_driver)


    virtual ahbapb_intf vif;
    a_seq_item item;


    function new(string name= "a_driver", uvm_component parent);
        super.new(name,parent)
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        `uvm_info(get_name(), "Obtaining VIF from database......", UVM_NONE)
        if (!(uvm_config_db#(virtual ahbapb_intf)::get(this, "*", "vif", vif))) begin
            `uvm_error(get_name(), "Failed to get VIF from database!")
        end
        else `uvm_info(get_name(), "Successfully fetched VIF from database", UVM_NONE)
        
    endfunction: build_phase

    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);        
    endfunction: connect_phase

    task run_phase(uvm_phase phase);
        super.run_phase(phase);
    endtask: run_phase


        
    task drive(a_seq_item item);
        @(posedge vif.clk);
        
    endtask

endclass

    