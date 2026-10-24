class stat_tx_reg extends uvm_reg;
    `uvm_object_utils(stat_tx_reg)

    uvm_reg_field tx_packets;
    uvm_reg_field reserved;

    function new(string name = "stat_tx_reg");
        super.new(name, 32, UVM_NO_COVERAGE);
    endfunction

    virtual function void build();
        tx_packets = uvm_reg_field::type_id::create("tx_packets");
        reserved   = uvm_reg_field::type_id::create("reserved");

        tx_packets.configure(this, 16,  0, "RO", 1, 16'h0000, 1, 0, 1);
        reserved.configure(this, 16, 16, "RO", 0, 16'h0000, 1, 0, 1);
    endfunction
endclass : stat_tx_reg