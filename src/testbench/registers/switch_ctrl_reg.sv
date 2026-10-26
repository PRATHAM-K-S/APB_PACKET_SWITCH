class switch_ctrl_reg extends uvm_reg;
    `uvm_object_utils(switch_ctrl_reg)

    rand uvm_reg_field enable;
    rand uvm_reg_field stat_clear;
    uvm_reg_field      reserved1;
    rand uvm_reg_field irq_global_en;
    uvm_reg_field      reserved2;

    function new(string name = "switch_ctrl_reg");
        super.new(name, 32, UVM_NO_COVERAGE);
    endfunction

    virtual function void build();
        enable = uvm_reg_field::type_id::create("enable");
        stat_clear = uvm_reg_field::type_id::create("stat_clear");
        reserved1 = uvm_reg_field::type_id::create("reserved1");
        irq_global_en = uvm_reg_field::type_id::create("irq_global_en");
        reserved2 = uvm_reg_field::type_id::create("reserved2");

        enable.configure(this, 1, 0, "RW", 0,  1'b0, 1, 1, 0);
        stat_clear.configure(this, 1, 1, "WO", 0, 1'b0, 1, 1, 0);
        reserved1.configure(this, 1, 2, "RO", 0, 1'b0, 1, 0, 0);
        irq_global_en.configure(this, 1, 3, "RW", 0, 1'b0, 1, 1, 0);
        reserved2.configure(this, 28, 4, "RO", 0, 28'b0, 1, 0, 0);
    endfunction
endclass : switch_ctrl_reg