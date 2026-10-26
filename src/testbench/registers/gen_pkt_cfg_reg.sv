class gen_pkt_cfg_reg extends uvm_reg;
    `uvm_object_utils(gen_pkt_cfg_reg)

    rand uvm_reg_field dst_port;
    rand uvm_reg_field src_port;
    uvm_reg_field reserved1;
    rand uvm_reg_field length;
    rand uvm_reg_field seed;
    uvm_reg_field reserved2;

    function new(string name = "gen_pkt_cfg_reg");
        super.new(name, 32, UVM_NO_COVERAGE);
    endfunction

    virtual function void build();
        dst_port = uvm_reg_field::type_id::create("dst_port");
        src_port = uvm_reg_field::type_id::create("src_port");
        reserved1 = uvm_reg_field::type_id::create("reserved1");
        length = uvm_reg_field::type_id::create("length");
        seed = uvm_reg_field::type_id::create("seed");
        reserved2 = uvm_reg_field::type_id::create("reserved2");

        dst_port.configure( this, 2, 0, "RW", 0, 2'h1, 1, 1, 0);
        src_port.configure( this, 2, 2, "RW", 0, 2'h0, 1, 1, 0);
        reserved1.configure(this, 4, 4, "RO", 0, 4'h0, 1, 0, 0);
        length.configure(this, 8, 8, "RW", 0, 8'h4, 1, 1, 1);
        seed.configure(this, 8, 16, "RW", 0, 8'h0, 1, 1, 1);
        reserved2.configure(this, 8, 24, "RO", 0, 8'h0, 1, 0, 1);
    endfunction
endclass : gen_pkt_cfg_reg