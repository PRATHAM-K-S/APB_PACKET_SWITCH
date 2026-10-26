class soft_reset_reg extends uvm_reg;
    `uvm_object_utils(soft_reset_reg)

    rand uvm_reg_field pulse;
    uvm_reg_field reserved;

    function new(string name = "soft_reset_reg");
        super.new(name, 32, UVM_NO_COVERAGE);
    endfunction

    virtual function void build();
        pulse = uvm_reg_field::type_id::create("pulse");
        reserved = uvm_reg_field::type_id::create("reserved");

        pulse.configure(this, 1, 0, "WO", 0, 1'b0, 1, 1, 0);
        reserved.configure(this, 31, 1, "RO", 0, 31'b0, 1, 0, 0);
    endfunction
endclass : soft_reset_reg