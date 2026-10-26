class gen_status_reg extends uvm_reg;

    // Factory registration
    `uvm_object_utils(gen_status_reg)

    uvm_reg_field running;
    uvm_reg_field done;
    uvm_reg_field fsm;
    uvm_reg_field reserved1;
    uvm_reg_field remaining;
    uvm_reg_field reserved2;

    // Class constructor
    function new(string name="gen_status_reg");
        super.new(name, 32, UVM_NO_COVERAGE);
    endfunction

    virtual function void build();
        // build fields
        running = uvm_reg_field::type_id::create("running");
        done = uvm_reg_field::type_id::create("done");
        fsm = uvm_reg_field::type_id::create("fsm");
        reserved1 = uvm_reg_field::type_id::create("reserved1");
        remaining = uvm_reg_field::type_id::create("remaining");
        reserved2 = uvm_reg_field::type_id::create("reserved2");
        // configure fields
        running.configure(this, 1, 0, "RO", 1, 1'b0, 1, 0, 0);
        done.configure(this, 1, 1, "RO", 1, 1'b0, 1, 0, 0);
        fsm.configure(this, 2, 2, "RO", 1, 2'b0, 1, 0, 0);
        reserved1.configure(this, 4, 4,  "RO", 1, 4'b0, 1, 0, 0);
        remaining.configure(this, 16, 8, "RO", 1, 16'b0, 1, 0, 1);
        reserved2.configure(this, 8, 24, "RO", 1, 8'b0, 1, 0, 1);
    endfunction: build
endclass //gen_status_reg extends uvm_reg