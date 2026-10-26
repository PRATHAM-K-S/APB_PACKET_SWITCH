class err_inject_reg extends uvm_reg;
    `uvm_object_utils(err_inject_reg)

    rand uvm_reg_field bus;
    rand uvm_reg_field dest;
    rand uvm_reg_field overflow;
    rand uvm_reg_field undersize;
    rand uvm_reg_field protocol;
    rand uvm_reg_field crc;
    rand uvm_reg_field length;
    rand uvm_reg_field injected;
    uvm_reg_field reserved;
    rand uvm_reg_field clear_count;

    function new(string name = "err_inject_reg");
        super.new(name, 32, UVM_NO_COVERAGE);
    endfunction

    virtual function void build();
        bus = uvm_reg_field::type_id::create("bus");
        dest = uvm_reg_field::type_id::create("dest");
        overflow = uvm_reg_field::type_id::create("overflow");
        undersize = uvm_reg_field::type_id::create("undersize");
        protocol = uvm_reg_field::type_id::create("protocol");
        crc = uvm_reg_field::type_id::create("crc");
        length = uvm_reg_field::type_id::create("length");
        injected = uvm_reg_field::type_id::create("injected");
        reserved = uvm_reg_field::type_id::create("reserved");
        clear_count = uvm_reg_field::type_id::create("clear_count");

        bus.configure(this, 1, 0, "WO", 0, 1'b0, 1, 1, 0);
        dest.configure(this, 1, 1, "WO", 0, 1'b0, 1, 1, 0);
        overflow.configure(this, 1, 2, "WO", 0, 1'b0, 1, 1, 0);
        undersize.configure(this, 1, 3, "WO", 0, 1'b0, 1, 1, 0);
        protocol.configure(this, 1, 4, "WO", 0, 1'b0, 1, 1, 0);
        crc.configure(this, 1, 5, "WO", 0, 1'b0, 1, 1, 0);
        length.configure(this, 1, 6, "WO", 0, 1'b0, 1, 1, 0);
        injected.configure(this, 1, 7, "WO", 0, 1'b0, 1, 1, 0);
        reserved.configure(this, 23, 8, "RO", 0, 23'b0, 1, 0, 0);
        clear_count.configure(this, 1, 31, "WO", 0, 1'b0, 1, 1, 0);
    endfunction
endclass : err_inject_reg