class version_reg extends uvm_reg;
    
    // Factory registration
    `uvm_object_utils(version_reg)

    uvm_reg_field patch;
    uvm_reg_field minor;
    uvm_reg_field major;
    uvm_reg_field reserved;

    // Class constructor
    function new(string name="version_reg");
        super.new(name, 32, UVM_NO_COVERAGE);
    endfunction

    virtual function void build();
        // build fields
        patch = uvm_reg_field::type_id::create("patch");
        major = uvm_reg_field::type_id::create("major");
        minor = uvm_reg_field::type_id::create("minor");
        reserved = uvm_reg_field::type_id::create("reserved");
        // configure fields
        patch.configure(this, 8, 0, "RO", 1, 8'h0, 1, 0, 1);
        major.configure(this, 8, 8, "RO", 1, 8'h2, 1, 0, 1);
        minor.configure(this, 8, 16, "RO", 1, 8'h1, 1, 0, 1);
        reserved.configure(this, 8, 24, "RO", 1, 8'h0, 1, 0, 1);
    endfunction: build

endclass //version_reg extends uvm_reg