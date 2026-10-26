class gen_ctrl_reg extends uvm_reg;
    `uvm_object_utils(gen_ctrl_reg)

    rand uvm_reg_field enable;
    rand uvm_reg_field start;
    rand uvm_reg_field stop;
    rand uvm_reg_field continuous;
    uvm_reg_field reserved;

    function new(string name = "gen_ctrl_reg");
        super.new(name, 32, UVM_NO_COVERAGE);
    endfunction

    virtual function void build();
        enable = uvm_reg_field::type_id::create("enable");
        start = uvm_reg_field::type_id::create("start");
        stop = uvm_reg_field::type_id::create("stop");
        continuous = uvm_reg_field::type_id::create("continuous");
        reserved = uvm_reg_field::type_id::create("reserved");

        enable.configure(this, 1,  0, "RW", 0, 1'b0, 1, 1, 0);
        start.configure(this, 1,  1, "WO", 0, 1'b0, 1, 1, 0);
        stop.configure(this, 1,  2, "WO", 0, 1'b0, 1, 1, 0);
        continuous.configure(this, 1, 3, "RW", 0, 1'b0, 1, 1, 0);
        reserved.configure(this, 28, 4, "RO", 0, 28'b0, 1, 0, 0);
    endfunction
endclass : gen_ctrl_reg