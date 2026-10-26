class stat_drop_reg extends uvm_reg;
    `uvm_object_utils(stat_drop_reg)

    uvm_reg_field dropped_packets;
    uvm_reg_field reserved;

    function new(string name = "stat_drop_reg");
        super.new(name, 32, UVM_NO_COVERAGE);
    endfunction

    virtual function void build();
        dropped_packets = uvm_reg_field::type_id::create("dropped_packets");
        reserved = uvm_reg_field::type_id::create("reserved");

        dropped_packets.configure(this, 16,  0, "RO", 1, 16'h0000, 1, 0, 1);
        reserved.configure(this, 16, 16, "RO", 0, 16'h0000, 1, 0, 1);
    endfunction
endclass : stat_drop_reg