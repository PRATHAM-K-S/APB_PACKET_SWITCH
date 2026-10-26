class irq_force_reg extends uvm_reg;
    `uvm_object_utils(irq_force_reg)

    rand uvm_reg_field force_event;
    uvm_reg_field reserved;

    function new(string name = "irq_force_reg");
        super.new(name, 32, UVM_NO_COVERAGE);
    endfunction

    virtual function void build();
        force_event = uvm_reg_field::type_id::create("force_event");
        reserved = uvm_reg_field::type_id::create("reserved");

        force_event.configure(this, 8, 0, "WO", 0, 8'h0, 1, 1, 1);
        reserved.configure(this, 24, 8, "RO", 0, 24'h0, 1, 0, 0);
    endfunction
endclass : irq_force_reg