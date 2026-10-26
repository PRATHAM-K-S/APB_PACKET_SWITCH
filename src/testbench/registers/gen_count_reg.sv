class gen_count_reg extends uvm_reg;
    `uvm_object_utils(gen_count_reg)

    rand uvm_reg_field packet_count;
    uvm_reg_field reserved;

    function new(string name = "gen_count_reg");
        super.new(name, 32, UVM_NO_COVERAGE);
    endfunction

    virtual function void build();
        packet_count = uvm_reg_field::type_id::create("packet_count");
        reserved = uvm_reg_field::type_id::create("reserved");
        
        packet_count.configure(this, 16,  0, "RW", 0, 16'h0004, 1, 1, 1);
        reserved.configure(this, 16, 16, "RO", 0, 16'h0000, 1, 0, 1);
    endfunction
endclass : gen_count_reg