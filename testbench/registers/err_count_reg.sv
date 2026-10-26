class err_count_reg extends uvm_reg;
    `uvm_object_utils(err_count_reg)

    uvm_reg_field error_count;
    uvm_reg_field reserved;

    function new(string name = "err_count_reg");
        super.new(name, 32, UVM_NO_COVERAGE);
    endfunction

    virtual function void build();
        error_count = uvm_reg_field::type_id::create("error_count");
        reserved = uvm_reg_field::type_id::create("reserved");

        error_count.configure(this, 16, 0, "RO", 1, 16'h0000, 1, 0, 1);
        reserved.configure(this, 16, 16, "RO", 0, 16'h0000, 1, 0, 1);
    endfunction
endclass : err_count_reg