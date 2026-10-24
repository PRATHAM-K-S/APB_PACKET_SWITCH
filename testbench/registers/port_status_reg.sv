class port_status_reg extends uvm_reg;
    
    // Factory registration
    `uvm_object_utils(port_status_reg)

    uvm_reg_field port0_level;
    uvm_reg_field port1_level;
    uvm_reg_field port2_level;
    uvm_reg_field port3_level;

    // Class constructor
    function new(string name="port_status_reg");
        super.new(name, 32, UVM_NO_COVERAGE);
    endfunction 

    virtual function void build();
        // build fields
        port0_level = uvm_reg_field::type_id::create("port0_level");
        port1_level = uvm_reg_field::type_id::create("port1_level");
        port2_level = uvm_reg_field::type_id::create("port2_level");
        port3_level = uvm_reg_field::type_id::create("port3_level");
        // configure fields
        port0_level.configure(this, 8, 0, "RO", 1, 8'h0, 1, 0, 1);
        port1_level.configure(this, 8, 8, "RO", 1, 8'h0, 1, 0, 1);
        port2_level.configure(this, 8, 16, "RO", 1, 8'h0, 1, 0, 1);
        port3_level.configure(this, 8, 24, "RO", 1, 8'h0, 1, 0, 1);
    endfunction: build

endclass //port_status_reg extends uvm_reg