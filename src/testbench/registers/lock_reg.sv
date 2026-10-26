class lock_reg extends uvm_reg;
    `uvm_object_utils(lock_reg)

    uvm_reg_field locked;
    rand uvm_reg_field key;

    function new(string name = "lock_reg");
        super.new(name, 32, UVM_NO_COVERAGE);
    endfunction

    virtual function void build();
        locked = uvm_reg_field::type_id::create("locked");
        key = uvm_reg_field::type_id::create("key");

        locked.configure(this, 1, 0, "RO", 1, 1'b1, 1, 0, 0);
        key.configure(this, 31, 1, "WO", 0, 31'b0, 1, 1, 0);
    endfunction
endclass : lock_reg