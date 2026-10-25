class gen_interval_reg extends uvm_reg;
    `uvm_object_utils(gen_interval_reg)

    rand uvm_reg_field interval;
    uvm_reg_field reserved;

    function new(string name = "gen_interval_reg");
        super.new(name, 32, UVM_NO_COVERAGE);
    endfunction

    virtual function void build();
        interval = uvm_reg_field::type_id::create("interval");
        reserved = uvm_reg_field::type_id::create("reserved");
        
        interval.configure(this, 16, 0, "RW", 0, 16'h0002, 1, 1, 1);
        reserved.configure(this, 16, 16, "RO", 0, 16'h0000, 1, 0, 1);
    endfunction
endclass : gen_interval_reg