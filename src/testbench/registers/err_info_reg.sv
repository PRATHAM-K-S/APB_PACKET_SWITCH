class err_info_reg extends uvm_reg;
    `uvm_object_utils(err_info_reg)

    uvm_reg_field last_code;
    uvm_reg_field source;
    uvm_reg_field dest_port;
    uvm_reg_field reserved;
    uvm_reg_field tx_snapshot;

    function new(string name = "err_info_reg");
        super.new(name, 32, UVM_NO_COVERAGE);
    endfunction

    virtual function void build();
        last_code = uvm_reg_field::type_id::create("last_code");
        source = uvm_reg_field::type_id::create("source");
        dest_port = uvm_reg_field::type_id::create("dest_port");
        reserved = uvm_reg_field::type_id::create("reserved");
        tx_snapshot = uvm_reg_field::type_id::create("tx_snapshot");

        last_code.configure(this, 8, 0, "RO", 1, 8'h0, 1, 0, 1);
        source.configure(this, 8, 8, "RO", 1, 8'h0, 1, 0, 1);
        dest_port.configure(this, 2, 16, "RO", 1, 2'h0, 1, 0, 0);
        reserved.configure(this, 2, 18, "RO", 0, 2'h0, 1, 0, 0);
        tx_snapshot.configure(this, 12, 20, "RO", 1, 12'h0, 1, 0, 1);
    endfunction
endclass : err_info_reg